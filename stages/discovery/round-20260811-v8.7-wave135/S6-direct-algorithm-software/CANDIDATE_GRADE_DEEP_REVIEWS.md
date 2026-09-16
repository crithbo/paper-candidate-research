# Candidate-grade deep review — TADY-CONSTRAINED-DISASSEMBLY

## Exact same-object contract

Input is a fixed executable/section from the artifact's public binary sets. Output is its instruction-boundary/block/CFG labelling under the artifact's published ground-truth representation. The contemplated constructor must preserve the same output schema and evaluation labels; it may not change the binary, invoke a different analysis target, or claim executable semantic equivalence that the supplied oracle does not establish.

## Current strongest union and atomic actions

The current artifact union includes score inference by Tady/TadyA, selectable attention and connection variants, model export/inference, supplied result paths for ddisasm/DeepDi/Ghidra/IDA/XDA, and PDT-based prune/error processing selected through its configuration. Atomic actions include scoring candidate boundaries, retaining/removing them under PDT constraints, choosing the listed model/section/dataset configurations, and emitting the label representation. The source README also makes clear that baseline/model results can be reused, so a new selector over their existing point outputs is not N2.

## Minimal action-divergence witness

The strongest hypothetical witness is a short x86 byte sequence where two locally high-score boundary selections are individually decodable but only one globally consistent CFG selection meets the PDT constraint. A complete N2 would have to jointly choose all retained boundaries/blocks/edges while preserving the same label semantics.

This does **not** certify a residual. Tady already has whole-output scoring plus a global structural pruning action. A purported improvement that merely changes scores/attention/model is a model replacement; one that reapplies a solver after the output is a postprocessor/controller; and one that promises binary semantic correctness changes the guarantee/object because the artifact evaluates against labels rather than a native executable equivalence reader.

## Natural carrier, full cost, and finite killer

If a legal residual had existed, use the supplied real-world binaries (curl, diffutils, GMP, ImageMagick, libmicrohttpd, libtomcrypt, OpenSSL, PuTTY, SQLite and zlib builds, plus the named public binary datasets) with their labels. Record boundary/block accuracy and coverage, structural violations, total decode+constraint runtime, CPU time, peak RSS, model size, and output size. No such test was run.

72-hour killer: (1) freeze a current repository SHA when upstream transport is available; (2) enumerate inference/prune flags and model list; (3) encode the short ambiguous sequence under the artifact label schema; (4) show whether joint selection is already represented by score-plus-PDT pruning; and (5) reject if the claimed gain needs model substitution, label-schema change, or a postprocessor. The static union/oracle review already triggers this rejection.

## Verdict

`STRUCTURAL_DROP`: no union-external complete same-object N2 with a fixed acceptance/guarantee boundary remains. This is neither a result, implementation, resource, nor AI-readiness judgement. No brief is formed.
