# Source and collision matrix

| Source | Status | Evidence | Effect |
|---|---|---|---|
| [Linux BTF specification](https://docs.kernel.org/bpf/btf.html) | Official | BTF type/string layout, type IDs/name offsets, BTF.ext func/line/CO-RE records. | Defines full reference-regeneration boundary. |
| [Linux libbpf source](https://github.com/torvalds/linux/blob/master/tools/lib/bpf/libbpf.c) | Current upstream | Current loader retains BTF/BTF.ext and local BTF type IDs. | Stock same-object consumer baseline. |
| [libbpf official repository](https://github.com/libbpf/libbpf) | Official project | CO-RE is a first-party supported use of BTF. | Natural consumer/artifact route. |

Collision status: `COLLISION_NOT_CLOSED`; no claim that no direct planner exists. Existing producers' deduplication is the direct executable baseline to close before any brief.
