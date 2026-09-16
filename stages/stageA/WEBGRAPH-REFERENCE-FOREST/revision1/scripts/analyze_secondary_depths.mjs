import fs from 'node:fs';
import path from 'node:path';

if(process.argv.length!==5) throw new Error('usage: node analyze_secondary_depths.mjs PARENT_ROOT REVISION_ROOT OUTPUT_JSON');
const [parentRoot,revisionRoot,outputPath]=process.argv.slice(2);
function parse(line){const f=line.split('\t'),r={};for(let i=0;i<f.length;i+=2)r[f[i]]=f[i+1];return r;}
function tuple(refString){
  const refs=refString.split(',').map(Number),depths=[];
  let sum=0,max=0,nonzero=0;
  for(let i=0;i<refs.length;i++){
    const d=refs[i]===0?0:depths[i-refs[i]]+1;
    if(d>3) throw new Error(`depth violation at ${i}`);
    depths.push(d);sum+=d;max=Math.max(max,d);if(refs[i]!==0)nonzero++;
  }
  return {sum,max,nonzero};
}
const output={analyzer:'secondary-depth-mechanism-analyzer-v1',tie_tuple:'sum depth, max depth, lex delta',corpora:{}};
for(const corpus of ['cnr-2000','wiki-vote']){
  const oldLines=fs.readFileSync(path.join(parentRoot,'results','killer','natural',`${corpus}-candidate-audit.tsv`),'utf8').trim().split(/\r?\n/).map(parse);
  const newLines=fs.readFileSync(path.join(revisionRoot,'results','preclaim','natural',`${corpus}-candidate-audit.tsv`),'utf8').trim().split(/\r?\n/).map(parse);
  if(oldLines.length!==newLines.length) throw new Error(`${corpus} line mismatch`);
  const totals={baseline_sum_depth:0,parent_exact_sum_depth:0,revision_exact_sum_depth:0,baseline_nonzero_refs:0,parent_exact_nonzero_refs:0,revision_exact_nonzero_refs:0};
  let baselineMax=0,parentMax=0,revisionMax=0,changed=0;
  for(let i=0;i<newLines.length;i++){
    const b=tuple(newLines[i].baseline_refs),o=tuple(oldLines[i].exact_refs),n=tuple(newLines[i].exact_refs);
    totals.baseline_sum_depth+=b.sum;totals.parent_exact_sum_depth+=o.sum;totals.revision_exact_sum_depth+=n.sum;
    totals.baseline_nonzero_refs+=b.nonzero;totals.parent_exact_nonzero_refs+=o.nonzero;totals.revision_exact_nonzero_refs+=n.nonzero;
    baselineMax=Math.max(baselineMax,b.max);parentMax=Math.max(parentMax,o.max);revisionMax=Math.max(revisionMax,n.max);
    if(oldLines[i].exact_refs!==newLines[i].exact_refs) changed++;
    if(Number(newLines[i].secondary_sum_depth)!==n.sum||Number(newLines[i].secondary_max_depth)!==n.max) throw new Error(`${corpus} logged secondary mismatch at ${i}`);
  }
  output.corpora[corpus]={chunks:newLines.length,changed_equal_primary_chunks:changed,...totals,baseline_max_depth:baselineMax,parent_exact_max_depth:parentMax,revision_exact_max_depth:revisionMax,revision_vs_parent_sum_depth_delta:totals.revision_exact_sum_depth-totals.parent_exact_sum_depth,revision_vs_baseline_sum_depth_delta:totals.revision_exact_sum_depth-totals.baseline_sum_depth};
}
fs.writeFileSync(outputPath,JSON.stringify(output,null,2)+'\n');
