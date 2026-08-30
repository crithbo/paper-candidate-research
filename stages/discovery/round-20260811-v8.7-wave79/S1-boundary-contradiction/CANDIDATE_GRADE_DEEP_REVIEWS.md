# CANDIDATE_GRADE_DEEP_REVIEWS

## D01 — LLVM bitcode compatibility maintenance

- **Exact object/contract:** one bitcode module and reader version, with the same accepted module and reconstructed IR semantics. The [LLVM documentation](https://llvm.org/docs/ExtendingLLVM.html) explicitly notes that adding instructions changes bitcode compatibility and identifies the current reader/writer implementation paths.
- **Atomic action/information:** decode or upgrade a construct using only its bitstream, module context and declared reader semantics; no source-program replacement or external semantic oracle.
- **Current union:** bitcode reader, writer, assembly parser and IR verifier already jointly realize compatibility. A new byte rewrite is an emitter/postprocessor; accepting an unsupported construct or mapping it to a different IR changes the guarantee.
- **Natural/full cost:** LLVM test and compiler-produced bitcode corpus; bitstream size, decode/upgrade/verify, later optimization, memory and exact IR/diagnostic outcome.
- **72h killer/fidelity closure:** a minimal versioned construct from the official reader test path. It must produce the native verifier-equivalent IR; otherwise it fails, while equivalent reconstruction is current-union replay.
- **Decision:** `DROP__CURRENT_UNION_OR_POSTPROCESSOR`.

## D02 — glibc versioned ELF symbol resolution

- **Exact object/contract:** a process image with fixed shared objects, `NEEDED` entries, versioned symbol references and namespace. The [current dynamic linker manual](https://sourceware.org/glibc/manual/latest/html_node/Dynamic-Linker.html) and [hardening guidance](https://sourceware.org/glibc/manual/latest/html_node/Dynamic-Linker-Hardening.html) define the binding environment and highlight version/namespace constraints.
- **Atomic action/information:** resolve a symbol using the dynamic linker’s link map, version tables and relocation data only.
- **Current union:** native loader lookup, version binding, namespace and relocation behavior are the strongest same-object union. `LD_PRELOAD`, `dlmopen`, linker scripts, interposition or an adapter alter the object/environment and are excluded.
- **Natural/full cost:** versioned ELF libraries and executables; loader startup, relocation, mappings, memory, binding result, ABI behavior and failure category.
- **72h killer:** one binary needing a versioned symbol under a fixed link map. Native `readelf` metadata plus loader binding is a finite oracle: different version/binding is fidelity failure; identical behavior is no new action.
- **Decision:** `DROP__LOADER_UNION_OR_CHANGED_ABI_NAMESPACE`.

## D03 — JVM class-file version compatibility

- **Exact object/contract:** class bytes with fixed major/minor and preview status, loaded by a declared JVM, preserving verifier acceptance/error and execution semantics. The [JVMS 26](https://docs.oracle.com/en/java/javase/26/docs/specs/jvms/index.html) specifies the versioned class-file format; [ClassFileVersion](https://docs.oracle.com/en/java/javase/26/docs/api/java.base/java/lang/classfile/ClassFileVersion.html) records current loading restrictions.
- **Atomic action/information:** validate/load versioned bytes using their header, constant pool and stated VM capabilities.
- **Current union:** native class-format parser, version gates and verifier. Downgrading attributes/major version is an emitter transform and can change semantics; enabling preview is a mode flag, not N2.
- **Natural/full cost:** public jars/class files; bytes, parse/verify/link/load time, memory, execution and identical error class.
- **72h killer:** a class with a version/preview condition at the declared VM boundary. Native loading is the oracle: reject/accept mismatch fails contract; matching behavior belongs to the existing parser/verifier union.
- **Decision:** `DROP__VERSION_BRIDGE_EMITTER_OR_NATIVE_UNION`.

## Conclusion

Three deep reviews meet the diagnostic target. None retains a complete same-object N1/N2/N3 outside the strongest current union without using a prohibited adapter/emitter/flag or changing the compatibility guarantee. No `STAGE0_BRIEF` is produced.
