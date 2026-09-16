# Current upstream reality check

## First-party evidence and pin

| Evidence | What it establishes | Limit |
|---|---|---|
| [WebKit main JavaScriptCore CLI source](https://github.com/WebKit/WebKit/blob/main/Source/JavaScriptCore/jsc.cpp), pin `d8e1779cc82b74f6663e2014b4e499238c553694` | Current JSC CLI source includes bytecode-cache error handling and exposes JSC-option inspection machinery | It is not a complete cache-format/action inventory. |
| [JSC bytecode directory](https://github.com/WebKit/WebKit/tree/main/Source/JavaScriptCore/bytecode), same pin | Current first-party source contains the bytecode generation/representation subsystem | A directory listing does not prove the complete serialization, invalidation, or embedding/API union. |
| [WebKit bytecode-format report](https://webkit.org/blog/9329/a-new-bytecode-format-for-javascriptcore/) | The format was designed to be compact and cacheable; the bytecode is a persistent source of truth with memory/cache tradeoffs | It describes the 2019 design, not present absence or a 2026 performance cliff. |
| [WebKit speculation report](https://webkit.org/blog/10308/speculation-in-javascriptcore/) | The same bytecode stream serves interpreter, cache, and compiler tiers | It does not establish a natural, versioned phase transition. |

## Attempted complete union

The fair same-information union must include, at minimum: source parse and bytecode generation; bytecode/cache serialization and validation; cache lookup/read/write and error/recovery paths; invalidation/version/URL-or-source identity; stock interpreter and compiler-tier consumption; default and non-default options exposed by the pinned executable or embedding API; build/platform feature gates; warm/cold cache state.

The inspected first-party material confirms the relevant subsystems but does not close that full union at the pinned revision. In particular, the exact public/native cache-serialization API, all build/platform gates, and all default/non-default switches could not be enumerated without a source-level audit of the relevant API and cache implementation at the pin. This review therefore makes no current-absence claim and treats the union as unclosed.

## Direct collision

No direct first-party paper or source was found that establishes a union-external whole cached-bytecode representation constructor for this exact object. This is not evidence that none exists; it is an `UNFROZEN` collision result.
