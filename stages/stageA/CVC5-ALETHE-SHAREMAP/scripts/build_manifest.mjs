import { createHash } from 'node:crypto';
import { createReadStream } from 'node:fs';
import { readdir, writeFile } from 'node:fs/promises';
import path from 'node:path';
import process from 'node:process';

const [rootArg, manifestArg = 'HASH_MANIFEST.sha256'] = process.argv.slice(2);
if (!rootArg) throw new Error('usage: node build_manifest.mjs <root> [manifest-name]');
const root = path.resolve(rootArg);
const manifestPath = path.join(root, manifestArg);

async function walk(directory) {
  const entries = await readdir(directory, { withFileTypes: true });
  const files = [];
  for (const entry of entries) {
    const absolute = path.join(directory, entry.name);
    if (entry.isDirectory()) files.push(...await walk(absolute));
    else if (entry.isFile() && path.resolve(absolute) !== path.resolve(manifestPath)) files.push(absolute);
  }
  return files;
}

async function hashFile(file) {
  const hash = createHash('sha256');
  await new Promise((resolve, reject) => {
    const stream = createReadStream(file);
    stream.on('data', (chunk) => hash.update(chunk));
    stream.on('error', reject);
    stream.on('end', resolve);
  });
  return hash.digest('hex').toUpperCase();
}

const files = (await walk(root)).sort((a, b) => a.localeCompare(b, 'en'));
const lines = [];
for (const file of files) {
  const relative = path.relative(root, file).split(path.sep).join('/');
  lines.push(`${await hashFile(file)}  *${relative}`);
}
await writeFile(manifestPath, `${lines.join('\n')}\n`, 'utf8');
process.stdout.write(`${JSON.stringify({ manifest: manifestPath, entries: lines.length })}\n`);
