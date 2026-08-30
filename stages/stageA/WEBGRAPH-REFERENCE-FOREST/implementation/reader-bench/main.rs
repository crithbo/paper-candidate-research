use anyhow::{bail, Result};
use dsi_bitstream::prelude::BE;
use lender::prelude::*;
use std::path::PathBuf;
use std::time::Instant;
use webgraph::prelude::*;

fn main() -> Result<()> {
    let args: Vec<_> = std::env::args_os().collect();
    if args.len() != 3 { bail!("usage: reader-bench BASENAME REPEATS"); }
    let basename = PathBuf::from(&args[1]);
    let repeats: usize = args[2].to_string_lossy().parse()?;
    println!("repeat\tsequential_full_decode_ns\trandom_100k_ns\tsequential_checksum\trandom_checksum");
    for repeat in 0..repeats {
        let seq = BvGraphSeq::with_basename(&basename).endianness::<BE>().load()?;
        let seq_start = Instant::now();
        let mut seq_checksum = 0_u64;
        let mut observed_nodes = 0usize;
        for_!((node, succ) in seq.iter() {
            observed_nodes += 1;
            seq_checksum = seq_checksum.wrapping_mul(0x100000001b3).wrapping_add(node as u64 + 1);
            for target in succ {
                seq_checksum = seq_checksum.wrapping_mul(0x100000001b3).wrapping_add(target as u64 + 1);
            }
        });
        if observed_nodes != seq.num_nodes() { bail!("sequential node count mismatch"); }
        let seq_ns = seq_start.elapsed().as_nanos();

        let random = BvGraph::with_basename(&basename).endianness::<BE>().load()?;
        let random_start = Instant::now();
        let mut state = 0x9e3779b97f4a7c15_u64;
        let mut random_checksum = 0_u64;
        for _ in 0..100_000 {
            state ^= state << 13; state ^= state >> 7; state ^= state << 17;
            let node = (state as usize) % random.num_nodes();
            for target in random.successors(node) {
                random_checksum = random_checksum.wrapping_mul(0x100000001b3).wrapping_add(target as u64 + 1);
            }
        }
        let random_ns = random_start.elapsed().as_nanos();
        println!("{}\t{}\t{}\t{}\t{}", repeat, seq_ns, random_ns, seq_checksum, random_checksum);
    }
    Ok(())
}
