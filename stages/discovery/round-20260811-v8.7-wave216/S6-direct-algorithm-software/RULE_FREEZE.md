# Rule freeze

- Assignment: `DISCOVERY-S6-20260811-V8.7-WAVE216-GNUHASH-DYNSYM-COMPLETE-SOURCE-CLOSURE-DEPTH`; cutoff 2026-08-11.
- Authority: v8.7 + R5-P0; `DISCOVERY_QUALITY_MODE=OFF`.
- Frozen hashes: plan `F0B885E43DC30CBB2BA0400286AEF1F69DECA5D4005B0989BCFDEE075FED7219`; registry `393DC81B3BC5D15011D4F04C42DE3339AFE3BFA084188E513E86A9331F8A0B1A`; ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- No R7 semantics, experiment, benchmark, download, downstream stage, shared-control write, or E-disk material.

Fixed object: same ELF DSO exports, symbol versions/binding/visibility, relocation behavior and stock dynamic-loader/readelf semantics. Any permutation must regenerate every dynsym-indexed reference, GNU hash bucket/bloom/chain entry, version table and relocation reference.
