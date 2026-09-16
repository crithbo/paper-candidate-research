"""Print authoritative GitHub release metadata for frozen binary assets."""

import json
from urllib.request import Request, urlopen


RELEASES = [
    ("google/flatbuffers", "v25.12.19", {"Windows.flatc.binary.zip"}),
    (
        "mstorsjo/llvm-mingw",
        "20260616",
        {"llvm-mingw-20260616-ucrt-x86_64.zip"},
    ),
]


for repository, tag, selected_names in RELEASES:
    url = f"https://api.github.com/repos/{repository}/releases/tags/{tag}"
    request = Request(
        url,
        headers={
            "Accept": "application/vnd.github+json",
            "User-Agent": "stagea-fidelity-preflight",
            "X-GitHub-Api-Version": "2022-11-28",
        },
    )
    with urlopen(request, timeout=30) as response:
        release = json.load(response)
    print(
        json.dumps(
            {
                "repository": repository,
                "tag": release["tag_name"],
                "target_commitish": release["target_commitish"],
                "published_at": release["published_at"],
                "html_url": release["html_url"],
                "assets": [
                    {
                        "name": asset["name"],
                        "size": asset["size"],
                        "digest": asset.get("digest"),
                        "browser_download_url": asset["browser_download_url"],
                    }
                    for asset in release["assets"]
                    if asset["name"] in selected_names
                ],
            },
            sort_keys=True,
        )
    )
