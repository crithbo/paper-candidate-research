$ErrorActionPreference = 'Stop'

$ResumeRoot = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1'
$Bin = Join-Path $ResumeRoot 'b\bin'
$RuntimeBin = Join-Path $ResumeRoot 'resources\toolchain\llvm-mingw-20260616-ucrt-x86_64\bin'
$Input = Join-Path $ResumeRoot 'runs\preclaim\witness.ll'
$Clobber = Join-Path $ResumeRoot 'runs\preclaim\clobber.o'
$OutRoot = Join-Path $ResumeRoot 'runs\preclaim\current_union_grid'
$InheritedPath = [Environment]::GetEnvironmentVariable('PATH', 'Process')
[Environment]::SetEnvironmentVariable('PATH', $null, 'Process')
[Environment]::SetEnvironmentVariable('Path', $null, 'Process')
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
  $Info.EnvironmentVariables['Path'] = $RuntimeBin + ';' + $InheritedPath
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

$Rows = @()
foreach ($Arm in $Arms) {
  $Dir = Join-Path $OutRoot $Arm.name
  New-Item -ItemType Directory -Force -Path $Dir | Out-Null
  $Asm = Join-Path $Dir 'witness.s'
  $Obj = Join-Path $Dir 'witness.o'
  $Elf = Join-Path $Dir 'witness.elf'
  $ReadLog = Join-Path $Dir 'readobj.stdout.log'
  $DisLog = Join-Path $Dir 'objdump.stdout.log'
  $BaseArgs = @('-mtriple=riscv32-unknown-elf', '-mattr=+m,+a,+c,+zcmp',
                '-target-abi=ilp32', '-O2', '-verify-machineinstrs')
  $LlcArgs = $BaseArgs + $Arm.args + @('-filetype=asm', '-o', $Asm, $Input)
  $Llc = Invoke-Tracked -File (Join-Path $Bin 'llc.exe') -Arguments $LlcArgs `
    -Stdout (Join-Path $Dir 'llc.stdout.log') -Stderr (Join-Path $Dir 'llc.stderr.log')
  if ($Llc.exit_code -ne 0) { throw "llc failed for $($Arm.name)" }
  $Mc = Invoke-Tracked -File (Join-Path $Bin 'llvm-mc.exe') `
    -Arguments @('-triple=riscv32-unknown-elf', '-mattr=+m,+a,+c,+zcmp',
                 '-filetype=obj', '-o', $Obj, $Asm) `
    -Stdout (Join-Path $Dir 'mc.stdout.log') -Stderr (Join-Path $Dir 'mc.stderr.log')
  if ($Mc.exit_code -ne 0) { throw "llvm-mc failed for $($Arm.name)" }
  $Link = Invoke-Tracked -File (Join-Path $Bin 'ld.lld.exe') `
    -Arguments @('-m', 'elf32lriscv', '--entry=witness', '-o', $Elf, $Obj, $Clobber) `
    -Stdout (Join-Path $Dir 'lld.stdout.log') -Stderr (Join-Path $Dir 'lld.stderr.log')
  if ($Link.exit_code -ne 0) { throw "ld.lld failed for $($Arm.name)" }
  $Read = Invoke-Tracked -File (Join-Path $Bin 'llvm-readobj.exe') `
    -Arguments @('--sections', '--symbols', '--unwind', $Elf) `
    -Stdout $ReadLog -Stderr (Join-Path $Dir 'readobj.stderr.log')
  if ($Read.exit_code -ne 0) { throw "llvm-readobj failed for $($Arm.name)" }
  $Dis = Invoke-Tracked -File (Join-Path $Bin 'llvm-objdump.exe') `
    -Arguments @('-d', '--no-show-raw-insn', $Elf) `
    -Stdout $DisLog -Stderr (Join-Path $Dir 'objdump.stderr.log')
  if ($Dis.exit_code -ne 0) { throw "llvm-objdump failed for $($Arm.name)" }

  $AsmText = Get-Content -LiteralPath $Asm -Raw
  $ReadText = Get-Content -LiteralPath $ReadLog -Raw
  $Push = [regex]::Match($AsmText, '(?m)^\s*cm\.push\s+(.+)$').Groups[1].Value.Trim()
  $Pop = [regex]::Match($AsmText, '(?m)^\s*cm\.popret\s+(.+)$').Groups[1].Value.Trim()
  $WitnessSymbol = [regex]::Match($ReadText, '(?s)Name: witness \([^\)]*\).*?Size: (\d+)')
  $WitnessBytes = if ($WitnessSymbol.Success) { [int]$WitnessSymbol.Groups[1].Value } else { -1 }
  $Metrics = @($Llc, $Mc, $Link, $Read, $Dis)
  $Rows += [ordered]@{
    arm = $Arm.name
    args = $Arm.args
    push = $Push
    popret = $Pop
    witness_text_bytes = $WitnessBytes
    wall_seconds = ($Metrics | Measure-Object wall_seconds -Sum).Sum
    cpu_seconds = ($Metrics | Measure-Object cpu_seconds -Sum).Sum
    peak_working_set_bytes = ($Metrics | Measure-Object peak_working_set_bytes -Maximum).Maximum
    artifact_bytes = (Get-ChildItem -LiteralPath $Dir -File | Measure-Object Length -Sum).Sum
    all_native_steps_exit_zero = $true
  }
}

$Payload = [ordered]@{
  schema = 'zcmp-current-union-grid-v1'
  input = $Input
  target = 'riscv32-unknown-elf__rv32imac_zcmp__ilp32__O2'
  same_information = $true
  arm_count = $Rows.Count
  rows = $Rows
}
$Payload | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $OutRoot 'results.json') -Encoding UTF8
$Payload | ConvertTo-Json -Depth 8
