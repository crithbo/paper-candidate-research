import fs from 'node:fs';
import path from 'node:path';

if (process.argv.length !== 4) throw new Error('usage: node analyze_claim_matched_pairs.mjs REVISION_ROOT OUTPUT_JSON');
const [revisionRoot, outputPath] = process.argv.slice(2);
const rawPath = path.join(revisionRoot,'results','claim','matched','matched-pair-raw.tsv');
const lines=fs.readFileSync(rawPath,'utf8').trim().split(/\r?\n/);
const header=lines[0].split('\t');
const rows=lines.slice(1).map(line=>Object.fromEntries(line.split('\t').map((v,i)=>[header[i],v])));
if(rows.length!==44) throw new Error(`expected 44 variant runs, got ${rows.length}`);
const numeric=['pair_index','order_position','exit_code','elapsed_ns','cpu_ns','peak_working_set_bytes','returned_bits','reader_exit_code','reader_process_elapsed_ns','reader_process_cpu_ns','reader_peak_working_set_bytes','reader_sequential_full_decode_ns','reader_random_100k_ns','native_payload_bytes'];
for(const row of rows) for(const key of numeric) row[key]=Number(row[key]);
const lowerMedian=v=>{const s=[...v].sort((a,b)=>a-b);return s[Math.floor((s.length-1)/2)];};
const nearestP90=v=>{const s=[...v].sort((a,b)=>a-b);return s[Math.ceil(.9*s.length)-1];};
const q=(v,kind)=>kind==='p50'?lowerMedian(v):nearestP90(v);
const ratio=(a,b)=>b===0?(a===0?1:Number.POSITIVE_INFINITY):a/b;
const expectedBits={'cnr-2000':{baseline:9319309,candidate:8763554},'wiki-vote':{baseline:876503,candidate:875555}};
const dimensions={
  end_to_end_elapsed_ns:'elapsed_ns',
  process_cpu_ns:'cpu_ns',
  peak_working_set_bytes:'peak_working_set_bytes',
  sequential_full_decode_ns:'reader_sequential_full_decode_ns',
  random_100k_ns:'reader_random_100k_ns'
};
const corpusResults={};
const failures=[];
for(const corpus of ['cnr-2000','wiki-vote']) {
  const all=rows.filter(r=>r.corpus===corpus);
  const analyzed=all.filter(r=>r.pair_index!==0);
  const base=analyzed.filter(r=>r.variant==='baseline');
  const cand=analyzed.filter(r=>r.variant==='candidate');
  if(base.length!==10||cand.length!==10) throw new Error(`${corpus} analyzed counts wrong`);
  const ratios={};
  for(const [label,key] of Object.entries(dimensions)) {
    const baselineValues=base.map(r=>r[key]);
    const candidateValues=cand.map(r=>r[key]);
    const paired=[];
    for(let pair=1;pair<=10;pair++) {
      const b=base.find(r=>r.pair_index===pair), c=cand.find(r=>r.pair_index===pair);
      paired.push(ratio(c[key],b[key]));
    }
    const p50Ratio=ratio(q(candidateValues,'p50'),q(baselineValues,'p50'));
    const p90Ratio=ratio(q(candidateValues,'p90'),q(baselineValues,'p90'));
    ratios[label]={
      baseline_p50:q(baselineValues,'p50'), baseline_p90:q(baselineValues,'p90'),
      candidate_p50:q(candidateValues,'p50'), candidate_p90:q(candidateValues,'p90'),
      candidate_over_baseline_p50:p50Ratio, candidate_over_baseline_p90:p90Ratio,
      paired_ratio_p50:lowerMedian(paired), paired_ratio_p90:nearestP90(paired)
    };
    if(p50Ratio>1.05) failures.push({corpus,dimension:label,statistic:'p50',ratio:p50Ratio});
    if(p90Ratio>1.05) failures.push({corpus,dimension:label,statistic:'p90',ratio:p90Ratio});
  }
  const basePayload=base[0].native_payload_bytes, candPayload=cand[0].native_payload_bytes;
  const deterministic={
    baseline_graph_bits:base[0].returned_bits,
    candidate_graph_bits:cand[0].returned_bits,
    graph_bits_ratio:cand[0].returned_bits/base[0].returned_bits,
    baseline_native_payload_bytes:basePayload,
    candidate_native_payload_bytes:candPayload,
    native_payload_ratio:candPayload/basePayload,
    native_payload_residual_bytes:basePayload-candPayload
  };
  if(deterministic.graph_bits_ratio>1.05) failures.push({corpus,dimension:'graph_bits',statistic:'deterministic',ratio:deterministic.graph_bits_ratio});
  if(deterministic.native_payload_ratio>1.05) failures.push({corpus,dimension:'native_payload_bytes',statistic:'deterministic',ratio:deterministic.native_payload_ratio});
  if(deterministic.native_payload_residual_bytes<=0) failures.push({corpus,dimension:'strict_payload_residual',statistic:'deterministic',ratio:null});
  const hashStability={};
  for(const variant of ['baseline','candidate']) {
    const vr=all.filter(r=>r.variant===variant);
    hashStability[variant]={};
    for(const key of ['graph_sha256','offsets_sha256','properties_sha256','ef_sha256']) {
      hashStability[variant][key]=[...new Set(vr.map(r=>r[key]))];
    }
  }
  const hashesStable=Object.values(hashStability).every(v=>Object.values(v).every(a=>a.length===1));
  const harnessChecksums=Array.from({length:11},(_,pair)=>{
    const b=all.find(r=>r.pair_index===pair&&r.variant==='baseline');
    const c=all.find(r=>r.pair_index===pair&&r.variant==='candidate');
    return b.harness_query_checksum===c.harness_query_checksum
      && b.reader_sequential_checksum===c.reader_sequential_checksum
      && b.reader_random_checksum===c.reader_random_checksum;
  }).every(Boolean);
  const expectedExact=all.every(r=>r.returned_bits===expectedBits[corpus][r.variant]);
  const allExitZero=all.every(r=>r.exit_code===0&&r.reader_exit_code===0);
  corpusResults[corpus]={pairs_total:11,warmup_pair_excluded:0,analyzed_pairs:10,deterministic,ratios,hash_stability:hashStability,all_hashes_stable:hashesStable,all_checksums_equal:harnessChecksums,all_expected_exact_bits:expectedExact,all_processes_exit_zero:allExitZero};
}
const fidelityValid=Object.values(corpusResults).every(x=>x.all_hashes_stable&&x.all_checksums_equal&&x.all_expected_exact_bits&&x.all_processes_exit_zero);
const decision=!fidelityValid?'INCONCLUSIVE_POLICY_HOLD':failures.length===0?'PASS_RECOMMENDED':'STOP_NARROW_FROZEN_MECHANISM';
const summary={
  analyzer:'matched-pair-full-cost-analyzer-v1',
  scientific_revision_consumed:true,
  ceiling_each_dimension:1.05,
  ratio_method:'candidate p50 / baseline p50 and candidate nearest-rank p90 / baseline nearest-rank p90; paired-ratio distribution supplemental',
  fidelity_valid:fidelityValid,
  corpus_results:corpusResults,
  ceiling_failures:failures,
  all_frozen_dimensions_pass:failures.length===0,
  decision,
  stop_boundary:decision==='STOP_NARROW_FROZEN_MECHANISM'?'FIXED_W4_D3_TWO_NATURAL_GRAPH_COMPLETE_ACTION_EXACT_OPTIMIZER_UNDER_NO_REGRESSION_FULL_COST_RULE':null,
  claim_ceiling:decision==='PASS_RECOMMENDED'?'PRELIMINARY_SUPPORT':'NEGATIVE_KILL_ONLY_FOR_NARROW_FROZEN_MECHANISM'
};
fs.writeFileSync(outputPath,JSON.stringify(summary,null,2)+'\n');
const ratioLines=['corpus\tdimension\tbaseline_p50\tcandidate_p50\tratio_p50\tbaseline_p90\tcandidate_p90\tratio_p90\tpaired_ratio_p50\tpaired_ratio_p90\tceiling'];
for(const [corpus,c] of Object.entries(corpusResults)) for(const [dimension,r] of Object.entries(c.ratios)) ratioLines.push([corpus,dimension,r.baseline_p50,r.candidate_p50,r.candidate_over_baseline_p50,r.baseline_p90,r.candidate_p90,r.candidate_over_baseline_p90,r.paired_ratio_p50,r.paired_ratio_p90,1.05].join('\t'));
fs.writeFileSync(path.join(path.dirname(outputPath),'full-cost-ratios.tsv'),ratioLines.join('\n')+'\n');
if(!fidelityValid) process.exitCode=2;
