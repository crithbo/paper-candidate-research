# Source/collision matrix

| Claim | Official source | Evidence | Consequence |
|---|---|---|---|
| Authoritative format/reference | [OpenEXR project](https://openexr.com/en/latest/index.html) | Project provides the specification and reference implementation. | Pin this source before claiming writer absence. |
| Layout and reader grammar | [OpenEXR File Layout](https://openexr.com/en/latest/OpenEXRFileLayout.html) | Defines multipart headers, per-part chunk tables, chunk forms, tile coordinates and offset-table ordering. | Establishes object and constraints; does not prove a current residual. |
| Levels and tiled semantics | [Technical Introduction](https://openexr.com/en/latest/TechnicalIntroduction.html) | Documents tiled multi-resolution/MIPMAP/RIPMAP representation. | Fixed level mode is a hard semantic boundary. |
| Native API scope | [OpenEXR API](https://openexr.com/en/latest/API.html) | Covers reading/writing scanline and tiled files, tiles and levels. | Complete flags/source union still open. |
| Direct collision | No current primary same-object global-layout/ROI collision matrix was closed. | — | Admission blocker, not novelty evidence. |

Cutoff: 2026-08-11. Only OpenEXR official sources were used.
