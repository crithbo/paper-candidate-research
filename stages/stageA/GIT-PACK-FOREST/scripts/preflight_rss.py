from __future__ import annotations

import argparse
import json
from pathlib import Path

from git_pack_lib import current_process_peak_rss_bytes, write_json


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", required=True, type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    allocation = bytearray(8 * 1024 * 1024)
    allocation[0] = 1
    peak = current_process_peak_rss_bytes()
    record = {
        "schema_version": "git-pack-forest-rss-preflight-v1",
        "collector": "Windows_GetProcessMemoryInfo_PeakWorkingSetSize",
        "units": "bytes",
        "deliberate_allocation_bytes": len(allocation),
        "driver_peak_rss_bytes": peak,
        "pass": peak > len(allocation),
    }
    write_json(root / "results" / "PRECLAIM_RSS_PREFLIGHT.json", record)
    print(json.dumps(record, indent=2, sort_keys=True))
    return 0 if record["pass"] else 2


if __name__ == "__main__":
    raise SystemExit(main())
