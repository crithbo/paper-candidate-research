# Exact public anchor

| Field | Value |
|---|---|
| Signature | `JAVASCRIPTCORE__FIXED_ECMASCRIPT_PROGRAM__BYTECODE_ENCODING_OSR_STATE_MAP_JOINT_CONSTRUCTOR__RESIDENCY_TIER_TRANSITION_FULL_COST` |
| Official sources | WebKit JSC deep dive: https://github.com/webkit/Documentation/blob/main/docs/Deep%20Dive/JSC/JavaScriptCore.md ; bytecode-format article: https://webkit.org/blog/9329/a-new-bytecode-format-for-javascriptcore/ |
| Object/oracle | Fixed ECMAScript program/input/engine target; stock JSC language result and legal tier/OSR behavior |
| Current union | LLInt, baseline JIT, DFG/FTL, bytecode and profile/OSR machinery plus all relevant options |
| Carrier | One version-pinned official JSC regression/test262 program selected from a single resolved WebKit source revision |
| Full cost | bytecode/metadata bytes, compile/tier CPU/RSS, profile/OSR transition cost, steady runtime and code-cache footprint |

The anchor does not imply an unimplemented joint constructor.
