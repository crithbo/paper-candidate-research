from __future__ import annotations

import hashlib
import json
import pathlib
import re

from pypdf import PdfReader


ROOT = pathlib.Path(__file__).resolve().parents[1]

INPUTS = {
    "sereno": {
        "path": ROOT / "sources" / "osdi26-xin.pdf",
        "patterns": [
            "nsp_noc",
            "SLAVE_EBI1",
            "aggregate metrics",
            "opaque binaries",
            "5 min traces",
            "Perfetto",
            "per-operator memory behavior",
            "fine-grained traffic-shaping hooks",
        ],
    },
    "xsched": {
        "path": ROOT / "sources" / "osdi25-shen-weihang.pdf",
        "patterns": [
            "preemptible command queue",
            "XQueue",
            "request-level",
            "NoC",
            "DRAM",
            "command submission",
        ],
    },
    "arm_axi": {
        "path": ROOT / "sources" / "IHI0022H_amba_axi_protocol_spec.pdf",
        "patterns": [
            "two 4-bit QoS identifiers",
            "does not specify the exact use",
            "system-level understanding",
            "AWQOS",
            "ARQOS",
        ],
    },
    "layerweaver_plus": {
        "path": ROOT / "sources" / "layerweaver-plus.pdf",
        "patterns": [
            "layer-wise DNN scheduler",
            "incoming user requests",
            "QoS constraints",
            "request-level",
            "NoC",
            "DRAM",
        ],
    },
}


def compact(text: str) -> str:
    return re.sub(r"\s+", " ", text).strip()


def main() -> None:
    result: dict[str, object] = {"schema_version": "pdf-text-audit-v1", "documents": {}}
    for doc_id, spec in INPUTS.items():
        reader = PdfReader(spec["path"])
        pages = [page.extract_text() or "" for page in reader.pages]
        full_text = "\n\f\n".join(pages)
        hits: dict[str, list[dict[str, object]]] = {}
        for pattern in spec["patterns"]:
            pattern_hits = []
            lower_pattern = pattern.lower()
            for page_index, page_text in enumerate(pages):
                lower_text = page_text.lower()
                start = 0
                while True:
                    index = lower_text.find(lower_pattern, start)
                    if index < 0:
                        break
                    lo = max(0, index - 180)
                    hi = min(len(page_text), index + len(pattern) + 260)
                    pattern_hits.append(
                        {
                            "pdf_page_index_zero_based": page_index,
                            "snippet": compact(page_text[lo:hi]),
                        }
                    )
                    start = index + len(pattern)
            hits[pattern] = pattern_hits
        result["documents"][doc_id] = {
            "file": pathlib.Path(spec["path"]).relative_to(ROOT).as_posix(),
            "page_count": len(pages),
            "extracted_utf8_sha256": hashlib.sha256(full_text.encode("utf-8")).hexdigest().upper(),
            "patterns": hits,
        }
    out = ROOT / "sources" / "PDF_TEXT_AUDIT.json"
    out.write_text(json.dumps(result, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(json.dumps({"documents": len(INPUTS), "output": out.relative_to(ROOT).as_posix()}))


if __name__ == "__main__":
    main()
