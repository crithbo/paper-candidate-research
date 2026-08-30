# R16B S5 neutral source snapshot

Frozen on 2026-08-13 before canonical evaluation.  Pre-depth exact-string
deduplication searched `plan.md`, `registry.yaml`, `history.md`, the R16A
accepted/excluded ledger, and the visible active-R16B assignment names for:
`GTK4_ICON_THEME_CACHE_CONSTRUCTOR`, `GDK_PIXBUF_LOADERS_CACHE_CONSTRUCTOR`,
`GIO_MODULES_CACHE_CONSTRUCTOR`, and `XDG_DESKTOP_MIME_CACHE_CONSTRUCTOR`.
No exact family signature was found.  This is a non-authoritative lexical
precheck only; mainline retains cross-lane duplicate authority.

## S5-R16B-F01 — GTK icon-theme cache

Signature: `object=GTK icon-theme directory with index.theme and icon files;
action=construct mmap-able icon-theme.cache; information=directory tree plus
command flags; output=stock GTK cache-readable theme; comparator=gtk4-update-
icon-cache including force/index-only/include-image-data/validate; cost=tree
walk+image-data read+cache write+bytes+startup mmap/read.`

Carrier: a finite real icon-theme directory.  Official current GTK 4 command
documentation (GTK 4.23.1, generated 2026.1; accessed 2026-08-13) says the
command creates `icon-theme.cache`, gives its stock-reader purpose, and lists
the default and non-default controls.  It is source-backed action presence, not
an implementation-absence claim.

## S5-R16B-F02 — GdkPixbuf loader-signature cache

Signature: `object=GdkPixbuf shared loader-module directory;
action=construct loaders.cache recording available loader signatures;
information=module files and exported fill_info signatures plus module-dir/file
overrides; output=stock GdkPixbuf runtime loader selection; comparator=gdk-
pixbuf-query-loaders and GDK_PIXBUF_MODULEDIR/GDK_PIXBUF_MODULE_FILE union;
cost=module probing+signature extraction+cache write+runtime parse/dlopen
avoidance.`

Carrier: a finite real loader directory.  Official GdkPixbuf 2.44.6 API
documentation (generated 2025.5; accessed 2026-08-13) names the utility,
default output, overrides, and runtime consumption.

## S5-R16B-F03 — GIO extension-module lazy-load cache

Signature: `object=GIO loadable module directory and declared extension points;
action=construct query cache for lazy module loading; information=module query
symbols and directory; output=same GIO extension discovery semantics;
comparator=gio-querymodules plus documented GIO module-directory controls;
cost=module probing+extension discovery+cache write+startup load avoidance.`

Carrier: a finite real GIO module directory with one queryable extension point.
Official GIO 2.89.0 API documentation (generated 2026.1; accessed 2026-08-13)
requires `gio-querymodules` after installing a queryable module and freezes the
query-symbol semantics.

## S5-R16B-F04 — XDG desktop MIME association cache

Signature: `object=directory of .desktop files containing MimeType declarations;
action=construct desktop MIME association cache after installation;
information=desktop-entry declarations; output=same application/MIME lookup
facts without priority semantics; comparator=update-desktop-database;
cost=desktop-file parse+MIME mapping+cache write+runtime file-read avoidance.`

Carrier: a finite real `.desktop`-file directory with a shared MIME type.
The freedesktop.org Desktop Entry specification's MIME-registration section,
accessed 2026-08-13, describes `update-desktop-database`, cache construction,
the post-install trigger, and explicitly says priority is external.  No current
source absence is asserted.

## Snapshot isolation

This file contains no disposition, claim pack, or shadow coordinate.  No shadow
file existed when this snapshot and the canonical files were created.
