import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';

if (process.argv.length !== 5) throw new Error('usage: node pad_native_graph.mjs RAW_GRAPH RAW_PROPERTIES OUTPUT_BASENAME');
const [graphPath, propertiesPath, outputBase] = process.argv.slice(2);
fs.mkdirSync(path.dirname(outputBase), {recursive: true});
const raw = fs.readFileSync(graphPath);
const padBytes = (4 - (raw.length % 4)) % 4;
const padded = Buffer.concat([raw, Buffer.alloc(padBytes)]);
fs.writeFileSync(outputBase + '.graph', padded);
fs.copyFileSync(propertiesPath, outputBase + '.properties');
const info = {
  raw_bytes: raw.length,
  zero_padding_bytes_added: padBytes,
  padded_bytes: padded.length,
  graph_bits_or_successor_lists_changed: false,
  padded_graph_sha256: crypto.createHash('sha256').update(padded).digest('hex').toUpperCase()
};
fs.writeFileSync(outputBase + '.padding.json', JSON.stringify(info, null, 2) + '\n');
