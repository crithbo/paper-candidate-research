# R3 Shadow P1 policy archive

This directory preserves the exact surviving bytes of the non-production R3
Shadow P1 policy preview removed from the live rule surface on 2026-08-23.

- `CORE_POLICY_C3E764C4.md` is the surviving preview common policy, SHA-256
  `C3E764C4CA88BFF4793E1FED111FDE10B6494074BA584CBD5D4647422D6CFEB6`.
- `shadow_roles/` contains the nine exact preview role/schema files.
- The roles pin the unavailable older common-policy SHA-256
  `30B24D069673DAD4EB555C5FC4DE4CCA6EB9D2108697BE7031FAEF75F9B42803`.

This mismatch is historical telemetry. The bundle is not self-consistent
production authority and must not be repaired by inventing or transforming the
missing bytes. The current policy remains `AGENTS.md` plus active role rules.

