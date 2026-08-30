# SOURCE / COLLISION MATRIX

| Family | Official evidence | Current/direct contrary evidence | Status |
|---|---|---|---|
| GResource | [Gio.Resource](https://docs.gtk.org/gio/struct.Resource.html), [GTK guide](https://docs.gtk.org/gtk4/getting_started.html) | binary bundle plus generated-source/static registration paths already exist | Unfrozen |
| locale archive | [glibc locale manual](https://sourceware.org/glibc/manual/latest/html_node/Setting-the-Locale.html), [localedef archive source change](https://sourceware.org/pipermail/glibc-cvs/2022q1/076870.html) | localedef archive construction and locale selection are native union arms | Unfrozen |
| OpenType | [OpenType font file](https://learn.microsoft.com/en-us/typography/opentype/spec/otff), [OpenType overview](https://learn.microsoft.com/en-us/typography/opentype/spec/overview) | sorted table directory, checksums and existing table-sharing collections constrain action space | Unfrozen |
| hwdb | [systemd hwdb manual](https://www.freedesktop.org/software/systemd/man/latest/systemd-hwdb.html), [systemd source](https://github.com/systemd/systemd) | source/flag union and release triples unclosed | Unfrozen |
| SELinux policy | [SELinux official releases](https://github.com/SELinuxProject/selinux/releases), [SELinux source](https://github.com/SELinuxProject/selinux) | compiler/loader action union and exact natural trace unclosed | Unfrozen |
| typelib | [GIRepository API](https://docs.gtk.org/girepository/), [official source](https://github.com/GNOME/gobject-introspection) | writer/reader current union unclosed | Unfrozen |

The record uses no absence claim based on issues/future work. Generic patching/build reuse is a baseline only.
