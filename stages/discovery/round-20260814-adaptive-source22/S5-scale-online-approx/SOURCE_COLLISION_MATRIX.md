# Source / collision matrix — S5 Source22

| Family | Exact object and stock oracle | Current union / witness result | Disposition |
|---|---|---|---|
| Verible changed-line formatting | Fixed SystemVerilog source and flags; stock formatter and `verible-verilog-syntax` | Whole-file plus `--lines` formatting, diff scanner, directives and flags.  One line-range witness survives into the native formatter and is then absorbed by it. | `DROP__CURRENT_UNION_DIRECT_ABSORPTION__GENERIC_FORMATTER_SELECTOR` |
| slang parser/elaborator | Fixed SystemVerilog project, parse tree and diagnostics | Parser/type-checker/elaborator/language-service union exists, but no current partial native action skeleton was frozen. | `NOT_ADMITTED_UNFROZEN__NO_CURRENT_PARTIAL_ACTION_SKELETON` |
| OpenTimer STA | Fixed VLSI timing input/report | Timing-analysis locator only; neither target-specific bounded-recourse action nor natural witness route closed. | `NOT_ADMITTED_UNFROZEN` |
| OpenModelica update/rebuild | Fixed Modelica model and simulator output | Model update API is an application/configuration surface, not a frozen same-object bounded-recourse constructor. | `NOT_ADMITTED__CONFIGURATION_SURFACE` |

The sole V6 survival trace is limited to Verible's one changed-line, stock diff-helper mode.  It neither claims an exhaustive action catalogue nor makes a Q1/Q2 decision; those remain Stage 0 functions.
