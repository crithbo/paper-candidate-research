# Source62 ordinary current-source screen

## Source roles

| Role | First-party source | Frozen result |
|---|---|---|
| ANCHOR/CURRENT | https://www.typescriptlang.org/tsconfig/incremental.html | incremental stores last-compilation project-graph information as tsbuildinfo; tsBuildInfoFile controls location. |
| CURRENT/CONTRARY | https://www.typescriptlang.org/docs/handbook/project-references | tsc -b orders project references, detects up-to-date projects, builds out-of-date projects, and offers clean, force, and watch actions. |
| current source/flag locus | https://github.com/microsoft/TypeScript/blob/main/src/compiler/commandLineParser.ts | current options include incremental, tsBuildInfoFile, composite, and assumeChangesOnlyAffectDirectDependencies, with their default values and build-info effects. |
| contrary source | https://github.com/microsoft/TypeScript/issues/36648 | maintainer explanation: TypeScript intentionally does not pay the extra work to detect output files modified after a build; a clean script should delete build info as well. |

No artifact was downloaded or persisted. Response bytes and wall time are unavailable and not estimated.

## Raw/deep decision

The anchor establishes a real same-object state divergence: unchanged source/build-info can coexist with a missing emitted output, and stock incremental mode intentionally assumes external output modifications were deliberate. However, the only candidate repair action that can presently be named is a generic output-manifest/liveness check followed by re-emission or rebuild. Neither the official documentation nor the bounded current source locus identifies a TypeScript-specific action, formal recourse/complexity guarantee, or natural versioned carrier that would make this more than an incremental-build correctness/maintenance feature.

Therefore S62-RQ-01 remains LOCATOR_ONLY. It is not a direct-absorption STOP: stock clean is an available full-rebuild baseline, not a same-action repair comparator. It fails admission because the union-external action is still a generic shell and there is no frozen finite target-specific guarantee route. A further queue would not cure that conceptual deficiency, so none is created.
