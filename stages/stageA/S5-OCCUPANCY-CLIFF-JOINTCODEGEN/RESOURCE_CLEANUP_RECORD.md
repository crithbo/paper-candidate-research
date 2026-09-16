# Inadmissible resource cleanup record

- Authorization: `UNBLOCK-AUTH-20260810-R1`
- Date: 2026-08-10 (Asia/Shanghai)
- Topic state: recoverable Stage A resource blocker; not STOP.
- Scientific revision consumed: false.
- Reason: both files are recorded short downloads, fail the frozen size/SHA contract, are explicitly prohibited from extraction or evidence use, and are unnecessary for the clean resource-only resume.
- Preserved: blocker reports, hashes, expected size/SHA, command logs, manifests, and resume contract.

Deleted targets after absolute-path validation:

| Target | Pre-delete bytes | Recorded SHA-256 |
|---|---:|---|
| `revision1/downloads/llvm-mingw-20260616-ucrt-x86_64.zip` | 187,480,016 | `A8155DB381A8DD945CD68FE009565A967D3BA5EC28442DDC7CE8D844F750AFCB` |
| `revision1-resume1/downloads/llvm-mingw-20260616-ucrt-x86_64.zip.part` | 133,887,242 | `4EC2B9F6DE4FADFD6864041FAEEFBC1DF2FA07508DDA80B850DBFF501F40CB4E` |

Total scheduled deletion: `321,367,258` bytes.

Recovery: not recoverable and not required. A clean exact asset must be verified in a new resume directory before any extraction.
