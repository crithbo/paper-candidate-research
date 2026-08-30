"use strict";

// Non-claim-bearing preclaim control.  This file deliberately implements an
// independent minimal binary-AIGER 1.9 writer/reader for the frozen six-AND
// witness.  It does not replace the required native AIGER/Yosys/ABC tools.

const fs = require("fs");
const path = require("path");
const crypto = require("crypto");
const startHr = process.hrtime.bigint();
const startCpu = process.cpuUsage();

const OUT = path.resolve(__dirname, "..", "artifacts", "witness_control");
fs.mkdirSync(OUT, { recursive: true });

const inputs = Object.fromEntries(Array.from({ length: 63 }, (_, i) => [`p${i + 1}`, 2 * (i + 1)]));
const gates = {
  g1: ["p1", "p2"],
  g2: ["p60", "p61"],
  g3: ["p62", "p63"],
  g5: ["p58", "p59"],
  g4: ["g1", "g2"],
  g6: ["g4", "g5"],
};
const outputs = ["g6", "g3"];
const namedSchedules = {
  S1: ["g1", "g2", "g4", "g5", "g6", "g3"],
  S2: ["g2", "g5", "g3", "g1", "g4", "g6"],
};

function uleb(value) {
  if (!Number.isSafeInteger(value) || value < 0) throw new Error(`invalid ULEB128 value ${value}`);
  const bytes = [];
  do {
    let byte = value & 0x7f;
    value = Math.floor(value / 128);
    if (value) byte |= 0x80;
    bytes.push(byte);
  } while (value);
  return Buffer.from(bytes);
}

function readUleb(buf, offset) {
  let value = 0;
  let multiplier = 1;
  let pos = offset;
  while (true) {
    if (pos >= buf.length) throw new Error("truncated ULEB128");
    const byte = buf[pos++];
    value += (byte & 0x7f) * multiplier;
    if (!(byte & 0x80)) return [value, pos];
    multiplier *= 128;
    if (!Number.isSafeInteger(multiplier)) throw new Error("ULEB128 overflow");
  }
}

function legal(order) {
  if (new Set(order).size !== Object.keys(gates).length) return false;
  const rank = Object.fromEntries(order.map((g, i) => [g, i]));
  return order.every((g) => gates[g].every((f) => inputs[f] || rank[f] < rank[g]));
}

function emit(order) {
  if (!legal(order)) throw new Error(`illegal schedule ${order.join(",")}`);
  const literal = { ...inputs };
  order.forEach((g, i) => { literal[g] = 2 * (63 + i + 1); });
  const header = Buffer.from("aig 69 63 0 2 6\n", "ascii");
  const roots = Buffer.from(outputs.map((g) => `${literal[g]}\n`).join(""), "ascii");
  const chunks = [];
  const rows = [];
  for (const g of order) {
    const lhs = literal[g];
    const rhs = gates[g].map((f) => literal[f]).sort((a, b) => b - a);
    const d0 = lhs - rhs[0];
    const d1 = rhs[0] - rhs[1];
    const b0 = uleb(d0);
    const b1 = uleb(d1);
    chunks.push(b0, b1);
    rows.push({ gate: g, lhs, rhs, deltas: [d0, d1], bytes: b0.length + b1.length });
  }
  const payload = Buffer.concat(chunks);
  return { buffer: Buffer.concat([header, roots, payload]), payload, rows, literal };
}

function readLine(buf, start) {
  const end = buf.indexOf(0x0a, start);
  if (end < 0) throw new Error("missing newline");
  return [buf.subarray(start, end).toString("ascii"), end + 1];
}

function parse(buf) {
  let pos = 0;
  let line;
  [line, pos] = readLine(buf, pos);
  const h = line.split(" ");
  if (h.length !== 6 || h[0] !== "aig") throw new Error("unexpected header");
  const [M, I, L, O, A] = h.slice(1).map(Number);
  if ([M, I, L, O, A].some((x) => !Number.isSafeInteger(x))) throw new Error("bad counts");
  if (L !== 0) throw new Error("control parser freezes L=0");
  const roots = [];
  for (let i = 0; i < O; i++) {
    [line, pos] = readLine(buf, pos);
    roots.push(Number(line));
  }
  const ands = [];
  for (let i = 0; i < A; i++) {
    const lhs = 2 * (I + L + i + 1);
    let d0, d1;
    [d0, pos] = readUleb(buf, pos);
    [d1, pos] = readUleb(buf, pos);
    const rhs0 = lhs - d0;
    const rhs1 = rhs0 - d1;
    if (!(lhs > rhs0 && rhs0 >= rhs1)) throw new Error("binary AIGER ordering violation");
    ands.push({ lhs, rhs: [rhs0, rhs1] });
  }
  if (pos !== buf.length) throw new Error(`unexpected trailing bytes: ${buf.length - pos}`);
  return { M, I, L, O, A, roots, ands, payloadOffset: buf.length - ands.reduce((n, a) => n + uleb(a.lhs - a.rhs[0]).length + uleb(a.rhs[0] - a.rhs[1]).length, 0) };
}

function signature(lit, byLhs, memo = new Map()) {
  const inv = lit & 1;
  const base = lit - inv;
  let core;
  if (base === 0) core = "0";
  else if (base <= 126) core = `p${base / 2}`;
  else if (memo.has(base)) core = memo.get(base);
  else {
    const node = byLhs.get(base);
    if (!node) throw new Error(`unknown literal ${lit}`);
    const children = node.rhs.map((x) => signature(x, byLhs, memo)).sort();
    core = `and(${children[0]},${children[1]})`;
    memo.set(base, core);
  }
  return inv ? `not(${core})` : core;
}

function canonical(parsed) {
  const byLhs = new Map(parsed.ands.map((a) => [a.lhs, a]));
  return parsed.roots.map((r) => signature(r, byLhs));
}

function enumerate(prefix, remaining, out) {
  if (!remaining.length) {
    out.push(prefix.slice());
    return;
  }
  const done = new Set(prefix);
  for (const g of remaining) {
    if (gates[g].every((f) => inputs[f] || done.has(f))) {
      enumerate(prefix.concat(g), remaining.filter((x) => x !== g), out);
    }
  }
}

const all = [];
enumerate([], Object.keys(gates).sort(), all);
const evaluated = all.map((order) => {
  const emitted = emit(order);
  const parsed = parse(emitted.buffer);
  return {
    order,
    deltaBytes: emitted.payload.length,
    wholeFileBytes: emitted.buffer.length,
    canonicalOutputs: canonical(parsed),
  };
});
const expectedCanonical = ["and(and(and(p1,p2),and(p60,p61)),and(p58,p59))", "and(p62,p63)"];
for (const row of evaluated) {
  if (JSON.stringify(row.canonicalOutputs) !== JSON.stringify(expectedCanonical)) {
    throw new Error(`structural identity mismatch for ${row.order.join(",")}`);
  }
}

const named = {};
for (const [name, order] of Object.entries(namedSchedules)) {
  const emitted = emit(order);
  const file = path.join(OUT, `${name}.aig`);
  fs.writeFileSync(file, emitted.buffer);
  named[name] = {
    order,
    deltaBytes: emitted.payload.length,
    wholeFileBytes: emitted.buffer.length,
    sha256: crypto.createHash("sha256").update(emitted.buffer).digest("hex"),
    rows: emitted.rows,
    parsed: parse(emitted.buffer),
    canonicalOutputs: canonical(parse(emitted.buffer)),
  };
}

const minDelta = Math.min(...evaluated.map((x) => x.deltaBytes));
const maxDelta = Math.max(...evaluated.map((x) => x.deltaBytes));
const result = {
  status: "CODEC_OR_IMPLEMENTATION_CONTROL__NON_CLAIM_BEARING",
  nodeVersion: process.version,
  legalScheduleCount: evaluated.length,
  completeEnumeration: true,
  recurrence: "F(prefix)=min_{v in ready(prefix)}[c(v,next_rank,assigned_fanin_ranks)+F(prefix+v)]",
  complexity: "O(number_of_legal_topological_orders * |V|) time; O(|V|) DFS stack, excluding retained result table",
  minDeltaBytes: minDelta,
  maxDeltaBytes: maxDelta,
  optimumOrders: evaluated.filter((x) => x.deltaBytes === minDelta).map((x) => x.order),
  named,
  structuralIdentityAllSchedules: true,
  nativeReaderValidated: false,
  n2AlgorithmicContributionEstablished: false,
};
result.cost = {
  wallNs: Number(process.hrtime.bigint() - startHr),
  cpuUsageUs: process.cpuUsage(startCpu),
  maxRssBytes: process.resourceUsage().maxRSS * 1024,
  inputBytes: 0,
  outputAigerBytes: named.S1.wholeFileBytes + named.S2.wholeFileBytes,
  networkBytes: 0,
};
fs.writeFileSync(path.join(OUT, "results.json"), JSON.stringify(result, null, 2) + "\n");
process.stdout.write(JSON.stringify({
  legalScheduleCount: result.legalScheduleCount,
  minDeltaBytes: minDelta,
  maxDeltaBytes: maxDelta,
  S1: { deltaBytes: named.S1.deltaBytes, wholeFileBytes: named.S1.wholeFileBytes, sha256: named.S1.sha256 },
  S2: { deltaBytes: named.S2.deltaBytes, wholeFileBytes: named.S2.wholeFileBytes, sha256: named.S2.sha256 },
  structuralIdentityAllSchedules: true,
  nativeReaderValidated: false,
  cost: result.cost,
}, null, 2) + "\n");
