# Current upstream audit

## Pin and provenance

`openjdk/jdk` tag `jdk-24+36` resolves, through the first counted official request, to `6705a9255d28f351950e7fbca9d05e73942a4e27`.  All retained source and test files use that immutable commit in their URL.  Official retained routes and SHA-256 values are listed in `RESOURCE_INVENTORY.yaml`.

## Action/configuration union recovered from the bounded routes

| Surface | Observed current stock action or constraint | Retained evidence |
|---|---|---|
| static/base and top layering | `SharedArchiveFile` supports one static archive or a base/top pair and rejects invalid combinations while dumping | `07-cdsConfig.cpp`, lines 165–245 |
| dynamic creation | dynamic builder constructs a dynamic `FileMapInfo`, copies/serializes dynamic archivable state, and writes the archive | `05-dynamicArchive.cpp`, lines 96–176 and 342–357; `04-archiveBuilder.cpp`, lines 994–1009 |
| exit-triggered dump | `ArchiveClassesAtExit` is a named dynamic-dump route with explicit option checks | `04-archiveBuilder.cpp`, lines 1144–1155; `07-cdsConfig.cpp`, lines 152–160 and 459–478 |
| automatic creation | `AutoCreateSharedArchive` can redirect a missing named archive to `ArchiveClassesAtExit`, subject to constraints | `07-cdsConfig.cpp`, lines 198–210 and 472–478 |
| reader acceptance/fallback | path, base-name, header and region CRC checks determine archive usability and map failure to archive-loading failure/disabled sharing | `06-filemap.cpp`, lines 407–459, 811–1070, 1196–1315; `05-dynamicArchive.cpp`, lines 477–556 |
| fixed acceptance witness | stock test creates a named archive then loads it with the normal CDS test utility | `10-SharedArchiveFile.java`, complete file |

## Same-object reading

The observed plans keep the stock CDS file/reader contract; they are not an external compression or cache-only proxy.  A base-only archive and a base-plus-dynamic archive form the minimum stock plan contrast.  The current source additionally shows rejection/fallback paths, so any comparison must account for compatibility validation and non-use of an invalid archive rather than treating archive bytes alone as the endpoint.

## Bounded conclusion

Current stock functionality is a strong direct subtractor for archive construction, layering, validation and automatic creation.  This bounded source packet does not specify a candidate action whose legality/guarantee can be compared exhaustively against that catalog.  It therefore closes the current-union/carrier portion but does not close the union-external-action or finite-guarantee portions.  No absence, novelty, direct-paper collision, or scientific-quality inference is made from the bounded routes.
