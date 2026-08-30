import fs from 'node:fs';
import path from 'node:path';

if (process.argv.length !== 5) {
  throw new Error('usage: node validate_preclaim_structural.mjs PARENT_ROOT REVISION_ROOT OUTPUT_JSON');
}
const [parentRoot, revisionRoot, outputPath] = process.argv.slice(2);
const parentAuditPath = path.join(parentRoot, 'results', 'killer', 'structural', 'candidate-audit.tsv');
const revisionDir = path.join(revisionRoot, 'results', 'preclaim', 'structural');
const revisionAuditPath = path.join(revisionDir, 'candidate-audit.tsv');
const metricsPath = path.join(revisionDir, 'run-metrics.tsv');

const parentLines = fs.readFileSync(parentAuditPath, 'utf8').trim().split(/\r?\n/);
const revisionLines = fs.readFileSync(revisionAuditPath, 'utf8').trim().split(/\r?\n/);
const metricLines = fs.readFileSync(metricsPath, 'utf8').trim().split(/\r?\n/);
if (parentLines.length !== 2048 || revisionLines.length !== 2048 || metricLines.length !== 2049) {
  throw new Error(`unexpected record counts parent=${parentLines.length} revision=${revisionLines.length} metrics=${metricLines.length - 1}`);
}
function parseAudit(line) {
  const fields = line.split('\t'), rec = {};
  for (let i = 0; i < fields.length; i += 2) rec[fields[i]] = fields[i + 1];
  return rec;
}
const header = metricLines[0].split('\t');
const metrics = metricLines.slice(1).map(line => Object.fromEntries(line.split('\t').map((v,i) => [header[i],v])));
let primaryMismatches = 0;
let writerMismatches = 0;
let exactWorse = 0;
let strict = 0;
let secondaryChangedChunks = 0;
let allDenseStateCount256 = true;
let maxRollingBytes = 0;
let maxBackpointerBytes = 0;
for (let i = 0; i < 2048; i++) {
  const before = parseAudit(parentLines[i]);
  const after = parseAudit(revisionLines[i]);
  const metric = metrics[i];
  if (metric.case_id !== `case-${String(i).padStart(4,'0')}`) throw new Error(`metric order mismatch at ${i}`);
  if (before.baseline_cost !== after.baseline_cost || before.exact_cost !== after.exact_cost) primaryMismatches++;
  if (after.exact_cost !== metric.returned_bits) writerMismatches++;
  if (BigInt(after.exact_cost) > BigInt(after.baseline_cost)) exactWorse++;
  if (BigInt(after.exact_cost) < BigInt(after.baseline_cost)) strict++;
  if (before.exact_refs !== after.exact_refs) secondaryChangedChunks++;
  if (Number(after.dense_state_count) !== 256) allDenseStateCount256 = false;
  maxRollingBytes = Math.max(maxRollingBytes, Number(after.rolling_array_bytes));
  maxBackpointerBytes = Math.max(maxBackpointerBytes, Number(after.compact_backpointer_bytes));
}
const case43Before = parseAudit(parentLines[43]);
const case43After = parseAudit(revisionLines[43]);
const result = {
  validator: 'revision-preclaim-structural-primary-parity-v1',
  cases: 2048,
  parent_primary_totals_compared: 2048,
  primary_cost_pair_mismatches: primaryMismatches,
  writer_additivity_mismatches: writerMismatches,
  exact_worse_cases: exactWorse,
  strict_primary_divergence_cases: strict,
  secondary_vector_changed_chunks: secondaryChangedChunks,
  case_0043: {
    parent_baseline_bits: Number(case43Before.baseline_cost),
    parent_exact_bits: Number(case43Before.exact_cost),
    revision_baseline_bits: Number(case43After.baseline_cost),
    revision_exact_bits: Number(case43After.exact_cost)
  },
  dense_state_count_256_all_chunks: allDenseStateCount256,
  max_rolling_array_bytes: maxRollingBytes,
  max_compact_backpointer_bytes: maxBackpointerBytes,
  all_processes_exit_zero: metrics.every(x => x.exit_code === '0'),
  all_native_semantics_and_reader_checks_passed_by_harness: metrics.every(x => x.exit_code === '0'),
  pass: primaryMismatches === 0 && writerMismatches === 0 && exactWorse === 0 && strict === 531
    && Number(case43After.baseline_cost) === 561 && Number(case43After.exact_cost) === 560
    && allDenseStateCount256 && metrics.every(x => x.exit_code === '0')
};
fs.writeFileSync(outputPath, JSON.stringify(result, null, 2) + '\n');
if (!result.pass) process.exitCode = 1;
