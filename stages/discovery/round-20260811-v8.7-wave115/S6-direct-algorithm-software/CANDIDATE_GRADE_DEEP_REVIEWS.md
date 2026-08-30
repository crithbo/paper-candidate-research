# Candidate-grade deep reviews

## D01 — clang-format whole-file layout writer

- **Exact semantics/oracle:** same parsed token stream and preprocessor-sensitive source behavior under a frozen style; native parse/token equivalence checker and compiler acceptance are the fidelity route.
- **Complete current union:** token annotation, style/config resolution, break/indent penalty search, alignment, line continuation and output emission. Current source/options, including non-default style fields, must be treated as the fair union.
- **Initial witness then closure:** a multi-argument call can require a joint line-break grouping rather than a local whitespace choice. Full union inspection makes global penalty/layout search already native; no union-external complete N2 action remains.
- **Full cost / 72h killer:** parse+format+output bytes+compile/token-equivalence+CPU/memory on a public repository. Kill if token semantics differ, if style changes, or if the mechanism is only a penalty/configuration change.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D02 — rustfmt whole-item layout writer

- **Exact semantics/oracle:** fixed Rust source to token-equivalent, rustc-acceptable output under frozen edition/configuration.
- **Complete current union:** parsing, comment/attribute treatment, width/shape calculation, chain/argument grouping, indentation, configuration resolution and printing.
- **Initial witness then closure:** a nested method chain gives a joint grouping witness. That action is inside current layout/shape/configuration union; a global layout restatement would be a formatter/parameter wrapper rather than an N2 constructor.
- **Full cost / 72h killer:** public crate, rustfmt/rustc acceptance, token/AST equality, formatting time/memory/output size. Kill on configuration-only divergence or changed edition/semantics.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D03 — libpng PNG scanline-filter writer

- **Exact semantics/oracle:** fixed pixel array and fixed PNG color/bit-depth/DEFLATE contract; native decoder must reproduce pixels.
- **Complete current union:** image transform, per-row filter candidate evaluation, filter selection, scanline buffering, compressor invocation and chunk emission. Full cost includes filtering, compression, bytes, encode/decode CPU/memory and pixel equality.
- **Initial witness then closure:** two correlated rows make a cross-row filter-state proposition expressible. Current writer's filter/action and compressor space must be closed before claiming it external; no source-grounded complete global action certificate was established here.
- **72h killer:** public PNG corpus; native decode equality and total encode+decode+size ledger. Kill if the supposed action is a filter/strategy setting, changes PNG contract, or cannot beat the full denominator.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`.

## Result

Three candidate-grade deep reviews, zero briefs. The remaining three raw families stayed unfrozen by design. This search ordering improves efficiency only; it does not convert a missing witness into negative evidence, and no outcome depends on implementation/result/resource/AI readiness.
