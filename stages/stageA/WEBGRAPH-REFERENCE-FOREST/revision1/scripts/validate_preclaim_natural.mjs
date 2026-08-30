import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

if (process.argv.length !== 5) throw new Error('usage: node validate_preclaim_natural.mjs PARENT_ROOT REVISION_ROOT OUTPUT_JSON');
const [parentRoot, revisionRoot, outputPath] = process.argv.slice(2);
const resultDir = path.join(revisionRoot, 'results', 'preclaim', 'natural');
const lines = fs.readFileSync(path.join(resultDir, 'run-metrics.tsv'), 'utf8').trim().split(/\r?\n/);
const header = lines[0].split('\t');
const rows = lines.slice(1).map(line => Object.fromEntries(line.split('\t').map((v,i) => [header[i],v])));
if (rows.length !== 4) throw new Error(`expected four tracks, got ${rows.length}`);
const byKey = Object.fromEntries(rows.map(x => [`${x.corpus}/${x.variant}`,x]));
const expectedBits = {
  'cnr-2000/baseline': 9319309,
  'cnr-2000/candidate': 8763554,
  'wiki-vote/baseline': 876503,
  'wiki-vote/candidate': 875555
};
function sha(file) { return crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex').toUpperCase(); }
const hashRows = [];
let baselineHashMismatches = 0;
for (const corpus of ['cnr-2000','wiki-vote']) {
  for (const variant of ['baseline','candidate']) {
    for (const ext of ['graph','offsets','properties','ef']) {
      const revisionFile = path.join(resultDir, `${corpus}-${variant}.${ext}`);
      const revisionSha = sha(revisionFile);
      let parentSha = null;
      let matchesParent = null;
      if (variant === 'baseline') {
        const parentFile = path.join(parentRoot, 'results', 'killer', 'natural', `${corpus}-${variant}.${ext}`);
        parentSha = sha(parentFile);
        matchesParent = revisionSha === parentSha;
        if (!matchesParent) baselineHashMismatches++;
      }
      hashRows.push({corpus,variant,extension:ext,bytes:fs.statSync(revisionFile).size,sha256:revisionSha,parent_sha256:parentSha,matches_parent:matchesParent});
    }
  }
}
function parseAudit(line) {
  const fields = line.split('\t'), rec={};
  for(let i=0;i<fields.length;i+=2) rec[fields[i]]=fields[i+1];
  return rec;
}
const auditParity = {};
let totalChangedEqualPrimaryChunks = 0;
for (const corpus of ['cnr-2000','wiki-vote']) {
  const parentLines = fs.readFileSync(path.join(parentRoot,'results','killer','natural',`${corpus}-candidate-audit.tsv`),'utf8').trim().split(/\r?\n/);
  const revisionLines = fs.readFileSync(path.join(resultDir,`${corpus}-candidate-audit.tsv`),'utf8').trim().split(/\r?\n/);
  if (parentLines.length !== revisionLines.length) throw new Error(`${corpus} audit count mismatch`);
  let primaryMismatch=0, changedEqualPrimary=0, denseMismatch=0;
  for(let i=0;i<parentLines.length;i++) {
    const before=parseAudit(parentLines[i]), after=parseAudit(revisionLines[i]);
    if(before.baseline_cost!==after.baseline_cost || before.exact_cost!==after.exact_cost) primaryMismatch++;
    if(before.exact_refs!==after.exact_refs) {
      if(before.exact_cost===after.exact_cost) changedEqualPrimary++; else primaryMismatch++;
    }
    if(Number(after.dense_state_count)!==256) denseMismatch++;
  }
  totalChangedEqualPrimaryChunks += changedEqualPrimary;
  auditParity[corpus] = {chunks:parentLines.length,primary_cost_mismatches:primaryMismatch,changed_equal_primary_chunks:changedEqualPrimary,dense_state_count_mismatches:denseMismatch};
}
const payload = {};
for(const corpus of ['cnr-2000','wiki-vote']) {
  const totals={};
  for(const variant of ['baseline','candidate']) {
    totals[variant]=['graph','offsets','properties'].reduce((s,ext)=>s+fs.statSync(path.join(resultDir,`${corpus}-${variant}.${ext}`)).size,0);
  }
  payload[corpus]={baseline_bytes:totals.baseline,candidate_bytes:totals.candidate,residual_bytes:totals.baseline-totals.candidate};
}
const allBits = Object.entries(expectedBits).every(([k,v]) => Number(byKey[k].returned_bits)===v);
const allChecksums = ['cnr-2000','wiki-vote'].every(c => byKey[`${c}/baseline`].query_checksum===byKey[`${c}/candidate`].query_checksum);
const allExitZero = rows.every(x => x.exit_code==='0');
const primaryParity = Object.values(auditParity).every(x => x.primary_cost_mismatches===0 && x.dense_state_count_mismatches===0);
const result={
  validator:'revision-preclaim-natural-exact-parity-v1',
  non_claim_bearing:true,
  expected_graph_bits_exact_match:allBits,
  all_processes_exit_zero:allExitZero,
  sequential_random_offsets_ef_checks_passed_by_harness:allExitZero,
  baseline_native_hashes_match_parent:baselineHashMismatches===0,
  baseline_hash_mismatches:baselineHashMismatches,
  fixed_query_checksums_equal:allChecksums,
  audit_primary_parity:primaryParity,
  total_changed_equal_primary_chunks:totalChangedEqualPrimaryChunks,
  audit_parity:auditParity,
  persisted_payload:payload,
  output_hashes:hashRows,
  // The gate freezes exact graph-bit totals and requires each persistent
  // residual to remain strict. Equal-bit tie choices may legitimately change
  // offsets/properties bytes, so exact equality to the parent's byte residual
  // is neither frozen nor used as a fidelity condition.
  pass:allBits && allExitZero && baselineHashMismatches===0 && allChecksums && primaryParity
    && payload['cnr-2000'].residual_bytes>0 && payload['wiki-vote'].residual_bytes>0
};
fs.writeFileSync(outputPath,JSON.stringify(result,null,2)+'\n');
if(!result.pass) process.exitCode=1;
