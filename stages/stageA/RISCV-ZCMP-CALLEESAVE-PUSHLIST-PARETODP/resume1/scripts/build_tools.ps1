$ErrorActionPreference = 'Stop'

$ResumeRoot = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1'
$ToolRoot = Join-Path $ResumeRoot 'resources\toolchain'
$LlvmMingwRoot = Join-Path $ToolRoot 'llvm-mingw-20260616-ucrt-x86_64'
$Ninja = Join-Path $ToolRoot 'ninja.exe'
$Build = Join-Path $ResumeRoot 'b'
$RunRoot = Join-Path $ResumeRoot 'runs\resource_build_attempt1'
$Stdout = Join-Path $RunRoot 'build.stdout.log'
$Stderr = Join-Path $RunRoot 'build.stderr.log'
$Metrics = Join-Path $RunRoot 'build_metrics.json'
$HardTimeoutSeconds = 21600

New-Item -ItemType Directory -Force -Path $RunRoot | Out-Null
$InheritedPath = [Environment]::GetEnvironmentVariable('PATH', 'Process')
[Environment]::SetEnvironmentVariable('PATH', $null, 'Process')
[Environment]::SetEnvironmentVariable('Path', $null, 'Process')
[Environment]::SetEnvironmentVariable('Path', (Join-Path $LlvmMingwRoot 'bin') + ';' + $ToolRoot + ';' + $InheritedPath, 'Process')
$Started = Get-Date
$Process = Start-Process -FilePath $Ninja -ArgumentList @('-C', $Build, '-j', '2', '-v', 'llc', 'llvm-mc', 'llvm-objdump', 'llvm-readobj', 'lld') -RedirectStandardOutput $Stdout -RedirectStandardError $Stderr -PassThru -WindowStyle Hidden
$PeakObservedWorkingSet = 0L
$PeakObservedPrivateBytes = 0L
$LastUpdate = $Started
$TimedOut = $false

while (-not $Process.HasExited) {
  Start-Sleep -Seconds 2
  $Elapsed = ((Get-Date) - $Started).TotalSeconds
  $Processes = @(Get-Process -ErrorAction SilentlyContinue | Where-Object {
    $_.StartTime -ge $Started -and $_.ProcessName -match '^(ninja|clang|clang\+\+|ld\.lld|llvm-|lld)'
  })
  $WorkingSet = [long](($Processes | Measure-Object WorkingSet64 -Sum).Sum)
  $PrivateBytes = [long](($Processes | Measure-Object PrivateMemorySize64 -Sum).Sum)
  if ($WorkingSet -gt $PeakObservedWorkingSet) { $PeakObservedWorkingSet = $WorkingSet }
  if ($PrivateBytes -gt $PeakObservedPrivateBytes) { $PeakObservedPrivateBytes = $PrivateBytes }
  if (((Get-Date) - $LastUpdate).TotalSeconds -ge 30) {
    $Tail = if (Test-Path -LiteralPath $Stdout) { (Get-Content -LiteralPath $Stdout -Tail 1 -ErrorAction SilentlyContinue) } else { '' }
    Write-Output ('BUILD_PROGRESS elapsed_s={0:F0} active={1} rss_bytes={2} tail={3}' -f $Elapsed, $Processes.Count, $WorkingSet, $Tail)
    $LastUpdate = Get-Date
  }
  if ($Elapsed -ge $HardTimeoutSeconds) {
    $TimedOut = $true
    Stop-Process -Id $Process.Id -Force -ErrorAction SilentlyContinue
    break
  }
}

$Process.WaitForExit()
$Ended = Get-Date
$Result = [ordered]@{
  started_at = $Started.ToString('o')
  ended_at = $Ended.ToString('o')
  wall_seconds = ($Ended - $Started).TotalSeconds
  compile_jobs_max = 2
  conservative_cpu_upper_bound_seconds = 2 * ($Ended - $Started).TotalSeconds
  hard_timeout_seconds = $HardTimeoutSeconds
  timed_out = $TimedOut
  exit_code = if ($TimedOut) { 124 } else { $Process.ExitCode }
  peak_observed_working_set_bytes = $PeakObservedWorkingSet
  peak_observed_private_bytes = $PeakObservedPrivateBytes
  stdout = $Stdout
  stderr = $Stderr
}
$Result | ConvertTo-Json | Set-Content -LiteralPath $Metrics -Encoding UTF8
$Result | ConvertTo-Json
exit $Result.exit_code
