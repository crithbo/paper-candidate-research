from __future__ import annotations

import hashlib
import json
import pathlib
import ssl
import time
import urllib.request


ROOT = pathlib.Path(__file__).resolve().parents[1]
OUT = ROOT / "sources"
OUT.mkdir(parents=True, exist_ok=True)

ASSETS = [
    {
        "id": "sereno_osdi26_pdf",
        "url": "https://www.usenix.org/system/files/osdi26-xin.pdf",
        "file": "osdi26-xin.pdf",
        "minimum_bytes": 100_000,
        "content_prefix": b"%PDF",
    },
    {
        "id": "xsched_osdi25_pdf",
        "url": "https://www.usenix.org/system/files/osdi25-shen-weihang.pdf",
        "file": "osdi25-shen-weihang.pdf",
        "minimum_bytes": 100_000,
        "content_prefix": b"%PDF",
    },
    {
        "id": "arm_amba_axi_ace_ihi0022h_pdf",
        "url": "https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/IHI0022H_amba_axi_protocol_spec.pdf",
        "file": "IHI0022H_amba_axi_protocol_spec.pdf",
        "minimum_bytes": 100_000,
        "content_prefix": b"%PDF",
    },
    {
        "id": "layerweaver_plus_pdf",
        "url": "https://www.jstage.jst.go.jp/article/transinf/E105.D/2/E105.D_2021EDL8084/_pdf",
        "file": "layerweaver-plus.pdf",
        "minimum_bytes": 100_000,
        "content_prefix": b"%PDF",
    },
    {
        "id": "amd_versal_qos_html",
        "url": "https://docs.amd.com/r/en-US/am011-versal-acap-trm/Quality-of-Service",
        "file": "amd-versal-qos.html",
        "minimum_bytes": 1_000,
        "content_prefix": b"",
    },
]


def fetch(url: str) -> tuple[bytes, dict[str, str]]:
    req = urllib.request.Request(
        url,
        headers={
            "User-Agent": "stagea-s1-primary-source-audit/1.0",
            "Accept": "application/pdf,text/html,application/json,text/plain,*/*",
        },
    )
    with urllib.request.urlopen(req, timeout=60, context=ssl.create_default_context()) as response:
        body = response.read()
        headers = {key.lower(): value for key, value in response.headers.items()}
        return body, headers


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def main() -> None:
    records: list[dict[str, object]] = []
    for asset in ASSETS:
        started = time.time()
        body, headers = fetch(str(asset["url"]))
        prefix = bytes(asset["content_prefix"])
        if len(body) < int(asset["minimum_bytes"]):
            raise RuntimeError(f"{asset['id']}: short body {len(body)}")
        if prefix and not body.startswith(prefix):
            raise RuntimeError(f"{asset['id']}: content prefix mismatch")
        path = OUT / str(asset["file"])
        path.write_bytes(body)
        records.append(
            {
                "id": asset["id"],
                "url": asset["url"],
                "file": path.relative_to(ROOT).as_posix(),
                "bytes": len(body),
                "sha256": sha256(body),
                "content_type": headers.get("content-type"),
                "etag": headers.get("etag"),
                "last_modified": headers.get("last-modified"),
                "elapsed_seconds": round(time.time() - started, 6),
            }
        )

    github_meta, github_headers = fetch(
        "https://api.github.com/repos/XpuOS/xsched-artifacts/commits/main"
    )
    github_obj = json.loads(github_meta.decode("utf-8"))
    commit = str(github_obj["sha"])
    meta_path = OUT / "xsched-artifacts-main-commit.json"
    meta_path.write_bytes(github_meta)
    records.append(
        {
            "id": "xsched_artifact_commit_metadata",
            "url": "https://api.github.com/repos/XpuOS/xsched-artifacts/commits/main",
            "file": meta_path.relative_to(ROOT).as_posix(),
            "bytes": len(github_meta),
            "sha256": sha256(github_meta),
            "content_type": github_headers.get("content-type"),
            "resolved_commit": commit,
        }
    )

    readme_url = f"https://raw.githubusercontent.com/XpuOS/xsched-artifacts/{commit}/README.md"
    readme, readme_headers = fetch(readme_url)
    readme_path = OUT / "xsched-artifacts-README.md"
    readme_path.write_bytes(readme)
    records.append(
        {
            "id": "xsched_artifact_readme",
            "url": readme_url,
            "file": readme_path.relative_to(ROOT).as_posix(),
            "bytes": len(readme),
            "sha256": sha256(readme),
            "content_type": readme_headers.get("content-type"),
            "resolved_commit": commit,
        }
    )

    manifest = {
        "schema_version": "s1-primary-source-acquisition-v1",
        "records": records,
    }
    (OUT / "ACQUISITION_MANIFEST.json").write_text(
        json.dumps(manifest, indent=2, ensure_ascii=False) + "\n", encoding="utf-8"
    )
    print(json.dumps({"assets": len(records), "xsched_commit": commit}))


if __name__ == "__main__":
    main()
