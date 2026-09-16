# SOURCE_COLLISION_MATRIX — Wave198

| family | primary spec / stock verifier | current-union evidence and restriction | disposition |
|---|---|---|---|
| OCI | [OCI image specification](https://oci-playground.github.io/specs-latest/specs/image/v1.1.0-rc5/oci-image-spec.pdf) | descriptors are digest-addressed; current builder/source/config union not frozen | `NOT_ADMITTED_UNFROZEN` |
| RPM | [RPM package format](https://rpm-software-management.github.io/rpm/manual/format_v3.html) | sections/signatures/header/payload semantics; current builder macros/source union not frozen | `NOT_ADMITTED_UNFROZEN` |
| wheel | [wheel specification](https://packaging.python.org/en/latest/specifications/binary-distribution-format/), [pip behavior](https://packaging.python.org/en/latest/tutorials/installing-packages/) | wheel install/metadata/`RECORD` constraints leave only generic archive layout in this screen | `EXCLUDED` |
| JAR | [JAR specification](https://docs.oracle.com/javase/8/docs/technotes/guides/jar/jar.html), [verification](https://docs.oracle.com/javase/tutorial/deployment/jar/verify.html) | signatures/manifests and `jarsigner -verify`; repack changes signature or is stock jar action | `EXCLUDED` |
| Go zip | [Go modules reference](https://go.dev/ref/mod) | canonical hash ignores zip layout and `go mod verify` checks it; external dedup is forbidden cache | `NOT_ADMITTED_UNFROZEN` |
| NuGet | [package creation](https://learn.microsoft.com/en-us/nuget/create-packages/creating-a-package), [catalog hashes](https://learn.microsoft.com/en-us/nuget/api/catalog-resource), [`dotnet nuget verify`](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-nuget-verify) | package conventions, SHA-512 catalog field and verifier known; source/config union unclosed | `NOT_ADMITTED_UNFROZEN` |

`CURRENT_UPSTREAM_REALITY_CHECK`: no document/source gap is claimed. Where source commit, flags/macros/signing configuration or a full builder union was not frozen, the row stays `NOT_ADMITTED_UNFROZEN`; it is not converted into an absence claim.

