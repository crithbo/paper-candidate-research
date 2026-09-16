# Source30 question cards

| Card | Current official source locus | Cheapest decisive test | Disposition |
|---|---|---|---|
| QC30-A Project Trellis ECP5 | `tools/ecp_vlog.py` parses tile configuration and routing graph; project current source is a configuration conversion/tooling locus. | Name a legal ECP5-native update distinct from generic configuration/routing conversion. | `LOCATOR_ONLY__NO_TARGET_NATIVE_ACTION_FROZEN`. |
| QC30-B sv2v | current v0.0.13 release documents language conversion options and `--bugpoint`. | Freeze an action beyond generic SystemVerilog-to-Verilog conversion. | `EXCLUDED_BEFORE_RAW__GENERIC_COMPILER_TRANSFORMATION`. |
| QC30-C Rocket Chip | official README calls it a parameterized Rocket Chip Generator and describes Chisel-to-RTL generation. | Show a residual not supplied by the project-owned complete constructor. | `EXCLUDED_BEFORE_RAW__PAPER_PROJECT_OWNED_COMPLETE_CONSTRUCTOR`. |

All three have exact identity, a precommitted falsifier and current official locus, but fail the non-generic discriminator before raw. No closure debt is queued.
