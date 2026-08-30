#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <string>
#include <vector>

#include "flatbuffers/flatbuffer_builder.h"
#include "flatbuffers/verifier.h"
#include "witness_generated.h"

namespace fbw = StageAFlatBuffersWitness;

static std::vector<std::uint8_t> FromHex(const char *hex) {
  std::vector<std::uint8_t> result;
  for (std::size_t i = 0; hex[i] != '\0'; i += 2) {
    const std::string byte_text(hex + i, 2);
    result.push_back(static_cast<std::uint8_t>(std::strtoul(byte_text.c_str(), nullptr, 16)));
  }
  return result;
}

static std::vector<std::uint8_t> Build(bool left_first) {
  flatbuffers::FlatBufferBuilder builder(1024);
  builder.ForceDefaults(false);
  builder.DedupVtables(true);

  flatbuffers::Offset<fbw::Child> left;
  flatbuffers::Offset<fbw::Child> right;
  if (left_first) {
    left = fbw::CreateChild(builder, 1);
    right = fbw::CreateChild(builder, 2);
  } else {
    right = fbw::CreateChild(builder, 2);
    left = fbw::CreateChild(builder, 1);
  }

  fbw::RootBuilder root_builder(builder);
  root_builder.add_right(right);
  root_builder.add_left(left);
  const auto root = root_builder.Finish();
  fbw::FinishRootBuffer(builder, root);

  return std::vector<std::uint8_t>(builder.GetBufferPointer(),
                                   builder.GetBufferPointer() + builder.GetSize());
}

struct CheckResult {
  bool verify;
  std::int32_t left_x;
  std::int32_t right_x;
  std::ptrdiff_t root_address;
  std::ptrdiff_t left_address;
  std::ptrdiff_t right_address;
};

static CheckResult Check(const std::vector<std::uint8_t> &bytes) {
  flatbuffers::Verifier verifier(bytes.data(), bytes.size());
  const bool verify = fbw::VerifyRootBuffer(verifier);
  const auto *root = fbw::GetRoot(bytes.data());
  return {verify,
          root->left()->x(),
          root->right()->x(),
          reinterpret_cast<const std::uint8_t *>(root) - bytes.data(),
          reinterpret_cast<const std::uint8_t *>(root->left()) - bytes.data(),
          reinterpret_cast<const std::uint8_t *>(root->right()) - bytes.data()};
}

int main() {
  const auto plan_a = Build(true);
  const auto plan_b = Build(false);
  const auto expected_a = FromHex(
      "0C00000008000E000400080008000000200000000C000000000006000A000400060000000200000000000600080004000600000001000000");
  const auto expected_b = FromHex(
      "0C00000008000E000400080008000000100000001C000000000006000A000400060000000100000000000600080004000600000002000000");
  const auto check_a = Check(plan_a);
  const auto check_b = Check(plan_b);
  const auto distance_a = std::llabs(check_a.root_address - check_a.right_address);
  const auto distance_b = std::llabs(check_b.root_address - check_b.right_address);

  const bool pass = plan_a == expected_a && plan_b == expected_b &&
                    check_a.verify && check_b.verify &&
                    check_a.left_x == 1 && check_b.left_x == 1 &&
                    check_a.right_x == 2 && check_b.right_x == 2 &&
                    check_a.root_address == 12 && check_b.root_address == 12 &&
                    check_a.left_address == 48 && check_a.right_address == 32 &&
                    check_b.left_address == 32 && check_b.right_address == 48 &&
                    plan_a.size() == 56 && plan_b.size() == 56 &&
                    distance_a == 20 && distance_b == 36;

  std::printf(
      "{\"gate\":\"native_56_byte_witness\",\"pass\":%s,"
      "\"plan_a_bytes\":%zu,\"plan_b_bytes\":%zu,"
      "\"plan_a_verify\":%s,\"plan_b_verify\":%s,"
      "\"plan_a_root\":%td,\"plan_a_left\":%td,\"plan_a_right\":%td,"
      "\"plan_b_root\":%td,\"plan_b_left\":%td,\"plan_b_right\":%td,"
      "\"plan_a_distance\":%lld,\"plan_b_distance\":%lld}\n",
      pass ? "true" : "false", plan_a.size(), plan_b.size(),
      check_a.verify ? "true" : "false", check_b.verify ? "true" : "false",
      check_a.root_address, check_a.left_address, check_a.right_address,
      check_b.root_address, check_b.left_address, check_b.right_address,
      static_cast<long long>(distance_a), static_cast<long long>(distance_b));
  return pass ? 0 : 1;
}
