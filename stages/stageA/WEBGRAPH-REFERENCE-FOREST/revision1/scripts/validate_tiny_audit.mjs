import fs from 'node:fs';

if (process.argv.length !== 4) {
  throw new Error('usage: node validate_tiny_audit.mjs AUDIT_TSV OUTPUT_JSON');
}
const [auditPath, outputPath] = process.argv.slice(2);
const records = fs.readFileSync(auditPath, 'utf8').trim().split(/\r?\n/);
if (records.length !== 1) throw new Error(`expected one audit record, found ${records.length}`);

const fields = records[0].split('\t');
const rec = {};
for (let i = 0; i < fields.length; i += 2) rec[fields[i]] = fields[i + 1];
for (const required of ['n','W','D','baseline_cost','exact_cost','secondary_sum_depth','secondary_max_depth','baseline_refs','exact_refs','action_costs']) {
  if (!(required in rec)) throw new Error(`missing ${required}`);
}
const n = Number(rec.n), W = Number(rec.W), D = Number(rec.D);
const costs = rec.action_costs.split(';').map(row => row.split(',').map(x => x === 'X' ? null : BigInt(x)));
const exactRefs = rec.exact_refs.split(',').map(Number);
const baselineRefs = rec.baseline_refs.split(',').map(Number);
if (costs.length !== n || exactRefs.length !== n || baselineRefs.length !== n) throw new Error('vector length mismatch');

function vectorCost(refs) {
  let total = 0n;
  const depths = [];
  let sumDepth = 0;
  let maxDepth = 0;
  for (let i = 0; i < refs.length; i++) {
    const delta = refs[i];
    if (delta < 0 || delta >= costs[i].length || costs[i][delta] === null) throw new Error(`illegal action ${delta} at ${i}`);
    const depth = delta === 0 ? 0 : depths[i - delta] + 1;
    if (depth > D) throw new Error(`depth violation at ${i}`);
    depths.push(depth);
    sumDepth += depth;
    maxDepth = Math.max(maxDepth, depth);
    total += costs[i][delta];
  }
  return { cost: total, sumDepth, maxDepth, depths };
}

let enumerated = 0n;
let bestCost = null;
let bestSumDepth = null;
let bestMaxDepth = null;
let bestRefs = null;
function lexLess(a, b) {
  if (b === null) return true;
  for (let i = 0; i < a.length; i++) {
    if (a[i] !== b[i]) return a[i] < b[i];
  }
  return false;
}
function visit(i, depths, refs, total, sumDepth, maxDepth) {
  if (i === n) {
    enumerated++;
    const better = bestCost === null
      || total < bestCost
      || (total === bestCost && sumDepth < bestSumDepth)
      || (total === bestCost && sumDepth === bestSumDepth && maxDepth < bestMaxDepth)
      || (total === bestCost && sumDepth === bestSumDepth && maxDepth === bestMaxDepth && lexLess(refs, bestRefs));
    if (better) {
      bestCost = total;
      bestSumDepth = sumDepth;
      bestMaxDepth = maxDepth;
      bestRefs = refs.slice();
    }
    return;
  }
  for (let delta = 0; delta < costs[i].length; delta++) {
    if (costs[i][delta] === null) continue;
    const depth = delta === 0 ? 0 : depths[i - delta] + 1;
    if (depth > D) continue;
    depths.push(depth); refs.push(delta);
    visit(i + 1, depths, refs, total + costs[i][delta], sumDepth + depth, Math.max(maxDepth, depth));
    refs.pop(); depths.pop();
  }
}
visit(0, [], [], 0n, 0, 0);

const candidateCost = vectorCost(exactRefs);
const baselineCost = vectorCost(baselineRefs);
const pass = bestCost === BigInt(rec.exact_cost)
  && candidateCost.cost === bestCost
  && candidateCost.sumDepth === bestSumDepth
  && candidateCost.maxDepth === bestMaxDepth
  && candidateCost.sumDepth === Number(rec.secondary_sum_depth)
  && candidateCost.maxDepth === Number(rec.secondary_max_depth)
  && baselineCost.cost === BigInt(rec.baseline_cost)
  && JSON.stringify(bestRefs) === JSON.stringify(exactRefs);
const result = {
  validator: 'independent-node-exhaustive-secondary-tuple-v2', n, W, D,
  legal_forests_enumerated: enumerated.toString(),
  exhaustive_optimum_bits: bestCost.toString(),
  exhaustive_secondary_sum_depth: bestSumDepth,
  exhaustive_secondary_max_depth: bestMaxDepth,
  exhaustive_secondary_lexicographic_refs: bestRefs,
  candidate_optimum_bits: rec.exact_cost,
  candidate_secondary_sum_depth: candidateCost.sumDepth,
  candidate_secondary_max_depth: candidateCost.maxDepth,
  candidate_refs: exactRefs,
  final_bvcompz_bits: rec.baseline_cost,
  final_bvcompz_refs: baselineRefs,
  candidate_vector_legal: true,
  baseline_vector_legal: true,
  exact_cost_and_tie_match: pass
};
fs.writeFileSync(outputPath, JSON.stringify(result, null, 2) + '\n');
if (!pass) process.exitCode = 1;
