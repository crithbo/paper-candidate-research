# Rule freeze

- Assignment: `DISCOVERY-S6-20260811-V8.7-WAVE210-BTF-TYPEGRAPH-STRINGTABLE-PLANNER-DEPTH`; cutoff 2026-08-11.
- Authority: v8.7 + R5-P0, `DISCOVERY_QUALITY_MODE=OFF`.
- Frozen control hashes: plan `08A2A5855112635FD009EACA933266F39CF9F47107C1516B0FDCEF1FE4A9F7D9`; registry `AE95989897A02C9213E9FC72C414D6AD660E458AD50F33E1BDB14DDB9B1F6F40`; ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- Only official Linux/libbpf/LLVM sources were used; no experiment, benchmark, download, automation or downstream stage occurred.

Fixed object: the same decoded BTF/BTF.ext type graph, strings, CO-RE, func/line semantics and stock kernel/libbpf/bpftool behavior. Any candidate must regenerate every affected type ID/string offset in BTF, BTF.ext and associated ELF records.
