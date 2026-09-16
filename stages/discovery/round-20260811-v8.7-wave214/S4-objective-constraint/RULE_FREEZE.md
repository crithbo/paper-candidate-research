# Rule freeze — Wave214

- `assignment_id`: `DISCOVERY-S4-20260811-V8.7-WAVE214-MACHO-EXPORTTRIE-LINKEDIT-COST-DEPTH`
- `rules_revision`: `v8.7+R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`; R7 behavior is not enabled.
- Frozen controls: `plan=F0B885E43DC30CBB2BA0400286AEF1F69DECA5D4005B0989BCFDEE075FED7219`; `registry=393DC81B3BC5D15011D4F04C42DE3339AFE3BFA084188E513E86A9331F8A0B1A`; `ROLE_DISCOVERY=FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- Scope: one exact object — a Mach-O dylib with frozen export names, addresses, re-export ordinals, flags, and stock `dyld` / `llvm-objdump` acceptance. Cutoff 2026-08-11.
- No experiment, build, benchmark, download, Stage 0/A/B creation, automation, or shared-control modification was performed.

## Current pins

- Apple ld64 upstream `HEAD` observed by `git ls-remote` at `f60a74eaa2c99585de1dc0f2820e7a9f8aaf522c`.
- LLVM upstream `main` observed at `cbe3031ee342114ae2b00ff6ec9e6d4a25a4a9d9`; `release/20.x` also observed at `87f0227cb60147a26a1eeb4fb06e3b505e9c7261`.
- The pin freezes provenance only. It does not turn uninspected Apple source paths into evidence of absence.

