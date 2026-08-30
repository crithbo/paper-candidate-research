# Primary RQ

For a fixed Rust exported enum/struct, target, `repr(C)`/primitive representation, foreign C reader and all ABI-visible values, can a compiler construction exploit Rust-style niche or field-layout choices while retaining the same C ABI and foreign observations with a non-generic guarantee beyond current layout lowering?

The hypothetical contribution would be N1/compiler-tool only if it supplied a new representation whose foreign bytes, discriminant validity, size/alignment and call ABI are unchanged. The counterfactual is a distinct legal native layout under the same exported object—not selecting a different `repr` attribute.
