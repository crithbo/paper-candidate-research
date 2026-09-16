import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

if (process.argv.length !== 4) throw new Error('usage: node analyze_natural_killer.mjs TOPIC_ROOT OUTPUT_JSON');
const [root, outputPath] = process.argv.slice(2);
const dir = path.join(root, 'results', 'killer', 'natural');
const metricLines = fs.readFileSync(path.join(dir, 'natural-run-metrics.tsv'), 'utf8').trim().split(/\r?\n/);
const header = metricLines[0].split('\t');
const metrics = metricLines.slice(1).map(line => Object.fromEntries(line.split('\t').map((v,i) => [header[i],v])));
function sha(file) { return crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex').toUpperCase(); }
function parseAudit(file) {
  const lines = fs.readFileSync(file, 'utf8').trim().split(/\r?\n/);
  let baseline = 0n, exact = 0n, strict = 0, ties = 0, same = 0, states = 0n, transitions = 0n;
  for (const line of lines) {
    const f = line.split('\t'), r = {};
    for (let i=0;i<f.length;i+=2) r[f[i]]=f[i+1];
    const b=BigInt(r.baseline_cost), e=BigInt(r.exact_cost);
    baseline += b; exact += e; states += BigInt(r.visited_states); transitions += BigInt(r.transitions);
    if (e < b) strict++;
    else if (r.baseline_refs !== r.exact_refs) ties++;
    else same++;
  }
  return {chunks:lines.length, baseline_sum_bits:baseline.toString(), exact_sum_bits:exact.toString(), strict_chunks:strict, tie_only_chunks:ties, identical_chunks:same, visited_states:states.toString(), transitions:transitions.toString()};
}
const result = { analyzer:'natural-killer-analyzer-v1', corpora:{} };
for (const corpus of ['cnr-2000','wiki-vote']) {
  const base = metrics.find(x => x.corpus===corpus && x.variant==='baseline');
  const cand = metrics.find(x => x.corpus===corpus && x.variant==='candidate');
  if (!base || !cand) throw new Error(`missing metrics for ${corpus}`);
  const extensions = ['graph','offsets','properties','ef'];
  const files = {};
  for (const variant of ['baseline','candidate']) {
    files[variant] = {};
    for (const ext of extensions) {
      const file = path.join(dir, `${corpus}-${variant}.${ext}`);
      files[variant][ext] = {bytes:fs.statSync(file).size,sha256:sha(file)};
    }
  }
  const audit = parseAudit(path.join(dir, `${corpus}-candidate-audit.tsv`));
  if (audit.baseline_sum_bits !== base.returned_bits || audit.exact_sum_bits !== cand.returned_bits) throw new Error(`audit sum mismatch ${corpus}`);
  const basePayload = files.baseline.graph.bytes + files.baseline.offsets.bytes + files.baseline.properties.bytes;
  const candPayload = files.candidate.graph.bytes + files.candidate.offsets.bytes + files.candidate.properties.bytes;
  const baseWithEf = basePayload + files.baseline.ef.bytes, candWithEf = candPayload + files.candidate.ef.bytes;
  result.corpora[corpus] = {
    nodes:Number(base.nodes), arcs:Number(base.arcs),
    baseline_bits:base.returned_bits, candidate_bits:cand.returned_bits,
    bit_residual:(BigInt(base.returned_bits)-BigInt(cand.returned_bits)).toString(),
    native_payload_bytes_baseline:basePayload, native_payload_bytes_candidate:candPayload,
    native_payload_residual_bytes:basePayload-candPayload,
    native_payload_residual_fraction:(basePayload-candPayload)/basePayload,
    native_payload_plus_ef_residual_bytes:baseWithEf-candWithEf,
    elapsed_ns_baseline:Number(base.elapsed_ns), elapsed_ns_candidate:Number(cand.elapsed_ns),
    elapsed_ratio_candidate_over_baseline:Number(cand.elapsed_ns)/Number(base.elapsed_ns),
    cpu_ns_baseline:Number(base.cpu_ns), cpu_ns_candidate:Number(cand.cpu_ns),
    peak_rss_baseline:Number(base.peak_working_set_bytes), peak_rss_candidate:Number(cand.peak_working_set_bytes),
    initial_reader_checksum_equal:base.query_checksum===cand.query_checksum,
    audit, files
  };
}
result.both_natural_graphs_have_strict_persistent_payload_residual = Object.values(result.corpora).every(x => x.native_payload_residual_bytes > 0);
result.optimizer_speedup_claim_permitted = false;
fs.writeFileSync(outputPath, JSON.stringify(result,null,2)+'\n');
