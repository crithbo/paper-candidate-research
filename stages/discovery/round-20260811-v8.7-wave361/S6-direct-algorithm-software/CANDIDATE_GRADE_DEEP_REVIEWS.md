# QEMU TCG closure

Fixed object: guest binary/input and ISA-visible execution semantics; stock differential execution is the oracle. Official upstream: https://github.com/qemu/qemu. A complete closure must pin TB generation/translation/optimization/chaining/invalidation and all controls, then show two stock-equivalent legal TB artifacts differing in a named native action outside that union.

This review did not establish such a source-complete action union or witness. A proposed mechanism presently reduces to generic compiler scheduling, trace/superblock control, or configuration selection, all excluded. Natural route if later closed: public guest binaries/tests; full cost: translation/run CPU/RSS/temp/TB bytes and differential execution; killer: beat full current union at identical ISA behavior. `NOT_ADMITTED_UNFROZEN`; no target-specific exact/FPT/certified guarantee or brief.
