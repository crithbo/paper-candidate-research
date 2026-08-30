# SOURCE_COLLISION_MATRIX

| Family | Official current source/docs | Native oracle / collision result |
|---|---|---|
| seccomp | [kernel seccomp docs](https://docs.kernel.org/userspace-api/seccomp_filter.html) specify BPF input, accepted returns, layered precedence, install flags and notification behavior. | Kernel BPF validation/evaluation; no union-external whole action. |
| Landlock | [kernel Landlock docs](https://docs.kernel.org/userspace-api/landlock.html) specify ABI negotiation, ruleset construction, rights, `restrict_self`, inheritance and samples. | Kernel domain/access result; compatibility configuration absorbed. |
| OPA-Wasm | [OPA Wasm docs](https://www.openpolicyagent.org/docs/wasm) define compiler artifact/evaluator relation. | Stock OPA Wasm evaluator; action gap not frozen. |
| SELinux | [SELinux upstream](https://github.com/SELinuxProject/selinux). | Source present but pinned full policy-binary/current configuration union not closed. |
| Component Model | [official component specification](https://component-model.bytecodealliance.org/). | Validator/runtime interface, not a fixed policy-enforcement object. |
| Kubernetes | [official admission policy docs](https://kubernetes.io/docs/reference/access-authn-authz/validating-admission-policy/). | API-server admission pipeline; policy/binding configuration controller. |

Latest-collision result is bounded to the cited first-party surfaces and never treated as a generalized absence conclusion.
