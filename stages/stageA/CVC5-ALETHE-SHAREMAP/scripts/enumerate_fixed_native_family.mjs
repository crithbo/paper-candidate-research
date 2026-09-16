import { spawn } from 'node:child_process';
import { createHash } from 'node:crypto';
import { mkdir, writeFile } from 'node:fs/promises';
import path from 'node:path';
import process from 'node:process';

const [cvc5Exe, inputFile, outputRoot, replayId = 'primary'] = process.argv.slice(2);
if (!cvc5Exe || !inputFile || !outputRoot) {
  throw new Error('usage: node enumerate_fixed_native_family.mjs <cvc5.exe> <input.smt2> <output-dir> [replay-id]');
}

const sha256 = (buffer) => createHash('sha256').update(buffer).digest('hex').toUpperCase();
const tokenCount = (text, token) => {
  const escaped = token.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  return (text.match(new RegExp(`(?<![A-Za-z0-9_])${escaped}(?![A-Za-z0-9_])`, 'g')) || []).length;
};

async function runThreshold(threshold) {
  const args = [
    '--dump-proofs',
    '--proof-format-mode=alethe',
    `--dag-thresh=${threshold}`,
    inputFile,
  ];
  const start = process.hrtime.bigint();
  const child = spawn(cvc5Exe, args, { windowsHide: true });
  const stdout = [];
  const stderr = [];
  child.stdout.on('data', (chunk) => stdout.push(chunk));
  child.stderr.on('data', (chunk) => stderr.push(chunk));
  const exitCode = await new Promise((resolve, reject) => {
    child.on('error', reject);
    child.on('close', resolve);
  });
  const elapsedNs = process.hrtime.bigint() - start;
  const out = Buffer.concat(stdout);
  const err = Buffer.concat(stderr);
  const text = out.toString('utf8');
  const fileName = `dag-thresh-${String(threshold).padStart(2, '0')}.alethe`;
  await writeFile(path.join(outputRoot, replayId, fileName), out);
  return {
    threshold,
    command: [cvc5Exe, ...args],
    exit_code: exitCode,
    wall_ns: elapsedNs.toString(),
    stdout_bytes: out.length,
    stdout_sha256: sha256(out),
    stderr_bytes: err.length,
    stderr_sha256: sha256(err),
    named_annotation_count: (text.match(/:named\s+@p_[0-9]+/g) || []).length,
    p10_token_count: tokenCount(text, '@p_10'),
    p12_token_count: tokenCount(text, '@p_12'),
    contains_fixed_long_term: text.includes('(= (not (ite d c false)) (not d))'),
    contains_fixed_short_term: text.includes('(not b)'),
    output_file: `${replayId}/${fileName}`,
  };
}

await mkdir(path.join(outputRoot, replayId), { recursive: true });
const rows = [];
for (let threshold = 0; threshold <= 64; threshold += 1) {
  rows.push(await runThreshold(threshold));
}

const behaviorGroups = new Map();
for (const row of rows) {
  const group = behaviorGroups.get(row.stdout_sha256) || [];
  group.push(row.threshold);
  behaviorGroups.set(row.stdout_sha256, group);
}

const highestThresholdWithNames = rows.reduce(
  (maximum, row) => (row.named_annotation_count > 0 ? row.threshold : maximum),
  -1,
);
const tailRows = rows.filter((row) => row.threshold > highestThresholdWithNames);

const summary = {
  schema: 'cvc5-fixed-native-family-enumeration-v1',
  replay_id: replayId,
  cvc5_executable: path.resolve(cvc5Exe),
  input_file: path.resolve(inputFile),
  threshold_domain: { min: 0, max: 64, inclusive: true },
  completeness_guard: 'Enumerate the closed integer range 0..64; derive the highest threshold with any native name; require every larger threshold to have zero names and threshold 64 to match sharing-disabled output.',
  highest_threshold_with_names: highestThresholdWithNames,
  rows,
  behavior_groups: [...behaviorGroups.entries()].map(([stdout_sha256, thresholds]) => ({ stdout_sha256, thresholds })),
  checks: {
    all_exit_zero: rows.every((row) => row.exit_code === 0),
    threshold_1_p10_count_is_3: rows[1].p10_token_count === 3,
    threshold_1_p12_count_is_2: rows[1].p12_token_count === 2,
    count_order_p10_gt_p12: rows[1].p10_token_count > rows[1].p12_token_count,
    tail_exists_after_highest_named_threshold: tailRows.length > 0,
    all_thresholds_after_highest_named_have_no_names: tailRows.every((row) => row.named_annotation_count === 0),
    threshold_64_matches_disabled: rows[64].stdout_sha256 === rows[0].stdout_sha256,
  },
};
summary.status = Object.values(summary.checks).every(Boolean) ? 'PASS_NATIVE_FAMILY_MECHANICAL_SUBGATE' : 'FAIL_CLOSED';
await writeFile(path.join(outputRoot, `native-family-${replayId}.json`), `${JSON.stringify(summary, null, 2)}\n`, 'utf8');
process.stdout.write(`${JSON.stringify({ replay_id: replayId, status: summary.status, distinct_raw_outputs: behaviorGroups.size, checks: summary.checks })}\n`);
