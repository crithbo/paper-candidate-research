$ErrorActionPreference = 'Stop'

$ResumeRoot = 'D:\project\writing\reserch\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1'
$Bin = Join-Path $ResumeRoot 'b\bin'
$RuntimeBin = Join-Path $ResumeRoot 'resources\toolchain\llvm-mingw-20260616-ucrt-x86_64\bin'
$Python = 'C:\Users\15383\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
$Planner = Join-Path $ResumeRoot 'scripts\zcmp_frontier_planner.py'
$FreezePath = Join-Path $ResumeRoot 'runs\natural\single_function\SINGLE_FUNCTION_FREEZE.json'
$OutRoot = Join-Path $ResumeRoot 'runs\natural\pilot_final'
$InheritedPath = [Environment]::GetEnvironmentVariable('PATH', 'Process')
[Environment]::SetEnvironmentVariable('PATH', $null, 'Process')
[Environment]::SetEnvironmentVariable('Path', $RuntimeBin + ';' + $InheritedPath, 'Process')
New-Item -ItemType Directory -Force -Path $OutRoot | Out-Null

$Arms = @(
  @{ name = 'default'; args = @() },
  @{ name = 'greedy'; args = @('-regalloc=greedy') },
  @{ name = 'basic'; args = @('-regalloc=basic') },
  @{ name = 'fast'; args = @('-regalloc=fast') },
  @{ name = 'greedy_no_hints'; args = @('-regalloc=greedy', '-riscv-disable-regalloc-hints') },
  @{ name = 'greedy_no_cost'; args = @('-regalloc=greedy', '-riscv-disable-cost-per-use') },
  @{ name = 'greedy_no_hints_no_cost'; args = @('-regalloc=greedy', '-riscv-disable-regalloc-hints', '-riscv-disable-cost-per-use') },
  @{ name = 'greedy_csr_scale_0'; args = @('-regalloc=greedy', '-regalloc-csr-cost-scale=0') },
  @{ name = 'greedy_csr_scale_80'; args = @('-regalloc=greedy', '-regalloc-csr-cost-scale=80') },
  @{ name = 'greedy_csr_scale_160'; args = @('-regalloc=greedy', '-regalloc-csr-cost-scale=160') },
  @{ name = 'greedy_first_cost_1'; args = @('-regalloc=greedy', '-regalloc-csr-first-time-cost=1') },
  @{ name = 'greedy_first_cost_8'; args = @('-regalloc=greedy', '-regalloc-csr-first-time-cost=8') },
  @{ name = 'greedy_first_cost_32'; args = @('-regalloc=greedy', '-regalloc-csr-first-time-cost=32') },
  @{ name = 'greedy_scale0_first8'; args = @('-regalloc=greedy', '-regalloc-csr-cost-scale=0', '-regalloc-csr-first-time-cost=8') },
  @{ name = 'greedy_scale160_first8'; args = @('-regalloc=greedy', '-regalloc-csr-cost-scale=160', '-regalloc-csr-first-time-cost=8') },
  @{ name = 'greedy_shrink_on'; args = @('-regalloc=greedy', '-enable-shrink-wrap=true') },
  @{ name = 'greedy_shrink_off'; args = @('-regalloc=greedy', '-enable-shrink-wrap=false') },
  @{ name = 'greedy_no_hints_scale0'; args = @('-regalloc=greedy', '-riscv-disable-regalloc-hints', '-regalloc-csr-cost-scale=0') }
)

function Invoke-Tracked {
  param(
    [Parameter(Mandatory = $true)][string]$File,
    [Parameter(Mandatory = $true)][string[]]$Arguments,
    [Parameter(Mandatory = $true)][string]$Stdout,
    [Parameter(Mandatory = $true)][string]$Stderr
  )
  $Started = Get-Date
  $Info = New-Object System.Diagnostics.ProcessStartInfo
  $Info.FileName = $File
  $Info.Arguments = (($Arguments | ForEach-Object {
    if ($_ -match '[\s"]') { '"' + ($_ -replace '"', '\"') + '"' } else { $_ }
  }) -join ' ')
  $Info.UseShellExecute = $false
  $Info.CreateNoWindow = $true
  $Info.RedirectStandardOutput = $true
  $Info.RedirectStandardError = $true
  $Process = New-Object System.Diagnostics.Process
  $Process.StartInfo = $Info
  if (-not $Process.Start()) { throw "failed to start $File" }
  $StdoutTask = $Process.StandardOutput.ReadToEndAsync()
  $StderrTask = $Process.StandardError.ReadToEndAsync()
  $Peak = 0L
  while (-not $Process.HasExited) {
    Start-Sleep -Milliseconds 10
    $Process.Refresh()
    if ($Process.WorkingSet64 -gt $Peak) { $Peak = $Process.WorkingSet64 }
  }
  $Process.WaitForExit()
  $Process.Refresh()
  if ($Process.WorkingSet64 -gt $Peak) { $Peak = $Process.WorkingSet64 }
  $StdoutTask.Result | Set-Content -LiteralPath $Stdout -Encoding UTF8
  $StderrTask.Result | Set-Content -LiteralPath $Stderr -Encoding UTF8
  $Ended = Get-Date
  return [pscustomobject][ordered]@{
    exit_code = $Process.ExitCode
    wall_seconds = ($Ended - $Started).TotalSeconds
    cpu_seconds = $Process.TotalProcessorTime.TotalSeconds
    peak_working_set_bytes = $Peak
  }
}

function Invoke-NativeVariant {
  param(
    [Parameter(Mandatory = $true)][string]$Kind,
    [Parameter(Mandatory = $true)][string]$Name,
    [Parameter(Mandatory = $true)][string]$Function,
    [Parameter(Mandatory = $true)][string]$InputMir,
    [Parameter(Mandatory = $true)][AllowEmptyCollection()][string[]]$ExtraLlcArgs,
    [Parameter(Mandatory = $true)][string]$Directory
  )
  New-Item -ItemType Directory -Force -Path $Directory | Out-Null
  $Asm = Join-Path $Directory 'output.s'
  $Obj = Join-Path $Directory 'output.o'
  $Linked = Join-Path $Directory 'linked.o'
  $ReadLog = Join-Path $Directory 'readobj.stdout.log'
  $DisLog = Join-Path $Directory 'objdump.stdout.log'
  $Steps = [ordered]@{}
  $FailureStep = $null

  $BaseArgs = @('-x', 'mir', '-mtriple=riscv32-unknown-elf',
                '-mattr=+m,+a,+c,+zcmp', '-target-abi=ilp32', '-O2',
                '-start-before=greedy', '-verify-machineinstrs')
  $Steps.llc = Invoke-Tracked -File (Join-Path $Bin 'llc.exe') `
    -Arguments ($BaseArgs + $ExtraLlcArgs + @('-filetype=asm', '-o', $Asm, $InputMir)) `
    -Stdout (Join-Path $Directory 'llc.stdout.log') -Stderr (Join-Path $Directory 'llc.stderr.log')
  if ($Steps.llc.exit_code -ne 0) { $FailureStep = 'llc_or_machine_verifier' }

  if ($null -eq $FailureStep) {
    $Steps.llvm_mc = Invoke-Tracked -File (Join-Path $Bin 'llvm-mc.exe') `
      -Arguments @('-triple=riscv32-unknown-elf', '-mattr=+m,+a,+c,+zcmp',
                   '-filetype=obj', '-o', $Obj, $Asm) `
      -Stdout (Join-Path $Directory 'mc.stdout.log') -Stderr (Join-Path $Directory 'mc.stderr.log')
    if ($Steps.llvm_mc.exit_code -ne 0) { $FailureStep = 'llvm_mc' }
  }
  if ($null -eq $FailureStep) {
    $Steps.ld_lld = Invoke-Tracked -File (Join-Path $Bin 'ld.lld.exe') `
      -Arguments @('-r', '-m', 'elf32lriscv', '-o', $Linked, $Obj) `
      -Stdout (Join-Path $Directory 'lld.stdout.log') -Stderr (Join-Path $Directory 'lld.stderr.log')
    if ($Steps.ld_lld.exit_code -ne 0) { $FailureStep = 'ld_lld_relocatable' }
  }
  if ($null -eq $FailureStep) {
    $Steps.llvm_readobj = Invoke-Tracked -File (Join-Path $Bin 'llvm-readobj.exe') `
      -Arguments @('--sections', '--symbols', '--unwind', $Linked) `
      -Stdout $ReadLog -Stderr (Join-Path $Directory 'readobj.stderr.log')
    if ($Steps.llvm_readobj.exit_code -ne 0) { $FailureStep = 'llvm_readobj' }
  }
  if ($null -eq $FailureStep) {
    $Steps.llvm_objdump = Invoke-Tracked -File (Join-Path $Bin 'llvm-objdump.exe') `
      -Arguments @('-d', '--no-show-raw-insn', $Linked) `
      -Stdout $DisLog -Stderr (Join-Path $Directory 'objdump.stderr.log')
    if ($Steps.llvm_objdump.exit_code -ne 0) { $FailureStep = 'llvm_objdump' }
  }

  $StepValues = @($Steps.Values)
  $AsmText = if (Test-Path -LiteralPath $Asm) { Get-Content -Raw -LiteralPath $Asm } else { '' }
  $ReadText = if (Test-Path -LiteralPath $ReadLog) { Get-Content -Raw -LiteralPath $ReadLog } else { '' }
  $EscapedFunction = [regex]::Escape($Function)
  $SizeMatch = [regex]::Match($ReadText, '(?s)Name: ' + $EscapedFunction + ' \([^\)]*\).*?Size: (\d+)')
  $PushMatch = [regex]::Match($AsmText, '(?m)^\s*cm\.push\s+(.+)$')
  $PopMatch = [regex]::Match($AsmText, '(?m)^\s*cm\.popret\s+(.+)$')
  $FrameMatch = [regex]::Match($AsmText, '(?m)^\s*cm\.push\s+\{[^\}]+\},\s*(-\d+)')
  $CfiCount = ([regex]::Matches($AsmText, '(?m)^\s*\.cfi_')).Count
  $HasEhFrame = $ReadText -match 'Name: \.eh_frame'
  return [ordered]@{
    kind = $Kind
    name = $Name
    function = $Function
    input_mir_sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $InputMir).Hash
    extra_llc_args = $ExtraLlcArgs
    all_native_steps_exit_zero = ($null -eq $FailureStep)
    failure_step = $FailureStep
    function_text_bytes = if ($SizeMatch.Success) { [int]$SizeMatch.Groups[1].Value } else { $null }
    push = if ($PushMatch.Success) { $PushMatch.Groups[1].Value.Trim() } else { '' }
    popret = if ($PopMatch.Success) { $PopMatch.Groups[1].Value.Trim() } else { '' }
    frame_bytes = if ($FrameMatch.Success) { -1 * [int]$FrameMatch.Groups[1].Value } else { 0 }
    cfi_directive_count = $CfiCount
    eh_frame_present = [bool]$HasEhFrame
    assembly_sha256 = if (Test-Path -LiteralPath $Asm) { (Get-FileHash -Algorithm SHA256 -LiteralPath $Asm).Hash } else { $null }
    linked_object_sha256 = if (Test-Path -LiteralPath $Linked) { (Get-FileHash -Algorithm SHA256 -LiteralPath $Linked).Hash } else { $null }
    wall_seconds = ($StepValues | Measure-Object wall_seconds -Sum).Sum
    cpu_seconds = ($StepValues | Measure-Object cpu_seconds -Sum).Sum
    peak_working_set_bytes = ($StepValues | Measure-Object peak_working_set_bytes -Maximum).Maximum
    artifact_bytes = (Get-ChildItem -LiteralPath $Directory -File | Measure-Object Length -Sum).Sum
    step_metrics = $Steps
  }
}

$Freeze = Get-Content -Raw -LiteralPath $FreezePath | ConvertFrom-Json
$FunctionRows = @()
foreach ($FunctionEntry in @($Freeze.rows)) {
  $Function = [string]$FunctionEntry.function
  $Stem = [IO.Path]::GetFileNameWithoutExtension([string]$FunctionEntry.pregreedy_mir)
  $FunctionDir = Join-Path $OutRoot $Stem
  $CandidateRoot = Join-Path $FunctionDir 'candidate'
  $UnionRoot = Join-Path $FunctionDir 'union'
  New-Item -ItemType Directory -Force -Path $CandidateRoot,$UnionRoot | Out-Null
  $InputMir = Join-Path $ResumeRoot ([string]$FunctionEntry.pregreedy_mir)

  $PlannerMetrics = Invoke-Tracked -File $Python `
    -Arguments @($Planner, 'enumerate', '--input', $InputMir, '--out-dir', $CandidateRoot, '--max-w', '4') `
    -Stdout (Join-Path $CandidateRoot 'planner.stdout.log') `
    -Stderr (Join-Path $CandidateRoot 'planner.stderr.log')
  if ($PlannerMetrics.exit_code -ne 0) {
    $FunctionRows += [ordered]@{
      module = [string]$FunctionEntry.module
      function = $Function
      initial_interface_width = [int]$FunctionEntry.interface_width
      final_eligibility = 'EXCLUDED_RESULT_INDEPENDENTLY_AFTER_EXACT_SINGLE_FUNCTION_REPLAY'
      exclusion_reason = (Get-Content -Raw -LiteralPath (Join-Path $CandidateRoot 'planner.stderr.log')).Trim()
      common_pregreedy_mir_sha256 = [string]$FunctionEntry.pregreedy_mir_sha256
      planner_metrics = $PlannerMetrics
      legal_candidate_plan_count = 0
      union_arm_count = 0
      candidate_rows = @()
      union_rows = @()
    }
    continue
  }
  $PlansPath = Join-Path $CandidateRoot 'plans.json'
  $Plans = Get-Content -Raw -LiteralPath $PlansPath | ConvertFrom-Json
  $CandidateRows = @()
  for ($Index = 0; $Index -lt $Plans.plans.Count; $Index++) {
    $Plan = $Plans.plans[$Index]
    $Name = 'plan_{0:D4}' -f $Index
    $PlanMir = Join-Path $CandidateRoot ([string]$Plan.mir)
    $RunDir = Join-Path $CandidateRoot ($Name + '_native')
    $Native = Invoke-NativeVariant -Kind 'candidate' -Name $Name -Function $Function `
      -InputMir $PlanMir -ExtraLlcArgs @() -Directory $RunDir
    $Native.assignment = $Plan.assignment
    $Native.csr_count = [int]$Plan.csr_count
    $Native.spill_values = $Plan.spill_values
    $Native.abstract_pareto = [bool]$Plan.abstract_pareto
    $Native.planner_wall_seconds = $PlannerMetrics.wall_seconds
    $Native.planner_cpu_seconds = $PlannerMetrics.cpu_seconds
    $Native.planner_peak_working_set_bytes = $PlannerMetrics.peak_working_set_bytes
    $Native.full_candidate_wall_seconds = $Native.wall_seconds + $PlannerMetrics.wall_seconds
    $Native.full_candidate_cpu_seconds = $Native.cpu_seconds + $PlannerMetrics.cpu_seconds
    $Native.full_candidate_peak_working_set_bytes = [Math]::Max([long]$Native.peak_working_set_bytes, [long]$PlannerMetrics.peak_working_set_bytes)
    $CandidateRows += $Native
  }

  $UnionRows = @()
  foreach ($Arm in $Arms) {
    $RunDir = Join-Path $UnionRoot $Arm.name
    $UnionRows += Invoke-NativeVariant -Kind 'current_union' -Name $Arm.name -Function $Function `
      -InputMir $InputMir -ExtraLlcArgs $Arm.args -Directory $RunDir
  }

  $FunctionRows += [ordered]@{
    module = [string]$FunctionEntry.module
    function = $Function
    interface_width = [int]$FunctionEntry.interface_width
    final_eligibility = 'ELIGIBLE'
    extracted_ir_sha256 = [string]$FunctionEntry.extracted_ir_sha256
    common_pregreedy_mir_sha256 = [string]$FunctionEntry.pregreedy_mir_sha256
    planner_metrics = $PlannerMetrics
    legal_candidate_plan_count = $CandidateRows.Count
    union_arm_count = $UnionRows.Count
    candidate_rows = $CandidateRows
    union_rows = $UnionRows
  }
}

$Payload = [ordered]@{
  schema = 'zcmp-natural-pilot-native-v1'
  llvm_commit = 'ba5bccfe01368f76e74d6ff4c35f1330e155b4ba'
  target = 'riscv32-unknown-elf__rv32imac_zcmp__ilp32__O2'
  same_information = $true
  source_freeze_sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $FreezePath).Hash
  current_union_arm_count = $Arms.Count
  function_count = $FunctionRows.Count
  eligible_function_count = @($FunctionRows | Where-Object { $_.final_eligibility -eq 'ELIGIBLE' }).Count
  rows = $FunctionRows
}
$ResultPath = Join-Path $OutRoot 'NATIVE_RESULTS.json'
$Payload | ConvertTo-Json -Depth 16 | Set-Content -LiteralPath $ResultPath -Encoding UTF8
$Payload | ConvertTo-Json -Depth 4
