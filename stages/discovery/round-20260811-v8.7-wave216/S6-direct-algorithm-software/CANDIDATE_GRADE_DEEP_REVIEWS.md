# Candidate-grade deep review

## GNU hash/dynsym joint constructor — NOT_ADMITTED_UNFROZEN

The GNU hash format requires symbols searchable through `.gnu.hash` to occupy a suffix of `.dynsym`, sorted by nondecreasing `gnu_hash(name) % nbuckets`. Bloom words, bucket starts and chain termination are then defined over that suffix. GNU ld exposes current `--hash-style` choices, and the glibc loader reads GNU bloom/bucket/chain arrays. Therefore a same-object action is necessarily whole-constructor regeneration, including symbol versions, relocation index references and dynamic loader interface; a wrapper cannot qualify.

A finite witness exists for two symbols with the same bucket: exchange their suffix positions and regenerate all coupled arrays and references. It preserves the format constraint but can reduce to arbitrary within-bucket ordering. No nontrivial objective/guarantee—such as a formally justified joint cache/lookup/size constructor—was frozen.

This depth pass could not source-pin the complete current GNU ld plus lld action/flag/backend union, including all export/version/relocation coupling paths. It also did not close direct same-object paper/tool collisions. Per the frozen rules this is `NOT_ADMITTED_UNFROZEN`, not an absence claim or a scientific STOP.

Natural route: version-pinned public Linux/LLVM shared-library builds; oracle: stock `readelf` plus glibc loader resolution for the same exports/versions/bindings. Full cost: link CPU/wall/RSS/temp, DSO bytes, loader lookup/load CPU/RSS, relocation processing, readelf validation. 72-hour killer: pin GNU binutils and LLVM commits; enumerate every dynsym sort/hash emission/flag path; construct the same-bucket whole-reference witness; validate exports/versioning/relocations with readelf and loader; reject if union already expresses the action, only routine ordering remains, semantics differ, or full cost absorbs gains.
