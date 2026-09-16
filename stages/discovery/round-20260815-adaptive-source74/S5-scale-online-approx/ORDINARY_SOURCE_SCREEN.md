# Source74 ordinary source screen

| Role | Official source | Decision |
|---|---|---|
| ANCHOR/CURRENT | mypy current configuration and command-line docs | incremental cache is standard; cache-fine-grained supports daemon data; flags cover cache directory/version/format choices. |
| CURRENT/CONTRARY | mypy daemon documentation | daemon keeps previous program state and uses finer-grained dependency tracking to reduce recheck work. |
| CONTRARY | mypy remote-cache documentation | remote cache requires CI/build integration, so it is not a native constructor. |
| HISTORY | bounded registry search | no exact mypy identity found; NO_MATCH is not novelty evidence. |

URLs:

- https://mypy.readthedocs.io/en/stable/config_file.html
- https://mypy.readthedocs.io/en/stable/mypy_daemon.html
- https://mypy.readthedocs.io/en/latest/additional_features.html

Current union covers the proposed in-process online recheck action. Remaining choices are cache configuration/branch selection, external CI integration, or generic graph recomputation. Any change to diagnostic or import semantics violates the same-object contract. Disposition: EXCLUDED_BEFORE_RAW__CURRENT_UNION_OR_GENERIC_KERNEL.
