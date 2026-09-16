"""Static APX r9 controller contract; execution is intentionally disabled."""
from dataclasses import dataclass

@dataclass(frozen=True)
class ProcessReceipt:
    row_id: str
    argv: tuple[str, ...]
    cwd: str
    stdout: str
    stderr: str
    timeout_seconds: int
    cpu_seconds: float | None
    wall_seconds: float | None
    peak_rss_bytes: int | None
    exit_code: int | None
    persisted_bytes: int | None

def execute(*_args, **_kwargs):
    raise RuntimeError("STATIC_PACKET_ONLY: tool execution is not authorized")
