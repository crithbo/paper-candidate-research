# Raw gate outcome

## TREE-SITTER-EDIT-RECOURSE

- Committed object/endpoint: Tree-sitter syntax tree for a fixed grammar and the stock parse-tree semantics after source edits.
- Carrier/current locus: official Tree-sitter upstream API documents passing an edited old tree so unchanged portions are reused; official grammar organization provides public grammar repositories.
- Minimum falsifier: stock API already expresses the proposed complete same-object reuse action, or the guarantee reduces to a normal edit/configuration path.
- Result: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_ACTION_ABSORPTION`.

The current API explicitly provides `ts_tree_edit` plus reuse of unchanged old-tree portions during parse. The selected RQ therefore has no union-external whole action as framed; no missing-version/source/cost/witness condition caused this result. No absence claim, implementation inference, or proposal is made.
