use anyhow::{bail, Context, Result};
use dsi_bitstream::prelude::*;
use std::fs;
use std::path::{Path, PathBuf};
use std::time::Instant;
use webgraph::{graphs::bvgraph, prelude::*};

const W: usize = 4;
const D: usize = 3;
const CHUNK_SIZE: usize = 128;

fn parse_lists(path: &Path) -> Result<Vec<Vec<usize>>> {
    let text = fs::read_to_string(path).with_context(|| format!("reading {}", path.display()))?;
    let mut lists = Vec::new();
    for (line_no, raw) in text.lines().enumerate() {
        let line = raw.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let (left, right) = line
            .split_once(':')
            .with_context(|| format!("line {} lacks ':'", line_no + 1))?;
        let expected: usize = left.trim().parse()?;
        if expected != lists.len() {
            bail!("line {} has node {}, expected {}", line_no + 1, expected, lists.len());
        }
        let mut succ = Vec::new();
        let right = right.trim();
        if right != "-" && !right.is_empty() {
            for token in right.split(',') {
                succ.push(token.trim().parse()?);
            }
        }
        if succ.windows(2).any(|pair| pair[0] >= pair[1]) {
            bail!("node {} successors are not strictly increasing", expected);
        }
        lists.push(succ);
    }
    let n = lists.len();
    for (u, succ) in lists.iter().enumerate() {
        for &v in succ {
            if v >= n {
                bail!("arc {} -> {} exceeds frozen node range 0..{}", u, v, n);
            }
        }
    }
    Ok(lists)
}

fn make_graph(lists: &[Vec<usize>]) -> VecGraph {
    let mut graph = VecGraph::empty(lists.len());
    for (u, succ) in lists.iter().enumerate() {
        for &v in succ {
            graph.add_arc(u, v);
        }
    }
    graph
}

// First-party test helper equivalent to `webgraph build ef`. Random access is
// validated only after materializing the native Elias-Fano offsets index.
fn build_ef(basename: &Path) -> Result<()> {
    use epserde::ser::Serialize;
    use std::io::{BufWriter, Seek};
    use sux::prelude::*;

    let graph_path = basename.with_extension("graph");
    let mut graph_file = fs::File::open(&graph_path)?;
    let file_len_bits = 8 * graph_file.seek(std::io::SeekFrom::End(0))? as usize;
    let props = fs::read_to_string(basename.with_extension("properties"))?;
    let num_nodes: usize = props
        .lines()
        .find_map(|line| line.strip_prefix("nodes="))
        .context("properties lacks nodes=")?
        .parse()?;
    let offsets = webgraph::utils::MmapHelper::<u32>::mmap(
        basename.with_extension("offsets"),
        mmap_rs::MmapFlags::SEQUENTIAL,
    )?;
    let mut reader: BufBitReader<BE, _> = BufBitReader::new(MemWordReader::new(offsets.as_ref()));
    let mut builder = EliasFanoBuilder::new(num_nodes + 1, file_len_bits);
    let mut offset = 0u64;
    for _ in 0..=num_nodes {
        offset += reader.read_gamma()?;
        builder.push(offset as _);
    }
    let ef = builder.build();
    let ef: EF = unsafe { ef.map_high_bits(SelectAdaptConst::<_, _, 12, 4>::new) };
    let mut file = BufWriter::new(fs::File::create(basename.with_extension("ef"))?);
    unsafe { ef.serialize(&mut file)? };
    Ok(())
}

fn main() -> Result<()> {
    let args: Vec<_> = std::env::args_os().collect();
    let native_mode = args.len() == 4 && args[1] == "--native";
    if (!native_mode && args.len() != 3) || (native_mode && args.len() != 4) {
        bail!("usage: webgraph_stagea_harness [--native] INPUT OUTPUT_BASENAME");
    }
    let input = PathBuf::from(if native_mode { &args[2] } else { &args[1] });
    let output = PathBuf::from(if native_mode { &args[3] } else { &args[2] });
    if let Some(parent) = output.parent() {
        fs::create_dir_all(parent)?;
    }

    let graph = if native_mode {
        let source = BvGraphSeq::with_basename(&input)
            .endianness::<BE>()
            .load()?;
        VecGraph::from_lender(source.iter())
    } else {
        make_graph(&parse_lists(&input)?)
    };
    let num_nodes = graph.num_nodes();
    let num_arcs = graph.num_arcs();
    let flags = CompFlags {
        compression_window: W,
        max_ref_count: D,
        min_interval_length: 4,
        ..Default::default()
    };

    let build_start = Instant::now();
    let mut compressor = BvCompZ::with_basename(&output)
        .with_comp_flags(flags)
        .with_chunk_size(CHUNK_SIZE);
    let returned_bits = compressor.comp_graph::<BE>(&graph)?;
    let build_ns = build_start.elapsed().as_nanos();

    let seq_start = Instant::now();
    let seq = BvGraphSeq::with_basename(&output)
        .endianness::<BE>()
        .load()?;
    labels::eq_sorted(&graph, &seq)?;
    bvgraph::check_offsets(&seq, &output)?;
    let sequential_validate_ns = seq_start.elapsed().as_nanos();

    let ef_start = Instant::now();
    build_ef(&output)?;
    let ef_build_ns = ef_start.elapsed().as_nanos();

    let random_start = Instant::now();
    let random = BvGraph::with_basename(&output)
        .endianness::<BE>()
        .load()?;
    for node in 0..num_nodes {
        let expected: Vec<_> = graph.successors(node).collect();
        let actual: Vec<_> = random.successors(node).collect();
        if actual != expected {
            bail!("random-access mismatch at node {}", node);
        }
    }
    let mut state = 0x9e3779b97f4a7c15_u64;
    let query_count = if num_nodes == 0 { 0 } else { 4096 };
    let mut query_checksum = 0_u64;
    for _ in 0..query_count {
        state ^= state << 13;
        state ^= state >> 7;
        state ^= state << 17;
        let node = (state as usize) % num_nodes;
        for succ in random.successors(node) {
            query_checksum = query_checksum.wrapping_mul(0x100000001b3).wrapping_add(succ as u64 + 1);
        }
    }
    let random_validate_and_query_ns = random_start.elapsed().as_nanos();

    println!("input={}", input.display());
    println!("output={}", output.display());
    println!("nodes={}", num_nodes);
    println!("arcs={}", num_arcs);
    println!("W={}", W);
    println!("D={}", D);
    println!("chunk_size={}", CHUNK_SIZE);
    println!("returned_bits={}", returned_bits);
    println!("build_ns={}", build_ns);
    println!("sequential_validate_ns={}", sequential_validate_ns);
    println!("ef_build_ns={}", ef_build_ns);
    println!("random_validate_and_query_ns={}", random_validate_and_query_ns);
    println!("query_count={}", query_count);
    println!("query_checksum={}", query_checksum);
    println!("sequential_equality=true");
    println!("random_access_equality=true");
    println!("offset_check=true");
    Ok(())
}
