# SOURCE / COLLISION MATRIX

| Question | Official current source | Outcome / counterevidence |
|---|---|---|
| Resource build and optimize action surface | [AAPT2 guide](https://developer.android.com/tools/aapt2), [AOSP aapt2 tree](https://android.googlesource.com/platform/frameworks/base/+/refs/heads/main/tools/aapt2/) | Compile/link/optimize/dump/diff already expose production actions; no ordinary-layout absence claim is possible. |
| Resource-ID stability | [AAPT2 link options](https://developer.android.com/tools/aapt2), [Link.h](https://android.googlesource.com/platform/frameworks/base/%2B/c223642/tools/aapt2/cmd/Link.h), [Link.cpp](https://android.googlesource.com/platform/frameworks/base/%2B/dc21dea9b8b1/tools/aapt2/cmd/Link.cpp) | `--stable-ids`/`--emit-ids` and an ID assigner are current native actions; ID mutation is excluded. |
| Existing size/lookup tradeoffs | [AAPT2 guide](https://developer.android.com/tools/aapt2), [AAPT2 release/source history](https://android.googlesource.com/platform/frameworks/base/%2B/0f3e248787d88154c8592f6e055b6b3586f4877d/tools/aapt2/) | Sparse encoding, name collapse, path shortening, resource dedupe and splits are mandatory union arms. |
| Name observability | [Android Resources API](https://developer.android.google.cn/reference/android/content/res/Resources) | `getIdentifier` maps package/type/entry names to resource IDs, so name collapse cannot be assumed semantics-preserving. |
| Serialization references | [Resources.proto](https://android.googlesource.com/platform/frameworks/base/%2B/c8d69f637ca0/tools/aapt2/Resources.proto) | String-pool index/source bookkeeping supports only a possible action hypothesis, not a whole legal stock-reader constructor. |
| Equal-information delta | [RFC 3284 VCDIFF](https://www.rfc-editor.org/rfc/rfc3284) | Comparator only; not a candidate mechanism. |

No non-primary source, old issue or future-work statement supports an implementation-absence claim. Latest direct algorithmic collision remains open because the candidate action itself is not frozen.
