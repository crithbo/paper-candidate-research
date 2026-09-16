# Question Card — S3-98-01

**Status:** `LOCATOR_ONLY__WHOLE_CONSTRUCTOR_AND_NATURAL_PANEL_UNFROZEN`

| Field | Boundary |
|---|---|
| Exact public identity | systemd `hwdb.d` release source and generated binary hardware database, upstream main checked 2026-08-15. |
| Carrier | intended adjacent official systemd release snapshots; no immutable release-pair panel acquired. |
| Same-object problem | fixed `.hwdb` rule mapping and stock device-property lookup behavior. |
| Tentative endpoint | final binary bytes + equal-information transition bytes, generation CPU/RSS/temp, and load/query cost. |
| Current loci | `systemd/systemd` main `hwdb.d/`; official systemd device API/manpage surface. |
| Minimum falsifier | any frozen modalias/property query yields a different property set/value/precedence through stock lookup. |
| Finite closure ceiling | deterministically select 20–50 upstream tags; pin `systemd-hwdb` updater plus reader source and all relevant flags; verify stock query oracle; compare current generator plus generic delta. |

## Ordinary closure result

Official upstream material establishes the rule-source directory and that the hwdb is compiled to an on-disk binary which must be updated when `.hwdb` data changes. That is evidence for the carrier and update semantics, not a legal-action catalogue. This review did not establish a non-generic, stock-legal action beyond generic trie/layout packing, nor a confound-controlled repeated release-transition law.

There is no current-implementation absence claim: source-level writer/reader symbols and default/non-default action/config union remain a bounded debt only after an atomic action is frozen. The RQ is therefore not evidence-qualified raw. No queue is opened because no single missing field bundle exists; the carrier/action/estimand would be selected jointly, and a disjunctive queue is prohibited.

## Sources

1. systemd upstream repository, <https://github.com/systemd/systemd> (official source, current main checked 2026-08-15).
2. systemd architecture documentation, <https://github.com/systemd/systemd-stable/blob/v255-stable/docs/ARCHITECTURE.md> (official project documentation; `hwdb.d` source location).
3. systemd device API documentation, <https://www.freedesktop.org/software/systemd/man/latest/sd-device.html> (official API semantics).
4. libinput documentation, “Static device configuration via udev,” <https://wayland.freedesktop.org/libinput/doc/1.25.0/device-configuration-via-udev.html> (primary downstream documentation of binary hwdb update behavior; accessed 2026-08-15).
