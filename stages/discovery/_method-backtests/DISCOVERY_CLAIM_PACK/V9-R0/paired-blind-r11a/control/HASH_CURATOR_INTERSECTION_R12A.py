from __future__ import annotations

import hashlib
import re
import sys
from pathlib import Path


ROOT = Path(r"D:\project\writing\reserch")
CONTROL = ROOT / r"stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r11a\control"
PRIVATE = CONTROL / "prior-identity-denylist-v1"
VISIBLE = PRIVATE / "packer-visible"
INDEX = ROOT / r"stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r11a\index"
COMMITMENT = INDEX / "CANDIDATE_IDENTITY_COMMITMENT.yaml"
COMMITMENT_MANIFEST = INDEX / "CANDIDATE_IDENTITY_COMMITMENT_MANIFEST.sha256"

EXPECTED_COMMITMENT_SHA256 = "7BD8EEB5BD135DCFF681EBE5A80313FE2CFFCFF33A5FC848259C4A9C7CA986BF"
EXPECTED_COMMITMENT_MANIFEST_SHA256 = "0A41E8C24729CBB552DAAD9B1944BBCE474982A39DB7006A8CD728BBDA6697D6"
EXPECTED_PROFILE_SHA256 = "515B641D52328FC916078B1999ABD03A5FDC8B5581865FB7AE90ECD5AE3FB434"
EXPECTED_PRIVATE_MANIFEST_SHA256 = "F05A6E2C397B6FE26F618D325EAE965615E36FFF729465110621EC3CDF7409A0"
EXPECTED_PRIVATE_DENYLIST_SHA256 = "D0E1A3E32512E2AA4154081D78317F3F91724ED086F8BE2185A23D34A4457C55"
CHECKPOINT_SHA256 = "B3C614BA87C8F8266DEA1CE2DC02517EAD263D5D7883C4E73D1C31D867BBC3C1"
SOURCE_MANIFEST_SHA256 = sorted([
    "69357EE2B5F29FAE3CA590382EA36E87647DDAA031CFF6063AF1F6FF6AF59BBD",
    "856FD1DE777B0F40542FFC58D4934CDA78F78AA6A57192AA7CAF24A756584AB5",
    "D66507876068BA4084830FA6D16307BC422BCB8C167747215BBE973DA9E845C4",
])


class IntersectionFailure(Exception):
    pass


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def file_hash(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def validate_private() -> list[str]:
    if file_hash(PRIVATE / "HASH_MANIFEST.sha256") != EXPECTED_PRIVATE_MANIFEST_SHA256:
        raise IntersectionFailure("PRIVATE_MANIFEST_HASH_MISMATCH")
    denylist_path = PRIVATE / "PRIVATE_PRIOR_IDENTITY_DENYLIST.sha256"
    if file_hash(denylist_path) != EXPECTED_PRIVATE_DENYLIST_SHA256:
        raise IntersectionFailure("PRIVATE_DENYLIST_HASH_MISMATCH")
    digests = denylist_path.read_text(encoding="ascii").splitlines()
    if len(digests) != 28 or digests != sorted(digests) or len(set(digests)) != 28:
        raise IntersectionFailure("PRIVATE_DENYLIST_CARDINALITY_OR_ORDER_MISMATCH")
    if any(not re.fullmatch(r"[0-9A-F]{64}", value) for value in digests):
        raise IntersectionFailure("PRIVATE_DENYLIST_FORMAT_MISMATCH")
    return digests


def parse_commitment() -> list[tuple[str, str]]:
    if file_hash(COMMITMENT) != EXPECTED_COMMITMENT_SHA256:
        raise IntersectionFailure("CANDIDATE_COMMITMENT_HASH_MISMATCH")
    if file_hash(COMMITMENT_MANIFEST) != EXPECTED_COMMITMENT_MANIFEST_SHA256:
        raise IntersectionFailure("CANDIDATE_COMMITMENT_MANIFEST_HASH_MISMATCH")
    manifest_text = COMMITMENT_MANIFEST.read_text(encoding="ascii")
    expected_line = f"{EXPECTED_COMMITMENT_SHA256} *CANDIDATE_IDENTITY_COMMITMENT.yaml\n"
    if manifest_text != expected_line:
        raise IntersectionFailure("CANDIDATE_COMMITMENT_MANIFEST_CONTENT_MISMATCH")

    text = COMMITMENT.read_text(encoding="utf-8-sig")
    exact_required = {
        "schema": "R11A_CANDIDATE_IDENTITY_COMMITMENT_V1",
        "checkpoint_008_sha256": CHECKPOINT_SHA256,
        "normalization_profile": "R11A-STABLE-FAMILY-IDENTITY-NORM-V1",
        "normalization_profile_hash": EXPECTED_PROFILE_SHA256,
        "candidate_identity_count": "4",
        "unhashable_count": "0",
        "decision": "COMMITTED__AWAITING_CONTROL_PLANE_HASH_ONLY_INTERSECTION",
    }
    for key, expected in exact_required.items():
        match = re.search(rf"^{re.escape(key)}:\s*'?([^'\r\n]+)'?\s*$", text, flags=re.M)
        if not match or match.group(1).strip() != expected:
            raise IntersectionFailure(f"COMMITMENT_FIELD_MISMATCH_{key}")

    allowed_top = {
        "schema", "assignment_id", "checkpoint_008_sha256", "normalization_profile",
        "normalization_profile_hash", "created_at", "candidate_identity_count", "entries",
        "unhashable_count", "decision",
    }
    for match in re.finditer(r"^([A-Za-z0-9_]+):", text, flags=re.M):
        if match.group(1) not in allowed_top:
            raise IntersectionFailure("COMMITMENT_UNEXPECTED_TOP_FIELD")

    lines = text.splitlines()
    entries: list[tuple[str, str]] = []
    current_id: str | None = None
    for line in lines:
        id_match = re.fullmatch(r"  - opaque_family_id:\s*([A-Za-z0-9_-]+)\s*", line)
        if id_match:
            if current_id is not None:
                raise IntersectionFailure("COMMITMENT_ENTRY_INCOMPLETE")
            current_id = id_match.group(1)
            continue
        hash_match = re.fullmatch(r"    candidate_identity_hash:\s*([0-9A-F]{64})\s*", line)
        if hash_match:
            if current_id is None:
                raise IntersectionFailure("COMMITMENT_HASH_WITHOUT_ID")
            entries.append((current_id, hash_match.group(1)))
            current_id = None
    if current_id is not None or len(entries) != 4:
        raise IntersectionFailure("COMMITMENT_ENTRY_COUNT_MISMATCH")
    if entries != sorted(entries) or len({x[0] for x in entries}) != 4 or len({x[1] for x in entries}) != 4:
        raise IntersectionFailure("COMMITMENT_ORDER_OR_UNIQUENESS_MISMATCH")
    return entries


def build_result(entries: list[tuple[str, str]], prior: list[str]) -> bytes:
    prior_set = set(prior)
    results = [(opaque, digest, digest in prior_set) for opaque, digest in entries]
    matched = sum(1 for _, _, is_match in results if is_match)
    decision = "PASS_NO_REUSE" if matched == 0 else "FAIL_REUSE_FOUND"
    lines = [
        "schema: R11A_PRIOR_IDENTITY_EXCLUSION_RESULT_V1",
        f"normalization_profile_sha256: {EXPECTED_PROFILE_SHA256}",
        f"private_denylist_root_sha256: {EXPECTED_PRIVATE_DENYLIST_SHA256}",
        "source_manifest_sha256:",
    ]
    lines.extend(f"  - {digest}" for digest in SOURCE_MANIFEST_SHA256)
    lines.extend([
        "raw_prior_identity_count: 28",
        "unique_prior_identity_hash_count: 28",
        "duplicate_prior_identity_count: 0",
        "unhashable_prior_identity_count: 0",
        f"candidate_commitment_sha256: {EXPECTED_COMMITMENT_SHA256}",
        f"candidate_identity_count_checked: {len(results)}",
        f"matched_candidate_count: {matched}",
        "candidate_results:",
    ])
    for opaque, digest, is_match in results:
        lines.extend([
            f"  - opaque_family_id: {opaque}",
            f"    candidate_identity_hash: {digest}",
            f"    prior_identity_match: {'true' if is_match else 'false'}",
        ])
    lines.append(f"decision: {decision}")
    return ("\n".join(lines) + "\n").encode("ascii")


def validate_visible(data: bytes, entries: list[tuple[str, str]]) -> None:
    text = data.decode("ascii")
    allowed_keys = {
        "schema", "normalization_profile_sha256", "private_denylist_root_sha256",
        "source_manifest_sha256", "raw_prior_identity_count", "unique_prior_identity_hash_count",
        "duplicate_prior_identity_count", "unhashable_prior_identity_count",
        "candidate_commitment_sha256", "candidate_identity_count_checked",
        "matched_candidate_count", "candidate_results", "opaque_family_id",
        "candidate_identity_hash", "prior_identity_match", "decision",
    }
    for match in re.finditer(r"^\s*(?:-\s+)?([A-Za-z0-9_]+):", text, flags=re.M):
        if match.group(1) not in allowed_keys:
            raise IntersectionFailure("VISIBLE_UNEXPECTED_FIELD")
    forbidden = [
        r"https?://", r"doi\s*:", r"arxiv\s*:", r"title\s*:", r"author\s*:",
        r"outcome\s*:", r"answer\s*:", r"case_semantics", r"class\s*:", r"stratum\s*:",
        r"method_labels?\s*:", r"hidden_target", r"ground_truth",
    ]
    if any(re.search(pattern, text, flags=re.I) for pattern in forbidden):
        raise IntersectionFailure("VISIBLE_FORBIDDEN_TOKEN_LEAK")
    allowed_hashes = {
        EXPECTED_PROFILE_SHA256, EXPECTED_PRIVATE_DENYLIST_SHA256,
        EXPECTED_COMMITMENT_SHA256, *SOURCE_MANIFEST_SHA256,
        *(digest for _, digest in entries),
    }
    observed_hashes = set(re.findall(r"\b[0-9A-F]{64}\b", text))
    if not observed_hashes.issubset(allowed_hashes):
        raise IntersectionFailure("VISIBLE_UNAPPROVED_HASH_LEAK")


def main() -> int:
    try:
        if VISIBLE.exists():
            raise IntersectionFailure("IMMUTABLE_VISIBLE_OUTPUT_ALREADY_EXISTS")
        prior = validate_private()
        entries = parse_commitment()
        result = build_result(entries, prior)
        validate_visible(result, entries)
        VISIBLE.mkdir(parents=False, exist_ok=False)
        result_path = VISIBLE / "PRIOR_IDENTITY_EXCLUSION_RESULT.yaml"
        result_path.write_bytes(result)
        result_hash = sha256_bytes(result)
        manifest = f"{result_hash} *PRIOR_IDENTITY_EXCLUSION_RESULT.yaml\n".encode("ascii")
        (VISIBLE / "HASH_MANIFEST.sha256").write_bytes(manifest)
        if result_path.read_bytes() != result:
            raise IntersectionFailure("VISIBLE_RESULT_WRITE_MISMATCH")
        if (VISIBLE / "HASH_MANIFEST.sha256").read_bytes() != manifest:
            raise IntersectionFailure("VISIBLE_MANIFEST_WRITE_MISMATCH")
        matched = len(re.findall(rb"prior_identity_match: true", result))
        print("R12A_INTERSECTION=PASS")
        print("CANDIDATE_COUNT=4")
        print(f"MATCHED_COUNT={matched}")
        print(f"DECISION={'PASS_NO_REUSE' if matched == 0 else 'FAIL_REUSE_FOUND'}")
        return 0
    except IntersectionFailure as exc:
        print(f"R12A_INTERSECTION=FAIL:{str(exc)}")
        return 2
    except Exception:
        print("R12A_INTERSECTION=FAIL:UNEXPECTED_LOCAL_INTERSECTION_ERROR")
        return 3


if __name__ == "__main__":
    sys.exit(main())
