# Divergence seed pool

Seeds are non-evidentiary prompts and do not enter the opportunity-family denominator.

| Seed | Engine | Boundary prompt | Selection |
|---|---|---|---|
| S01 | producer-consumer inversion | Can a consumer-owned C buffer view release work be arranged without changing exporter validity? | Selected |
| S02 | constraint manipulation | Can resize/mutability and `PyBuffer_Release` be jointly scheduled under the same C-API endpoint? | Merged into S01 |
| S03 | representation seam | Can a `memoryview` preserve a buffer while its producer releases storage earlier? | Merged into S01 |
| S04 | adjacent possible | Can external-buffer teardown replace Python’s release pairing? | Not selected: likely wrapper/object change |
| S05 | abstraction ladder | Can strides/format normalization be coupled to ownership release? | Not selected: serializer-like, not the endpoint |
| S06 | cross-layer contrast | Can interpreter-local reference accounting alter buffer-consumer lifetime? | Not selected: generic lifetime accounting |

S01 was selected because it has a precise public C-API object, a native oracle, and a falsifiable ownership seam.
