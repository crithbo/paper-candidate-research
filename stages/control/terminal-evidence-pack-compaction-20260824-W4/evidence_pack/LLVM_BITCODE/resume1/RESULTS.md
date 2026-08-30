# LLVM-BITCODE-ABBREV-PLANNER Stage A results

## Outcome

- Owner recommendation: **STOP_RECOMMENDED**
- Quality disposition: **BELOW_Q2_STOP** for this frozen candidate/object.
- Evidence ceiling: `NEGATIVE_KILL__B2_FULL_ACTION_ABSORPTION`.
- Claim-bearing observation obtained: **yes**, after fidelity-gate PASS.
- Scientific revision consumed: **no**.
- Stage B authorized: **false**.

WL-SLDP is a real native grammar/scope/assignment/ID-width constructor, and it
does improve B0 on part of the corpus.  It nevertheless has no publishable N2
residual: B2 generated a byte-identical WL-SLDP output for every one of the 100
natural modules.  The frozen `all actions or benefits absorbed by B1/B2` and
`residual action coverage <10%` killers therefore fire.

## Gate and corpus

- Five-part `PRE_CLAIM_CONTRACT_FIDELITY_GATE`: PASS before natural execution.
- Public source: official `llvm/llvm-test-suite`, signed tag `llvmorg-22.1.8`,
  tag object `6ec524803ed4b104f6eeed8809708c666c518927`, commit
  `28d2f36a29e8bb5de329a828f07729de66df0a9c`.
- Exact codeload archive: 360,676,319 bytes, SHA-256
  `e120b213476dd7138e2e82092644f505b2e12837aa151e45aaf81585acca7c1c`.
- Natural modules: 100 distinct native-verified modules, 99 C and 1 C++.
- Trace strata: O0/g0 24; O0/gline 26; O2/g0 25; O2/gline 25.
- Total B0 bytes: 484,840.  Frozen corpus manifest SHA-256:
  `74dd21052e889e22780f49151cf36e2322a6ba8cf959054afdf6346f1529ebc0`.
- Corpus construction retained 107 failed/duplicate/invalid attempts.  No
  synthetic module entered the primary denominator.

## Primary bytes and residual

| Arm | Total raw bytes | p50 module bytes | p90 module bytes | Saving vs B0 total | Residual meaning |
|---|---:|---:|---:|---:|---|
| B0 native writer | 484,840 | 4,276 | 5,716 | 0 | deployment anchor |
| B1 current-grammar oracle | 484,604 | 4,276 | 5,712 | 236 | absorbs current-family cleanup/scope |
| B2 greedy full bounded | 484,520 | 4,276 | 5,712 | 320 | strongest same-universe deployable arm |
| WL-SLDP | 484,520 | 4,276 | 5,712 | 320 | identical to B2 on all 100 modules |

- Modules with WL saving versus B0: 63/100.
- Savings distribution: 37 × 0 B, 48 × 4 B, 13 × 8 B, 2 × 12 B.
- Modules using an actually emitted novel grammar in WL: 22/100; B2 used a
  novel grammar on the same 22.
- Modules using the capacity-neutral VST-to-BLOCKINFO action: WL 24/100; B2
  24/100.
- WL files byte/hash-equal to B2: 100/100.
- Useful-module residual outside strongest union: 0/63 = **0%**.
- Raw residual versus strongest union: p50 = **0 B**, p90 = **0 B**.

The 320-byte B0 saving is only 0.0660% of the whole 484,840-byte denominator,
and none belongs uniquely to WL-SLDP.  The result is not rescued by calling the
candidate mathematically Pareto-nondominated: its primary output is identical
to B2, so any timing/RSS differences are measurement noise or cost differences,
not a size/access benefit.

## Native fidelity

All 400 natural arm files passed:

1. raw `BC C0 DE` trace parse;
2. exact expanded block/record trace SHA equality to the frozen B0 module;
3. unmodified LLVM 22.1.8 `llvm-bcanalyzer`;
4. unmodified LLVM 22.1.8 `llvm-dis`;
5. canonical decoded-IR equality after removing only the filename-derived
   `ModuleID` line;
6. `opt -passes=verify -disable-output`; and
7. one first fresh-process plus four warm fresh-process native reads.

There were no self-containment, trace, native parse, equality, or verifier
failures in the claim-bearing run.  The paused failed-offset rewrite and the
preclaim rejected top-level BLOCKINFO construction remain controls only.

## Full cost

| Metric | B0 p50 / p90 | B1 p50 / p90 | B2 p50 / p90 | WL p50 / p90 |
|---|---:|---:|---:|---:|
| planning wall (s/module) | 0 / 0 | .03668 / .06186 | .03924 / .07611 | .04096 / .07297 |
| strict checks wall (s/module) | .15061 / .25935 | .14626 / .25353 | .14582 / .25502 | .14603 / .25175 |
| first read wall (s/module) | .05290 / .08791 | .05028 / .08832 | .05246 / .08490 | .05267 / .08909 |
| warm read wall (s/module) | .04865 / .08634 | .04883 / .08337 | .04897 / .08310 | .04870 / .08482 |
| native peak RSS (bytes) | 16,093,184 / 16,285,696 | 16,109,568 / 16,281,600 | 16,117,760 / 16,285,696 | 16,097,280 / 16,293,888 |

Measured cumulative CPU, including all corpus compile attempts, planner
processes, and strict native checks, was 71.390625 seconds = 0.019831 CPU-hours.
Maximum planner-process RSS was 35,074,048 bytes; maximum native-tool RSS was
17,055,744 bytes.  Whole topic workspace at completion was 1,454,520,629 bytes
(1.354628 GiB).  Archive transfer/extraction overhead does not approach the
4 CPU-hour limit even though it is not included in child-process CPU totals.

The first/warm labels are operational process-order labels; no OS cache flush
was attempted.  Since B2 and WL files are exactly identical, their small read
timing differences cannot establish an access benefit.

## Frozen killer evaluation

| Killer | Observation | Result |
|---|---|---|
| same object/native fidelity failure | 0/400 arm failures | not triggered |
| actions/benefits absorbed by B1/B2 | WL == B2 on 100/100 | **triggered** |
| natural residual action coverage <10% | 0/63 = 0% | **triggered** |
| no p50/p90 union residual | 0 B / 0 B | **triggered** |
| no primary-benefit Pareto point | identical B2/WL bytes and files | **triggered** |
| resource failure before observation | none; full run completed | not applicable |

The scientifically supported statement is narrow: under this exact LLVM
version, bounded grammar universe, offset-safe native action domain, and frozen
100-module corpus, WL-SLDP's executable primary benefit is fully reproduced by
the fair greedy full-family comparator.  This is a decisive negative Stage A
result, not a claim about all future LLVM versions or all conceivable grammar
families.
