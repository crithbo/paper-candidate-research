# SOURCE_COLLISION_MATRIX — Wave 366

| Family | Primary/official current source | Reality and collision record | Status |
|---|---|---|---|
| gettext `.mo` | [GNU gettext manual](https://www.gnu.org/software/gettext/manual/) | Format/reader and `msgfmt` construction must be source-pinned before asserting any union gap; no absence is claimed. | `NOT_ADMITTED_UNFROZEN` |
| GCC `.gch` | [GCC PCH documentation](https://gcc.gnu.org/onlinedocs/gcc/Precompiled-Headers.html) | Same compiler binary, language, macro/options and target constraints are documented; ASLR can prevent binary identity. These are strong contrary conditions to a naïve stable-byte claim. | `NOT_ADMITTED_UNFROZEN` |
| GSettings compiled schema | [GLib schemas documentation](https://docs.gtk.org/gio/compiled-schemas.html) | Source/compiler/reader and non-default action closure remains required; no gap asserted. | `NOT_ADMITTED_UNFROZEN` |
| Cargo intermediate artifact | [Cargo build-cache documentation](https://doc.rust-lang.org/cargo/reference/build-cache.html) | The official documentation labels incremental output a cache and states build-dir layout is internal/subject to change. | `EXCLUDED_CACHE_OBJECT` |
| Go build cache | [Go cache source directory](https://go.dev/src/cmd/go/internal/cache/) | The object is an implementation cache; a reuse/cache mechanism is excluded under the assignment. | `EXCLUDED_CACHE_OBJECT` |
| TeX format dump | [TeX Live documentation](https://tug.org/texlive/doc.html) | Producer/reader/config and semantic action catalog not closed at the cutoff. | `NOT_ADMITTED_UNFROZEN` |

No old issue, future-work statement, missing implementation or unmeasured result is used to infer absence.  No direct novelty claim is made without a candidate-grade same-object action contract.
