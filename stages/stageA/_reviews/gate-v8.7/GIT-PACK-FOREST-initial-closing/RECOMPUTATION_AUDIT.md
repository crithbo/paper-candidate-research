# GIT-PACK-FOREST Independent Recomputation Audit

## Read-only audit boundary

The reviewer ran no candidate research experiment and wrote nothing to the owner or mainline directories. All calculations below read frozen manifests, JSON records, pack/index artifacts, scripts, Git 2.55 source, and the bundled executable.

## Freeze and provenance

| Artifact | Recomputed SHA-256 / result |
|---|---|
| Owner `HASH_MANIFEST.sha256` | `FA1742777AE11057C233100F931890D24F29A1AF20FDFB1B76997270386E018B` |
| Owner manifest verification | `63,924/63,924`, `3,039,711,577 B`, zero mismatch/missing/unlisted |
| `STAGEA_REPORT.md` | `846A8A6AD17942492E561EDF8FEE42673DEFAD58E239FA1ECC4EAEB19D49F920` |
| `EXPERIMENT_CONTRACT.yaml` | `0517AF7175ED81A94D6347189521E6AB4F3D17E91823FFE5C0DE164EB28A95AD` |
| `Q1_COMPARATOR_MATRIX.md` | `EEAD57D32EC7E84F65AE76AD1F69C31E72C52FAD38E497F0B983CA1FEC4B743F` |
| `RESULTS.md` | `C11364AAA541E058AF6E9AAC52DD36A566EF975E80841042D23A8FE36F9AE53E` |
| `COMMAND_LOG.md` | `CEF75FDBC964F8D2DCD90EE96A347364077E483531C0E91D9601374F637A167C` |
| `USER_REVIEW_PACKET.md` | `1E2319940F320C0B57257761E44CD4E9F789BBEFAD5BD8E0A41654EF6C90B3C8` |
| `handoff.yaml` | `DC62EC04CBCBBA2E054524845F09DF79AAA15898D9BA02DE2E7E7EE3453199B6` |
| Discovery manifest | `736638AED4B1C05137301A03C0D6FEF0FFA50E08CE7B11CA60AA5ADBC9980C12`, 4/4 |
| Stage 0 primary manifest | `5BE1D727E9904794272B7593475841A1DB645B6D836F82036766F45ECA59214A`, 4/4 |
| Stage 0 confirmation manifest | `712E5D2ADF5813C6B1E92D98100699892D7ECEA40264495F5B0BA2F9EC4D29B4`, 5/5 |

The owner directory contains two intentional non-payload files in addition to the manifest's 63,924 entries: the manifest itself and its verification record. No unexpected payload file was found.

## Preclaim fidelity recomputation

- Bundled executable reports `git version 2.55.0.windows.1`.
- Bundled Git source resolves to `e9019fcafe0040228b8631c30f97ae1adb61bcdc`.
- Native parity JSON contains 38 comparisons, 38 byte-exact diff-delta programs, and 38 byte-exact zlib streams; both all-pass flags are true.
- Frozen zlib version is `1.3.2`; DLL SHA-256 is `93E9243A44C29200EEACAF9658EFE2558581770E4B11CA4B500E18E424A6E3B5`.
- Final preclaim witness uses all 115 reachable objects, verifies 115 objects, has index strict exit 0, fsck strict exit 0, canonical mismatch 0, and native delta/zlib parity true.
- Formal inference is restricted to `codec-final-initial` and `codec-final-replay`; earlier control runs were not counted.

Disposition: `PASS_NATIVE_GIT_CODEC_AND_FULL_COST`.

## Formal result recomputation

For every repository and run, the reviewer rebuilt the comparison values from raw method records:

1. exclude `candidate_joint` and failed methods from the comparator set;
2. require canonical mismatch count 0;
3. take the minimum pack+index bytes, minimum cold time, and minimum warm time among actual methods;
4. recompute each signed residual using the frozen formula;
5. apply the frozen primary-benefit predicate: positive size residual, or cold residual above 5%, or warm residual above 5%.

All 60 recomputed metric formulas per run match the stored values within `1e-12`. Results:

| Quantity | Initial | Replay |
|---|---:|---:|
| Repositories | 20 | 20 |
| Methods | 280 | 280 |
| Failed/inapplicable | 0 | 0 |
| Strict correctness failures | 0 | 0 |
| Primary benefit | 0 | 0 |
| Positive size | 0 | 0 |
| Cold above 5% | 0 | 0 |
| Warm above 5% | 0 | 0 |
| Size residual min/max | `-3.5303305475 / 0` | `-3.5303305475 / 0` |
| Cold residual min/max | `-0.1371041215 / 0.0181128017` | `-0.1767362266 / 0.0132508289` |
| Warm residual min/max | `-1.3872887418 / 0.0062413411` | `-1.2763427859 / -0.0151228043` |

The per-metric minima are always values of actual successful methods. Ties may yield more than one named winner, but no denominator is synthesized at byte level.

## Action residual recomputation

Each run selects 832 candidate edges. Recomputed coverage reasons are:

| Reason | Initial | Replay | Interpretation |
|---|---:|---:|---|
| `OBSERVED_UNION_EDGE` | 719 | 720 | actually selected by an executed comparator |
| `PATH_WALK_SAME_PATH_SUPERSET` | 112 | 111 | action-space expressibility proxy |
| `CONSERVATIVE_WINDOW80_PROXY_1` | 1 | 1 | ordering/window proxy |
| outside conservative superset | 0 | 0 | preregistered conservative residual |

The stored conservative residual `0/832` is arithmetically correct. It is not equivalent to 832 observed selections. Observed-only unmatched fractions are `113/832 = 13.5817%` and `112/832 = 13.4615%`. This correction narrows the absorption claim but does not change the independently established 0/20 primary-benefit STOP kernel.

## Full-cost recomputation

Independent summation of all raw method records exactly matches `FULL_COST.json` for construction, verification, access, and bytes in both runs. Every candidate record has non-null construction wall/CPU/RSS, index wall/CPU/RSS, strict verification, cold access, and warm access fields. Graph precomputation and candidate optimization are included. No fallback occurs.

The ledger preserves units rather than adding seconds to bytes. The comparator envelope's selection/planning is not presented as a single deployable pack. Since the negative claim only requires that an actual comparator exists for each failed primary dimension, this does not invalidate the bounded conclusion.

## Artifact and replay recomputation

- Physical pack and index SHA-256 values: 560/560 match their frozen JSON records.
- Cross-run pack/index pair hashes: 224/280 match.
- Candidate: 20/20 match.
- Deterministic simple methods: 40/40 match.
- Classic branching: 19/20 match.
- Every executed method: strict index exit 0, strict fsck exit 0, canonical mismatch 0, and verified object count equal to the frozen repository count.

The remaining native Git and one classic tie variation changes byte hashes but not candidate output, per-repository size residual, correctness, candidate coverage flags, outside count, or decision. Scientific replay therefore passes with a declared byte-level nondeterminism boundary.

## Independent conclusion

The package supports `CONFIRM_STOP / BELOW_Q2_STOP` for the exact frozen mechanism under `BOUNDED_NATURAL_20_REPOSITORY_GIT_2_55_NEGATIVE__NO_GENERAL_IMPOSSIBILITY_CLAIM`. The action-coverage rhetoric must be weakened, but no revision is warranted solely to restate it because the bounded natural performance negative is independently decisive.

