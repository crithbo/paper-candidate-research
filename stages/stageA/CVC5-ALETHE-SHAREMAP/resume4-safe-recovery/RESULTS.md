# Results — CVC5 resume4 safe recovery

| Observation | Value |
|---|---|
| Resource route | Official portable MSYS2 MINGW64 |
| GCC | 16.2.0-3, SHA-256 `AB37C11763FDCB3BF6F809B5D033A31EBEB77F10BA5934C72FA37287EE56144F` |
| GNU ld | 2.47 |
| `libgcc_eh.a` | 11,726 B, `9F2A47DD4D2530F54A771139F532D4560223630173F5FF4ADABD26A2A37CF46E` |
| `libgcc.a` | 3,030,766 B, `2FB177D002383F802852CE7506096AF5FF9EA22836F0D31D51849DE485214ED2` |
| C link smoke | PASS, 0.751 s, executable `B186DE9D296E066A1454E01D368E0D41E00DD7FA9318B6E31EDD7568E52AAB30` |
| Rust 1.72 GNU link smoke | PASS, 0.724 s, executable `F1736CA04441E51DD9382D4E2805F9592AA514DEB74B0FD563461732F455433C` |
| Carcara archive | 1,382,442 B, `FCD42C4ED6501B690E3F363E980B2B1403A1A7C9DF262FECC0A4C831B8960F30` |
| Source parity | 72/72 paths and content hashes exact |
| `Cargo.lock` after fetch/build | `0E9C953C2C1B184511E2DFDF19D4BB7C35A6BE55140BC1A3D77179411D7C7378` |
| Cargo fetch locked | PASS, 71.716 s |
| Clean locked build | FAIL, exit 101, 26.192 s |
| Build failure | POSIX shell consumed Windows absolute `CC` backslashes; command-not-found 127 |
| `carcara.exe` | 0 |
| Resource root | 33,405 files; 1,533,870,899 B |
| Resource ready | false |
| Claim-bearing | false |
| Scientific revision | false |
| Stage B | false |

Build log: `resources/logs/carcara-clean-build.combined.log`, SHA-256 `8A2AB4E57525CD096D0F8ED8101543740AA80AD2B42B9904CB99BE6479626E22`.

Native configure log: `resources/build/carcara-target/release/build/gmp-mpfr-sys-7107cdddf71b20a3/out/build/gmp-build/config.log`, SHA-256 `776222AA6522513B840493F7A1902D2C4C5BADB985E1B53BABC070B9338BD11E`.

