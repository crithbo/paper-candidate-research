# V8 exact-build platform preflight report

## Outcome

`PREFLIGHT_PASS__WINDOWS_X64_NATIVE_ROUTE_FEASIBLE__NEXT_RESOURCE_AUTHORIZATION_REQUIRED`

An ordinary public Windows/CPU route exists for exact V8 commit `c635f0d160b6e988b5ea5a907511a2929beb5d5e`. The exact commit has successful official Win64 builder, tester and debug-builder records, and the host satisfies the published OS/RAM/disk/CPU shape. The frozen Stage A contract did not bind Linux; Windows x64 can be frozen uniformly before the first native claim. R3F2/Linux refreeze is therefore `NOT_REQUIRED__NOT_AUTHORIZED`.

This preflight does not unblock Stage A by itself. The public exact-commit test isolate is a useful future stock-control asset but is not a candidate-capable mutable writer package. The next assignment must obtain the official exact source/DEPS closure and build `d8`, `mksnapshot` and `cctest` under one frozen Windows x64 configuration, with a user-provided license-appropriate Visual Studio/SDK installation, or accept a user-provided equivalent candidate-capable package.

## Exact identity and provenance

- Commit: `c635f0d160b6e988b5ea5a907511a2929beb5d5e`
- Tree: `98d4847ec4f1a50d0b1c0323e23d02db5d53d7e9`
- Parent: `c658a77923c51e3800329bc74197e2ea7717ec17`
- Commit position: `refs/heads/main@{#109153}`
- V8 source version: `15.3.0`, candidate bit set
- Committer time: `2026-08-10T15:45:40Z`
- V8 license blob: `9898b2d4833bfe87c05ba9106f082ed600bb2aab`; exact text SHA-256 `6AB33AF8774A0F396EE3AEEB761E3229057682D6F9FA7F572E390C2CB3A6E509`

Official source and build metadata are enumerated in `OFFICIAL_METADATA.tsv`.

## Official Win64 evidence

- `V8 Win64 - builder`: build `8673841892324615937` / #29159, `SUCCESS`; exact input and output revision match. Its build phase was 196.491 s and compile substep 123.320 s on official remote infrastructure. These timings are metadata, not a local estimate.
- `V8 Win64`: build `8673841534126114753` / #71443, `SUCCESS`.
- `V8 Win64 - debug builder`: build `8673841892481508561` / #28922, `SUCCESS`.
- `V8 Official Win64`: no exact-tag result; this does not invalidate the ordinary Win64 builder route.
- Exact builder manifest: generation `1786377119651730`, 253 bytes, SHA-256 `41732913FCF3A49FACF64F305CCAFE1FC8CB54E079785F45A83E39FBE5E0C00A`, with three CAS root digests for `bot_default`, `mozilla`, and `test262`.

No archive or binary body was downloaded.

## Platform-semantic finding

The exact source makes platform configuration part of snapshot construction: the snapshot toolchain is selected from host/current OS and CPU, and `run_mksnapshot` passes target OS and architecture. The reader embeds/checks the V8 version and can verify checksum integrity. Therefore a Windows blob must not be claimed byte-identical to an independently generated Linux blob.

The correct parity rule is instead one-platform native parity: freeze Windows x64, exact source/DEPS, compiler/SDK/tool identities, complete effective GN args, snapshot/runtime inputs and one matching reader; then run candidate and every comparator on that same denominator. This preserves the Stage A same-object contract and does not change its research object.

## GN/configuration finding

The exact official builder reported:

```gn
dcheck_always_on = false
is_component_build = false
is_debug = false
symbol_level = 1
target_cpu = "x64"
use_remoteexec = true
v8_enable_google_benchmark = true
```

The proposed local seed expands Win/x64 and external-startup-data defaults explicitly and changes only build transport to `use_remoteexec=false`. It is not yet a scientific configuration. The next resource gate must dump every effective format-affecting argument and fail closed on any unregistered difference. See `GN_ARGS_AND_DEPENDENCIES.yaml`.

## Resource estimate and host fit

Official Windows documentation states Windows 10+, x86-64, at least 8 GB RAM, over 16 GB recommended, and at least 100 GB free on NTFS. This host has 31.69 GiB RAM, 32 logical processors and 304.91 GiB free on NTFS D:, so hardware/storage preflight passes. The missing public prerequisites are Visual Studio C++/MFC/ATL, Windows SDK/Debugging Tools, depot_tools/Python/GN/Ninja, and exact V8 binaries.

The proposed next ceiling is 35 GiB network, 120 GiB workspace high-water, 24 CPU-hours, six wall hours and 32 logical processors. It is a request, not authority. Any system/global install remains user-provided or separately authorized; the agent may only use assignment-local tools and process-local environment changes.

## Scope and evidence ceiling

- Archive body download: no
- Source checkout/build: no
- Linux/WSL/refreeze: no
- Candidate/baseline/natural experiment: no
- Claim-bearing observation: none
- Scientific revision consumed: no
- Scientific inference: none
- Evidence ceiling: `RESOURCE_PREFLIGHT_ONLY__NO_SCIENTIFIC_INFERENCE`
- Stage B: false

Owner recommendation: accept R3F1 as a resource-preflight PASS, leave the scientific topic in `BLOCKED_USER_ACTION_REQUIRED`, ask the user/mainline to approve `NEXT_RESOURCE_REQUEST.yaml`, and release lane 3 as `IDLE_REUSABLE_AWAITING_MAINLINE`.

## Official references

- [Exact V8 commit](https://chromium.googlesource.com/v8/v8/+/c635f0d160b6e988b5ea5a907511a2929beb5d5e)
- [V8 source checkout](https://v8.dev/docs/source-code)
- [V8 build from source](https://v8.dev/docs/build)
- [V8 GN build](https://v8.dev/docs/build-gn)
- [Chromium Windows build prerequisites](https://chromium.googlesource.com/chromium/src.git/+/HEAD/docs/windows_build_instructions.md)
- [Exact Win64 builder](https://ci.chromium.org/b/8673841892324615937)
- [Exact Win64 tester](https://ci.chromium.org/b/8673841534126114753)
- [Exact Win64 debug builder](https://ci.chromium.org/b/8673841892481508561)

