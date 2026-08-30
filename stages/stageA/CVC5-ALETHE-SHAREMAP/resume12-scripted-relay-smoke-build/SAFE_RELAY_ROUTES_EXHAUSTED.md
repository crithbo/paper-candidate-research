# Safe Relay Routes Exhausted

The assignment's final authorized sequence has been consumed without obtaining a Carcara executable:

1. The corrected relay from resume11 was revalidated and copied exactly.
2. The hash-frozen script was passed directly to frozen `sh.exe` exactly once. Relay compile/link and loader smoke passed.
3. Frozen Carcara source (`72/72`) and registry cache (`8,647` files; exact path/size match) were localized without network access.
4. The only permitted clean locked offline Carcara build exited `101` in `gmp-mpfr-sys v1.6.1`.

The build script first failed to create its symlink and selected its documented copy fallback. It then panicked while attempting to execute `cp -R`. The emitted error provides no lower-level OS error code, so no more specific cause is inferred.

No retry, PATH change, alternate tool, dependency/feature/version change, version/checker smoke, preclaim, scientific run, or Stage B action followed. Under the assignment decision rule, all authorized safe relay routes are exhausted.

