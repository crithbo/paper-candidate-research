$ErrorActionPreference = 'Stop'
$Root = 'D:\project\writing\reserch\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1'
$RelativePaths = @(
  'MAINLINE_ASSIGNMENT.yaml',
  'RESOURCE_AUTHORIZATION_FREEZE.yaml',
  'INPUT_FREEZE.yaml',
  'EXPERIMENT_CONTRACT.yaml',
  'RESOURCE_ACQUISITION_LEDGER.yaml',
  'RESOURCE_GATE_REPORT.md',
  'PRE_CLAIM_FIDELITY_GATE.md',
  'CURRENT_UPSTREAM_REALITY_CHECK.md',
  'NATURAL_CORPUS_FREEZE.yaml',
  'Q1_COMPARATOR_MATRIX.md',
  'Q1_EVIDENCE_GAP_REVIEW.md',
  'FULL_COST_LEDGER.md',
  'COMMAND_LOG.md',
  'RESULTS.md',
  'STAGEA_REPORT.md',
  'USER_REVIEW_PACKET.md',
  'REPRODUCE.md',
  'handoff.yaml',
  'resources\exact_blobs\RISCVInstrInfoZc.td',
  'resources\exact_blobs\RISCVTargetMachine.cpp',
  'resources\downloads\llvm-project-ba5bccfe01368f76e74d6ff4c35f1330e155b4ba.tar.gz',
  'resources\corpus\embench-iot-0466a18e4f6b47e19598d7c6ba72916d54b68f65.tar.gz',
  'resources\corpus\embench_tag_ref.json',
  'b\bin\llc.exe',
  'b\bin\llvm-mc.exe',
  'b\bin\llvm-objdump.exe',
  'b\bin\llvm-readobj.exe',
  'b\bin\ld.lld.exe',
  'b\bin\llvm-extract.exe',
  'runs\resource_build_attempt1\build_metrics.json',
  'runs\preclaim\witness.ll',
  'runs\preclaim\plan_p_prologepilog.mir',
  'runs\preclaim\plan_p.s',
  'runs\preclaim\plan_p.elf',
  'runs\preclaim\plan_s_complete_0sp_verified.mir',
  'runs\preclaim\plan_s.s',
  'runs\preclaim\plan_s.elf',
  'runs\preclaim\tiny_oracle.json',
  'runs\preclaim\candidate_witness\plans.json',
  'runs\preclaim\current_union_grid\results.json',
  'runs\natural\modules\MODULE_FREEZE.json',
  'runs\natural\pregreedy_modules\PRE_GREEDY_FREEZE.json',
  'runs\natural\CANONICAL_ELIGIBILITY.json',
  'runs\natural\single_function\SINGLE_FUNCTION_FREEZE.json',
  'runs\natural\pilot_final\NATIVE_RESULTS.json',
  'runs\natural\pilot_final\ANALYSIS.json',
  'scripts\zcmp_frontier_planner.py',
  'scripts\compile_natural_corpus.ps1',
  'scripts\make_pregreedy_modules.ps1',
  'scripts\screen_natural_mir.py',
  'scripts\prepare_eligible_single_function.ps1',
  'scripts\run_natural_pilot.ps1',
  'scripts\analyze_natural_pilot.py',
  'scripts\make_canonical_manifest.ps1'
)
$Lines = foreach ($RelativePath in $RelativePaths) {
  $FullPath = Join-Path $Root $RelativePath
  if (-not (Test-Path -LiteralPath $FullPath -PathType Leaf)) {
    throw "missing canonical manifest input: $RelativePath"
  }
  $Hash = (Get-FileHash -Algorithm SHA256 -LiteralPath $FullPath).Hash
  "$Hash *$RelativePath"
}
[IO.File]::WriteAllLines((Join-Path $Root 'HASH_MANIFEST.sha256'), $Lines, (New-Object Text.UTF8Encoding($false)))
Write-Output ("canonical_entries=" + $Lines.Count)
