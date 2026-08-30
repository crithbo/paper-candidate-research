$ErrorActionPreference = 'Stop'
$ResumeRoot = 'D:\project\writing\reserch\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1'
$CorpusRoot = Join-Path $ResumeRoot 'resources\corpus\embench\src'
$Support = Join-Path $ResumeRoot 'resources\corpus\embench\support'
$Shim = Join-Path $ResumeRoot 'resources\corpus\include_shim'
$RuntimeBin = Join-Path $ResumeRoot 'resources\toolchain\llvm-mingw-20260616-ucrt-x86_64\bin'
$Clang = Join-Path $RuntimeBin 'clang.exe'
$OutRoot = Join-Path $ResumeRoot 'runs\natural\modules'
New-Item -ItemType Directory -Force -Path $OutRoot | Out-Null

function Quote-Arg([string]$Value) {
  if ($Value -match '[\s"]') { return '"' + ($Value -replace '"', '\"') + '"' }
  return $Value
}

$Rows = @()
$Sources = Get-ChildItem -LiteralPath $CorpusRoot -Filter '*.c' -File -Recurse | Sort-Object FullName
foreach ($Source in $Sources) {
  $Benchmark = Split-Path -Leaf $Source.DirectoryName
  $Stem = [IO.Path]::GetFileNameWithoutExtension($Source.Name)
  $Name = $Benchmark + '__' + $Stem
  $Out = Join-Path $OutRoot ($Name + '.ll')
  $Stdout = Join-Path $OutRoot ($Name + '.clang.stdout.log')
  $Stderr = Join-Path $OutRoot ($Name + '.clang.stderr.log')
  $Args = @(
    '-target', 'riscv32-unknown-elf', '-march=rv32imac_zcmp', '-mabi=ilp32',
    '-O2', '-ffreestanding', '-fno-builtin', '-DCPU_MHZ=1',
    '-I', $Shim, '-I', $Support, '-I', $Source.DirectoryName,
    '-S', '-emit-llvm', '-o', $Out, $Source.FullName
  )
  $Info = New-Object System.Diagnostics.ProcessStartInfo
  $Info.FileName = $Clang
  $Info.Arguments = (($Args | ForEach-Object { Quote-Arg $_ }) -join ' ')
  $Info.UseShellExecute = $false
  $Info.CreateNoWindow = $true
  $Info.RedirectStandardOutput = $true
  $Info.RedirectStandardError = $true
  $Process = New-Object System.Diagnostics.Process
  $Process.StartInfo = $Info
  $Started = Get-Date
  [void]$Process.Start()
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
  $StdoutTask.Result | Set-Content -LiteralPath $Stdout -Encoding UTF8
  $StderrTask.Result | Set-Content -LiteralPath $Stderr -Encoding UTF8
  $Ended = Get-Date
  $Success = $Process.ExitCode -eq 0 -and (Test-Path -LiteralPath $Out)
  $Rows += [ordered]@{
    benchmark = $Benchmark
    source = $Source.FullName.Substring($ResumeRoot.Length + 1)
    source_sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $Source.FullName).Hash
    module = if ($Success) { $Out.Substring($ResumeRoot.Length + 1) } else { $null }
    module_sha256 = if ($Success) { (Get-FileHash -Algorithm SHA256 -LiteralPath $Out).Hash } else { $null }
    module_bytes = if ($Success) { (Get-Item -LiteralPath $Out).Length } else { 0 }
    exit_code = $Process.ExitCode
    wall_seconds = ($Ended - $Started).TotalSeconds
    cpu_seconds = $Process.TotalProcessorTime.TotalSeconds
    peak_working_set_bytes = $Peak
    success = $Success
    stderr = $Stderr.Substring($ResumeRoot.Length + 1)
  }
}

$Payload = [ordered]@{
  schema = 'embench-module-freeze-v1'
  corpus_commit = '0466a18e4f6b47e19598d7c6ba72916d54b68f65'
  frontend = 'clang 22.1.8 ca7933e47d3a3451d81e72ac174dcb5aa28b59d1'
  target = 'riscv32-unknown-elf__rv32imac_zcmp__ilp32'
  flags = @('-O2', '-ffreestanding', '-fno-builtin', '-DCPU_MHZ=1')
  source_count = $Rows.Count
  success_count = @($Rows | Where-Object success).Count
  failure_count = @($Rows | Where-Object { -not $_.success }).Count
  rows = $Rows
}
$Payload | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath (Join-Path $OutRoot 'MODULE_FREEZE.json') -Encoding UTF8
$Payload | ConvertTo-Json -Depth 8
