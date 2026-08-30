# Unique opportunity families

## Current-source reality anchors

| family | first-party anchor frozen at cutoff | current action/configuration facts checked | natural carrier route |
|---|---|---|---|
| Core Wasm | WebAssembly Core 3.0 Binary Format, dated 2026-07-28: https://webassembly.github.io/spec/core/binary/ | binary grammar covers sections, indices, code/data, and custom sections; no current-absence claim is made | WebAssembly/spec tests plus public compiler-produced modules |
| R2R | Microsoft ReadyToRun documentation and dotnet/runtime Crossgen2 source tree: https://learn.microsoft.com/en-us/dotnet/core/deploying/ready-to-run ; https://github.com/dotnet/runtime/tree/main/src/coreclr/tools/crossgen2 | `PublishReadyToRun`, exclusion list, symbol output, and `PublishReadyToRunComposite`; target RID and tiered-compilation interaction checked | dotnet/runtime and ASP.NET public applications/tests |
| BEAM | Erlang/OTP compiler and loader source: https://github.com/erlang/otp/tree/master/lib/compiler ; https://github.com/erlang/otp/tree/master/erts/emulator/beam | compiler options and loader-owned BEAM chunk contract must be inspected together; no unverified absence asserted | OTP applications and Hex packages |
| V8 snapshot | V8 snapshot source: https://chromium.googlesource.com/v8/v8/+/refs/heads/main/src/snapshot | source entry point identified, but a complete command/flag plus native snapshot contract was not closed without downloading/building | V8 test and embedder snapshot corpus, not yet frozen |
| gettext MO | GNU gettext manual/source: https://www.gnu.org/software/gettext/manual/ ; https://git.savannah.gnu.org/cgit/gettext.git/ | `msgfmt` native hash-table/format choices checked; external compression excluded | GNU and distribution PO catalogs |
| TZif | IANA tz theory and upstream tz source: https://data.iana.org/time-zones/theory.html ; https://github.com/eggert/tz | timezone histories, `zic` generation, and TZif reader contract are distinct from a generic compressor | IANA tzdb release sources and installed zoneinfo trees |

The source references are frozen by URL/ref and cutoff date for a Discovery screening record. No claimed absence depends on a moving branch: the only source-sensitive rows are either directly absorbed or remain unfrozen.

