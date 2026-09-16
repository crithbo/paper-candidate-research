# CANDIDATE_GRADE_DEEP_REVIEW

## D01 — LLVM constrained floating-point lowering

- **Exact object and contract:** a fixed LLVM IR function using constrained FP operations/`strictfp`, with its rounding, exception and denormal environment observable.  Same function means preserving values *and* the encoded FP-environment behavior, not merely a tolerance bound.
- **Current reality check:** the current [LLVM LangRef](https://llvm.org/docs/LangRef.html) explicitly distinguishes default FP assumptions, `strictfp`, `denormal_fpenv`, constrained intrinsics, and fast-math flags.  This is a positive current-union check, not an implementation-absence claim; no old issue/future-work assertion is used.
- **Strongest same-object union:** legal constrained lowering plus all non-semantic-changing pass/scheduling choices; fast-math/reassociation is outside the contract.  Information is the IR, attributes, and target facts available to a compiler, not an oracle.
- **Action-divergence audit:** a proposed reassociation/vector contraction either is already a legal compiler optimization in the union or changes an observable rounding/exception/denormal outcome.  Thus no independently specified N1/N2/N3 action remains.
- **Natural carrier/full cost:** LLVM regression FP cases and ordinary numerical kernels; account parsing/lowering/optimization time, code size, execution time, memory, result bits and FP-environment observations.
- **Finite Stage-A killer, if it had survived:** one small constrained expression whose alternate association changes a mandated rounding/exception/denormal observation, checked by the native verifier/test oracle.  The static audit already kills the premise.
- **Decision:** `DROP__CURRENT_UNION_OR_CONTRACT_CHANGE`; no paper potential can honestly be stated under the frozen contract.

## D02 — CUDA strict-mode code generation

- **Exact object and contract:** a fixed CUDA kernel compiled with denormals preserved, precise div/sqrt, and its explicitly fixed FMA policy.  Same quality is IEEE/ULP and special-value behavior stipulated by that contract, never a relaxed accuracy target.
- **Current reality check:** current [nvcc documentation](https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/contents.html) exposes `--ftz`, `--prec-div`, `--prec-sqrt`, and `--fmad`; the official [programming guide](https://docs.nvidia.com/cuda/cuda-programming-guide/05-appendices/mathematical-functions.html) documents their numerical consequences. `--use_fast_math` bundles contract-changing choices.  No absent-feature claim is made.
- **Strongest same-object union:** the documented strict selections, code generation/scheduling legal under them, and all compiler-internal choices that retain the selected semantics.  The information condition is kernel source, target, and fixed command line.
- **Six-dimensional residual:** the apparent faster action changes a decision rule only by enabling FTZ, approximate division/sqrt, or different contraction; it fails quality/guarantee.  Under same information and fixed resource budget, remaining instruction scheduling is already inside the native compiler union.  Full cost would include host/device compilation, code size/registers, launch/runtime and exact special-value checks; no generalizable independent mechanism was found.
- **Natural carrier and finite killer:** public CUDA numerical kernels with a finite FMA/denormal-sensitive witness; compare native strict compilation against the proposed action and reject on any contract deviation.  This is finite but only confirms the static exclusion.
- **Decision:** `DROP__FLAG_ONLY_OR_CONTRACT_CHANGE`, not a readiness judgment.

## D03 — PyTorch deterministic operator dispatch

- **Exact object and contract:** one fixed PyTorch operator/model invocation on fixed software/hardware, with the documented deterministic-algorithm requirement and output equality across repeated runs.  This does not claim cross-release or cross-platform reproducibility beyond the official contract.
- **Current reality check:** [the official API](https://docs.pytorch.org/docs/stable/generated/torch.use_deterministic_algorithms.html) already makes operations choose deterministic algorithms when available or raise; [the reproducibility note](https://docs.pytorch.org/docs/stable/notes/randomness.html) states the related controls and their boundary.  There is no absence assertion.
- **Strongest same-object union:** documented deterministic dispatch/fallback/error behavior and any current backend legal choices.  Information is the operation, shapes/dtypes/device, deterministic setting and backend state available at dispatch.
- **Action-divergence audit:** choosing among native algorithms is a selector/controller unless it supplies a new complete algorithm with identical determinism and output guarantee.  No such non-generic N2/N3 was frozen; a candidate merely wraps current dispatch or changes the guarantee.
- **Natural carrier/full cost:** public model/operator workloads; include deterministic fallback, setup/dispatch, runtime, memory, errors, and repeated-output check—not just selected kernel time.
- **Finite killer:** on one operation for which deterministic mode has a native alternative or raises, show the claimed action either equals native behavior, is a wrapper, or fails the exact repeatability contract.  It is decisive within a bounded CPU/GPU-independent source/oracle closure, but the action is already excluded.
- **Decision:** `DROP__CONTROLLER_OR_CURRENT_UNION_ABSORPTION`.

## Admission outcome

Three candidate-grade reviews were performed (the requested diagnostic range was 3--4).  None leaves a complete same-object N1/N2/N3 under a frozen numeric contract.  Therefore there are no `STAGE0_BRIEF` files and no `PROPOSE_STAGE0` recommendation.
