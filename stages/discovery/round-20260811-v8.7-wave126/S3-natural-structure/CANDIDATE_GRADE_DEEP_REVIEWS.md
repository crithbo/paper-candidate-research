# Candidate-grade deep review — CD-126-01

## Claim contract

- Function: losslessly produce a PDBx/mmCIF artifact for a fixed wwPDB semantic data block, with the PDB Exchange Dictionary and intended mmCIF consumer contract unchanged.
- Natural route: 20–50 small public RCSB entries may later form a finite natural sample; no asset was downloaded and no run was performed here.
- Comparator union: current wwPDB `PdbxWriter`/`PdbxReader`, dictionary validator, supported mmCIF/BinaryCIF writer ecosystem and standard compression/reader path.
- Full-cost denominator: emitted bytes (raw and compressed), writer CPU/RSS, reader/parser CPU/RSS, validation time, and any representation conversion/decoder cost.

## Red-team action tests

| Proposed action | Same-object status | Union status | Verdict |
|---|---|---|---|
| Whitespace/lexical normalization | Can preserve syntax semantics. | Ordinary writer/tokenizer choice and compressor input. | Absorbed / nontriviality failure. |
| Category ordering | Dictionary data can be preserved, but consumer-visible container order has not been proven universally irrelevant. | Existing writer/container ordering action. | No union-external witness. |
| Loop column ordering | Must preserve correspondence between tags and values; parser output/order compatibility has not been closed. | Writer table emission action. | No certified residual. |
| Loop row grouping/reordering | May alter parsed row order and external use of order; no global non-observability proof. | If legal, writer-level ordering; otherwise changed semantic/consumer object. | No certified residual. |
| BinaryCIF or external compression | BinaryCIF is a different archive representation; external compression is baseline. | Existing output/codec union. | Object change or absorption. |

## Finite 72-hour killer and STOP condition

If a later Stage0 admits an action certificate, first freeze: a wwPDB dictionary version, a `PdbxReader`/`PdbxWriter` source revision, an independent current validator, exact output representation and 20–50 RCSB entry IDs. Then reject the candidate before performance claims if any one holds: dictionary/parser mismatch; changed consumer-observable order; the action can be replayed by the frozen writer/encoder union; or the complete raw+compressed bytes, writer CPU/RSS, reader CPU/RSS and validation cost show no residual. This finite plan is not run and is not a Stage A authorization.

## Decision

`NOT_ADMITTED_UNFROZEN`, hence no `STAGE0_BRIEF` and no `PROPOSE_STAGE0`. There is no direct negative result; there is no whole-writer action-divergence witness to test.
