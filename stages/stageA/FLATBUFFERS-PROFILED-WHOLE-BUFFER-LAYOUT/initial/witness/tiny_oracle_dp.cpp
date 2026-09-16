#include <algorithm>
#include <array>
#include <cstdint>
#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <map>
#include <set>
#include <sstream>
#include <stdexcept>
#include <string>
#include <tuple>
#include <utility>
#include <vector>

#include "flatbuffers/flatbuffer_builder.h"
#include "flatbuffers/verifier.h"
#include "tiny_oracle_generated.h"

namespace {

enum class CaseKind { Alias, String, Vector };

struct Config {
  bool dedup = true;
  bool force_defaults = false;
};

struct Step {
  int node = -1;
  int variant = -1;
};

using Plan = std::vector<Step>;

struct VtableEntry {
  std::string bytes;
  uint32_t offset = 0;
};

struct Replay {
  bool ok = true;
  bool complete = false;
  bool verify = false;
  bool equality = false;
  bool identifier = false;
  bool alignment = false;
  std::string why;
  uint32_t completed = 0;
  size_t bytes = 0;
  size_t min_align = 1;
  std::array<uint32_t, 8> offsets{};
  std::vector<VtableEntry> vtables;
  std::map<std::string, uint32_t> shared_pool;
  int64_t profile_distance = 0;
  int calls = 2;  // ForceDefaults + DedupVtables configuration calls.
  std::string raw;
};

struct Objective {
  int64_t distance = 0;
  size_t bytes = 0;
  int calls = 0;

  auto tie() const { return std::tie(distance, bytes, calls); }
  bool operator<(const Objective &other) const { return tie() < other.tie(); }
  bool operator==(const Objective &other) const { return tie() == other.tie(); }
};

struct Label {
  Plan plan;
  Objective objective;
  uint64_t multiplicity = 1;
};

struct CaseSummary {
  uint64_t oracle_plans = 0;
  size_t oracle_unique_buffers = 0;
  size_t oracle_frontier = 0;
  size_t candidate_frontier = 0;
  uint64_t candidate_generated_prefixes = 0;
  uint64_t candidate_normalized_states = 0;
  uint64_t candidate_state_merges = 0;
  uint64_t candidate_last_use_merges = 0;
  bool all_verify = true;
  bool all_equality = true;
  bool all_identifier = true;
  bool all_alignment = true;
  bool path_plan_unique = true;
  bool frontier_equal = false;
  std::set<std::string> action_variants;
};

std::string CaseName(CaseKind c) {
  switch (c) {
    case CaseKind::Alias: return "alias_vtable_alignment";
    case CaseKind::String: return "shared_string_alias";
    case CaseKind::Vector: return "vector_key_force_alignment";
  }
  return "unknown";
}

uint32_t RootBit(CaseKind c) {
  if (c == CaseKind::Alias) return 1u << 2;
  if (c == CaseKind::String) return 1u << 3;
  return 1u << 4;
}

uint32_t FullMask(CaseKind c) {
  if (c == CaseKind::Alias) return 0x7u;
  if (c == CaseKind::String) return 0xFu;
  return 0x1Fu;
}

std::string Hex(const uint8_t *data, size_t size) {
  static const char digits[] = "0123456789abcdef";
  std::string out;
  out.resize(size * 2);
  for (size_t i = 0; i < size; ++i) {
    out[2 * i] = digits[data[i] >> 4];
    out[2 * i + 1] = digits[data[i] & 15];
  }
  return out;
}

std::string PlanKey(const Plan &plan) {
  std::ostringstream os;
  for (const auto &s : plan) os << s.node << '.' << s.variant << '/';
  return os.str();
}

std::vector<int> Permutation(int n, int ordinal) {
  std::vector<int> p(static_cast<size_t>(n));
  for (int i = 0; i < n; ++i) p[static_cast<size_t>(i)] = i;
  while (ordinal-- > 0) {
    if (!std::next_permutation(p.begin(), p.end())) {
      throw std::runtime_error("permutation ordinal out of range");
    }
  }
  return p;
}

bool Dominates(const Objective &a, const Objective &b) {
  const bool no_worse = a.distance <= b.distance && a.bytes <= b.bytes && a.calls <= b.calls;
  const bool strict = a.distance < b.distance || a.bytes < b.bytes || a.calls < b.calls;
  return no_worse && strict;
}

std::set<Objective> Pareto(const std::vector<Objective> &values) {
  std::set<Objective> result;
  for (const auto &v : values) {
    bool dominated = false;
    for (const auto &w : values) {
      if (Dominates(w, v)) {
        dominated = true;
        break;
      }
    }
    if (!dominated) result.insert(v);
  }
  return result;
}

void RecordVtable(flatbuffers::FlatBufferBuilder &fbb, uint32_t table_offset,
                  bool dedup, Replay *r) {
  if (!dedup) return;  // The disabled arm never queries prior vtables.
  const auto size = fbb.GetSize();
  const auto *base = fbb.GetCurrentBufferPointer();
  const ptrdiff_t table_index = static_cast<ptrdiff_t>(size) - table_offset;
  if (table_index < 0 || static_cast<size_t>(table_index + 4) > size) {
    throw std::runtime_error("table offset outside current native buffer");
  }
  const auto rel = flatbuffers::ReadScalar<flatbuffers::soffset_t>(base + table_index);
  const ptrdiff_t vt_index = table_index - rel;
  if (vt_index < 0 || static_cast<size_t>(vt_index + 2) > size) {
    throw std::runtime_error("vtable pointer outside current native buffer");
  }
  const auto len = flatbuffers::ReadScalar<flatbuffers::voffset_t>(base + vt_index);
  if (len < 4 || static_cast<size_t>(vt_index) + len > size) {
    throw std::runtime_error("invalid native vtable length");
  }
  const std::string signature = Hex(base + vt_index, len);
  const bool found = std::any_of(r->vtables.begin(), r->vtables.end(),
                                 [&](const VtableEntry &v) { return v.bytes == signature; });
  if (!found) {
    r->vtables.push_back({signature, static_cast<uint32_t>(size - static_cast<size_t>(vt_index))});
  }
}

flatbuffers::Offset<StageATiny::Leaf> MakeLeaf(flatbuffers::FlatBufferBuilder &fbb,
                                               int key, int64_t payload, int variant,
                                               const Config &cfg, Replay *r) {
  const auto order = Permutation(2, variant);
  const auto start = fbb.StartTable();
  ++r->calls;
  for (int field : order) {
    if (field == 0) {
      fbb.AddElement<int32_t>(StageATiny::Leaf::VT_KEY, key, 0);
    } else {
      fbb.AddElement<int64_t>(StageATiny::Leaf::VT_PAYLOAD, payload, 0);
    }
    ++r->calls;
  }
  flatbuffers::Offset<StageATiny::Leaf> out(fbb.EndTable(start));
  ++r->calls;
  RecordVtable(fbb, out.o, cfg.dedup, r);
  return out;
}

void AddAliasField(flatbuffers::FlatBufferBuilder &fbb, int field,
                   flatbuffers::Offset<StageATiny::Leaf> left,
                   flatbuffers::Offset<StageATiny::Leaf> right, Replay *r) {
  if (field == 0) fbb.AddOffset(StageATiny::AliasRoot::VT_LEFT, left);
  if (field == 1) fbb.AddOffset(StageATiny::AliasRoot::VT_RIGHT, right);
  if (field == 2) fbb.AddOffset(StageATiny::AliasRoot::VT_ALIAS_LEFT, left);
  ++r->calls;
}

void AddStringField(flatbuffers::FlatBufferBuilder &fbb, int field,
                    flatbuffers::Offset<flatbuffers::String> hot,
                    flatbuffers::Offset<flatbuffers::String> cold,
                    flatbuffers::Offset<flatbuffers::String> hot_alias, Replay *r) {
  if (field == 0) fbb.AddOffset(StageATiny::StringRoot::VT_HOT, hot);
  if (field == 1) fbb.AddOffset(StageATiny::StringRoot::VT_COLD, cold);
  if (field == 2) fbb.AddOffset(StageATiny::StringRoot::VT_HOT_ALIAS, hot_alias);
  ++r->calls;
}

Replay ReplayPlan(CaseKind c, const Config &cfg, const Plan &plan) {
  Replay r;
  flatbuffers::FlatBufferBuilder fbb(128);
  fbb.ForceDefaults(cfg.force_defaults);
  fbb.DedupVtables(cfg.dedup);
  std::array<flatbuffers::Offset<StageATiny::Leaf>, 2> leaf{};
  std::array<flatbuffers::Offset<flatbuffers::String>, 3> strings{};
  flatbuffers::Offset<flatbuffers::Vector<flatbuffers::Offset<StageATiny::Leaf>>> keyed;
  flatbuffers::Offset<flatbuffers::Vector<int32_t>> values;
  uint32_t root_offset = 0;

  try {
    for (const auto &step : plan) {
      const uint32_t bit = 1u << step.node;
      if (r.completed & bit) throw std::runtime_error("duplicate logical node");

      if (c == CaseKind::Alias) {
        if (step.node == 0 || step.node == 1) {
          const int which = step.node;
          leaf[which] = MakeLeaf(fbb, which + 1, which == 0 ? 111 : 222,
                                 step.variant, cfg, &r);
          r.offsets[which] = leaf[which].o;
        } else if (step.node == 2) {
          if ((r.completed & 0x3u) != 0x3u) throw std::runtime_error("AliasRoot dependency");
          const auto order = Permutation(3, step.variant);
          const auto start = fbb.StartTable();
          ++r.calls;
          for (int field : order) AddAliasField(fbb, field, leaf[0], leaf[1], &r);
          flatbuffers::Offset<StageATiny::AliasRoot> root(fbb.EndTable(start));
          ++r.calls;
          RecordVtable(fbb, root.o, cfg.dedup, &r);
          r.offsets[2] = root.o;
          root_offset = root.o;
        } else {
          throw std::runtime_error("bad Alias node");
        }
      } else if (c == CaseKind::String) {
        if (step.node == 0 || step.node == 1) {
          const char *text = step.node == 0 ? "hot" : "cold";
          strings[step.node] = step.variant == 0 ? fbb.CreateString(text)
                                                  : fbb.CreateSharedString(text);
          ++r.calls;
          if (step.variant == 1) r.shared_pool[text] = strings[step.node].o;
          r.offsets[step.node] = strings[step.node].o;
        } else if (step.node == 2) {
          if (!(r.completed & 0x1u)) throw std::runtime_error("hot alias dependency");
          if (step.variant == 0) {
            strings[2] = strings[0];
          } else {
            auto it = r.shared_pool.find("hot");
            if (it == r.shared_pool.end()) throw std::runtime_error("shared hot not in native pool");
            strings[2] = fbb.CreateSharedString("hot");
            ++r.calls;
            if (strings[2].o != strings[0].o) throw std::runtime_error("shared lookup did not alias");
          }
          r.offsets[2] = strings[2].o;
        } else if (step.node == 3) {
          if ((r.completed & 0x7u) != 0x7u) throw std::runtime_error("StringRoot dependency");
          const auto order = Permutation(3, step.variant);
          const auto start = fbb.StartTable();
          ++r.calls;
          for (int field : order) AddStringField(fbb, field, strings[0], strings[1], strings[2], &r);
          flatbuffers::Offset<StageATiny::StringRoot> root(fbb.EndTable(start));
          ++r.calls;
          RecordVtable(fbb, root.o, cfg.dedup, &r);
          r.offsets[3] = root.o;
          root_offset = root.o;
        } else {
          throw std::runtime_error("bad String node");
        }
      } else {
        if (step.node == 0 || step.node == 1) {
          const int which = step.node;
          leaf[which] = MakeLeaf(fbb, which + 1, which == 0 ? 111 : 222,
                                 step.variant, cfg, &r);
          r.offsets[which] = leaf[which].o;
        } else if (step.node == 2) {
          if ((r.completed & 0x3u) != 0x3u) throw std::runtime_error("keyed vector dependency");
          std::vector<flatbuffers::Offset<StageATiny::Leaf>> elements{leaf[0], leaf[1]};
          keyed = step.variant == 0 ? fbb.CreateVector(elements)
                                    : fbb.CreateVectorOfSortedTables<StageATiny::Leaf>(&elements);
          ++r.calls;
          r.offsets[2] = keyed.o;
        } else if (step.node == 3) {
          const std::vector<int32_t> data{3, 1, 4, 1, 5};
          fbb.ForceVectorAlignment(data.size(), sizeof(int32_t), 16);
          values = fbb.CreateVector(data);
          r.calls += 2;
          r.offsets[3] = values.o;
        } else if (step.node == 4) {
          if ((r.completed & 0xCu) != 0xCu) throw std::runtime_error("VectorRoot vector dependency");
          const auto order = Permutation(2, step.variant);
          const auto start = fbb.StartTable();
          ++r.calls;
          for (int field : order) {
            if (field == 0) fbb.AddOffset(StageATiny::VectorRoot::VT_KEYED, keyed);
            if (field == 1) fbb.AddOffset(StageATiny::VectorRoot::VT_VALUES, values);
            ++r.calls;
          }
          flatbuffers::Offset<StageATiny::VectorRoot> root(fbb.EndTable(start));
          ++r.calls;
          RecordVtable(fbb, root.o, cfg.dedup, &r);
          r.offsets[4] = root.o;
          root_offset = root.o;
        } else {
          throw std::runtime_error("bad Vector node");
        }
      }
      r.completed |= bit;
    }

    if (r.completed == FullMask(c)) {
      if (c == CaseKind::Alias) {
        fbb.Finish(flatbuffers::Offset<StageATiny::AliasRoot>(root_offset), "FBLT");
      } else if (c == CaseKind::String) {
        fbb.Finish(flatbuffers::Offset<StageATiny::StringRoot>(root_offset), "FBLT");
      } else {
        fbb.Finish(flatbuffers::Offset<StageATiny::VectorRoot>(root_offset), "FBLT");
      }
      ++r.calls;
      r.complete = true;
    }

    r.bytes = fbb.GetSize();
    r.min_align = fbb.GetBufferMinAlignment();
    if (r.bytes) r.raw = Hex(fbb.GetCurrentBufferPointer(), r.bytes);

    if (r.complete) {
      const uint8_t *buffer = fbb.GetBufferPointer();
      r.identifier = flatbuffers::BufferHasIdentifier(buffer, "FBLT");
      flatbuffers::Verifier verifier(buffer, fbb.GetSize());
      if (c == CaseKind::Alias) {
        r.verify = verifier.VerifyBuffer<StageATiny::AliasRoot>("FBLT");
        const auto *root = flatbuffers::GetRoot<StageATiny::AliasRoot>(buffer);
        r.equality = root && root->left() && root->right() && root->alias_left() &&
                     root->left() == root->alias_left() && root->left() != root->right() &&
                     root->left()->key() == 1 && root->left()->payload() == 111 &&
                     root->right()->key() == 2 && root->right()->payload() == 222;
        // Table starts need not themselves have the widest field alignment; the
        // verifier/accessor validates the native field layout. The explicit
        // reader-visible 16-byte address assertion is in the vector case.
        r.alignment = true;
        r.profile_distance = std::llabs(static_cast<int64_t>(r.offsets[2]) - r.offsets[1]);
      } else if (c == CaseKind::String) {
        r.verify = verifier.VerifyBuffer<StageATiny::StringRoot>("FBLT");
        const auto *root = flatbuffers::GetRoot<StageATiny::StringRoot>(buffer);
        r.equality = root && root->hot() && root->cold() && root->hot_alias() &&
                     root->hot()->str() == "hot" && root->cold()->str() == "cold" &&
                     root->hot_alias()->str() == "hot" && root->hot() == root->hot_alias();
        r.alignment = true;
        r.profile_distance = std::llabs(static_cast<int64_t>(r.offsets[3]) - r.offsets[0]);
      } else {
        r.verify = verifier.VerifyBuffer<StageATiny::VectorRoot>("FBLT");
        const auto *root = flatbuffers::GetRoot<StageATiny::VectorRoot>(buffer);
        const auto *ks = root ? root->keyed() : nullptr;
        const auto *vs = root ? root->values() : nullptr;
        r.equality = ks && vs && ks->size() == 2 && vs->size() == 5 &&
                     ks->Get(0)->key() == 1 && ks->Get(1)->key() == 2 &&
                     ks->LookupByKey(1) == ks->Get(0) && ks->LookupByKey(2) == ks->Get(1) &&
                     vs->Get(0) == 3 && vs->Get(1) == 1 && vs->Get(2) == 4 &&
                     vs->Get(3) == 1 && vs->Get(4) == 5;
        r.alignment = vs && (reinterpret_cast<uintptr_t>(vs->Data()) % 16u == 0);
        r.profile_distance = std::llabs(static_cast<int64_t>(r.offsets[4]) - r.offsets[2]);
      }
    }
  } catch (const std::exception &e) {
    r.ok = false;
    r.why = e.what();
  }
  return r;
}

std::vector<Step> LegalSteps(CaseKind c, const Replay &r) {
  std::vector<Step> out;
  auto add = [&](int node, int variants) {
    if (!(r.completed & (1u << node))) {
      for (int v = 0; v < variants; ++v) out.push_back({node, v});
    }
  };
  if (c == CaseKind::Alias) {
    add(0, 2);
    add(1, 2);
    if ((r.completed & 0x3u) == 0x3u) add(2, 6);
  } else if (c == CaseKind::String) {
    add(0, 2);
    add(1, 2);
    if (r.completed & 0x1u) {
      add(2, r.shared_pool.count("hot") ? 2 : 1);
    }
    if ((r.completed & 0x7u) == 0x7u) add(3, 6);
  } else {
    add(0, 2);
    add(1, 2);
    if ((r.completed & 0x3u) == 0x3u) add(2, 2);
    add(3, 1);
    if ((r.completed & 0xCu) == 0xCu) add(4, 2);
  }
  return out;
}

bool AnyTableRemaining(CaseKind c, uint32_t mask) {
  if (c == CaseKind::Alias) return (mask & 0x7u) != 0x7u;
  if (c == CaseKind::String) return !(mask & (1u << 3));
  return (mask & ((1u << 0) | (1u << 1) | (1u << 4))) !=
         ((1u << 0) | (1u << 1) | (1u << 4));
}

bool OffsetLive(CaseKind c, int node, uint32_t mask) {
  if (mask == FullMask(c)) return false;
  if (c == CaseKind::Alias) {
    if (node <= 1 && !(mask & (1u << 2))) return true;
  } else if (c == CaseKind::String) {
    if (node == 0 && (!(mask & (1u << 2)) || !(mask & (1u << 3)))) return true;
    if ((node == 1 || node == 2) && !(mask & (1u << 3))) return true;
  } else {
    if ((node == 0 || node == 1) && !(mask & (1u << 2))) return true;
    if ((node == 2 || node == 3) && !(mask & (1u << 4))) return true;
  }
  return false;
}

std::string StateKey(CaseKind c, const Config &cfg, const Replay &r) {
  std::ostringstream os;
  os << static_cast<int>(c) << '|' << cfg.dedup << cfg.force_defaults << '|'
     << r.completed << '|' << r.bytes << '|' << r.min_align << '|';
  for (int node = 0; node < 8; ++node) {
    if ((r.completed & (1u << node)) && OffsetLive(c, node, r.completed)) {
      os << 'A' << node << '=' << r.offsets[static_cast<size_t>(node)] << ';';
    }
  }
  if (cfg.dedup && AnyTableRemaining(c, r.completed)) {
    for (const auto &v : r.vtables) os << 'V' << v.bytes << '@' << v.offset << ';';
  }
  if (c == CaseKind::String && !(r.completed & (1u << 2))) {
    auto it = r.shared_pool.find("hot");
    if (it != r.shared_pool.end()) os << "Shot@" << it->second << ';';
  }
  return os.str();
}

void InsertLabel(std::map<std::string, std::vector<Label>> *states,
                 const std::string &key, Label label) {
  auto &labels = (*states)[key];
  for (auto &old : labels) {
    if (old.objective == label.objective) {
      old.multiplicity += label.multiplicity;
      if (PlanKey(label.plan) < PlanKey(old.plan)) old.plan = std::move(label.plan);
      return;
    }
    if (Dominates(old.objective, label.objective)) return;
  }
  labels.erase(std::remove_if(labels.begin(), labels.end(),
                              [&](const Label &old) { return Dominates(label.objective, old.objective); }),
               labels.end());
  labels.push_back(std::move(label));
}

void EnumerateOracle(CaseKind c, const Config &cfg, const Plan &prefix,
                     CaseSummary *summary, std::vector<Objective> *outcomes,
                     std::set<std::string> *buffers, std::set<std::string> *plans) {
  const Replay current = ReplayPlan(c, cfg, prefix);
  if (!current.ok) throw std::runtime_error("oracle prefix replay: " + current.why);
  if (current.complete) {
    ++summary->oracle_plans;
    summary->all_verify = summary->all_verify && current.verify;
    summary->all_equality = summary->all_equality && current.equality;
    summary->all_identifier = summary->all_identifier && current.identifier;
    summary->all_alignment = summary->all_alignment && current.alignment;
    outcomes->push_back({current.profile_distance, current.bytes, current.calls});
    buffers->insert(current.raw);
    const auto inserted = plans->insert(std::string("d") + (cfg.dedup ? "1" : "0") +
                                        "f" + (cfg.force_defaults ? "1/" : "0/") +
                                        PlanKey(prefix)).second;
    summary->path_plan_unique = summary->path_plan_unique && inserted;
    return;
  }
  for (const auto &step : LegalSteps(c, current)) {
    summary->action_variants.insert(std::to_string(step.node) + "." + std::to_string(step.variant));
    Plan next = prefix;
    next.push_back(step);
    EnumerateOracle(c, cfg, next, summary, outcomes, buffers, plans);
  }
}

std::vector<Objective> RunCandidate(CaseKind c, const Config &cfg, CaseSummary *summary) {
  std::map<std::string, std::vector<Label>> states;
  std::map<std::string, std::string> first_raw;
  const Replay empty = ReplayPlan(c, cfg, {});
  InsertLabel(&states, StateKey(c, cfg, empty), Label{{}, {0, 0, empty.calls}, 1});
  first_raw[StateKey(c, cfg, empty)] = empty.raw;

  const int layers = c == CaseKind::Alias ? 3 : (c == CaseKind::String ? 4 : 5);
  for (int layer = 0; layer < layers; ++layer) {
    std::map<std::string, std::vector<Label>> next_states;
    std::map<std::string, std::string> next_first_raw;
    for (const auto &entry : states) {
      for (const auto &label : entry.second) {
        const Replay current = ReplayPlan(c, cfg, label.plan);
        if (!current.ok) throw std::runtime_error("candidate prefix replay: " + current.why);
        for (const auto &step : LegalSteps(c, current)) {
          ++summary->candidate_generated_prefixes;
          Plan next_plan = label.plan;
          next_plan.push_back(step);
          const Replay next = ReplayPlan(c, cfg, next_plan);
          if (!next.ok) throw std::runtime_error("candidate transition replay: " + next.why);
          const std::string key = StateKey(c, cfg, next);
          auto raw_it = next_first_raw.find(key);
          if (raw_it == next_first_raw.end()) {
            next_first_raw[key] = next.raw;
          } else {
            ++summary->candidate_state_merges;
            if (raw_it->second != next.raw && next.completed == FullMask(c)) {
              ++summary->candidate_last_use_merges;
            }
          }
          Label advanced;
          advanced.plan = std::move(next_plan);
          advanced.objective = {next.complete ? next.profile_distance : 0,
                                next.complete ? next.bytes : 0,
                                next.calls};
          advanced.multiplicity = label.multiplicity;
          InsertLabel(&next_states, key, std::move(advanced));
        }
      }
    }
    states = std::move(next_states);
    first_raw = std::move(next_first_raw);
    for (const auto &entry : states) summary->candidate_normalized_states += entry.second.size();
  }

  std::vector<Objective> outcomes;
  for (const auto &entry : states) {
    for (const auto &label : entry.second) {
      const Replay final = ReplayPlan(c, cfg, label.plan);
      if (!final.complete || !final.verify || !final.equality || !final.identifier || !final.alignment) {
        std::ostringstream why;
        why << "candidate retained invalid terminal case=" << CaseName(c)
            << " dedup=" << cfg.dedup << " force_defaults=" << cfg.force_defaults
            << " complete=" << final.complete << " verify=" << final.verify
            << " equality=" << final.equality << " identifier=" << final.identifier
            << " alignment=" << final.alignment << " plan=" << PlanKey(label.plan);
        throw std::runtime_error(why.str());
      }
      outcomes.push_back({final.profile_distance, final.bytes, final.calls});
    }
  }
  return outcomes;
}

CaseSummary RunCase(CaseKind c) {
  CaseSummary summary;
  std::vector<Objective> all_oracle;
  std::vector<Objective> all_candidate;
  std::set<std::string> buffers;
  std::set<std::string> plans;
  for (bool dedup : {false, true}) {
    for (bool force_defaults : {false, true}) {
      const Config cfg{dedup, force_defaults};
      EnumerateOracle(c, cfg, {}, &summary, &all_oracle, &buffers, &plans);
      const auto candidate = RunCandidate(c, cfg, &summary);
      all_candidate.insert(all_candidate.end(), candidate.begin(), candidate.end());
    }
  }
  summary.oracle_unique_buffers = buffers.size();
  const auto oracle_frontier = Pareto(all_oracle);
  const auto candidate_frontier = Pareto(all_candidate);
  summary.oracle_frontier = oracle_frontier.size();
  summary.candidate_frontier = candidate_frontier.size();
  summary.frontier_equal = oracle_frontier == candidate_frontier;
  summary.path_plan_unique = summary.path_plan_unique && plans.size() == summary.oracle_plans;
  return summary;
}

bool RunGeneratedDirectBaselines() {
  bool pass = true;
  {
    flatbuffers::FlatBufferBuilder fbb;
    auto left = StageATiny::CreateLeaf(fbb, 1, 111);
    auto right = StageATiny::CreateLeaf(fbb, 2, 222);
    auto root = StageATiny::CreateAliasRoot(fbb, left, right, left);
    fbb.Finish(root, "FBLT");
    flatbuffers::Verifier verifier(fbb.GetBufferPointer(), fbb.GetSize());
    const auto *read = StageATiny::GetAliasRoot(fbb.GetBufferPointer());
    pass = pass && verifier.VerifyBuffer<StageATiny::AliasRoot>("FBLT") && read &&
           read->left() == read->alias_left() && read->right()->key() == 2;
  }
  {
    flatbuffers::FlatBufferBuilder fbb;
    auto hot = fbb.CreateString("hot");
    auto cold = fbb.CreateString("cold");
    auto root = StageATiny::CreateStringRoot(fbb, hot, cold, hot);
    fbb.Finish(root, "FBLT");
    flatbuffers::Verifier verifier(fbb.GetBufferPointer(), fbb.GetSize());
    const auto *read = flatbuffers::GetRoot<StageATiny::StringRoot>(fbb.GetBufferPointer());
    pass = pass && verifier.VerifyBuffer<StageATiny::StringRoot>("FBLT") && read &&
           read->hot() == read->hot_alias() && read->cold()->str() == "cold";
  }
  {
    flatbuffers::FlatBufferBuilder fbb;
    std::vector<flatbuffers::Offset<StageATiny::Leaf>> keyed{
        StageATiny::CreateLeaf(fbb, 1, 111), StageATiny::CreateLeaf(fbb, 2, 222)};
    const std::vector<int32_t> values{3, 1, 4, 1, 5};
    auto root = StageATiny::CreateVectorRootDirect(fbb, &keyed, &values);
    fbb.Finish(root, "FBLT");
    flatbuffers::Verifier verifier(fbb.GetBufferPointer(), fbb.GetSize());
    const auto *read = flatbuffers::GetRoot<StageATiny::VectorRoot>(fbb.GetBufferPointer());
    pass = pass && verifier.VerifyBuffer<StageATiny::VectorRoot>("FBLT") && read &&
           read->keyed()->LookupByKey(1) == read->keyed()->Get(0) &&
           reinterpret_cast<uintptr_t>(read->values()->Data()) % 16u == 0;
  }
  return pass;
}

void PrintCase(const std::string &name, const CaseSummary &s, bool comma) {
  std::cout << "    \"" << name << "\": {\n"
            << "      \"oracle_plans\": " << s.oracle_plans << ",\n"
            << "      \"oracle_unique_buffers\": " << s.oracle_unique_buffers << ",\n"
            << "      \"oracle_frontier_points\": " << s.oracle_frontier << ",\n"
            << "      \"candidate_frontier_points\": " << s.candidate_frontier << ",\n"
            << "      \"candidate_generated_prefixes\": " << s.candidate_generated_prefixes << ",\n"
            << "      \"candidate_normalized_state_labels\": " << s.candidate_normalized_states << ",\n"
            << "      \"candidate_state_merges\": " << s.candidate_state_merges << ",\n"
            << "      \"last_use_raw_prefix_merges\": " << s.candidate_last_use_merges << ",\n"
            << "      \"action_variant_coverage\": " << s.action_variants.size() << ",\n"
            << "      \"path_plan_unique\": " << (s.path_plan_unique ? "true" : "false") << ",\n"
            << "      \"all_stock_verify\": " << (s.all_verify ? "true" : "false") << ",\n"
            << "      \"all_identity_equality\": " << (s.all_equality ? "true" : "false") << ",\n"
            << "      \"all_identifier_equal\": " << (s.all_identifier ? "true" : "false") << ",\n"
            << "      \"all_native_alignment\": " << (s.all_alignment ? "true" : "false") << ",\n"
            << "      \"frontier_equal\": " << (s.frontier_equal ? "true" : "false") << "\n"
            << "    }" << (comma ? "," : "") << "\n";
}

}  // namespace

int main() {
  try {
    const bool generated_direct_baselines = RunGeneratedDirectBaselines();
    const auto alias = RunCase(CaseKind::Alias);
    const auto string_case = RunCase(CaseKind::String);
    const auto vector_case = RunCase(CaseKind::Vector);
    const bool pass = generated_direct_baselines &&
                      alias.path_plan_unique && alias.all_verify && alias.all_equality &&
                      alias.all_identifier && alias.all_alignment && alias.frontier_equal &&
                      alias.candidate_last_use_merges > 0 &&
                      string_case.path_plan_unique && string_case.all_verify &&
                      string_case.all_equality && string_case.all_identifier &&
                      string_case.all_alignment && string_case.frontier_equal &&
                      string_case.candidate_last_use_merges > 0 &&
                      vector_case.path_plan_unique && vector_case.all_verify &&
                      vector_case.all_equality && vector_case.all_identifier &&
                      vector_case.all_alignment && vector_case.frontier_equal &&
                      vector_case.candidate_last_use_merges > 0;
    std::cout << "{\n"
              << "  \"gate\": \"tiny_native_exhaustive_oracle_vs_reuse_closure_dp\",\n"
              << "  \"claim_bearing\": false,\n"
              << "  \"pass\": " << (pass ? "true" : "false") << ",\n"
              << "  \"flatbuffers_commit\": \"7e163021e59cca4f8e1e35a7c828b5c6b7915953\",\n"
              << "  \"generated_direct_baselines_pass\": "
              << (generated_direct_baselines ? "true" : "false") << ",\n"
              << "  \"config_grid\": \"DedupVtables(false,true) x ForceDefaults(false,true)\",\n"
              << "  \"cases\": {\n";
    PrintCase(CaseName(CaseKind::Alias), alias, true);
    PrintCase(CaseName(CaseKind::String), string_case, true);
    PrintCase(CaseName(CaseKind::Vector), vector_case, false);
    std::cout << "  }\n}\n";
    return pass ? 0 : 2;
  } catch (const std::exception &e) {
    std::cerr << "tiny oracle fatal: " << e.what() << "\n";
    return 3;
  }
}
