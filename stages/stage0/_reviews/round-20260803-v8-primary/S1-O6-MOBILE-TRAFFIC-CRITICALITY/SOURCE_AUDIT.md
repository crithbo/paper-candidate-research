# Source / collision audit — S1-O6-MOBILE-TRAFFIC-CRITICALITY

| Source | Grade / use | Verification finding |
|---|---|---|
| [Sereno OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/xin) | official proceedings; direct problem source | verifies the 153% jank phenomenon and software-yield mechanism; does not verify a new hardware tag |
| [XSched OSDI 2025](https://www.usenix.org/conference/osdi25/presentation/shen-weihang) | official proceedings | command-level scheduling baseline, not first-arbiter proof |
| [Arm AMBA/CHI](https://www.arm.com/architecture/system-architectures/amba/amba-5) | official specification context | transaction QoS is an existing capability; exact semantic mapping remains open |
| [AMD Versal QoS](https://docs.amd.com/r/en-US/am011-versal-acap-trm/Quality-of-Service) | official technical documentation | documents AXI QoS propagation to NoC/DDR; strong direct subtract |

**Collision status:** `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`. No source was treated as a global novelty proof. No predatory/metadata red flag was identified for the proceedings; vendor documentation is not used as publication-quality novelty evidence.
