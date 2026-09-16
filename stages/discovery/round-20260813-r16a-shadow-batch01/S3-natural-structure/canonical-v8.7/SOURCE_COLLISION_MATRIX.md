# SOURCE_COLLISION_MATRIX — canonical v8.7

| Family | First-party/current source and config facets | Direct/contrary evidence | Canonical result |
|---|---|---|---|
| BIND zone journal | [BIND journal docs](https://bind9.readthedocs.io/en/stable/chapter6.html); [configuration reference](https://bind9.readthedocs.io/en/stable/reference.html). Checked dynamic update, `.jnl`, dump delay, `rndc sync/freeze/thaw`, `allow-update`, `update-policy`, DNSSEC/inline-signing. | Documentation makes update buffering/dump timing a live operational control; using it as the intervention is controller/scheduling work. | Structural drop: controller only. |
| gettext catalog | Historical Wave260/Wave266 evidence supplied by mainline. | Current-union absorbed; V9 cannot revive it. | Excluded repeated. |
| GCC PCH | [GCC PCH documentation](https://gcc.gnu.org/onlinedocs/gcc/Precompiled-Headers.html); historical Wave267 Clang PCH/PCM result. | Object (precompiled header), problem (layout/load cost), action (generic placement/layout) and reader/guarantee are not materially distinct. | Excluded repeated. |
| TeX format | [Web2c documentation](https://tug.org/texinfohtml/web2c.html). Checked `-ini`, `-fmt`, `-progname`, `%&`, dump selection and configuration/path inputs. | Existing load selection is not a whole-format construction algorithm; generic layout/delta remains excluded. | Unfrozen. |
| systemd hwdb | [libinput/systemd hwdb update documentation](https://wayland.freedesktop.org/libinput/doc/latest/device-configuration-via-udev.html). Checked binary-db update, trigger/reload and property lookup facets. | Source-level full constructor union not closed; update/reload alone is controller behavior. | Unfrozen. |
| shared MIME cache | [Shared MIME-info specification](https://apol.pages.freedesktop.org/xdg-specs/shared-mime-info-spec/shared-mime-info-spec-latest.html). Checked XML merge, precedence, generated `mime.cache`, glob/magic matching. | Current spec establishes semantics but not an unabsorbed target-specific construction action. | Unfrozen. |

No current-absence claim is made for an uninspected source action.  No literature novelty assertion is made because no family reached a closed action contract.
