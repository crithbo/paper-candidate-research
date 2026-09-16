# Source and collision matrix — Wave282

| Requirement | First-party evidence / source facet | Finding | Consequence |
|---|---|---|---|
| Producer/input semantics | [Gio.Settings](https://gnome.pages.gitlab.gnome.org/gtk/gio/class.Settings.html) | glib-compile-schemas creates compact binary schemas from XML; IDs, keys, types/defaults and vendor overrides are semantic inputs. | Same-object contract retains them. |
| Install/search | [GIO migration guide](https://gnome.pages.gitlab.gnome.org/gtk/gio/migrating-gconf.html) | Schemas live in glib-2.0/schemas, are compiled, and use XDG data locations. | Path selection is existing surface, not N2. |
| Stock lookup oracle | [SettingsSchemaSource API](https://gnome.pages.gitlab.gnome.org/glibmm/classGio_1_1SettingsSchemaSource.html) | Schema source loads gschemas.compiled and performs schema lookup/parent recursion. | Defines stock acceptance oracle. |
| Pinned implementation | GLib main b865b41591b2d9457c4bac34511a3f59cf03df6c; producer, GVDB builder/reader, gsettingsschema facets | Pin is fixed but source pages were unreadable in this static pass; sort/hash/index/string/value/endian union is not asserted. | NOT_ADMITTED_UNFROZEN. |
| Candidate N2 | Target-aware joint schema-index/physical-layout constructor | No source-authorized mutation domain or stock-readable two-file witness exists in evidence. | Layout would be generic packing/hash/order or reader/format change. |
| Latest collision | First-party docs only, no frozen legal action | Direct same-object collision cannot be searched fairly before complete action exists. | No novelty or absence claim. |

## Collision conclusion

Neither direct absorption nor novelty clearance is asserted. The available evidence supports a bounded source closure plan only, not a non-generic same-object N2.
