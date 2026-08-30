# Source72 ordinary source screen

## Source roles

| Role | Official source | Observation |
|---|---|---|
| ANCHOR/CURRENT | Hadoop current ShuffleHandler API | current action surface includes buffer, connection, memory/cache and related configuration fields. |
| CURRENT/CONTRARY | Hadoop Pluggable Shuffle and Pluggable Sort | a custom sort needs MapOutputCollector and optionally ShuffleConsumerPlugin implementation classes. |
| HISTORY | bounded registry lookup | no Hadoop/MapReduce exact five-field identity found; NO_MATCH is not novelty evidence. |

URLs:

- https://hadoop.apache.org/docs/current/hadoop-mapreduce-client/hadoop-mapreduce-client-shuffle/apidocs/org/apache/hadoop/mapred/ShuffleHandler.html
- https://hadoop.apache.org/docs/r2.10.2/hadoop-mapreduce-client/hadoop-mapreduce-client-core/PluggableShuffleAndPluggableSort.html

## Decision

With stock output semantics fixed, the proposed online merge decision has three forms:

1. selecting memory/spill/merge settings: forbidden controller/configuration;
2. writing a MapOutputCollector or ShuffleConsumerPlugin: a paper-owned complete constructor;
3. applying generic external merge or online scheduling: a generic kernel, not target-specific.

No union-external stock Hadoop atomic action was named. S72-01 is therefore EXCLUDED_BEFORE_RAW__CONFIG_PLUGIN_OR_GENERIC_KERNEL. This is a structural admission decision, not a claim of current absence, global non-novelty, or a resource/implementation result.
