import fs from 'node:fs';
import path from 'node:path';
if(process.argv.length!==4)throw new Error('usage: node analyze_reader_replay.mjs REPLAY_DIR OUTPUT_JSON');
const [dir,out]=process.argv.slice(2);
function q(v,p){const s=[...v].sort((a,b)=>a-b);return s[Math.ceil(p*s.length)-1]}
const tracks=['cnr-2000-baseline','cnr-2000-candidate','wiki-vote-baseline','wiki-vote-candidate'];
const data={analyzer:'reader-replay-analyzer-v1',warmup_repeat_excluded:0,repeats_analyzed:10,tracks:{}};
for(const track of tracks){
 const lines=fs.readFileSync(path.join(dir,track+'.tsv'),'utf8').trim().split(/\r?\n/); const h=lines[0].split('\t');
 const rows=lines.slice(2).map(line=>Object.fromEntries(line.split('\t').map((v,i)=>[h[i],v])));
 if(rows.length!==10)throw new Error(`${track} rows ${rows.length}`);
 const seq=rows.map(r=>Number(r.sequential_full_decode_ns)),rnd=rows.map(r=>Number(r.random_100k_ns));
 data.tracks[track]={sequential_full_decode_ns_p50:q(seq,.5),sequential_full_decode_ns_p90:q(seq,.9),random_100k_ns_p50:q(rnd,.5),random_100k_ns_p90:q(rnd,.9),sequential_checksum:rows[0].sequential_checksum,random_checksum:rows[0].random_checksum,checksums_stable:rows.every(r=>r.sequential_checksum===rows[0].sequential_checksum&&r.random_checksum===rows[0].random_checksum)};
}
data.comparisons={};
for(const corpus of ['cnr-2000','wiki-vote']){
 const b=data.tracks[corpus+'-baseline'],c=data.tracks[corpus+'-candidate'];
 data.comparisons[corpus]={checksums_equal:b.sequential_checksum===c.sequential_checksum&&b.random_checksum===c.random_checksum,sequential_p50_ratio:c.sequential_full_decode_ns_p50/b.sequential_full_decode_ns_p50,sequential_p90_ratio:c.sequential_full_decode_ns_p90/b.sequential_full_decode_ns_p90,random_p50_ratio:c.random_100k_ns_p50/b.random_100k_ns_p50,random_p90_ratio:c.random_100k_ns_p90/b.random_100k_ns_p90};
}
fs.writeFileSync(out,JSON.stringify(data,null,2)+'\n');
