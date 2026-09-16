import fs from 'node:fs';
import crypto from 'node:crypto';
import { pipeline } from 'node:stream/promises';
import { Readable } from 'node:stream';

const [url, output, expectedSha256, expectedBytesText] = process.argv.slice(2);
if (!url || !output || !expectedSha256 || !expectedBytesText) {
  console.error('usage: node fetch_binary.mjs URL OUTPUT SHA256 BYTES');
  process.exit(2);
}

const expectedBytes = Number(expectedBytesText);
const response = await fetch(url, { redirect: 'follow' });
if (!response.ok || !response.body) {
  throw new Error(`HTTP ${response.status} ${response.statusText}`);
}
await pipeline(Readable.fromWeb(response.body), fs.createWriteStream(output, { flags: 'wx' }));
const stat = fs.statSync(output);
const actualSha256 = crypto.createHash('sha256').update(fs.readFileSync(output)).digest('hex').toUpperCase();
if (stat.size !== expectedBytes || actualSha256 !== expectedSha256.toUpperCase()) {
  throw new Error(`asset mismatch bytes=${stat.size}/${expectedBytes} sha256=${actualSha256}/${expectedSha256}`);
}
console.log(JSON.stringify({ url, output, bytes: stat.size, sha256: actualSha256 }));
