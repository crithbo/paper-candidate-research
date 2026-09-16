#include <chrono>
#include <cstdint>
#include <ctime>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <vector>

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <psapi.h>

#include "flatbuffers/verifier.h"
#include "schema_generated.h"

namespace {

using Clock = std::chrono::steady_clock;
volatile uint64_t trace_sink = 0;

std::vector<uint8_t> ReadFile(const std::string &path) {
  std::ifstream in(path, std::ios::binary);
  if (!in) throw std::runtime_error("cannot open " + path);
  in.seekg(0, std::ios::end);
  const auto size = static_cast<size_t>(in.tellg());
  in.seekg(0);
  std::vector<uint8_t> out(size);
  if (size) in.read(reinterpret_cast<char *>(out.data()), static_cast<std::streamsize>(size));
  if (!in && size) throw std::runtime_error("short read " + path);
  return out;
}

size_t WorkingSet() {
  PROCESS_MEMORY_COUNTERS_EX pmc{};
  pmc.cb = sizeof(pmc);
  if (!GetProcessMemoryInfo(GetCurrentProcess(), reinterpret_cast<PROCESS_MEMORY_COUNTERS *>(&pmc),
                            sizeof(pmc))) return 0;
  return static_cast<size_t>(pmc.WorkingSetSize);
}

struct Logger {
  std::string model;
  uint32_t request = 0;
  uint32_t seed = 0;
  uint32_t event = 0;

  void Hit(const char *endpoint, const std::string &selector) {
    std::cout << model << '\t' << request << '\t' << seed << '\t' << event++ << '\t'
              << endpoint << '\t' << selector << '\n';
  }
};

uint64_t ReplayOne(const tflite::Model *model, uint32_t seed, Logger *log) {
  uint64_t sum = 0;
  auto hit = [&](const char *endpoint, const std::string &selector) { log->Hit(endpoint, selector); };

  hit("tflite.Model.version", "root");
  sum += model->version();
  hit("tflite.Model.description", "root");
  const auto *description = model->description();
  sum += description ? description->size() : 0;
  hit("tflite.Model.subgraphs", "root");
  const auto *subgraphs = model->subgraphs();
  hit("tflite.Model.operator_codes", "root");
  const auto *codes = model->operator_codes();
  hit("tflite.Model.buffers", "root");
  const auto *buffers = model->buffers();

  const tflite::Tensor *tensor = nullptr;
  const tflite::Operator *op = nullptr;
  uint32_t tensor_buffer = seed;
  uint32_t opcode_index = seed;
  uint32_t sg_index = 0;
  if (subgraphs && subgraphs->size()) {
    sg_index = (seed * 17u + 3u) % subgraphs->size();
    const auto *sg = subgraphs->Get(sg_index);
    if (sg) {
      const std::string sg_selector = "sg=" + std::to_string(sg_index);
      hit("tflite.SubGraph.name", sg_selector);
      const auto *sg_name = sg->name();
      sum += sg_name ? sg_name->size() : 0;
      hit("tflite.SubGraph.inputs", sg_selector);
      const auto *sg_inputs = sg->inputs();
      sum += sg_inputs ? sg_inputs->size() : 0;
      hit("tflite.SubGraph.outputs", sg_selector);
      const auto *sg_outputs = sg->outputs();
      sum += sg_outputs ? sg_outputs->size() : 0;
      hit("tflite.SubGraph.tensors", sg_selector);
      const auto *tensors = sg->tensors();
      hit("tflite.SubGraph.operators", sg_selector);
      const auto *operators = sg->operators();

      if (tensors && tensors->size()) {
        const uint32_t tensor_index = (seed * 29u + sg_index) % tensors->size();
        tensor = tensors->Get(tensor_index);
        if (tensor) {
          const std::string selector = sg_selector + ";tensor=" + std::to_string(tensor_index);
          hit("tflite.Tensor.shape", selector);
          const auto *shape = tensor->shape();
          sum += shape ? shape->size() : 0;
          hit("tflite.Tensor.type", selector);
          sum += static_cast<uint64_t>(tensor->type());
          hit("tflite.Tensor.buffer", selector);
          tensor_buffer = tensor->buffer();
          sum += tensor_buffer;
          hit("tflite.Tensor.name", selector);
          const auto *name = tensor->name();
          sum += name ? name->size() : 0;
          hit("tflite.Tensor.quantization", selector);
          sum += tensor->quantization() ? 1 : 0;
          hit("tflite.Tensor.is_variable", selector);
          sum += tensor->is_variable() ? 1 : 0;
          hit("tflite.Tensor.shape_signature", selector);
          const auto *signature = tensor->shape_signature();
          sum += signature ? signature->size() : 0;
          hit("tflite.Tensor.has_rank", selector);
          sum += tensor->has_rank() ? 1 : 0;
        }
      }

      if (operators && operators->size()) {
        const uint32_t op_index = (seed * 13u + sg_index) % operators->size();
        op = operators->Get(op_index);
        if (op) {
          const std::string selector = sg_selector + ";operator=" + std::to_string(op_index);
          hit("tflite.Operator.opcode_index", selector);
          opcode_index = op->opcode_index();
          sum += opcode_index;
          hit("tflite.Operator.inputs", selector);
          const auto *inputs = op->inputs();
          sum += inputs ? inputs->size() : 0;
          hit("tflite.Operator.outputs", selector);
          const auto *outputs = op->outputs();
          sum += outputs ? outputs->size() : 0;
          hit("tflite.Operator.builtin_options_type", selector);
          sum += static_cast<uint64_t>(op->builtin_options_type());
          hit("tflite.Operator.builtin_options", selector);
          sum += op->builtin_options() ? 1 : 0;
          hit("tflite.Operator.custom_options", selector);
          const auto *custom = op->custom_options();
          sum += custom ? custom->size() : 0;
          hit("tflite.Operator.custom_options_format", selector);
          sum += static_cast<uint64_t>(op->custom_options_format());
          hit("tflite.Operator.mutating_variable_inputs", selector);
          const auto *mutating = op->mutating_variable_inputs();
          sum += mutating ? mutating->size() : 0;
          hit("tflite.Operator.intermediates", selector);
          const auto *intermediates = op->intermediates();
          sum += intermediates ? intermediates->size() : 0;
        }
      }
    }
  }

  if (codes && codes->size()) {
    const uint32_t index = opcode_index % codes->size();
    const auto *code = codes->Get(index);
    if (code) {
      const std::string selector = "opcode=" + std::to_string(index);
      hit("tflite.OperatorCode.deprecated_builtin_code", selector);
      sum += static_cast<uint64_t>(static_cast<uint8_t>(code->deprecated_builtin_code()));
      hit("tflite.OperatorCode.custom_code", selector);
      const auto *custom_code = code->custom_code();
      sum += custom_code ? custom_code->size() : 0;
      hit("tflite.OperatorCode.version", selector);
      sum += static_cast<uint64_t>(code->version());
      hit("tflite.OperatorCode.builtin_code", selector);
      sum += static_cast<uint64_t>(code->builtin_code());
    }
  }

  if (buffers && buffers->size()) {
    const uint32_t index = tensor_buffer % buffers->size();
    const auto *buffer = buffers->Get(index);
    if (buffer) {
      const std::string selector = "buffer=" + std::to_string(index);
      hit("tflite.Buffer.data", selector);
      const auto *data = buffer->data();
      sum += data ? data->size() : 0;
      hit("tflite.Buffer.offset", selector);
      sum += buffer->offset();
      hit("tflite.Buffer.size", selector);
      sum += buffer->size();
    }
  }
  return sum;
}

}  // namespace

int main(int argc, char **argv) {
  if (argc != 3) {
    std::cerr << "usage: trace_collector model.tflite frozen_train_model_id\n";
    return 64;
  }
  try {
    const auto bytes = ReadFile(argv[1]);
    flatbuffers::Verifier verifier(bytes.data(), bytes.size());
    if (!tflite::VerifyModelBuffer(verifier) || !flatbuffers::BufferHasIdentifier(bytes.data(), "TFL3"))
      throw std::runtime_error("stock verifier or TFL3 identifier failed");
    const auto *model = tflite::GetModel(bytes.data());
    const auto wall0 = Clock::now();
    const auto cpu0 = std::clock();
    const size_t rss0 = WorkingSet();
    std::cout << "model\trequest_ordinal\tseed\tevent_ordinal\tendpoint_id\tselector\n";
    for (uint32_t request = 0; request < 64; ++request) {
      Logger logger{argv[2], request, request, 0};
      trace_sink += ReplayOne(model, request, &logger);
    }
    const double wall_ms = std::chrono::duration<double, std::milli>(Clock::now() - wall0).count();
    const double cpu_ms = 1000.0 * (std::clock() - cpu0) / CLOCKS_PER_SEC;
    const size_t rss = std::max(rss0, WorkingSet());
    std::cerr << "TRACE_COST," << argv[2] << ',' << wall_ms << ',' << cpu_ms << ',' << rss << ','
              << trace_sink << '\n';
    return 0;
  } catch (const std::exception &e) {
    std::cerr << "FATAL," << argv[2] << ',' << e.what() << '\n';
    return 2;
  }
}
