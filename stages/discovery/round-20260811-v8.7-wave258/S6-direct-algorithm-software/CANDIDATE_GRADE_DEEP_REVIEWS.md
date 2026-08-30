# Candidate-grade depth red-team

Official current documentation describes a persistent crash-recoverable hash AM, bucket/overflow pages, VACUUM squeeze/recycling and an exactly-one mapped bucket split per expansion. Current upstream `src/include/access/hash.h` corroborates coupled metapage/overflow/split-cleanup state and exposes build, insert, squeeze and vacuum paths.

The joint planner fails before novelty: different logical split selection changes the frozen mapping/WAL object; mapped split selection is absorbed; remaining page packing/tuning is excluded. Linear and extensible hashing are the fair direct subtractor family. Finite falsifier: source-pin, construct recovery-valid twin indexes, replay lookup/scan/recovery, and enumerate metapage-derived split. Status: `STRUCTURAL_DROP`.
