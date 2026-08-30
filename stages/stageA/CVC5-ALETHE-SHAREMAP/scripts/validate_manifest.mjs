import { createHash } from "node:crypto";
import { createReadStream } from "node:fs";
import { readFile, stat } from "node:fs/promises";
import path from "node:path";

const [rootArg, manifestArg] = process.argv.slice(2);
if (!rootArg || !manifestArg) {
  throw new Error("usage: node validate_manifest.mjs <root> <manifest>");
}

const root = path.resolve(rootArg);
const manifest = path.resolve(root, manifestArg);
const text = await readFile(manifest, "utf8");
const lines = text.split(/\r?\n/u).filter(Boolean);
const failures = [];
let totalBytes = 0;

async function sha256(file) {
  return await new Promise((resolve, reject) => {
    const hash = createHash("sha256");
    const stream = createReadStream(file);
    stream.on("error", reject);
    stream.on("data", (chunk) => hash.update(chunk));
    stream.on("end", () => resolve(hash.digest("hex").toUpperCase()));
  });
}

for (const [index, line] of lines.entries()) {
  const match = /^([0-9A-F]{64})  \*(.+)$/u.exec(line);
  if (!match) {
    failures.push({ line: index + 1, reason: "malformed_entry" });
    continue;
  }
  const relative = match[2].replaceAll("/", path.sep);
  const file = path.resolve(root, relative);
  if (file === manifest || !file.startsWith(`${root}${path.sep}`)) {
    failures.push({ line: index + 1, path: match[2], reason: "unsafe_or_self_entry" });
    continue;
  }
  try {
    const info = await stat(file);
    if (!info.isFile()) {
      failures.push({ line: index + 1, path: match[2], reason: "not_a_file" });
      continue;
    }
    totalBytes += info.size;
    const actual = await sha256(file);
    if (actual !== match[1]) {
      failures.push({ line: index + 1, path: match[2], reason: "hash_mismatch", expected: match[1], actual });
    }
  } catch (error) {
    failures.push({ line: index + 1, path: match[2], reason: "missing_or_unreadable", error: String(error) });
  }
}

const report = {
  status: failures.length === 0 ? "PASS" : "FAIL",
  manifest: path.relative(root, manifest).replaceAll(path.sep, "/"),
  entries: lines.length,
  total_bytes_excluding_manifest: totalBytes,
  failures,
};

process.stdout.write(`${JSON.stringify(report, null, 2)}\n`);
if (failures.length !== 0) process.exitCode = 1;
