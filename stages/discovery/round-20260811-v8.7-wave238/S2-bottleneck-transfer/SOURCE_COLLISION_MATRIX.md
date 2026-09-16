# Source and collision matrix — Wave238

| Family | Official source/current pin | Stock reader/verifier contract | Whole-action finding | Status |
|---|---|---|---|---|
| SafeTensors | [upstream](https://github.com/huggingface/safetensors) @ `6eb4dc9a28ebce297606e0f4836bbf28839cacef` | header-described tensor ranges; safe/lazy/zero-copy reader | tensor block reorder is generic profile packing, not format-specific N2 | `STRUCTURAL_DROP` |
| rkyv | [format](https://rkyv.org/format.html), [validation](https://rkyv.org/validation.html) @ `3814956a8e11bac7b8587e4b2cb5dde99492deee` | `access` + bytecheck bounds/alignment/subtree ownership | no frozen stock-compatible profile-layout action interface | `NOT_ADMITTED_UNFROZEN` |
| GGUF | [GGUF spec](https://github.com/ggml-org/ggml/blob/master/docs/gguf.md), [header](https://github.com/ggml-org/llama.cpp/blob/master/ggml/include/gguf.h) @ `030ebb558a5820b444a8f836ed5cdd46c9b4bd7a` | GGUF metadata/tensor layout and GGML loader | executor/quantization/loader union and legal witness incomplete | `NOT_ADMITTED_UNFROZEN` |
| OpenVDB | [OpenVDB upstream](https://github.com/AcademySoftwareFoundation/openvdb) @ `2ad18b6aebf69240f8db78c08c6f9bbee896c553` | fixed grid topology/value plus stock reader | source/action union and carrier incomplete | `NOT_ADMITTED_UNFROZEN` |
| LMDB | [LMDB upstream](https://github.com/LMDB/lmdb) @ `0c8b94738866b1ba7ffac27287fd6cab83f2ade4` | fixed transactional key/value/cursor result | no verifier-centered whole constructor frozen | `NOT_ADMITTED_UNFROZEN` |
| Fleece | [official project](https://github.com/couchbase/fleece-cpp) | no ref pin recovered; no absence conclusion | closure unavailable | `NOT_ADMITTED_UNFROZEN` |

No source failure was converted into a scientific negative. No literature collision is represented as closed where a candidate action itself is not frozen.
