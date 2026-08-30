"""Download the preregistered exact-commit corpus and verify Git blob identities."""

from __future__ import annotations

import csv
import hashlib
import json
from pathlib import Path
from urllib.parse import quote
from urllib.request import Request, urlopen


COMMIT = "18b9e6f2a8c5a9518e588f59c2ba16ef7ef9d551"
ROOT = Path(__file__).resolve().parents[1]
SELECTION = ROOT / "inputs" / "corpus_selection.tsv"
OUT = ROOT / "inputs" / "natural_corpus"
MANIFEST = ROOT / "inputs" / "natural_corpus_manifest.json"


def git_blob(data: bytes) -> str:
    header = f"blob {len(data)}\0".encode("ascii")
    return hashlib.sha1(header + data).hexdigest()


OUT.mkdir(parents=True, exist_ok=True)
records = []
with SELECTION.open("r", encoding="utf-8", newline="") as handle:
    for row in csv.DictReader(handle, delimiter="\t"):
        path = row["path"]
        url = (
            "https://raw.githubusercontent.com/tensorflow/tflite-micro/"
            + COMMIT
            + "/"
            + quote(path, safe="/")
        )
        request = Request(url, headers={"User-Agent": "flatbuffers-stagea-corpus-freeze"})
        with urlopen(request, timeout=90) as response:
            data = response.read()
        expected_size = int(row["bytes"])
        observed_blob = git_blob(data)
        if len(data) != expected_size:
            raise RuntimeError(f"size mismatch for {path}: {len(data)} != {expected_size}")
        if observed_blob != row["git_blob_sha1"]:
            raise RuntimeError(f"blob mismatch for {path}: {observed_blob}")
        local_name = f"{len(records):02d}_{row['family']}_{Path(path).name}"
        local = OUT / local_name
        local.write_bytes(data)
        records.append(
            {
                "ordinal": len(records),
                "split": row["split"],
                "family": row["family"],
                "source_path": path,
                "source_url": url,
                "commit": COMMIT,
                "license": "Apache-2.0",
                "bytes": len(data),
                "git_blob_sha1": observed_blob,
                "sha256": hashlib.sha256(data).hexdigest().upper(),
                "local_path": str(local.relative_to(ROOT)).replace("\\", "/"),
            }
        )

payload = {
    "frozen_before_outcomes": True,
    "commit": COMMIT,
    "count": len(records),
    "train_count": sum(r["split"] == "train" for r in records),
    "heldout_count": sum(r["split"] == "heldout" for r in records),
    "records": records,
}
MANIFEST.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
print(json.dumps({"pass": True, "count": len(records), "bytes": sum(r["bytes"] for r in records)}))
