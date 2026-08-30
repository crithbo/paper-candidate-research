#include <algorithm>
#include <array>
#include <chrono>
#include <cstdint>
#include <ctime>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <map>
#include <memory>
#include <numeric>
#include <set>
#include <sstream>
#include <stdexcept>
#include <string>
#include <tuple>
#include <unordered_map>
#include <utility>
#include <vector>

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <psapi.h>

#include "flatbuffers/flatbuffer_builder.h"
#include "flatbuffers/reflection.h"
#include "flatbuffers/reflection_generated.h"
#include "flatbuffers/verifier.h"
#include "schema_generated.h"

namespace {

using Clock = std::chrono::steady_clock;

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

std::string Hex(const uint8_t *data, size_t size) {
  static const char digits[] = "0123456789abcdef";
  std::string out(size * 2, '0');
  for (size_t i = 0; i < size; ++i) {
    out[2 * i] = digits[data[i] >> 4];
    out[2 * i + 1] = digits[data[i] & 15];
  }
  return out;
}

uint64_t Fnv1a(const std::string &s) {
  uint64_t h = 1469598103934665603ull;
  for (unsigned char c : s) {
    h ^= c;
    h *= 1099511628211ull;
  }
  return h;
}

std::string Csv(const std::string &s) {
  std::string out = "\"";
  for (char c : s) {
    if (c == '"') out += '"';
    out += c;
  }
  out += '"';
  return out;
}

int TypeSize(reflection::BaseType t) {
  return static_cast<int>(flatbuffers::GetTypeSize(t));
}

bool IsScalar(reflection::BaseType t) {
  return t >= reflection::UType && t <= reflection::Double;
}

int ProfileWeight(const std::string &object, const std::string &field) {
  const std::string key = object + "." + field;
  if (key.find("Model.subgraphs") != std::string::npos) return 32;
  if (key.find("SubGraph.operators") != std::string::npos) return 24;
  if (key.find("SubGraph.tensors") != std::string::npos) return 16;
  if (key.find("Operator.inputs") != std::string::npos ||
      key.find("Operator.outputs") != std::string::npos) return 12;
  if (key.find("Operator.builtin_options") != std::string::npos) return 10;
  if (key.find("Tensor.shape") != std::string::npos ||
      key.find("Tensor.name") != std::string::npos) return 8;
  if (key.find("Model.operator_codes") != std::string::npos) return 6;
  if (key.find("Model.buffers") != std::string::npos) return 2;
  if (key.find("Buffer.data") != std::string::npos) return 1;
  return 3;
}

int ForceAlignment(const std::string &object, const std::string &field) {
  const auto dot = object.rfind('.');
  const std::string short_object = dot == std::string::npos ? object : object.substr(dot + 1);
  const std::string key = short_object + "." + field;
  if (key == "CustomQuantization.custom") return 16;
  if (key == "Int32Vector.values") return 4;
  if (key == "Uint16Vector.values") return 4;
  if (key == "Buffer.data") return 16;
  return 0;
}

enum class Kind { Table, String, Vector };

struct FieldData {
  const reflection::Field *def = nullptr;
  int child = -1;
  int weight = 1;
  std::vector<uint8_t> scalar;
};

struct Node {
  Kind kind = Kind::Table;
  const void *source = nullptr;
  const reflection::Object *object = nullptr;
  std::string name;
  std::string text;
  reflection::BaseType element = reflection::None;
  int element_object_index = -1;
  size_t count = 0;
  int force_alignment = 0;
  std::vector<uint8_t> vector_scalar_bytes;
  std::vector<FieldData> fields;
  std::vector<int> children;
  std::vector<int> child_weights;
  std::vector<int> parents;
};

struct Graph {
  const reflection::Schema *schema = nullptr;
  int root = -1;
  std::vector<Node> nodes;
  std::map<std::pair<const void *, int>, int> identity;

  int AddString(const flatbuffers::String *s) {
    if (!s) return -1;
    const auto key = std::make_pair(static_cast<const void *>(s), static_cast<int>(Kind::String));
    auto found = identity.find(key);
    if (found != identity.end()) return found->second;
    const int id = static_cast<int>(nodes.size());
    identity[key] = id;
    Node n;
    n.kind = Kind::String;
    n.source = s;
    n.name = "string";
    n.text.assign(s->c_str(), s->size());
    nodes.push_back(std::move(n));
    return id;
  }

  int AddVector(const flatbuffers::Table &owner, const reflection::Object &owner_def,
                const reflection::Field &field) {
    const auto *vec = owner.GetPointer<const flatbuffers::Vector<uint8_t> *>(field.offset());
    if (!vec) return -1;
    const auto key = std::make_pair(static_cast<const void *>(vec), static_cast<int>(Kind::Vector));
    auto found = identity.find(key);
    if (found != identity.end()) {
      nodes[found->second].force_alignment =
          std::max(nodes[found->second].force_alignment,
                   ForceAlignment(owner_def.name()->str(), field.name()->str()));
      return found->second;
    }
    const int id = static_cast<int>(nodes.size());
    identity[key] = id;
    Node n;
    n.kind = Kind::Vector;
    n.source = vec;
    n.name = owner_def.name()->str() + "." + field.name()->str();
    n.element = field.type()->element();
    n.element_object_index = field.type()->index();
    n.count = vec->size();
    n.force_alignment = ForceAlignment(owner_def.name()->str(), field.name()->str());
    nodes.push_back(std::move(n));

    Node stored = nodes[id];
    const int weight = ProfileWeight(owner_def.name()->str(), field.name()->str());
    if (IsScalar(stored.element)) {
      const size_t bytes = stored.count * static_cast<size_t>(TypeSize(stored.element));
      stored.vector_scalar_bytes.assign(vec->Data(), vec->Data() + bytes);
    } else if (stored.element == reflection::String) {
      const auto *typed = reinterpret_cast<const flatbuffers::Vector<flatbuffers::Offset<flatbuffers::String>> *>(vec);
      for (flatbuffers::uoffset_t i = 0; i < typed->size(); ++i) {
        stored.children.push_back(AddString(typed->Get(i)));
        stored.child_weights.push_back(weight);
      }
    } else if (stored.element == reflection::Obj) {
      const auto *obj = schema->objects()->Get(stored.element_object_index);
      if (obj->is_struct()) throw std::runtime_error("unexpected TFLite struct vector");
      const auto *typed = reinterpret_cast<const flatbuffers::Vector<flatbuffers::Offset<flatbuffers::Table>> *>(vec);
      for (flatbuffers::uoffset_t i = 0; i < typed->size(); ++i) {
        stored.children.push_back(AddTable(*typed->Get(i), *obj));
        stored.child_weights.push_back(weight);
      }
    } else {
      throw std::runtime_error("unsupported natural vector element type " +
                               std::to_string(static_cast<int>(stored.element)));
    }
    nodes[id] = std::move(stored);
    return id;
  }

  int AddTable(const flatbuffers::Table &table, const reflection::Object &object) {
    const auto key = std::make_pair(static_cast<const void *>(&table), static_cast<int>(Kind::Table));
    auto found = identity.find(key);
    if (found != identity.end()) return found->second;
    const int id = static_cast<int>(nodes.size());
    identity[key] = id;
    Node n;
    n.kind = Kind::Table;
    n.source = &table;
    n.object = &object;
    n.name = object.name()->str();
    nodes.push_back(std::move(n));

    Node stored = nodes[id];
    for (auto it = object.fields()->begin(); it != object.fields()->end(); ++it) {
      const auto &field = **it;
      if (!table.CheckField(field.offset())) continue;
      FieldData data;
      data.def = &field;
      data.weight = ProfileWeight(object.name()->str(), field.name()->str());
      const auto type = field.type()->base_type();
      if (IsScalar(type)) {
        const auto *ptr = table.GetAddressOf(field.offset());
        const size_t bytes = static_cast<size_t>(TypeSize(type));
        data.scalar.assign(ptr, ptr + bytes);
      } else if (type == reflection::String) {
        data.child = AddString(flatbuffers::GetFieldS(table, field));
      } else if (type == reflection::Obj) {
        const auto *child_def = schema->objects()->Get(field.type()->index());
        if (child_def->is_struct()) throw std::runtime_error("unexpected TFLite struct");
        const auto *child = flatbuffers::GetFieldT(table, field);
        if (child) data.child = AddTable(*child, *child_def);
      } else if (type == reflection::Union) {
        const auto *child = flatbuffers::GetFieldT(table, field);
        if (child) {
          const auto &child_def = flatbuffers::GetUnionType(*schema, object, field, table);
          data.child = AddTable(*child, child_def);
        }
      } else if (type == reflection::Vector) {
        data.child = AddVector(table, object, field);
      } else {
        throw std::runtime_error("unsupported natural field type " +
                                 std::to_string(static_cast<int>(type)));
      }
      if (data.child >= 0) {
        stored.children.push_back(data.child);
        stored.child_weights.push_back(data.weight);
      }
      stored.fields.push_back(std::move(data));
    }
    nodes[id] = std::move(stored);
    return id;
  }

  void FinalizeParents() {
    for (auto &n : nodes) n.parents.clear();
    for (int parent = 0; parent < static_cast<int>(nodes.size()); ++parent) {
      for (int child : nodes[parent].children) {
        if (child >= 0) nodes[child].parents.push_back(parent);
      }
    }
    for (auto &n : nodes) {
      std::sort(n.parents.begin(), n.parents.end());
      n.parents.erase(std::unique(n.parents.begin(), n.parents.end()), n.parents.end());
    }
  }

  std::string Canonical() const {
    std::ostringstream os;
    os << "root=" << root << ";nodes=" << nodes.size() << ';';
    for (int id = 0; id < static_cast<int>(nodes.size()); ++id) {
      const auto &n = nodes[id];
      os << "#" << id << ':' << static_cast<int>(n.kind) << ':' << n.name << ':';
      if (n.kind == Kind::String) {
        os << Hex(reinterpret_cast<const uint8_t *>(n.text.data()), n.text.size());
      } else if (n.kind == Kind::Vector) {
        os << static_cast<int>(n.element) << ':' << n.count << ':' << n.force_alignment << ':';
        if (!n.vector_scalar_bytes.empty()) {
          os << Hex(n.vector_scalar_bytes.data(), n.vector_scalar_bytes.size());
        } else {
          for (int child : n.children) os << child << ',';
        }
      } else {
        for (const auto &f : n.fields) {
          os << f.def->id() << '/' << f.def->name()->str() << '=';
          if (!f.scalar.empty()) os << Hex(f.scalar.data(), f.scalar.size());
          else os << '@' << f.child;
          os << ',';
        }
      }
      os << ';';
    }
    return os.str();
  }

  uint64_t WeightedDistanceFromPointers() const {
    uint64_t sum = 0;
    for (int parent = 0; parent < static_cast<int>(nodes.size()); ++parent) {
      const auto &n = nodes[parent];
      for (size_t i = 0; i < n.children.size(); ++i) {
        const int child = n.children[i];
        if (child < 0) continue;
        const auto a = reinterpret_cast<uintptr_t>(n.source);
        const auto b = reinterpret_cast<uintptr_t>(nodes[child].source);
        const uint64_t d = a > b ? a - b : b - a;
        sum += static_cast<uint64_t>(n.child_weights[i]) * d;
      }
    }
    return sum;
  }

  bool ForceAlignmentPass() const {
    for (const auto &n : nodes) {
      if (n.kind == Kind::Vector && n.force_alignment > 0) {
        const auto *vec = static_cast<const flatbuffers::Vector<uint8_t> *>(n.source);
        if (reinterpret_cast<uintptr_t>(vec->Data()) % static_cast<uintptr_t>(n.force_alignment)) return false;
      }
    }
    return true;
  }
};

Graph ExtractGraph(const reflection::Schema *schema, const uint8_t *buffer) {
  Graph graph;
  graph.schema = schema;
  const auto *root = flatbuffers::GetAnyRoot(buffer);
  graph.root = graph.AddTable(*root, *schema->root_table());
  graph.FinalizeParents();
  return graph;
}

struct Step { int node = -1; int variant = 0; };
using Plan = std::vector<Step>;

struct VtableEntry { std::string bytes; uint32_t offset = 0; };

struct BuildResult {
  bool ok = true;
  bool complete = false;
  std::string why;
  std::vector<uint8_t> output;
  std::vector<uint32_t> offsets;
  std::vector<VtableEntry> vtables;
  std::vector<uint8_t> completed;
  size_t current_bytes = 0;
  size_t min_alignment = 1;
  uint64_t distance = 0;
  uint64_t calls = 2;
  std::string raw_prefix;
};

std::vector<int> FieldOrder(const Graph &g, int node, int variant) {
  const auto &fields = g.nodes[node].fields;
  std::vector<int> order(fields.size());
  std::iota(order.begin(), order.end(), 0);
  if (variant == 1) std::reverse(order.begin(), order.end());
  if (variant == 2) {
    std::stable_sort(order.begin(), order.end(), [&](int a, int b) {
      if (fields[a].weight != fields[b].weight) return fields[a].weight > fields[b].weight;
      return fields[a].def->id() < fields[b].def->id();
    });
  }
  return order;
}

std::vector<int> Variants(const Graph &g, int node) {
  if (g.nodes[node].kind != Kind::Table) return {0};
  std::vector<int> result;
  std::set<std::vector<int>> seen;
  for (int v = 0; v < 3; ++v) {
    auto order = FieldOrder(g, node, v);
    if (seen.insert(order).second) result.push_back(v);
  }
  return result;
}

template <typename T>
void AddScalar(flatbuffers::FlatBufferBuilder *fbb, const FieldData &field) {
  const T value = flatbuffers::ReadScalar<T>(field.scalar.data());
  T def{};
  if constexpr (std::is_floating_point<T>::value) {
    def = static_cast<T>(field.def->default_real());
  } else {
    def = static_cast<T>(field.def->default_integer());
  }
  fbb->AddElement<T>(field.def->offset(), value, def);
}

void EmitScalar(flatbuffers::FlatBufferBuilder *fbb, const FieldData &field) {
  switch (field.def->type()->base_type()) {
    case reflection::UType:
    case reflection::Bool:
    case reflection::UByte: AddScalar<uint8_t>(fbb, field); break;
    case reflection::Byte: AddScalar<int8_t>(fbb, field); break;
    case reflection::Short: AddScalar<int16_t>(fbb, field); break;
    case reflection::UShort: AddScalar<uint16_t>(fbb, field); break;
    case reflection::Int: AddScalar<int32_t>(fbb, field); break;
    case reflection::UInt: AddScalar<uint32_t>(fbb, field); break;
    case reflection::Long: AddScalar<int64_t>(fbb, field); break;
    case reflection::ULong: AddScalar<uint64_t>(fbb, field); break;
    case reflection::Float: AddScalar<float>(fbb, field); break;
    case reflection::Double: AddScalar<double>(fbb, field); break;
    default: throw std::runtime_error("EmitScalar non-scalar");
  }
}

template <typename T>
flatbuffers::Offset<void> CreateScalarVector(flatbuffers::FlatBufferBuilder *fbb, const Node &n) {
  const auto *data = reinterpret_cast<const T *>(n.vector_scalar_bytes.data());
  return flatbuffers::Offset<void>(fbb->CreateVector(data, n.count).o);
}

flatbuffers::Offset<void> EmitVector(flatbuffers::FlatBufferBuilder *fbb, const Graph &g,
                                     const Node &n, const std::vector<uint32_t> &offsets,
                                     uint64_t *calls) {
  if (n.force_alignment > 0) {
    const size_t elem_size = IsScalar(n.element) ? static_cast<size_t>(TypeSize(n.element))
                                                  : sizeof(flatbuffers::uoffset_t);
    fbb->ForceVectorAlignment(n.count, elem_size, static_cast<size_t>(n.force_alignment));
    ++*calls;
  }
  flatbuffers::Offset<void> out;
  switch (n.element) {
    case reflection::UType:
    case reflection::Bool:
    case reflection::UByte: out = CreateScalarVector<uint8_t>(fbb, n); break;
    case reflection::Byte: out = CreateScalarVector<int8_t>(fbb, n); break;
    case reflection::Short: out = CreateScalarVector<int16_t>(fbb, n); break;
    case reflection::UShort: out = CreateScalarVector<uint16_t>(fbb, n); break;
    case reflection::Int: out = CreateScalarVector<int32_t>(fbb, n); break;
    case reflection::UInt: out = CreateScalarVector<uint32_t>(fbb, n); break;
    case reflection::Long: out = CreateScalarVector<int64_t>(fbb, n); break;
    case reflection::ULong: out = CreateScalarVector<uint64_t>(fbb, n); break;
    case reflection::Float: out = CreateScalarVector<float>(fbb, n); break;
    case reflection::Double: out = CreateScalarVector<double>(fbb, n); break;
    case reflection::String:
    case reflection::Obj: {
      fbb->StartVector(n.count, sizeof(flatbuffers::uoffset_t), alignof(flatbuffers::uoffset_t));
      ++*calls;
      for (auto it = n.children.rbegin(); it != n.children.rend(); ++it) {
        fbb->PushElement(flatbuffers::Offset<void>(offsets[*it]));
        ++*calls;
      }
      out = flatbuffers::Offset<void>(fbb->EndVector(static_cast<flatbuffers::uoffset_t>(n.count)));
      ++*calls;
      return out;
    }
    default: throw std::runtime_error("unsupported vector emission type");
  }
  ++*calls;
  return out;
}

void RecordVtable(flatbuffers::FlatBufferBuilder *fbb, uint32_t table_offset,
                  bool dedup, BuildResult *r) {
  if (!dedup) return;
  const size_t size = fbb->GetSize();
  const uint8_t *base = fbb->GetCurrentBufferPointer();
  const ptrdiff_t table_index = static_cast<ptrdiff_t>(size) - table_offset;
  const auto rel = flatbuffers::ReadScalar<flatbuffers::soffset_t>(base + table_index);
  const ptrdiff_t vt_index = table_index - rel;
  if (table_index < 0 || vt_index < 0 || static_cast<size_t>(vt_index + 2) > size)
    throw std::runtime_error("native vtable bounds");
  const auto len = flatbuffers::ReadScalar<flatbuffers::voffset_t>(base + vt_index);
  if (len < 4 || static_cast<size_t>(vt_index) + len > size)
    throw std::runtime_error("native vtable length");
  const std::string bytes = Hex(base + vt_index, len);
  if (std::none_of(r->vtables.begin(), r->vtables.end(),
                   [&](const VtableEntry &v) { return v.bytes == bytes; })) {
    r->vtables.push_back({bytes, static_cast<uint32_t>(size - static_cast<size_t>(vt_index))});
  }
}

BuildResult Build(const Graph &g, const Plan &plan, bool dedup, size_t capacity) {
  BuildResult r;
  r.offsets.assign(g.nodes.size(), 0);
  r.completed.assign(g.nodes.size(), 0);
  try {
    flatbuffers::FlatBufferBuilder fbb(capacity);
    fbb.ForceDefaults(true);  // present defaults are part of the frozen object.
    fbb.DedupVtables(dedup);
    for (const auto &step : plan) {
      if (step.node < 0 || step.node >= static_cast<int>(g.nodes.size()) || r.completed[step.node])
        throw std::runtime_error("duplicate/bad natural node action");
      const Node &n = g.nodes[step.node];
      for (int child : n.children) {
        if (child >= 0 && !r.completed[child]) throw std::runtime_error("natural dependency violation");
      }
      flatbuffers::Offset<void> out;
      if (n.kind == Kind::String) {
        out = flatbuffers::Offset<void>(fbb.CreateString(n.text.data(), n.text.size()).o);
        ++r.calls;
      } else if (n.kind == Kind::Vector) {
        out = EmitVector(&fbb, g, n, r.offsets, &r.calls);
      } else {
        const auto order = FieldOrder(g, step.node, step.variant);
        const auto start = fbb.StartTable();
        ++r.calls;
        for (int index : order) {
          const auto &field = n.fields[index];
          if (!field.scalar.empty()) EmitScalar(&fbb, field);
          else fbb.AddOffset(field.def->offset(),
                             field.child >= 0 ? flatbuffers::Offset<void>(r.offsets[field.child])
                                              : flatbuffers::Offset<void>());
          ++r.calls;
        }
        out = flatbuffers::Offset<void>(fbb.EndTable(start));
        ++r.calls;
        RecordVtable(&fbb, out.o, dedup, &r);
      }
      r.offsets[step.node] = out.o;
      r.completed[step.node] = 1;
    }
    const bool complete = std::all_of(r.completed.begin(), r.completed.end(), [](uint8_t x) { return x != 0; });
    if (complete) {
      fbb.Finish(flatbuffers::Offset<void>(r.offsets[g.root]), "TFL3");
      ++r.calls;
      r.complete = true;
    }
    r.current_bytes = fbb.GetSize();
    r.min_alignment = fbb.GetBufferMinAlignment();
    if (r.current_bytes) r.raw_prefix = Hex(fbb.GetCurrentBufferPointer(), r.current_bytes);
    if (complete) r.output.assign(fbb.GetBufferPointer(), fbb.GetBufferPointer() + fbb.GetSize());
    for (int parent = 0; parent < static_cast<int>(g.nodes.size()); ++parent) {
      if (!r.completed[parent]) continue;
      const auto &n = g.nodes[parent];
      for (size_t i = 0; i < n.children.size(); ++i) {
        const int child = n.children[i];
        if (child < 0 || !r.completed[child]) continue;
        const uint64_t a = r.offsets[parent], b = r.offsets[child];
        r.distance += static_cast<uint64_t>(n.child_weights[i]) * (a > b ? a - b : b - a);
      }
    }
  } catch (const std::exception &e) {
    r.ok = false;
    r.why = e.what();
  }
  return r;
}

bool Ready(const Graph &g, int node, const std::vector<uint8_t> &done) {
  if (done[node]) return false;
  for (int child : g.nodes[node].children) if (child >= 0 && !done[child]) return false;
  return true;
}

double NodeHotness(const Graph &g, int node) {
  double score = 0;
  for (int w : g.nodes[node].child_weights) score += w;
  for (int p : g.nodes[node].parents) {
    const auto &parent = g.nodes[p];
    for (size_t i = 0; i < parent.children.size(); ++i)
      if (parent.children[i] == node) score += parent.child_weights[i];
  }
  return score;
}

Plan DeterministicPlan(const Graph &g, bool hot_nodes, bool hot_fields) {
  Plan plan;
  std::vector<uint8_t> done(g.nodes.size(), 0);
  while (plan.size() < g.nodes.size()) {
    int choice = -1;
    for (int node = 0; node < static_cast<int>(g.nodes.size()); ++node) {
      if (!Ready(g, node, done)) continue;
      if (choice < 0 || (hot_nodes && NodeHotness(g, node) > NodeHotness(g, choice)) ||
          (!hot_nodes && node < choice)) choice = node;
    }
    if (choice < 0) throw std::runtime_error("natural graph is cyclic");
    int variant = hot_fields && g.nodes[choice].kind == Kind::Table ? 2 : 0;
    plan.push_back({choice, variant});
    done[choice] = 1;
  }
  return plan;
}

std::string CompletionKey(const std::vector<uint8_t> &done) {
  std::string out;
  out.reserve(done.size());
  for (uint8_t x : done) out.push_back(x ? '1' : '0');
  return out;
}

std::string StateKey(const Graph &g, const BuildResult &r, bool dedup) {
  std::ostringstream os;
  os << CompletionKey(r.completed) << '|' << r.current_bytes << '|' << r.min_alignment << '|';
  for (int node = 0; node < static_cast<int>(g.nodes.size()); ++node) {
    if (!r.completed[node]) continue;
    bool live = false;
    for (int parent : g.nodes[node].parents) if (!r.completed[parent]) live = true;
    if (live) os << node << '@' << r.offsets[node] << ';';
  }
  if (dedup) {
    bool table_remaining = false;
    for (int node = 0; node < static_cast<int>(g.nodes.size()); ++node)
      if (!r.completed[node] && g.nodes[node].kind == Kind::Table) table_remaining = true;
    if (table_remaining) for (const auto &v : r.vtables) os << 'V' << v.bytes << '@' << v.offset << ';';
  }
  return os.str();
}

struct PlannerResult {
  Plan plan;
  bool fallback = false;
  uint64_t transitions = 0;
  uint64_t states = 0;
  uint64_t merges = 0;
  uint64_t distinct_raw_merges = 0;
  uint64_t temp_bytes = 0;
  double wall_ms = 0;
  double cpu_ms = 0;
  size_t peak_rss = 0;
};

struct Label { Plan plan; BuildResult state; };

auto PrefixScore(const Label &label) {
  return std::make_tuple(label.state.distance, label.state.current_bytes, label.state.calls,
                         label.plan.size());
}

PlannerResult BeamPlan(const Graph &g, bool quotient, bool dedup, size_t capacity,
                       size_t width = 8, uint64_t transition_cap = 20000) {
  PlannerResult result;
  const auto wall0 = Clock::now();
  const auto cpu0 = std::clock();
  result.peak_rss = WorkingSet();
  Label start;
  start.state = Build(g, {}, dedup, capacity);
  std::vector<Label> beam{std::move(start)};
  for (size_t layer = 0; layer < g.nodes.size(); ++layer) {
    std::vector<Label> expanded;
    for (const auto &label : beam) {
      for (int node = 0; node < static_cast<int>(g.nodes.size()); ++node) {
        if (!Ready(g, node, label.state.completed)) continue;
        for (int variant : Variants(g, node)) {
          if (++result.transitions > transition_cap) {
            result.fallback = true;
            result.plan = DeterministicPlan(g, false, false);
            goto finished;
          }
          Label next;
          next.plan = label.plan;
          next.plan.push_back({node, variant});
          next.state = Build(g, next.plan, dedup, capacity);
          if (!next.state.ok) throw std::runtime_error("planner replay: " + next.state.why);
          expanded.push_back(std::move(next));
        }
      }
    }
    if (quotient) {
      std::map<std::string, size_t> index;
      std::map<std::string, std::string> raw;
      std::vector<Label> merged;
      for (auto &label : expanded) {
        const std::string key = StateKey(g, label.state, dedup);
        auto found = index.find(key);
        if (found == index.end()) {
          index[key] = merged.size();
          raw[key] = label.state.raw_prefix;
          merged.push_back(std::move(label));
        } else {
          ++result.merges;
          if (raw[key] != label.state.raw_prefix) ++result.distinct_raw_merges;
          if (PrefixScore(label) < PrefixScore(merged[found->second]))
            merged[found->second] = std::move(label);
        }
      }
      expanded = std::move(merged);
    }
    std::sort(expanded.begin(), expanded.end(),
              [](const Label &a, const Label &b) { return PrefixScore(a) < PrefixScore(b); });
    if (expanded.size() > width) expanded.resize(width);
    result.states += expanded.size();
    for (const auto &l : expanded)
      result.temp_bytes = std::max<uint64_t>(result.temp_bytes,
                                             l.state.raw_prefix.size() / 2 + l.plan.size() * sizeof(Step));
    result.peak_rss = std::max(result.peak_rss, WorkingSet());
    beam = std::move(expanded);
  }
  if (beam.empty()) {
    result.fallback = true;
    result.plan = DeterministicPlan(g, false, false);
  } else {
    result.plan = beam.front().plan;
  }
finished:
  result.wall_ms = std::chrono::duration<double, std::milli>(Clock::now() - wall0).count();
  result.cpu_ms = 1000.0 * (std::clock() - cpu0) / CLOCKS_PER_SEC;
  result.peak_rss = std::max(result.peak_rss, WorkingSet());
  return result;
}

std::vector<uint8_t> GeneratedPack(const uint8_t *input) {
  const auto *model = tflite::GetModel(input);
  std::unique_ptr<tflite::ModelT> object(model->UnPack());
  flatbuffers::FlatBufferBuilder fbb;
  const auto root = tflite::Model::Pack(fbb, object.get());
  tflite::FinishModelBuffer(fbb, root);
  return std::vector<uint8_t>(fbb.GetBufferPointer(), fbb.GetBufferPointer() + fbb.GetSize());
}

volatile uint64_t reader_sink = 0;

uint64_t ReaderChecksum(const uint8_t *buffer, uint32_t seed) {
  const auto *model = tflite::GetModel(buffer);
  uint64_t sum = model->version() + seed;
  const auto *subs = model->subgraphs();
  const auto *codes = model->operator_codes();
  const auto *buffers = model->buffers();
  if (codes) sum += codes->size();
  if (buffers) sum += buffers->size();
  if (subs) {
    sum += subs->size();
    for (flatbuffers::uoffset_t i = 0; i < subs->size(); ++i) {
      const auto *sg = subs->Get(i);
      if (!sg) continue;
      const auto *tensors = sg->tensors();
      const auto *ops = sg->operators();
      if (tensors && tensors->size()) {
        const auto *t = tensors->Get((seed + i * 17u) % tensors->size());
        if (t) {
          sum += static_cast<uint64_t>(t->type());
          if (t->name()) sum += t->name()->size();
          if (t->shape()) sum += t->shape()->size();
        }
      }
      if (ops && ops->size()) {
        const auto *op = ops->Get((seed + i * 13u) % ops->size());
        if (op) {
          sum += op->opcode_index();
          if (op->inputs()) sum += op->inputs()->size();
          if (op->outputs()) sum += op->outputs()->size();
        }
      }
    }
  }
  if (buffers && buffers->size()) {
    const auto *b = buffers->Get(seed % buffers->size());
    if (b && b->data()) sum += b->data()->size();
  }
  return sum;
}

struct Timing {
  double builder_wall_us = 0;
  double verify_wall_us = 0;
  double reader_warm_ns = 0;
  double reader_cold_ns = 0;
  size_t peak_rss = 0;
};

template <typename Builder>
Timing Measure(const std::vector<uint8_t> &output, Builder builder) {
  Timing t;
  t.peak_rss = WorkingSet();
  constexpr int build_reps = 30;
  auto start = Clock::now();
  for (int i = 0; i < build_reps; ++i) {
    auto bytes = builder();
    reader_sink += bytes.size();
  }
  t.builder_wall_us = std::chrono::duration<double, std::micro>(Clock::now() - start).count() / build_reps;
  t.peak_rss = std::max(t.peak_rss, WorkingSet());

  constexpr int verify_reps = 200;
  start = Clock::now();
  for (int i = 0; i < verify_reps; ++i) {
    flatbuffers::Verifier verifier(output.data(), output.size());
    reader_sink += tflite::VerifyModelBuffer(verifier) ? 1 : 0;
  }
  t.verify_wall_us = std::chrono::duration<double, std::micro>(Clock::now() - start).count() / verify_reps;

  constexpr int warm_reps = 5000;
  start = Clock::now();
  for (int i = 0; i < warm_reps; ++i) reader_sink += ReaderChecksum(output.data(), static_cast<uint32_t>(i));
  t.reader_warm_ns = std::chrono::duration<double, std::nano>(Clock::now() - start).count() / warm_reps;

  std::vector<uint8_t> eviction(8u * 1024u * 1024u, 1);
  constexpr int cold_reps = 50;
  start = Clock::now();
  for (int i = 0; i < cold_reps; ++i) {
    for (size_t j = 0; j < eviction.size(); j += 64) reader_sink += eviction[j];
    reader_sink += ReaderChecksum(output.data(), static_cast<uint32_t>(i));
  }
  t.reader_cold_ns = std::chrono::duration<double, std::nano>(Clock::now() - start).count() / cold_reps;
  t.peak_rss = std::max(t.peak_rss, WorkingSet());
  return t;
}

struct Arm {
  std::string name;
  Plan plan;
  bool generated = false;
  bool dedup = true;
  size_t capacity = 1024;
  PlannerResult planner;
};

void PrintHeader() {
  std::cout << "split,family,model,arm,eligible,verify,equality,identifier,alignment,bytes,weighted_distance,"
               "nodes,aliases,builder_calls,builder_wall_us,verify_wall_us,reader_warm_ns,reader_cold_ns,"
               "planner_wall_ms,planner_cpu_ms,planner_peak_rss,planner_states,planner_transitions,planner_merges,"
               "planner_distinct_raw_merges,planner_temp_bytes,fallback,process_peak_rss,canonical_fnv64\n";
}

}  // namespace

int main(int argc, char **argv) {
  if (argc != 6) {
    std::cerr << "usage: natural_native_harness schema.bfbs model.tflite split family model_id\n";
    return 64;
  }
  try {
    const auto schema_bytes = ReadFile(argv[1]);
    const auto input = ReadFile(argv[2]);
    const auto *schema = reflection::GetSchema(schema_bytes.data());
    flatbuffers::Verifier original_verifier(input.data(), input.size());
    if (!tflite::VerifyModelBuffer(original_verifier)) throw std::runtime_error("original stock verify failed");
    if (!flatbuffers::BufferHasIdentifier(input.data(), "TFL3")) throw std::runtime_error("original identifier failed");

    const auto profile_wall0 = Clock::now();
    const auto profile_cpu0 = std::clock();
    const size_t profile_rss0 = WorkingSet();
    const Graph original = ExtractGraph(schema, input.data());
    const std::string canonical = original.Canonical();
    const double profile_wall_ms = std::chrono::duration<double, std::milli>(Clock::now() - profile_wall0).count();
    const double profile_cpu_ms = 1000.0 * (std::clock() - profile_cpu0) / CLOCKS_PER_SEC;
    const size_t profile_peak_rss = std::max(profile_rss0, WorkingSet());

    const Plan stable = DeterministicPlan(original, false, false);
    const Plan hot = DeterministicPlan(original, true, true);
    const Plan local = DeterministicPlan(original, false, true);
    const auto generic = BeamPlan(original, false, true, 1024);
    const auto candidate = BeamPlan(original, true, true, 1024);
    std::vector<Arm> arms{
        {"generated_pack_default", {}, true, true, 1024, {}},
        {"stable_legal_topo", stable, false, true, 1024, {}},
        {"stable_dedup_off", stable, false, false, 1024, {}},
        {"stable_size_matched_capacity", stable, false, true, std::max<size_t>(64, input.size()), {}},
        {"hot_first_ready", hot, false, true, 1024, {}},
        {"local_field_order", local, false, true, 1024, {}},
        {"generic_bounded_beam", generic.plan, false, true, 1024, generic},
        {"fb_rcfdp_bounded", candidate.plan, false, true, 1024, candidate},
    };

    PrintHeader();
    for (auto &arm : arms) {
      std::vector<uint8_t> output;
      BuildResult built;
      if (arm.generated) {
        output = GeneratedPack(input.data());
      } else {
        built = Build(original, arm.plan, arm.dedup, arm.capacity);
        if (!built.ok || !built.complete) throw std::runtime_error(arm.name + " build failed: " + built.why);
        output = built.output;
      }
      flatbuffers::Verifier verifier(output.data(), output.size());
      const bool verify = tflite::VerifyModelBuffer(verifier);
      const bool identifier = flatbuffers::BufferHasIdentifier(output.data(), "TFL3");
      bool equality = false, alignment = false;
      uint64_t distance = 0, canonical_hash = 0;
      if (verify && identifier) {
        const Graph replayed = ExtractGraph(schema, output.data());
        const std::string replayed_canonical = replayed.Canonical();
        equality = replayed_canonical == canonical;
        alignment = replayed.ForceAlignmentPass();
        distance = replayed.WeightedDistanceFromPointers();
        canonical_hash = Fnv1a(replayed_canonical);
      }
      const bool eligible = verify && identifier && equality && alignment;
      Timing timing;
      if (arm.generated) {
        timing = Measure(output, [&]() { return GeneratedPack(input.data()); });
      } else {
        timing = Measure(output, [&]() { return Build(original, arm.plan, arm.dedup, arm.capacity).output; });
      }
      size_t aliases = 0;
      for (const auto &n : original.nodes) if (n.parents.size() > 1) ++aliases;
      std::cout << Csv(argv[3]) << ',' << Csv(argv[4]) << ',' << Csv(argv[5]) << ',' << Csv(arm.name) << ','
                << eligible << ',' << verify << ',' << equality << ',' << identifier << ',' << alignment << ','
                << output.size() << ',' << distance << ',' << original.nodes.size() << ',' << aliases << ','
                << (arm.generated ? 0 : built.calls) << ',' << std::fixed << std::setprecision(3)
                << timing.builder_wall_us << ',' << timing.verify_wall_us << ',' << timing.reader_warm_ns << ','
                << timing.reader_cold_ns << ',' << arm.planner.wall_ms << ',' << arm.planner.cpu_ms << ','
                << arm.planner.peak_rss << ',' << arm.planner.states << ',' << arm.planner.transitions << ','
                << arm.planner.merges << ',' << arm.planner.distinct_raw_merges << ',' << arm.planner.temp_bytes << ','
                << arm.planner.fallback << ',' << timing.peak_rss << ',' << canonical_hash << '\n';
    }
    std::cerr << "PROFILE," << argv[5] << ',' << profile_wall_ms << ',' << profile_cpu_ms << ','
              << profile_peak_rss << ',' << original.nodes.size() << ',' << Fnv1a(canonical) << '\n';
    return 0;
  } catch (const std::exception &e) {
    std::cerr << "FATAL," << argv[5] << ',' << e.what() << '\n';
    return 2;
  }
}
