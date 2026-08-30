import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

if (process.argv.length !== 3) throw new Error('usage: node generate_structural_domain.mjs OUTPUT_DIR');
const outDir = process.argv[2];
fs.mkdirSync(outDir, { recursive: true });
let state = 87041031 >>> 0;
function next() {
  state ^= state << 13; state ^= state >>> 17; state ^= state << 5;
  return state >>> 0;
}
function emit(caseId, lists) {
  const lines = ['# NATIVE-STRUCTURAL-DOMAIN-2048-V1 case ' + caseId];
  for (let i = 0; i < lists.length; i++) {
    const row = [...new Set(lists[i])].filter(v => v >= 0 && v < 24).sort((a,b) => a-b);
    lines.push(`${i}:${row.length ? row.join(',') : '-'}`);
  }
  fs.writeFileSync(path.join(outDir, `case-${String(caseId).padStart(4,'0')}.lists`), lines.join('\n') + '\n');
}
for (let id = 0; id < 2048; id++) {
  const stratum = Math.floor(id / 512);
  const lists = [];
  for (let i = 0; i < 24; i++) {
    let row = [];
    if (stratum === 0) {
      const center = (i + (next() % 3)) % 24;
      for (let k = -3; k <= 4; k++) if ((next() & 3) !== 0) row.push((center + k + 24) % 24);
    } else if (stratum === 1) {
      const len = 3 + ((i + (next() % 7)) % 10);
      for (let k = 0; k < len; k++) row.push((k + (id % 3)) % 24);
      if ((next() & 1) === 0) row.push((17 + i) % 24);
    } else if (stratum === 2) {
      const base = (i & 1) * 12;
      for (let k = 0; k < 12; k++) if ((next() % 5) !== 0) row.push(base + k);
      if ((next() & 3) === 0) row.push((base + 12 + (next() % 12)) % 24);
    } else {
      if ((i + id) % 7 !== 0) {
        const anchor = (next() % 24);
        for (let k = 0; k < 10; k++) if ((next() & 1) !== 0) row.push((anchor + k) % 24);
        if (i > 0 && (next() & 1) === 0) row.push(...lists[i - 1].slice(0, 4));
      }
    }
    lists.push(row);
  }
  emit(id, lists);
}
const names = fs.readdirSync(outDir).filter(name => /^case-\d{4}\.lists$/.test(name)).sort();
if (names.length !== 2048) throw new Error(`expected 2048 cases, found ${names.length}`);
const manifest = names.map(name => {
  const hash = crypto.createHash('sha256').update(fs.readFileSync(path.join(outDir, name))).digest('hex').toUpperCase();
  return `${hash}  ${name}`;
});
fs.writeFileSync(path.join(outDir, 'STRUCTURAL_DOMAIN_MANIFEST.sha256'), manifest.join('\n') + '\n');
