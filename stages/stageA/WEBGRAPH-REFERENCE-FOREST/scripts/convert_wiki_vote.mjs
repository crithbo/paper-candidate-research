import fs from 'node:fs';
import zlib from 'node:zlib';
import crypto from 'node:crypto';

if (process.argv.length !== 4) throw new Error('usage: node convert_wiki_vote.mjs RAW_GZ OUTPUT_LISTS');
const [rawPath, outputPath] = process.argv.slice(2);
const text = zlib.gunzipSync(fs.readFileSync(rawPath)).toString('utf8');
const edges = [];
const ids = new Set();
for (const raw of text.split(/\r?\n/)) {
  const line = raw.trim();
  if (!line || line.startsWith('#')) continue;
  const [uText, vText, ...rest] = line.split(/\s+/);
  if (rest.length) throw new Error(`unexpected columns: ${line}`);
  const u = Number(uText), v = Number(vText);
  if (!Number.isSafeInteger(u) || !Number.isSafeInteger(v)) throw new Error(`bad edge: ${line}`);
  edges.push([u, v]); ids.add(u); ids.add(v);
}
const ordered = [...ids].sort((a,b) => a-b);
const rank = new Map(ordered.map((id, i) => [id, i]));
const succ = Array.from({length: ordered.length}, () => new Set());
for (const [u, v] of edges) succ[rank.get(u)].add(rank.get(v));
let uniqueArcs = 0, selfLoops = 0;
const lines = ['# SNAP Wiki-Vote: ascending original-ID rank; exact duplicates removed; self-loops preserved'];
for (let i = 0; i < succ.length; i++) {
  const row = [...succ[i]].sort((a,b) => a-b);
  uniqueArcs += row.length;
  selfLoops += Number(row.includes(i));
  lines.push(`${i}:${row.length ? row.join(',') : '-'}`);
}
const body = lines.join('\n') + '\n';
fs.writeFileSync(outputPath, body);
const result = {
  raw_edge_rows: edges.length,
  nodes: ordered.length,
  unique_directed_arcs: uniqueArcs,
  duplicate_rows_removed: edges.length - uniqueArcs,
  self_loops_preserved: selfLoops,
  minimum_original_id: ordered[0],
  maximum_original_id: ordered.at(-1),
  output_sha256: crypto.createHash('sha256').update(body).digest('hex').toUpperCase()
};
fs.writeFileSync(outputPath + '.conversion.json', JSON.stringify(result, null, 2) + '\n');
