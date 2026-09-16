# Candidate-grade deep reviews

## D1 — GNU tar sparse-member map construction: `NOT_ADMITTED_UNFROZEN`

Same object is a fixed sparse filesystem tree and extracted bytes/metadata under stock GNU tar. Natural phase seed is sparse-hole density and member size. A legal witness would need two archive constructions with all sparse-map references regenerated and equal extraction. Current writer flags/format-version action union and direct sparse-archive constructor subtraction are unpinned. Full cost: create/extract CPU-RSS-temp, archive bytes, random/sequential read. Killer: a small versioned sparse tree rejects any line that changes sparse semantics or only changes a format flag.

## D2 — libarchive ZIP central-directory construction: `NOT_ADMITTED_UNFROZEN`

Same object is fixed archive tree, payload bytes and extraction/list behavior through stock libarchive. Natural phase seed is directory-entry count versus listing/lookup tail. A legal witness would regenerate local-header/central-directory/offset relations under stock reading. Complete native writer/config union and direct ZIP-layout collision are unpinned. Full cost: write/read CPU-RSS-temp, bytes, list/lookup tail. Killer rejects generic archive packing, compressor choices and changed ZIP semantics.

## D3 — ripgrep regex DFA/cache construction: `NOT_ADMITTED_UNFROZEN`

Same object is fixed regex set, text corpus and exact match set under stock ripgrep. Natural phase seed is Unicode-pattern/state-tail growth. A legal witness must preserve all matches while changing a complete native automaton/cache construction. Current source configurations and direct automata-construction collision have not been pinned; a cache policy or generic DFA implementation is excluded. Full cost: compile/search CPU-RSS, state bytes, match equality. Killer rejects any difference expressible only as cache-policy/controller/tuning.

## Non-admitted breadth rows

CMake generator and cpio archive rows lack source-pinned complete action unions; zstd dictionary training is structurally excluded as a mature codec primitive rather than a target-specific new constructor. None is a brief.
