import { readFile, writeFile } from 'node:fs/promises';
import process from 'node:process';

const [primaryPath, replayPath, outputPath] = process.argv.slice(2);
if (!primaryPath || !replayPath || !outputPath) {
  throw new Error('usage: node validate_native_family_replay.mjs <primary.json> <replay.json> <output.json>');
}

const primary = JSON.parse(await readFile(primaryPath, 'utf8'));
const replay = JSON.parse(await readFile(replayPath, 'utf8'));
const stableRowKeys = [
  'threshold',
  'exit_code',
  'stdout_bytes',
  'stdout_sha256',
  'stderr_bytes',
  'stderr_sha256',
  'named_annotation_count',
  'p10_token_count',
  'p12_token_count',
  'contains_fixed_long_term',
  'contains_fixed_short_term',
];

const mismatches = [];
if (primary.rows.length !== replay.rows.length) {
  mismatches.push({ field: 'row_count', primary: primary.rows.length, replay: replay.rows.length });
}
for (let index = 0; index < Math.min(primary.rows.length, replay.rows.length); index += 1) {
  for (const key of stableRowKeys) {
    if (primary.rows[index][key] !== replay.rows[index][key]) {
      mismatches.push({ threshold: primary.rows[index].threshold, field: key, primary: primary.rows[index][key], replay: replay.rows[index][key] });
    }
  }
}
const primaryGroups = primary.behavior_groups.map((group) => ({ hash: group.stdout_sha256, thresholds: group.thresholds }));
const replayGroups = replay.behavior_groups.map((group) => ({ hash: group.stdout_sha256, thresholds: group.thresholds }));
if (JSON.stringify(primaryGroups) !== JSON.stringify(replayGroups)) {
  mismatches.push({ field: 'behavior_groups', primary: primaryGroups, replay: replayGroups });
}

const result = {
  schema: 'cvc5-native-family-replay-validator-v1',
  primary: primaryPath,
  replay: replayPath,
  stable_row_fields: stableRowKeys,
  volatile_fields_excluded: ['wall_ns', 'command_absolute_path', 'output_file', 'replay_id'],
  thresholds_compared: Math.min(primary.rows.length, replay.rows.length),
  mismatch_count: mismatches.length,
  mismatches,
  status: mismatches.length === 0 ? 'PASS' : 'FAIL_CLOSED',
};
await writeFile(outputPath, `${JSON.stringify(result, null, 2)}\n`, 'utf8');
process.stdout.write(`${JSON.stringify({ status: result.status, thresholds_compared: result.thresholds_compared, mismatch_count: result.mismatch_count })}\n`);
