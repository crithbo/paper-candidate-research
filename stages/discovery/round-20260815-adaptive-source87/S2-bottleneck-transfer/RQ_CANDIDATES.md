# Same-object RQs

Official GraalVM documentation says build-time class initialization stores static state in the executable, reducing runtime initialization/check work; it also records restrictions on objects allowed in the image heap. The primary RQ is whether, for a fixed closed-world Java application and identical observable initialization semantics, a target-specific constructor can **jointly** choose only proven-safe build-time initialization classes and physical image-heap placement, with a certified image-size/cold-start frontier against stock Native Image analysis and layout.

The alternate RQ asks whether safe-init proof boundaries and heap-object locality admit a fixed-parameter or Pareto guarantee under the same executable/semantics. Both are one family. Flags that merely force class initialization, manual metadata configuration, postprocessing, or changed initialization semantics are excluded.
