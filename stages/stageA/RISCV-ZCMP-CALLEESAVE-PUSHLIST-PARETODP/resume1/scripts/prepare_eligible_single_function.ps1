$ErrorActionPreference = 'Stop'

$ResumeRoot = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1'
$Bin = Join-Path $ResumeRoot 'b\bin'
$RuntimeBin = Join-Path $ResumeRoot 'resources\toolchain\llvm-mingw-20260616-ucrt-x86_64\bin'
$InheritedPath = [Environment]::GetEnvironmentVariable('PATH', 'Process')
[Environment]::SetEnvironmentVariable('PATH', $null, 'Process')
[Environment]::SetEnvironmentVariable('Path', $RuntimeBin + ';' + $InheritedPath, 'Process')
$EligibilityPath = Join-Path $ResumeRoot 'runs\natural\ELIGIBILITY.json'
$ModuleRoot = Join-Path $ResumeRoot 'runs\natural\modules'
$OutRoot = Join-Path $ResumeRoot 'runs\natural\single_function'
New-Item -ItemType Directory -Force -Path $OutRoot | Out-Null

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

$Eligibility = Get-Content -Raw -LiteralPath $EligibilityPath | ConvertFrom-Json
$Rows = @()
foreach ($Entry in @($Eligibility.rows | Where-Object { $_.eligible })) {
  $ModuleBase = [IO.Path]::GetFileNameWithoutExtension([string]$Entry.module)
  $SafeFunction = ([string]$Entry.function) -replace '[^A-Za-z0-9_.-]', '_'
  $Stem = $ModuleBase + '__' + $SafeFunction
  $InputIr = Join-Path $ModuleRoot ($ModuleBase + '.ll')
  $ExtractedIr = Join-Path $OutRoot ($Stem + '.ll')
  $Mir = Join-Path $OutRoot ($Stem + '.mir')

  $Extract = Invoke-Tracked -File (Join-Path $Bin 'llvm-extract.exe') `
    -Arguments @(('--func=' + [string]$Entry.function), '-S', '-o', $ExtractedIr, $InputIr) `
    -Stdout (Join-Path $OutRoot ($Stem + '.extract.stdout.log')) `
    -Stderr (Join-Path $OutRoot ($Stem + '.extract.stderr.log'))
  if ($Extract.exit_code -ne 0) { throw "llvm-extract failed for $Stem" }

  $Llc = Invoke-Tracked -File (Join-Path $Bin 'llc.exe') `
    -Arguments @('-mtriple=riscv32-unknown-elf', '-mattr=+m,+a,+c,+zcmp',
                 '-target-abi=ilp32', '-O2', '-verify-machineinstrs',
                 '-stop-before=greedy', '-o', $Mir, $ExtractedIr) `
    -Stdout (Join-Path $OutRoot ($Stem + '.llc.stdout.log')) `
    -Stderr (Join-Path $OutRoot ($Stem + '.llc.stderr.log'))
  if ($Llc.exit_code -ne 0) { throw "llc pregreedy failed for $Stem" }

  $Rows += [ordered]@{
    module = $ModuleBase
    function = [string]$Entry.function
    interface_width = [int]$Entry.interface_width
    extracted_ir = $ExtractedIr.Substring($ResumeRoot.Length + 1)
    extracted_ir_sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $ExtractedIr).Hash
    pregreedy_mir = $Mir.Substring($ResumeRoot.Length + 1)
    pregreedy_mir_sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $Mir).Hash
    extract_metrics = $Extract
    llc_metrics = $Llc
  }
}

$Payload = [ordered]@{
  schema = 'exact-single-function-pregreedy-freeze-v1'
  llvm_commit = 'ba5bccfe01368f76e74d6ff4c35f1330e155b4ba'
  source_eligibility_sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $EligibilityPath).Hash
  function_count = $Rows.Count
  all_native_steps_exit_zero = $true
  rows = $Rows
}
$Payload | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $OutRoot 'SINGLE_FUNCTION_FREEZE.json') -Encoding UTF8
$Payload | ConvertTo-Json -Depth 8
