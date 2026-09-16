# Evidence-qualified question cards

## QC50-01 — PyTorch symmetric-memory rendezvous

| Field | Frozen value |
|---|---|
| Exact object / endpoint | Fixed group, symmetric tensor sizes and call order; same symmetric-memory handle and collective numerical outputs. |
| Carrier / action / estimand | Official versioned symmetric-memory docs/tests; joint rendezvous metadata/handle construction; setup, mapped bytes, collective latency and output contract. All three were frozen. |
| Current loci | [PyTorch Symmetric Memory](https://docs.pytorch.org/docs/main/symmetric_memory.html) and current [FSDP collectives source](https://github.com/pytorch/pytorch/blob/main/torch/distributed/fsdp/_fully_shard/_fsdp_collectives.py). |
| Finite falsifier | If current `rendezvous` choices already select TCPStore or NCCL process-group allgather for the same group/handle contract, the proposed action is absorbed. |
| Bounded route | public documented SymmMem examples/tests; native handle plus collective output oracle; 72-hour route is finite but not used because of known fatal. |

## QC50-02 — PyTorch Inductor symmetric arguments

| Field | Frozen value |
|---|---|
| Exact object / endpoint | Fixed operator schema with `group_name`, same compiler-visible arguments and distributed operator results. |
| Carrier / action / estimand | Current public PyTorch source; compile-time argument-to-P2P allocation construction; compile, allocation, communication and output full cost. All three were frozen. |
| Current locus | [`torch.library.register_symm_mem_args`](https://github.com/pytorch/pytorch/blob/main/torch/library.py), which states that Inductor automatically allocates listed arguments in P2P-accessible NVLink memory at compile time. |
| Finite falsifier | If declarative schema registration causes Inductor to allocate the candidate arguments in `empty_strided_p2p`, the proposed two-layer action is already native. |
| Bounded route | source-defined operator schema and PyTorch distributed tests; compiler/operator result oracle. No packet because direct current action is known. |
