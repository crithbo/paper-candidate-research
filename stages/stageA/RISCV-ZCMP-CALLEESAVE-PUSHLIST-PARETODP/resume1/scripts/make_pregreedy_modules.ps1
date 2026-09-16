$ErrorActionPreference = 'Stop'
$ResumeRoot = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1'
$RuntimeBin = Join-Path $ResumeRoot 'resources\toolchain\llvm-mingw-20260616-ucrt-x86_64\bin'
$Llc = Join-Path $ResumeRoot 'b\bin\llc.exe'
$ModuleRoot = Join-Path $ResumeRoot 'runs\natural\modules'
$OutRoot = Join-Path $ResumeRoot 'runs\natural\pregreedy_modules'
New-Item -ItemType Directory -Force -Path $OutRoot | Out-Null
$InheritedPath = [Environment]::GetEnvironmentVariable('PATH', 'Process')
[Environment]::SetEnvironmentVariable('PATH', $null, 'Process')
[Environment]::SetEnvironmentVariable('Path', $null, 'Process')
[Environment]::SetEnvironmentVariable('Path', $RuntimeBin + ';' + $InheritedPath, 'Process')

$Rows = @()
foreach ($Module in (Get-ChildItem -LiteralPath $ModuleRoot -Filter '*.ll' -File | Sort-Object Name)) {
  $Out = Join-Path $OutRoot ($Module.BaseName + '.mir')
  $StdoutLog = Join-Path $OutRoot ($Module.BaseName + '.llc.stdout.log')
  $StderrLog = Join-Path $OutRoot ($Module.BaseName + '.llc.stderr.log')
  $Started = Get-Date
  # Windows PowerShell promotes native stderr to ErrorRecord objects under
  # ErrorActionPreference=Stop.  Invoke llc as a native process so that the
  # exact process exit code, rather than diagnostic stream presence, decides
  # success; preserve both streams verbatim for audit.
  $Arguments = @(
    '-mtriple=riscv32-unknown-elf',
    '-mattr=+m,+a,+c,+zcmp',
    '-target-abi=ilp32',
    '-O2',
    '-verify-machineinstrs',
    '-stop-before=greedy',
    '-o', $Out,
    $Module.FullName
  )
  $Process = Start-Process -FilePath $Llc -ArgumentList $Arguments -NoNewWindow -Wait -PassThru `
    -RedirectStandardOutput $StdoutLog -RedirectStandardError $StderrLog
  $Exit = $Process.ExitCode
  $Ended = Get-Date
  $Rows += [ordered]@{
    module = $Module.Name
    module_sha256 = (Get-FileHash -Algorithm SHA256 -LiteralPath $Module.FullName).Hash
    mir = if ($Exit -eq 0) { $Out.Substring($ResumeRoot.Length + 1) } else { $null }
    mir_sha256 = if ($Exit -eq 0) { (Get-FileHash -Algorithm SHA256 -LiteralPath $Out).Hash } else { $null }
    exit_code = $Exit
    wall_seconds = ($Ended - $Started).TotalSeconds
  }
}
$Payload = [ordered]@{
  schema = 'exact-pregreedy-module-freeze-v1'
  llvm_commit = 'ba5bccfe01368f76e74d6ff4c35f1330e155b4ba'
  module_count = $Rows.Count
  success_count = @($Rows | Where-Object { $_.exit_code -eq 0 }).Count
  rows = $Rows
}
$Payload | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath (Join-Path $OutRoot 'PRE_GREEDY_FREEZE.json') -Encoding UTF8
$Payload | ConvertTo-Json -Depth 6
