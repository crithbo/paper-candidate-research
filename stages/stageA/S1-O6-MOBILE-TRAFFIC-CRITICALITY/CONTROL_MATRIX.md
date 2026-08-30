# Frozen control matrix

This matrix was preregistered before any claim-bearing observation. No row may be replaced with a different object, synthetic request stream, extra-information oracle, or relaxed quality/fairness contract.

| Cell | Action layer | Information available | Source/budget preserving | Required full cost | Scientific role |
|---|---|---|---|---|---|
| B0 stock priority + FR-FCFS/weighted | accelerator/arbiter | accelerator identity and deployed priority only | Yes | all deployment, queue, DRAM, fairness and fallback costs | deployment baseline |
| B1 Sereno-style yield | application/decode execution | published software-visible phase/yield information | Yes; any changed arrivals/work removed is explicit and charged | yield overhead, lost/useful work, quality and thermal effects | direct software subtractor |
| B2 XSched-style command priority/preemption | command queue | command identity and policy metadata | Yes | scheduler, preemption, synchronization and recovery | command-level subtractor |
| B3 native static transaction QoS | transaction/interconnect | fixed mapping into native QoS alphabet | Yes | tag/path, queue, arbiter, DRAM, fairness and control-plane | same-information baseline |
| B4 native dynamic transaction QoS | transaction/interconnect | exactly the candidate-visible source/criticality/budget alphabet, capped to equal symbols | Yes | classification plus every path/arbiter/DRAM/fairness cost | strongest same-information baseline |
| Candidate | first shared arbiter | no more information than B4 | Yes | complete ledger in `EXPERIMENT_CONTRACT.yaml` | tested N1 contract |
| EDF | offline | complete future request stream | Not deployable | reported only as headroom ceiling | never a union oracle |

Equal-quality dominance is evaluated only after the natural mapping, output-quality equality, thermal/power envelope, completion set and starvation bound are all valid. Native-QoS coverage of all candidate points, or exact reduction of the candidate action to native QoS, is the only preregistered scientific STOP route for this probe.

