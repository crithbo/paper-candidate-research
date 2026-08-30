"""Inspect the pinned official TFLite Micro tree for candidate model files."""

import json
from urllib.request import Request, urlopen


COMMIT = "18b9e6f2a8c5a9518e588f59c2ba16ef7ef9d551"
url = f"https://api.github.com/repos/tensorflow/tflite-micro/git/trees/{COMMIT}?recursive=1"
request = Request(
    url,
    headers={
        "Accept": "application/vnd.github+json",
        "User-Agent": "flatbuffers-stagea-corpus-audit",
        "X-GitHub-Api-Version": "2022-11-28",
    },
)
with urlopen(request, timeout=60) as response:
    payload = json.load(response)

entries = payload["tree"]
models = sorted(
    (entry for entry in entries if entry["path"].lower().endswith(".tflite")),
    key=lambda entry: (entry.get("size", 0), entry["path"]),
)
print(f"truncated={payload.get('truncated')} total_entries={len(entries)} models={len(models)}")
for entry in models:
    print(f"{entry.get('size', 0)}\t{entry['sha']}\t{entry['path']}")
print("--SCHEMA_AND_LICENSE--")
for entry in entries:
    path = entry["path"]
    lower = path.lower()
    if lower in {"license", "license.txt", "apache-2.0.txt"} or lower.endswith(
        ("schema.fbs", "schema_generated.h")
    ):
        print(f"{entry.get('size', 0)}\t{entry['sha']}\t{path}")
