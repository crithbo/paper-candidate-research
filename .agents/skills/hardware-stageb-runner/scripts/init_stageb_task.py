#!/usr/bin/env python3
"""Initialize an exact, isolated Stage B assignment directory without overwrites."""

from __future__ import annotations

import argparse
import datetime as dt
import json
import re
from pathlib import Path


IDENTIFIER_RE = re.compile(r"^[A-Za-z0-9][A-Za-z0-9._-]{0,127}$")
AUXILIARY_DIRECTORIES = ("runs", "notes", "requests")
RESOURCE_DIRECTORIES = (
    "downloads", "archives", "src", "build", "env", "cache", "tmp", "logs"
)
WORKSPACE_TEMPLATES = {
    "STAGEB_WORK_BREAKDOWN.yaml": "STAGEB_WORK_BREAKDOWN.yaml",
    "ENVIRONMENT_LOCK.yaml": "ENVIRONMENT_LOCK.yaml",
    "AUTONOMOUS_RECOVERY_LEDGER.yaml": "AUTONOMOUS_RECOVERY_LEDGER.yaml",
    "CLAIM_EVIDENCE_MATRIX.yaml": "CLAIM_EVIDENCE_MATRIX.yaml",
    "RUN_INDEX.yaml": "RUN_INDEX.yaml",
    "RESOURCE_INVENTORY.yaml": "RESOURCE_INVENTORY.yaml",
}
AUXILIARY_TEMPLATES = {
    "source-manifest.yaml": "SOURCE_MANIFEST.yaml",
    "progress.md": "PROGRESS.md",
    "result-summary.md": "RESULT_SUMMARY.md",
}


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Create an exact Stage B assignment skeleton without overwriting files."
    )
    parser.add_argument(
        "--workspace-root",
        required=True,
        help="Exact project workspace root containing AGENTS.md and stages/stageB",
    )
    parser.add_argument("--topic-id", required=True, help="Stable topic identifier")
    parser.add_argument("--title", default="", help="Short human-readable topic title")
    parser.add_argument("--assignment-id", required=True, help="Frozen mainline Stage B assignment ID")
    parser.add_argument("--approval-id", required=True, help="Topic-specific user Stage B approval ID")
    parser.add_argument(
        "--write-directory",
        required=True,
        help="Exact frozen assignment directory strictly below stages/stageB/<topic-id>/",
    )
    parser.add_argument(
        "--dry-run", action="store_true", help="Validate and list paths without writing"
    )
    return parser.parse_args()


def replace_yaml_scalars(text: str, values: dict[str, str]) -> str:
    """Replace exact YAML scalar keys while retaining indentation and comments."""
    output: list[str] = []
    for line in text.splitlines():
        stripped = line.lstrip(" ")
        indent = line[: len(line) - len(stripped)]
        replacement = None
        for key, value in values.items():
            if stripped == f"{key}:" or stripped.startswith(f"{key}: "):
                replacement = f"{indent}{key}: {json.dumps(value, ensure_ascii=False)}"
                break
        output.append(replacement if replacement is not None else line)
    return "\n".join(output) + "\n"


def main() -> int:
    args = parse_args()
    for name, value in (("topic-id", args.topic_id), ("assignment-id", args.assignment_id)):
        if not IDENTIFIER_RE.fullmatch(value):
            raise SystemExit(
                f"{name} must be 1-128 characters using letters, digits, dot, underscore, or hyphen"
            )
    if not args.approval_id.strip():
        raise SystemExit("AUTHORIZATION_REFUSAL__MISSING_STAGEB_USER_APPROVAL_ID")

    workspace_root = Path(args.workspace_root).resolve()
    if not (workspace_root / "AGENTS.md").is_file():
        raise SystemExit("workspace-root must contain AGENTS.md")
    stageb_root = (workspace_root / "stages" / "stageB").resolve()
    topic_root = (stageb_root / args.topic_id).resolve()
    task_dir = Path(args.write_directory).resolve()
    if topic_root.parent != stageb_root:
        raise SystemExit("resolved topic root escapes stages/stageB")
    if task_dir == topic_root or topic_root not in task_dir.parents:
        raise SystemExit(
            "AUTHORIZATION_REFUSAL__WRITE_DIRECTORY_MUST_BE_ASSIGNMENT_BELOW_TOPIC_ROOT"
        )

    templates_dir = workspace_root / "templates"
    assets = Path(__file__).resolve().parent.parent / "assets"
    missing_templates = [
        name for name in WORKSPACE_TEMPLATES if not (templates_dir / name).is_file()
    ]
    if missing_templates:
        raise SystemExit("MISSING_CANONICAL_WORKSPACE_TEMPLATES__" + ",".join(missing_templates))
    missing_assets = [
        name
        for name in (*AUXILIARY_TEMPLATES, "mainline-request.md")
        if not (assets / name).is_file()
    ]
    if missing_assets:
        raise SystemExit("MISSING_SKILL_ASSETS__" + ",".join(missing_assets))

    resource_root = task_dir / "resources"
    now = dt.datetime.now(dt.timezone.utc).isoformat()
    yaml_values = {
        "topic_id": args.topic_id,
        "assignment_id": args.assignment_id,
        "stageb_user_approval_id": args.approval_id,
        "unique_write_directory": str(task_dir),
        "resource_root": str(resource_root),
        "inventory_path": str(task_dir / "RESOURCE_INVENTORY.yaml"),
        "created_at": now,
    }
    marker_values = {
        "__TOPIC_ID__": args.topic_id,
        "__TITLE__": args.title or args.topic_id,
        "__CREATED_AT__": now,
        "__ASSIGNMENT_ID__": args.assignment_id,
        "__APPROVAL_ID__": args.approval_id,
        "__WRITE_BOUNDARY__": str(task_dir),
    }

    planned_directories = [
        *(task_dir / name for name in AUXILIARY_DIRECTORIES),
        resource_root,
        *(resource_root / name for name in RESOURCE_DIRECTORIES),
    ]
    planned_files = [
        *(task_dir / output for output in WORKSPACE_TEMPLATES.values()),
        *(task_dir / output for output in AUXILIARY_TEMPLATES.values()),
        task_dir / "requests" / "REQUEST_TEMPLATE.md",
    ]
    if args.dry_run:
        print(
            json.dumps(
                {
                    "validated_assignment_directory": str(task_dir),
                    "topic_root": str(topic_root),
                    "resource_root": str(resource_root),
                    "required_preexisting_authority_files": [
                        str(task_dir / "ASSIGNMENT_CONTEXT.yaml"),
                        str(task_dir / "STAGEB_EXECUTION_CONTRACT.yaml"),
                        str(task_dir / "BOOTSTRAP_ACK.yaml"),
                    ],
                    "planned_directories": [str(path) for path in planned_directories],
                    "planned_files": [str(path) for path in planned_files],
                    "writes_performed": False,
                },
                ensure_ascii=False,
                indent=2,
            )
        )
        return 0

    authority_files = {
        "ASSIGNMENT_CONTEXT.yaml": task_dir / "ASSIGNMENT_CONTEXT.yaml",
        "STAGEB_EXECUTION_CONTRACT.yaml": task_dir / "STAGEB_EXECUTION_CONTRACT.yaml",
        "BOOTSTRAP_ACK.yaml": task_dir / "BOOTSTRAP_ACK.yaml",
    }
    missing_authority = [name for name, path in authority_files.items() if not path.is_file()]
    if missing_authority:
        raise SystemExit(
            "AUTHORIZATION_REFUSAL__MISSING_PREEXISTING_AUTHORITY_FILES__"
            + ",".join(missing_authority)
        )
    contract_text = authority_files["STAGEB_EXECUTION_CONTRACT.yaml"].read_text(
        encoding="utf-8"
    )
    ack_text = authority_files["BOOTSTRAP_ACK.yaml"].read_text(encoding="utf-8")
    for key, value in (
        ("topic_id", args.topic_id),
        ("assignment_id", args.assignment_id),
        ("stageb_user_approval_id", args.approval_id),
    ):
        pattern = rf"(?m)^\s*{re.escape(key)}:\s*[\"']?{re.escape(value)}[\"']?\s*(?:#.*)?$"
        if not re.search(pattern, contract_text):
            raise SystemExit(f"AUTHORIZATION_REFUSAL__CONTRACT_MISMATCH__{key}")
    if not re.search(r"(?m)^start_authorized_by_mainline:\s*true\s*(?:#.*)?$", ack_text):
        raise SystemExit("AUTHORIZATION_REFUSAL__BOOTSTRAP_ACK_NOT_ACCEPTED")

    task_dir.mkdir(parents=True, exist_ok=True)
    for directory in planned_directories:
        directory.mkdir(parents=True, exist_ok=True)

    created: list[str] = []
    skipped: list[str] = []
    for template_name, output_name in WORKSPACE_TEMPLATES.items():
        output = task_dir / output_name
        if output.exists():
            skipped.append(str(output))
            continue
        text = (templates_dir / template_name).read_text(encoding="utf-8")
        output.write_text(
            replace_yaml_scalars(text, yaml_values), encoding="utf-8", newline="\n"
        )
        created.append(str(output))

    for template_name, output_name in AUXILIARY_TEMPLATES.items():
        output = task_dir / output_name
        if output.exists():
            skipped.append(str(output))
            continue
        text = (assets / template_name).read_text(encoding="utf-8")
        for marker, value in marker_values.items():
            text = text.replace(marker, value)
        output.write_text(text, encoding="utf-8", newline="\n")
        created.append(str(output))

    request_template = task_dir / "requests" / "REQUEST_TEMPLATE.md"
    if request_template.exists():
        skipped.append(str(request_template))
    else:
        request_template.write_text(
            (assets / "mainline-request.md").read_text(encoding="utf-8"),
            encoding="utf-8",
            newline="\n",
        )
        created.append(str(request_template))

    print(
        json.dumps(
            {
                "task_dir": str(task_dir),
                "resource_root": str(resource_root),
                "created": created,
                "skipped_existing": skipped,
                "execution_authorized": False,
                "next_gate": "MAINLINE_COMPLETES_AND_FREEZES_CONTRACT_AND_BOOTSTRAP_ACK",
            },
            ensure_ascii=False,
            indent=2,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
