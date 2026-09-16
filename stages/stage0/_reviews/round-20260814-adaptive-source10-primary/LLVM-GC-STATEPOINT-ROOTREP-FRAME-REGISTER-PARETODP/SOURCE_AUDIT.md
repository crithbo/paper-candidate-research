# Source audit — LLVM GC root/frame/register frontier

## Frozen discovery input integrity

| Artifact | Expected SHA-256 | Status |
|---|---|---|
| brief | `AB059B8342474CFB5C094529D28D77D9C62EB338F3684087FAE36ED8938477F6` | verified before review |
| collision matrix | `E0AF7A8DC1FFFAC7AACF4732539BF306C8F62609E7ABA559AE154750270DA89A` | verified before review |
| discovery log | `AAB58AB5F6AC55691C9749B898D0425EEBD02B653BA51E094B89F2F610E40212` | verified before review |
| discovery handoff | `5CF2302D4C3B2237D980168AB5BF5837B267BE82F08A3738E5A61E8BE2BDC631` | verified before review |

## First-party sources consulted

1. [LLVM Statepoints](https://llvm.org/docs/Statepoints.html), checked
   2026-08-14/15: relocation sequence, stackmap mapping, explicit alloca-root
   conditions and RewriteStatepointsForGC limitation.
2. [LLVM Garbage Collection](https://llvm.org/docs/GarbageCollection.html),
   checked 2026-08-14/15: collector/GC strategy and custom-lowering boundary.
3. [LLVM StackMaps](https://llvm.org/docs/StackMaps.html), checked 2026-08-14/15:
   location/reader semantics and experimental status.
4. [current StackMaps.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/CodeGen/StackMaps.cpp), checked as current-source locator.

## Contrary evidence and stopping rule

The official docs themselves provide the strongest contrary evidence: a
relocated value may be stack-spilled and alloca-root addresses may be emitted.
They do not establish same-collector exchangeability, root/base-update
equivalence, or a bounded joint method.  A GitHub cache miss for the current
RewriteStatepointsForGC source is recorded as retrieval-limited, not as evidence
of absent action.  Thus the collision status is
`SEARCH_BOUNDED_OPEN__COMPONENT_ACTIONS_PRESENT__JOINT_SAME_COLLECTOR_CERTIFICATE_UNCLOSED`.
