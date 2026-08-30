from __future__ import annotations

import hashlib
import json
import os
import posixpath
import re
import sys
import tempfile
import unicodedata
from pathlib import Path
from urllib.parse import parse_qsl, quote, unquote, urlencode, urlsplit, urlunsplit


PROFILE = "R11A-STABLE-FAMILY-IDENTITY-NORM-V1"
ROOT = Path(r"D:\project\writing\reserch")
CONTROL = ROOT / r"stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r11a\control"
OUTPUT = CONTROL / "prior-identity-denylist-v1"

INPUTS = [
    {
        "role": "V8_8_R3_PROTECTED_KEY",
        "path": ROOT / r"stages\discovery\_method-backtests\CONSOLIDATED_DISCOVERY_STAGE0\V8.8-R3\packer\auditor_key\case_key.yaml",
        "sha256": "DC1949187185841B88C05113BA9C2552EFD68727A88A08AF6C9CA95BBE9A35AE",
        "manifest": ROOT / r"stages\discovery\_method-backtests\CONSOLIDATED_DISCOVERY_STAGE0\V8.8-R3\packer\HASH_MANIFEST.sha256",
        "manifest_sha256": "69357EE2B5F29FAE3CA590382EA36E87647DDAA031CFF6063AF1F6FF6AF59BBD",
        "manifest_suffix": "auditor_key/case_key.yaml",
    },
    {
        "role": "V8_8_R3R1_RESUME2_PROTECTED_KEY",
        "path": ROOT / r"stages\discovery\_method-backtests\CONSOLIDATED_DISCOVERY_STAGE0\V8.8-R3R1\resume2\packer\auditor_key\AUDITOR_KEY.yaml",
        "sha256": "50E28F843A96655BC97108ED30995B5DA288ABDC721F65CBB5E0D77CB14F2FD1",
        "manifest": ROOT / r"stages\discovery\_method-backtests\CONSOLIDATED_DISCOVERY_STAGE0\V8.8-R3R1\resume2\packer\HASH_MANIFEST.sha256",
        "manifest_sha256": "856FD1DE777B0F40542FFC58D4934CDA78F78AA6A57192AA7CAF24A756584AB5",
        "manifest_suffix": "auditor_key/AUDITOR_KEY.yaml",
    },
    {
        "role": "R10_ZERO_CASE_HANDOFF",
        "path": ROOT / r"stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r10\packer\handoff.yaml",
        "sha256": "30BF2876F291835C55246FF31C6EEE328D51FF0DB400B932D1985C99E6DD3D51",
        "manifest": ROOT / r"stages\discovery\_method-backtests\DISCOVERY_CLAIM_PACK\V9-R0\paired-blind-r10\packer\HASH_MANIFEST.sha256",
        "manifest_sha256": "D66507876068BA4084830FA6D16307BC422BCB8C167747215BBE973DA9E845C4",
        "manifest_suffix": "handoff.yaml",
    },
]

TRACKING_KEYS = {"fbclid", "gclid", "mc_cid", "mc_eid"}
UNRESERVED = set("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~")


class CuratorFailure(Exception):
    pass


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def file_hash(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def yaml_scalar(text: str) -> str:
    value = text.strip()
    if not value or value in {"|", ">", "~", "null", "Null", "NULL"}:
        raise CuratorFailure("UNHASHABLE_SCALAR")
    if value.startswith("&") or value.startswith("*") or value.startswith("!"):
        raise CuratorFailure("YAML_INDIRECTION_FORBIDDEN")
    if value.startswith("'"):
        if len(value) < 2 or not value.endswith("'"):
            raise CuratorFailure("MALFORMED_SINGLE_QUOTE")
        return value[1:-1].replace("''", "'")
    if value.startswith('"'):
        try:
            parsed = json.loads(value)
        except Exception as exc:
            raise CuratorFailure("MALFORMED_DOUBLE_QUOTE") from exc
        if not isinstance(parsed, str):
            raise CuratorFailure("NON_STRING_SCALAR")
        return parsed
    if " #" in value:
        value = value.split(" #", 1)[0].rstrip()
    if not value:
        raise CuratorFailure("EMPTY_PLAIN_SCALAR")
    return value


def nfkc_space(text: str) -> str:
    text = unicodedata.normalize("NFKC", text.replace("\r\n", "\n").replace("\r", "\n"))
    return " ".join(text.strip().split())


def decode_unreserved_pct(text: str) -> str:
    def repl(match: re.Match[str]) -> str:
        char = chr(int(match.group(1), 16))
        return char if char in UNRESERVED else match.group(0).upper()

    return re.sub(r"%([0-9A-Fa-f]{2})", repl, text)


def normalize_doi(value: str) -> str | None:
    candidate = nfkc_space(value)
    candidate = re.sub(r"^(?:doi:\s*|https?://(?:dx\.)?doi\.org/)", "", candidate, flags=re.I)
    if not re.match(r"^10\.\d{4,9}/\S+$", candidate, flags=re.I):
        return None
    return decode_unreserved_pct(candidate).casefold()


def normalize_arxiv(value: str) -> str | None:
    candidate = nfkc_space(value)
    candidate = re.sub(r"^https?://arxiv\.org/(?:abs|pdf)/", "", candidate, flags=re.I)
    candidate = re.sub(r"^(?:arxiv:)\s*", "", candidate, flags=re.I)
    candidate = re.sub(r"\.pdf$", "", candidate, flags=re.I)
    candidate = re.sub(r"v\d+$", "", candidate, flags=re.I)
    if re.match(r"^(?:\d{4}\.\d{4,5}|[a-z\-]+(?:\.[A-Z]{2})?/\d{7})$", candidate, flags=re.I):
        return candidate.casefold()
    return None


def normalize_openreview(value: str) -> str | None:
    candidate = nfkc_space(value)
    if re.match(r"^[A-Za-z0-9_-]{8,}$", candidate) and " " not in candidate:
        return None
    match = re.search(r"openreview\.net/(?:forum|pdf)\?id=([A-Za-z0-9_-]+)", candidate, flags=re.I)
    return match.group(1) if match else None


def normalize_url(value: str) -> str | None:
    candidate = nfkc_space(value)
    try:
        parts = urlsplit(candidate)
    except Exception:
        return None
    if parts.scheme.casefold() not in {"http", "https"} or not parts.hostname:
        return None
    scheme = parts.scheme.casefold()
    host = parts.hostname.casefold()
    port = parts.port
    if port is not None and not ((scheme == "http" and port == 80) or (scheme == "https" and port == 443)):
        host = f"{host}:{port}"
    path = posixpath.normpath(parts.path or "/")
    if parts.path.endswith("/") and not path.endswith("/"):
        path += "/"
    if not path.startswith("/"):
        path = "/" + path
    query_pairs = []
    for key, val in parse_qsl(parts.query, keep_blank_values=True):
        key_fold = key.casefold()
        if key_fold.startswith("utm_") or key_fold in TRACKING_KEYS:
            continue
        query_pairs.append((key, val))
    query_pairs.sort(key=lambda pair: (pair[0], pair[1]))
    query = urlencode(query_pairs, doseq=True, quote_via=quote, safe="~")
    return urlunsplit((scheme, host, path, query, ""))


def normalize_fallback(title: str, date: str, author: str) -> str:
    if not re.fullmatch(r"\d{4}-\d{2}-\d{2}", date):
        raise CuratorFailure("INVALID_FALLBACK_DATE")

    def text_part(value: str) -> str:
        value = nfkc_space(value).casefold()
        value = value.translate(str.maketrans({"–": "-", "—": "-", "‘": "'", "’": "'", "“": '"', "”": '"'}))
        value = re.sub(r"[^\w]+", " ", value, flags=re.UNICODE)
        return " ".join(value.split())

    t, a = text_part(title), text_part(author)
    if not t or not a:
        raise CuratorFailure("INCOMPLETE_FALLBACK")
    return json.dumps({"author_or_organization": a, "date": date, "title": t}, ensure_ascii=False, sort_keys=True, separators=(",", ":"))


def normalize_identity(raw: str) -> tuple[str, str]:
    explicit = nfkc_space(raw)
    if not explicit or any(ord(ch) < 32 and ch not in "\t\n" for ch in explicit):
        raise CuratorFailure("UNHASHABLE_IDENTITY")
    doi = normalize_doi(explicit)
    if doi is not None:
        return "doi", doi
    arxiv = normalize_arxiv(explicit)
    if arxiv is not None:
        return "arxiv", arxiv
    openreview = normalize_openreview(explicit)
    if openreview is not None:
        return "openreview_forum", openreview
    url = normalize_url(explicit)
    if url is not None:
        return "official_locator", url
    return "explicit_protected_scalar", explicit.casefold()


def canonical_preimage(raw: str) -> bytes:
    kind, value = normalize_identity(raw)
    payload = {"identity_kind": kind, "identity_value": value, "profile": PROFILE}
    return json.dumps(payload, ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8")


def parse_r3(path: Path) -> list[str]:
    values: list[str] = []
    cases: set[str] = set()
    current: str | None = None
    seen_identity: set[str] = set()
    in_cases = False
    for line in path.read_text(encoding="utf-8-sig").splitlines():
        if line == "cases:":
            in_cases = True
            continue
        if not in_cases:
            continue
        case_match = re.fullmatch(r"  (C\d{2}):\s*", line)
        if case_match:
            current = case_match.group(1)
            if current in cases:
                raise CuratorFailure("DUPLICATE_PROTECTED_RECORD")
            cases.add(current)
            continue
        identity_match = re.fullmatch(r"    (hidden_target_id|hidden_target):\s*(.+?)\s*", line)
        if identity_match:
            if current is None or current in seen_identity:
                raise CuratorFailure("AMBIGUOUS_PROTECTED_IDENTITY")
            values.append(yaml_scalar(identity_match.group(2)))
            seen_identity.add(current)
    if len(cases) != 18 or len(values) != 18 or seen_identity != cases:
        raise CuratorFailure("R3_RECORD_COUNT_MISMATCH")
    return values


def parse_r3r1(path: Path) -> list[str]:
    values: list[str] = []
    in_map = False
    for line in path.read_text(encoding="utf-8-sig").splitlines():
        if line == "source_identity_map:":
            in_map = True
            continue
        if in_map and line and not line.startswith(" "):
            break
        if in_map:
            match = re.fullmatch(r"  ([A-Za-z0-9_]+):\s*(.+?)\s*", line)
            if match:
                values.append(yaml_scalar(match.group(2)))
    if len(values) != 10:
        raise CuratorFailure("R3R1_RECORD_COUNT_MISMATCH")
    return values


def parse_r10_zero(path: Path) -> int:
    count_values = []
    for line in path.read_text(encoding="utf-8-sig").splitlines():
        match = re.fullmatch(r"blind_cases_frozen:\s*(\d+)\s*", line)
        if match:
            count_values.append(int(match.group(1)))
    if count_values != [0]:
        raise CuratorFailure("R10_ZERO_CASE_PROVENANCE_MISMATCH")
    return 0


def verify_manifest(manifest: Path, manifest_hash: str, suffix: str, expected_hash: str) -> None:
    if file_hash(manifest) != manifest_hash:
        raise CuratorFailure("SOURCE_MANIFEST_HASH_MISMATCH")
    found = []
    for line in manifest.read_text(encoding="utf-8-sig").splitlines():
        match = re.fullmatch(r"([0-9A-Fa-f]{64})\s+\*?(.+)", line)
        if not match:
            continue
        rel = match.group(2).strip().replace("\\", "/").lstrip("./")
        if rel.casefold().endswith(suffix.casefold()):
            found.append(match.group(1).upper())
    if found != [expected_hash]:
        raise CuratorFailure("PROTECTED_KEY_NOT_COVERED_BY_MANIFEST")


def collision_guard(entries: list[tuple[str, bytes]]) -> None:
    by_digest: dict[str, bytes] = {}
    for digest, preimage in entries:
        if digest in by_digest and by_digest[digest] != preimage:
            raise CuratorFailure("HASH_COLLISION_FATAL")
        by_digest[digest] = preimage


def fixture_tests() -> dict[str, str]:
    doi_a = canonical_preimage("doi:10.1000/ABC")
    doi_b = canonical_preimage("https://doi.org/10.1000/abc")
    arxiv_a = canonical_preimage("arXiv:2601.01234v2")
    arxiv_b = canonical_preimage("https://arxiv.org/abs/2601.01234")
    url_a = canonical_preimage("HTTPS://EXAMPLE.ORG:443/a/../b?utm_source=x&z=2&a=1#fragment")
    url_b = canonical_preimage("https://example.org/b?a=1&z=2")
    fallback_a = normalize_fallback("A—Title", "2026-08-13", "An Organization")
    fallback_b = normalize_fallback("a title", "2026-08-13", "an organization")
    if doi_a != doi_b or arxiv_a != arxiv_b or url_a != url_b or fallback_a != fallback_b:
        raise CuratorFailure("NORMALIZATION_FIXTURE_FAILURE")
    duplicate_preimage = canonical_preimage("EXPLICIT-ID")
    collision_guard([(sha256_bytes(duplicate_preimage), duplicate_preimage), (sha256_bytes(duplicate_preimage), duplicate_preimage)])
    injected_collision_passed = False
    try:
        collision_guard([("0" * 64, b"one"), ("0" * 64, b"two")])
    except CuratorFailure as exc:
        injected_collision_passed = str(exc) == "HASH_COLLISION_FATAL"
    if not injected_collision_passed:
        raise CuratorFailure("COLLISION_INJECTION_FIXTURE_FAILURE")
    return {
        "doi_alias": "PASS",
        "arxiv_version": "PASS",
        "url_normalization": "PASS",
        "fallback_normalization": "PASS",
        "identical_duplicate": "PASS",
        "collision_injection": "PASS",
    }


def profile_bytes() -> bytes:
    text = f"""schema: R11A_STABLE_FAMILY_IDENTITY_NORMALIZATION_PROFILE_V1
profile: {PROFILE}
canonical_encoding: UTF-8_NO_BOM
canonical_serialization: SORTED_KEY_COMPACT_JSON
digest: SHA-256_UPPERCASE_HEX_64
unicode: NFKC
whitespace: TRIM_AND_COLLAPSE_TO_ASCII_SPACE
identifier_priority:
  - DOI
  - ARXIV_BASE_IDENTIFIER
  - OPENREVIEW_FORUM_IDENTIFIER
  - OFFICIAL_HTTP_OR_HTTPS_LOCATOR
  - EXPLICIT_PROTECTED_IDENTITY_SCALAR
doi_version_suffix_policy: NOT_APPLICABLE
arxiv_version_suffix_policy: REMOVE_vN
url_policy: LOWER_SCHEME_HOST_REMOVE_DEFAULT_PORT_FRAGMENT_DOT_SEGMENTS_TRACKING_SORT_QUERY
fallback_policy: TITLE_PLUS_ISO_DATE_PLUS_FIRST_AUTHOR_OR_ORGANIZATION_ONLY
missing_or_ambiguous_identity: FAIL_CLOSED
distinct_preimage_same_digest: HASH_COLLISION_FATAL
model_inference: FORBIDDEN
"""
    return text.encode("utf-8")


def build_payloads() -> dict[str, bytes]:
    for item in INPUTS:
        if file_hash(item["path"]) != item["sha256"]:
            raise CuratorFailure("PROTECTED_INPUT_HASH_MISMATCH")
        verify_manifest(item["manifest"], item["manifest_sha256"], item["manifest_suffix"], item["sha256"])

    raw_values = parse_r3(INPUTS[0]["path"]) + parse_r3r1(INPUTS[1]["path"])
    r10_count = parse_r10_zero(INPUTS[2]["path"])
    if len(raw_values) != 28 or r10_count != 0:
        raise CuratorFailure("RAW_COUNT_MISMATCH")

    preimages = [canonical_preimage(value) for value in raw_values]
    entries = [(sha256_bytes(preimage), preimage) for preimage in preimages]
    collision_guard(entries)
    digests = sorted({digest for digest, _ in entries})
    duplicate_count = len(entries) - len(digests)
    fixtures = fixture_tests()

    profile = profile_bytes()
    denylist = ("\n".join(digests) + "\n").encode("ascii")
    source_manifest_hashes = sorted({item["manifest_sha256"] for item in INPUTS})
    script_hash = file_hash(Path(__file__).resolve())

    provenance_lines = [
        "schema: R11A_PRIVATE_CURATION_PROVENANCE_V1",
        "authorization_id: R11A-HASH-ONLY-PRIOR-IDENTITY-DENYLIST-20260813-R12A",
        "owner: MAINLINE_CONTROL_PLANE__DETERMINISTIC_NO_MODEL_HASH_CURATOR",
        f"normalization_profile: {PROFILE}",
        f"normalization_profile_sha256: {sha256_bytes(profile)}",
        f"transform_sha256: {script_hash}",
        "network_used: false",
        "model_semantic_inference_used: false",
        "protected_raw_values_persisted: false",
        "protected_raw_identity_count: 28",
        f"unique_prior_identity_hash_count: {len(digests)}",
        f"duplicate_prior_identity_count: {duplicate_count}",
        "unhashable_prior_identity_count: 0",
        "r10_frozen_case_count: 0",
        f"private_denylist_root_sha256: {sha256_bytes(denylist)}",
        "source_inputs:",
    ]
    for item in INPUTS:
        provenance_lines.extend([
            f"  - role: {item['role']}",
            f"    input_sha256: {item['sha256']}",
            f"    source_manifest_sha256: {item['manifest_sha256']}",
        ])
    provenance = ("\n".join(provenance_lines) + "\n").encode("utf-8")

    fixture_lines = "\n".join(f"- {name}: {status}" for name, status in fixtures.items())
    report = f"""# Private Hash Curator Validation Report

- Authorization: `R11A-HASH-ONLY-PRIOR-IDENTITY-DENYLIST-20260813-R12A`
- Status: `PASS_PRIVATE_DENYLIST_BUILD__CANDIDATE_COMMITMENT_AND_INTERSECTION_PENDING`
- Scientific inference: `NONE`
- Canonical mode: `OFF`
- Network, download, experiment, automation: `NOT_USED`

## Mechanical checks

- Exact protected input hashes: PASS (3/3)
- Exact source-manifest hashes: PASS (3/3)
- Protected-key manifest coverage: PASS (3/3)
- Raw protected identities: 28
- R10 frozen cases: 0
- Unhashable identities: 0
- Distinct-preimage digest collision: NONE
- Raw protected values persisted or logged: NO
- Private digest set sorted and uppercase 64-hex: PASS
- Two clean deterministic recomputations: PASS (validated before publication)

## Synthetic fixtures

{fixture_lines}

## Remaining mandatory gate

The same R11A PACKER must first freeze `CANDIDATE_IDENTITY_COMMITMENT.yaml` using the profile hash above. Mainline then performs the private intersection and publishes only the approved Packer-visible result schema. No Phase-1 scientific search resumes until candidate commitment ordering, result leak scan, manifests, and intersection validation all pass.
""".encode("utf-8")

    return {
        "NORMALIZATION_PROFILE.yaml": profile,
        "PRIVATE_PRIOR_IDENTITY_DENYLIST.sha256": denylist,
        "PRIVATE_CURATION_PROVENANCE.yaml": provenance,
        "PRIVATE_VALIDATION_REPORT.md": report,
    }


def write_payloads(directory: Path, payloads: dict[str, bytes]) -> None:
    directory.mkdir(parents=False, exist_ok=False)
    for name, data in payloads.items():
        (directory / name).write_bytes(data)
    manifest_lines = []
    for name in sorted(payloads):
        manifest_lines.append(f"{sha256_bytes(payloads[name])} *{name}")
    (directory / "HASH_MANIFEST.sha256").write_text("\n".join(manifest_lines) + "\n", encoding="ascii", newline="\n")


def verify_written(directory: Path, expected: dict[str, bytes]) -> None:
    actual_names = sorted(path.name for path in directory.iterdir() if path.is_file())
    expected_names = sorted([*expected.keys(), "HASH_MANIFEST.sha256"])
    if actual_names != expected_names:
        raise CuratorFailure("OUTPUT_FILE_SET_MISMATCH")
    for name, data in expected.items():
        if (directory / name).read_bytes() != data:
            raise CuratorFailure("OUTPUT_BYTE_MISMATCH")
    manifest = (directory / "HASH_MANIFEST.sha256").read_text(encoding="ascii").splitlines()
    if len(manifest) != len(expected):
        raise CuratorFailure("MANIFEST_COUNT_MISMATCH")
    for line in manifest:
        match = re.fullmatch(r"([0-9A-F]{64}) \*(.+)", line)
        if not match or match.group(2) not in expected:
            raise CuratorFailure("MANIFEST_FORMAT_MISMATCH")
        if match.group(1) != file_hash(directory / match.group(2)):
            raise CuratorFailure("MANIFEST_HASH_MISMATCH")


def main() -> int:
    try:
        if OUTPUT.exists():
            raise CuratorFailure("IMMUTABLE_OUTPUT_ALREADY_EXISTS")
        payloads_a = build_payloads()
        payloads_b = build_payloads()
        if payloads_a != payloads_b:
            raise CuratorFailure("NONDETERMINISTIC_RECOMPUTATION")

        with tempfile.TemporaryDirectory(prefix="_r12a_curator_run1_", dir=CONTROL) as temp_a, tempfile.TemporaryDirectory(prefix="_r12a_curator_run2_", dir=CONTROL) as temp_b:
            run_a = Path(temp_a) / "artifact"
            run_b = Path(temp_b) / "artifact"
            write_payloads(run_a, payloads_a)
            write_payloads(run_b, payloads_b)
            verify_written(run_a, payloads_a)
            verify_written(run_b, payloads_b)
            if {p.name: p.read_bytes() for p in run_a.iterdir()} != {p.name: p.read_bytes() for p in run_b.iterdir()}:
                raise CuratorFailure("CLEAN_DIRECTORY_RECOMPUTATION_MISMATCH")

        write_payloads(OUTPUT, payloads_a)
        verify_written(OUTPUT, payloads_a)
        print("R12A_PRIVATE_BUILD=PASS")
        print("RAW_IDENTITY_COUNT=28")
        print(f"UNIQUE_DIGEST_COUNT={len((OUTPUT / 'PRIVATE_PRIOR_IDENTITY_DENYLIST.sha256').read_text(encoding='ascii').splitlines())}")
        print("UNHASHABLE_COUNT=0")
        print("PACKER_VISIBLE_RESULT=PENDING_CANDIDATE_COMMITMENT")
        return 0
    except CuratorFailure as exc:
        print(f"R12A_PRIVATE_BUILD=FAIL:{str(exc)}")
        return 2
    except Exception:
        print("R12A_PRIVATE_BUILD=FAIL:UNEXPECTED_LOCAL_TRANSFORM_ERROR")
        return 3


if __name__ == "__main__":
    sys.exit(main())
