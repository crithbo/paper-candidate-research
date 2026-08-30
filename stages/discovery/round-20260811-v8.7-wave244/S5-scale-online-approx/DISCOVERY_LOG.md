# Wave244 Versioned-Trace Native Constructor Breadth

Frozen controls matched: registry `5396B336DADB3F026382933E6ABCDF539344E2757393885D279E3AF510E86EB2`, plan `712F12542ACCEE7F93884EAE8ED65811D6A1AA5C1638A84ABD2E3A69DA21D0F5`. No experiment, benchmark, download, Stage/shared write or automation.

## Six screened families

| Family | Fixed stock-reader object / current union | Disposition |
|---|---|---|
| CRAM v3 | decoded alignment records and slice-based random access; container/compression headers must precede slice decode and index entries are per slice. | `UNION_ABSORBED`: container/slice construction and index semantics are fixed; generic container replanning lacks a distinct native legal witness. |
| BAM/CSI | exact coordinate-sorted alignment retrieval with BAI/CSI binning. | `UNION_ABSORBED`: append/index rebuild is existing format action; no bounded recourse constructor frozen. |
| netCDF-4 unlimited variables | exact array values/metadata under stock reader; unlimited dimensions, chunked storage and filters. | `UNION_ABSORBED`: chunking/filter choice is fixed before enddef and changes require output copy/rechunk; tuning is excluded. |
| netCDF classic records | exact record-variable arrays with one unlimited dimension. | `UNION_ABSORBED`: native append/record growth is current action, not new state transition. |
| HDF5 extendible chunked datasets | exact dataset values/chunks under stock reader. | `NOT_ADMITTED_UNFROZEN`: public versioned mutation trace/current complete action union not closed here. |
| FITS binary tables | exact astronomy table/array reader candidate. | `NOT_ADMITTED_UNFROZEN`: no current source-level incremental constructor and natural update trace closure. |

Three source-grounded deep reviews (CRAM, BAM/CSI, netCDF) reveal no union-external complete N2. Natural carriers are available in principle through GA4GH/HTS public alignment releases and public scientific netCDF collections, but a specific corpus/version/update trace was not frozen because no candidate action survived; this is not a scientific negative.

Full-cost contract for any future topic: stock decoded oracle; source commit/spec version and natural mutation trace; update/build/read CPU, peak RSS/temp, bytes, container/chunk/index rewrite, I/O, query latency and recourse. A <=72h killer rejects decoded mismatch, reader/format change, illegal transition, bound breach, union absorption, or no full-cost Pareto/guarantee gain.

Sources: [HTS specifications](https://samtools.github.io/hts-specs/), [CRAM v3](https://samtools.github.io/hts-specs/CRAMv3.pdf), [SAM/BAM](https://samtools.github.io/hts-specs/SAMv1.pdf), [netCDF data model](https://docs.unidata.ucar.edu/netcdf-c/current/netcdf_data_model.html), [netCDF variables](https://docs.unidata.ucar.edu/netcdf-c/4.9.1-rc1/group__variables.html), [netCDF formats](https://docs.unidata.ucar.edu/netcdf-c/current/file_format_specifications.html).

Decision: `COMPLETE_ZERO_PROPOSALS`; no scientific STOP.
