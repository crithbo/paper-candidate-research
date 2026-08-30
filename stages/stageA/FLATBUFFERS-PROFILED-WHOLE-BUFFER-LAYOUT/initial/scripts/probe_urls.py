"""Read-only HTTP range probe for preregistered official acquisition URLs."""

from urllib.request import Request, urlopen


URLS = [
    "https://github.com/google/flatbuffers/archive/7e163021e59cca4f8e1e35a7c828b5c6b7915953.zip",
    "https://github.com/google/flatbuffers/releases/download/v25.12.19/Windows.flatc.binary.zip",
    "https://github.com/mstorsjo/llvm-mingw/releases/download/20260616/llvm-mingw-20260616-ucrt-x86_64.zip",
]


for url in URLS:
    request = Request(
        url,
        headers={"Range": "bytes=0-0", "User-Agent": "stagea-fidelity-preflight"},
    )
    with urlopen(request, timeout=30) as response:
        print(
            response.status,
            response.geturl(),
            response.headers.get("Content-Length"),
            response.headers.get("Content-Range"),
        )
