import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

if (process.argv.length !== 5) throw new Error('usage: node analyze_structural_domain.mjs TOPIC_ROOT SUMMARY_JSON DIVERGENCES_TSV');
const [root, summaryPath, divergencePath] = process.argv.slice(2);
const resultDir = path.join(root, 'results', 'killer', 'structural');
const inputDir = path.join(root, 'inputs', 'structural');
const auditLines = fs.readFileSync(path.join(resultDir, 'candidate-audit.tsv'), 'utf8').trim().split(/\r?\n/);
const metricLines = fs.readFileSync(path.join(resultDir, 'run-metrics.tsv'), 'utf8').trim().split(/\r?\n/);
if (auditLines.length !== 2048) throw new Error(`audit records ${auditLines.length} != 2048`);
if (metricLines.length !== 2049) throw new Error(`metric records ${metricLines.length - 1} != 2048`);

function parseAudit(line) {
  const fields = line.split('\t'), rec = {};
  for (let i = 0; i < fields.length; i += 2) rec[fields[i]] = fields[i + 1];
  return rec;
}
const metricHeader = metricLines[0].split('\t');
const metrics = metricLines.slice(1).map(line => Object.fromEntries(line.split('\t').map((value, i) => [metricHeader[i], value])));
function quantile(values, q) {
  const sorted = values.map(Number).sort((a,b) => a-b);
  return sorted[Math.ceil(q * sorted.length) - 1];
}

const records = [];
let strict = 0, ties = 0, same = 0, invalid = 0, changedNodes = 0;
let totalSavings = 0n, maxSavings = 0n, totalStates = 0n, totalTransitions = 0n;
for (let i = 0; i < 2048; i++) {
  const audit = parseAudit(auditLines[i]);
  const metric = metrics[i];
  const expectedId = `case-${String(i).padStart(4, '0')}`;
  if (metric.case_id !== expectedId) throw new Error(`metric order mismatch at ${i}`);
  const base = BigInt(audit.baseline_cost), exact = BigInt(audit.exact_cost), written = BigInt(metric.returned_bits);
  if (written !== exact) throw new Error(`writer/additivity mismatch at ${expectedId}`);
  if (exact > base) invalid++;
  const baseRefs = audit.baseline_refs.split(',').map(Number);
  const exactRefs = audit.exact_refs.split(',').map(Number);
  const different = baseRefs.some((x, j) => x !== exactRefs[j]);
  const changed = baseRefs.reduce((acc, x, j) => acc + Number(x !== exactRefs[j]), 0);
  changedNodes += changed;
  let classification = 'SAME';
  if (exact < base) {
    classification = 'STRICT_NATIVE_DIVERGENCE'; strict++;
    const saved = base - exact; totalSavings += saved; if (saved > maxSavings) maxSavings = saved;
  } else if (different) {
    classification = 'TIE_ONLY_DIFFERENT_VECTOR'; ties++;
  } else same++;
  totalStates += BigInt(audit.visited_states);
  totalTransitions += BigInt(audit.transitions);
  records.push({case_id: expectedId, classification, baseline_bits: base.toString(), exact_bits: exact.toString(), saved_bits: (base-exact).toString(), changed_nodes: changed, baseline_refs: audit.baseline_refs, exact_refs: audit.exact_refs});
}
if (invalid !== 0) throw new Error(`${invalid} cases have exact > baseline`);

const manifestLines = fs.readFileSync(path.join(inputDir, 'STRUCTURAL_DOMAIN_MANIFEST.sha256'), 'utf8').trim().split(/\r?\n/);
let manifestVerified = manifestLines.length === 2048;
for (const line of manifestLines) {
  const [expected, name] = line.split(/\s{2}/);
  const actual = crypto.createHash('sha256').update(fs.readFileSync(path.join(inputDir, name))).digest('hex').toUpperCase();
  if (actual !== expected) { manifestVerified = false; break; }
}
const fileNames = fs.readdirSync(path.join(resultDir, 'native-outputs'));
const outputBytes = fileNames.reduce((sum, name) => sum + fs.statSync(path.join(resultDir, 'native-outputs', name)).size, 0);
const strictRecords = records.filter(r => r.classification === 'STRICT_NATIVE_DIVERGENCE');
const elapsed = metrics.map(m => m.elapsed_ns), cpu = metrics.map(m => m.cpu_ns), rss = metrics.map(m => m.peak_working_set_bytes), build = metrics.map(m => m.build_ns);
const summary = {
  analyzer: 'structural-domain-analyzer-v1',
  domain_id: 'NATIVE-STRUCTURAL-DOMAIN-2048-V1',
  cases: 2048,
  input_manifest_verified: manifestVerified,
  all_native_writer_additivity_checks_passed: true,
  all_native_reader_checks_passed: metrics.every(m => m.exit_code === '0'),
  exact_never_worse_than_baseline: invalid === 0,
  strict_native_divergence_cases: strict,
  strict_native_divergence_rate: strict / 2048,
  tie_only_different_vector_cases: ties,
  identical_vector_cases: same,
  first_strict_case: strictRecords.length ? strictRecords[0].case_id : null,
  max_saved_bits_per_case: maxSavings.toString(),
  total_saved_bits_across_strict_cases: totalSavings.toString(),
  changed_reference_actions_across_all_cases: changedNodes,
  total_dp_visited_states: totalStates.toString(),
  total_dp_transitions: totalTransitions.toString(),
  execution: {
    elapsed_ns_p50: quantile(elapsed, 0.5), elapsed_ns_p90: quantile(elapsed, 0.9),
    cpu_ns_p50: quantile(cpu, 0.5), cpu_ns_p90: quantile(cpu, 0.9),
    peak_working_set_bytes_p50: quantile(rss, 0.5), peak_working_set_bytes_p90: quantile(rss, 0.9),
    native_build_ns_p50: quantile(build, 0.5), native_build_ns_p90: quantile(build, 0.9),
    native_output_file_count: fileNames.length,
    native_output_bytes: outputBytes
  }
};
fs.writeFileSync(summaryPath, JSON.stringify(summary, null, 2) + '\n');
const divLines = ['case_id\tclassification\tbaseline_bits\texact_bits\tsaved_bits\tchanged_nodes\tbaseline_refs\texact_refs'];
for (const rec of records.filter(r => r.classification !== 'SAME')) {
  divLines.push([rec.case_id,rec.classification,rec.baseline_bits,rec.exact_bits,rec.saved_bits,rec.changed_nodes,rec.baseline_refs,rec.exact_refs].join('\t'));
}
fs.writeFileSync(divergencePath, divLines.join('\n') + '\n');
