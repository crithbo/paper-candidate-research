# Source57 S5 ordinary source screen

Date: 2026-08-15. Bounded official/primary source review only. No candidate
build, benchmark, installation, download, or experiment occurred.

## Identity accountability

The five-field comparison freezes object, action/estimand, claim endpoint,
semantic guarantee, and full-cost boundary.

- Source55 MIPS-FCSR CQ01 is assigned to a separate closure task and was not
  read, modified, or reopened.
- Source53 records the exact Bazel incremental-buildgraph recourse identity as
  current-union/generic-cache structural drop. No external evidence delta is
  available, so Bazel is EXCLUDED_BEFORE_RAW.
- No exact historical five-field record was found for the GNU make or Ninja
  RQs. This is NO_EXACT_MATCH_FOUND__NOT_A_NOVELTY_OR_ABSENCE_CLAIM.
- Build-tool or dependency-graph similarity is RELATED_ONLY, never an
  exclusion.

## S57-01 GNU make remake/restart

The official manual specifies that make reads its makefiles, considers them as
goal targets, rebuilds out-of-date makefiles where rules apply, and starts with
a clean slate and rereads makefiles if one changes. It also defines rules as
the target/prerequisite/recipe relationship and determines necessary
recompilations from that database.

The candidate's only identified decision is whether and when to avoid or
perform the native re-read/restart/rebuild. Choosing that decision is graph
scheduling/controller behavior. Mutating the makefile database without the
documented re-read semantics changes prerequisite/rule interpretation or
diagnostic behavior. No target-specific atomic constructor or fixed
approximation/recourse guarantee was isolated.

Disposition: STRUCTURAL_DROP__CURRENT_REMAKE_RESTART_UNION_OR_SCHEDULER.

## S57-02 Ninja dynamic dependencies

The current Ninja manual specifies dyndep bindings, a required one-to-one
correspondence between dyndep and build statements, and the loader action that
adds implicit inputs/outputs so building proceeds as if the information had
been present in the original graph. The documentation gives first-run
dependency discovery as its intended semantics.

The same-object graph extension is therefore already a native operation.
Reordering its invocation, caching the dyndep file, or choosing how a generator
emits it is a controller/generator wrapper. A different dynamic dependency
language or relaxed correspondence changes the fixed graph/diagnostic
contract. No union-external native action survives.

Disposition: STRUCTURAL_DROP__CURRENT_DYNDEP_GRAPH_EXTENSION_UNION.

## Source roles

| role | official source | use |
|---|---|---|
| ANCHOR/CURRENT/CONTRARY | GNU Make manual and Remaking Makefiles node | current native remake, restart and rule semantics |
| ANCHOR/CURRENT/CONTRARY | Ninja manual dynamic-dependencies section | dyndep contract and graph extension action |
| identity contrary | Bazel Skyframe official documentation plus Source53 registry identity | exact historical containment only; no rescreening |

URLs:

- https://www.gnu.org/s/make/manual/html_node/Remaking-Makefiles.html
- https://www.gnu.org/software/make/manual/html_node/Rules.html
- https://ninja-build.org/manual.html
- https://bazel.googlesource.com/bazel/+/3b9ed6e9d3570a0c67e0d59e65b3785bbc1fad99/site/en/reference/skyframe.md

