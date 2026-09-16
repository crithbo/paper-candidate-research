# Candidate-grade deep review — AAPT2 resource-table version-aware layout/delta

## Exact object and observable semantics

The object would be the `resources.arsc` relation for one Android application/version: `(package,type,entry,configuration) -> resolved value`, fixed resource IDs, fixed qualifiers/configuration selection, and fixed resource names wherever stock `Resources.getIdentifier(name, defType, defPackage)` or reverse name APIs can observe them. The stock oracle is AAPT2 resource dump plus Android runtime resource lookup under the same package/device configuration. It is not a generic APK ZIP, a signed APK byte identity, a changed app package name, or a custom reader.

## Current-upstream reality check

Official AAPT2 documentation and current AOSP paths show a complete producer surface that is already materially broader than a plain serializer:

- `compile` and `link` merge `.flat`, resource-table, binary-XML and processed asset inputs; compile/link input order and overlay resolution are semantic inputs.
- `--stable-ids` / `--emit-ids`, `--package-id`, shared/static-library options and ID assigner source govern identity preservation.
- link configuration inclusion/exclusion, density/config splits, resource de-duplication, `--no-resource-deduping`, and optimization modes are present.
- `optimize` supports sparse resource entry encoding, resource-name collapse, path shortening and splits; sparse encoding explicitly trades size/memory/startup against per-lookup cost.
- `dump` and `diff` are existing inspection/comparison interfaces.

`Resources.getIdentifier` makes resource names part of a stock observable mapping; therefore name collapse is not a generally legal same-object layout action. Stable IDs likewise prevent treating ID reassignment as layout freedom. Source paths to pin at the start of any later review are the peeled `frameworks/base` commit plus `tools/aapt2/cmd/Link.cpp`, `cmd/Link.h`, `link/`, `optimize/`, `format/` and Android framework `AssetManager`/resource-table reader paths, with all defaults and nondefault command flags captured.

## Witness-first result

The review attempted to freeze two adjacent versions and two different stock-reader-equivalent table layouts while holding resource IDs, names, values and configuration selection constant. The format/source record demonstrates that fields reference string-pool indices and that source/pool bookkeeping exists, but it does **not** establish a user-facing or source-derived complete legal operation that independently permutes a resource-table/string-pool/config-entry sequence while regenerating every reference and preserving the fixed oracle.

It would be unsound to infer this whole action merely from binary representation, and execution is forbidden in this Discovery assignment. The potential layout freedom must also be checked against current link/optimize serialization, which may already canonicalize or absorb it. Consequently no stock-legal two-layout action-divergence witness is frozen.

## Conditional construction considered, but not admitted

If a future source audit proves the above action catalog, a candidate could be an AAPT2-specific bounded DP over legal resource-table atoms, ID-map constraints, string-pool references, configuration-selection ordering and predecessor locality, evaluated against current table bytes plus equal-information VCDIFF bytes. The DP would need an explicit exact bounded-context guarantee, not generic packing, and N3 would further require a held-out adjacent-app-version stability law controlling changed IDs, values, qualifiers, overlays, tool version and minSdk.

Those prerequisites are not established. A generic VCDIFF wrapper, post-link rewriter, flag selector, name collapse, path shortening, sparse-encoding choice, resource reordering without a legal action proof, or changed IDs/names/configuration semantics is excluded.

## Required full cost and finite killer if re-opened

Full cost would include AAPT2 compile/link/optimize CPU, wall time, peak RSS/temp; resource-table and signed/installable package bytes; patch/apply bytes; stock install, resource-table load and lookup CPU/RSS/latency under matched device configuration. A bounded 72-hour killer is: pin two small official open-source Android app version pairs, enumerate every current producer/config arm, construct or fail to construct two legal layouts, and use stock dump/runtime name+ID/configuration oracle. Any changed lookup, need for a custom reader, absent complete action, or exact replay by the union ends the candidate.

## Disposition

`NOT_ADMITTED_UNFROZEN__NO_STOCK_LEGAL_TWO_LAYOUT_WITNESS__CURRENT_PRODUCER_AND_READER_UNION_NOT_CLOSED`.

This is not a resource, implementation, result or AI-readiness rejection. No Stage 0 brief is issued.
