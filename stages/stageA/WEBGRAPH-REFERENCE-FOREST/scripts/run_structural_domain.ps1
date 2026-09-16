param(
    [Parameter(Mandatory=$true)][string]$TopicRoot
)
$ErrorActionPreference = 'Stop'
$caseDir = Join-Path $TopicRoot 'inputs\structural'
$resultDir = Join-Path $TopicRoot 'results\killer\structural'
$outputDir = Join-Path $resultDir 'native-outputs'
$auditPath = Join-Path $resultDir 'candidate-audit.tsv'
$metricsPath = Join-Path $resultDir 'run-metrics.tsv'
$exe = Join-Path $TopicRoot 'build\candidate-target\release\webgraph-stagea-candidate.exe'
$runtimeBin = Join-Path $TopicRoot 'toolchain\msys64\clang64\bin'
$runtimeUsrBin = Join-Path $TopicRoot 'toolchain\msys64\usr\bin'
New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
if (Test-Path -LiteralPath $auditPath) { throw "fail-closed: audit output already exists: $auditPath" }
if (Test-Path -LiteralPath $metricsPath) { throw "fail-closed: metrics output already exists: $metricsPath" }
$env:PATH = "$runtimeBin;$runtimeUsrBin;$env:PATH"
$env:WEBGRAPH_EXACT_AUDIT = $auditPath
$cases = @(Get-ChildItem -LiteralPath $caseDir -Filter 'case-????.lists' -File | Sort-Object Name)
if ($cases.Count -ne 2048) { throw "expected 2048 frozen cases, found $($cases.Count)" }
$rows = [System.Collections.Generic.List[string]]::new()
$rows.Add("case_id`texit_code`telapsed_ns`tcpu_ns`tpeak_working_set_bytes`treturned_bits`tbuild_ns`tsequential_validate_ns`tef_build_ns`trandom_validate_and_query_ns`tquery_checksum")
foreach ($case in $cases) {
    $caseId = [System.IO.Path]::GetFileNameWithoutExtension($case.Name)
    $basename = Join-Path $outputDir $caseId
    $psi = [System.Diagnostics.ProcessStartInfo]::new()
    $psi.FileName = $exe
    $psi.UseShellExecute = $false
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $psi.CreateNoWindow = $true
    # Windows PowerShell 5.1 targets .NET Framework and does not expose the
    # newer ProcessStartInfo.ArgumentList collection.
    $psi.Arguments = '"' + $case.FullName + '" "' + $basename + '"'
    $watch = [System.Diagnostics.Stopwatch]::StartNew()
    $proc = [System.Diagnostics.Process]::Start($psi)
    $peak = 0L
    while (-not $proc.HasExited) {
        try { $proc.Refresh(); $peak = [Math]::Max($peak, $proc.PeakWorkingSet64) } catch {}
        Start-Sleep -Milliseconds 2
    }
    $watch.Stop()
    $stdout = $proc.StandardOutput.ReadToEnd()
    $stderr = $proc.StandardError.ReadToEnd()
    $proc.Refresh()
    $peak = [Math]::Max($peak, $proc.PeakWorkingSet64)
    $exit = $proc.ExitCode
    $cpuNs = [long]($proc.TotalProcessorTime.TotalMilliseconds * 1000000.0)
    if ($exit -ne 0) { throw "case $caseId failed with exit $exit`: $stderr" }
    $kv = @{}
    foreach ($line in ($stdout -split "`r?`n")) {
        if ($line -match '^([^=]+)=(.*)$') { $kv[$Matches[1]] = $Matches[2] }
    }
    foreach ($key in @('returned_bits','build_ns','sequential_validate_ns','ef_build_ns','random_validate_and_query_ns','query_checksum')) {
        if (-not $kv.ContainsKey($key)) { throw "case $caseId missing metric $key" }
    }
    $rows.Add("$caseId`t$exit`t$($watch.ElapsedTicks * (1000000000L / [System.Diagnostics.Stopwatch]::Frequency))`t$cpuNs`t$peak`t$($kv.returned_bits)`t$($kv.build_ns)`t$($kv.sequential_validate_ns)`t$($kv.ef_build_ns)`t$($kv.random_validate_and_query_ns)`t$($kv.query_checksum)")
    if (($rows.Count - 1) % 128 -eq 0) { Write-Output "completed_cases=$($rows.Count - 1)" }
}
[System.IO.File]::WriteAllLines($metricsPath, $rows, [System.Text.UTF8Encoding]::new($false))
Write-Output "completed_cases=2048"
