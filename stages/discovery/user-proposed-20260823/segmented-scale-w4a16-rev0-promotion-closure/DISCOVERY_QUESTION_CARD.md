# Discovery Research Question Card
+
## Identity
+
- Card ID: S6-SEGMENTED-SCALE-M16-C0.
- Assignment/lane: DISCOVERY-S6-20260823-SEGMENTED-SCALE-W4A16-PROMOTION-CLOSURE / S6.
- Exact public identity: vLLM v0.26.0, commit 568afb3a13806beb53bb2e6bd518269357b237c0, AMD gfx1151, dense W4A16 M=16, G=32.
- Carrier kind: IMPLEMENTATION_CARRIER_ONLY.
- Network-security exclusion: PASS.
+
## Identity preflight
+
- Prior M1 pre-topic packet: RELATED_ONLY; its object is M=1/decode GEMV while this assignment freezes M=16 small-batch GEMM.
- Object/action/endpoint/guarantee/full-cost relation to QGroup: NONE; QGroup was not read or reopened.
- Mechanical disposition: RELATED_ONLY_DO_NOT_EXCLUDE.
+
## Research contract
+
- Problem: current gfx1151 M=16 W4A16 code clamps each logical K tile to one 32-wide scale group, even where its initial tile heuristic selects a larger K tile.
- Proposed insight: a contribution may exist through a fixed q-group scale tile and segment-to-scale mapping, distinguishable because correctness is preserved at every K coordinate while the current source has one g_idx/scale vector per tile.
- Endpoint: target-native compiler schedule and tested full-cost frontier; no firstness or automatic byte-reduction claim.
- Initial full-cost: compile/codegen overhead; W4, activation and scale traffic; VGPR and LDS allocation; occupancy/spills; launch count; output correctness; end-to-end vLLM latency.
+
## RAW_REQUIRED evidence
+
- Opportunity anchor: current source says BLOCK_K greater than group_size silently corrupts output under its one-group g_idx design.
- Current locus: official frozen vLLM Triton and RDNA hybrid sources.
- Known direct fatal: NONE_FOUND_WITHIN_BOUND; M=16 selects the Triton route and that source clamps to G=32.
- Strongest skeptic: q-group scheduling is generic unrolling/configuration and saves no compulsory scale bytes.
- Non-generic discriminator: a scale-tile/segment mapping changes static dataflow from one group row to q separately bound rows and is coupled to M=16 accumulator/register allocation, not a flag sweep.
- Minimum falsifier: direct M=16 current action or no static register/occupancy frontier.
+
## Bounded closure debt
+
| Debt | Status | Owner / finite route |
|---|---|---|
| Complete current union | CLOSED for three assignment-required M=16 loci. | Discovery |
| Strongest same-object paper collision | OPEN_BOUNDED | Stage 0 target/action search and one-hop current genealogy. |
| Compiler automatic-hoisting result | OPEN_BOUNDED | Stage 0 source/IR/codegen check under frozen compiler revision. |
| Small native witness | CLOSED symbolically; executable check deferred. | Stage 0 |
| Natural M=16 frequency | OPEN_BOUNDED | Stage 0 frozen vLLM trace/carrier selection. |
| Full-cost measurement | OPEN_BOUNDED | Stage 0/Stage A with all denominators. |
+
## Front-end disposition
+
- RQ audit: RQ_COMPLETE.
- RAW_REQUIRED audit: COMPLETE.
- Closure debt: OPEN_BOUNDED.
- Disposition: EVIDENCE_QUALIFIED_RAW.
- Eligible for C0: YES.
- Claim ceiling: no novelty, speedup, correctness observation or Q2 result is claimed by this card.
