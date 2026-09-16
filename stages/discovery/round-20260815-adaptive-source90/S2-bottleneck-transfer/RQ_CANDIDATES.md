# RQs

For a fixed Swift module, ABI, target and observable ownership/destruction behavior, can a target-specific N2 constructor jointly choose legal SIL ownership forwarding/ARC lifetime boundaries and object-layout/access placement to improve retain/release traffic, code size and cache/full runtime cost with a certified Pareto/FPT bound? This must preserve the stock ABI and object lifetime; pass flags, manual refactoring, generic packing or ARC controller do not qualify. The alternate RQ is the same family under an ownership-interference parameter.
