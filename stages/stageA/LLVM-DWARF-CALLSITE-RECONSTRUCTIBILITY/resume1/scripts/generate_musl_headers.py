#!/usr/bin/env python3
"""Reproduce musl's mkalltypes.sed build step without system installation."""

import re
import shutil
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "resources" / "musl-src" / "musl-1.2.5"
OUT = ROOT / "resources" / "musl-build" / "include" / "bits"


def convert(line: str) -> str:
    m = re.match(r"^TYPEDEF (.*) ([^ ]*);$", line)
    if m:
        body, name = m.groups()
        return f"#if defined(__NEED_{name}) && !defined(__DEFINED_{name})\ntypedef {body} {name};\n#define __DEFINED_{name}\n#endif"
    m = re.match(r"^STRUCT * ([^ ]*) (.*);$", line)
    if m:
        name, body = m.groups()
        return f"#if defined(__NEED_struct_{name}) && !defined(__DEFINED_struct_{name})\nstruct {name} {body};\n#define __DEFINED_struct_{name}\n#endif"
    m = re.match(r"^UNION * ([^ ]*) (.*);$", line)
    if m:
        name, body = m.groups()
        return f"#if defined(__NEED_union_{name}) && !defined(__DEFINED_union_{name})\nunion {name} {body};\n#define __DEFINED_union_{name}\n#endif"
    return line


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    inputs = [SRC / "arch" / "x86_64" / "bits" / "alltypes.h.in", SRC / "include" / "alltypes.h.in"]
    lines = []
    for path in inputs:
        lines.extend(path.read_text(encoding="utf-8").splitlines())
    (OUT / "alltypes.h").write_text("\n".join(convert(line) for line in lines) + "\n", encoding="utf-8")
    shutil.copyfile(SRC / "arch" / "x86_64" / "bits" / "syscall.h.in", OUT / "syscall.h")


if __name__ == "__main__":
    main()
