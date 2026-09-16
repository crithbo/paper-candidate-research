param(
    [Parameter(Mandatory=$true)][string]$ParentRoot,
    [Parameter(Mandatory=$true)][string]$RevisionRoot
)
$ErrorActionPreference = 'Stop'
$resultDir = Join-Path $RevisionRoot 'results\preclaim\natural'
New-Item -ItemType Directory -Force -Path $resultDir | Out-Null
$metricsPath = Join-Path $resultDir 'run-metrics.tsv'
if (Test-Path -LiteralPath $metricsPath) { throw 'fail-closed: preclaim natural metrics already exist' }
$runtimeBin = Join-Path $ParentRoot 'toolchain\msys64\clang64\bin'
$runtimeUsrBin = Join-Path $ParentRoot 'toolchain\msys64\usr\bin'
$env:PATH = "$runtimeBin;$runtimeUsrBin;$env:PATH"
$tracks = @(
    [pscustomobject]@{corpus='cnr-2000'; variant='baseline'; native=$true; input=(Join-Path $ParentRoot 'inputs\natural\cnr-padded\cnr-2000'); exe=(Join-Path $RevisionRoot 'bin\webgraph-stagea-baseline.exe')},
    [pscustomobject]@{corpus='cnr-2000'; variant='candidate'; native=$true; input=(Join-Path $ParentRoot 'inputs\natural\cnr-padded\cnr-2000'); exe=(Join-Path $RevisionRoot 'build\candidate-target\release\webgraph-stagea-candidate.exe')},
    [pscustomobject]@{corpus='wiki-vote'; variant='baseline'; native=$false; input=(Join-Path $ParentRoot 'inputs\natural\wiki-vote-ascending-id.lists'); exe=(Join-Path $RevisionRoot 'bin\webgraph-stagea-baseline.exe')},
    [pscustomobject]@{corpus='wiki-vote'; variant='candidate'; native=$false; input=(Join-Path $ParentRoot 'inputs\natural\wiki-vote-ascending-id.lists'); exe=(Join-Path $RevisionRoot 'build\candidate-target\release\webgraph-stagea-candidate.exe')}
)
$rows = [System.Collections.Generic.List[string]]::new()
$rows.Add("corpus`tvariant`texit_code`telapsed_ns`tcpu_ns`tpeak_working_set_bytes`tnodes`tarcs`treturned_bits`tbuild_ns`tsequential_validate_ns`tef_build_ns`trandom_validate_and_query_ns`tquery_checksum")
foreach ($track in $tracks) {
    $basename = Join-Path $resultDir ($track.corpus + '-' + $track.variant)
    if ($track.variant -eq 'candidate') {
        $audit = $basename + '-audit.tsv'
        if (Test-Path -LiteralPath $audit) { throw "fail-closed: audit already exists $audit" }
        $env:WEBGRAPH_EXACT_AUDIT = $audit
    } else {
        Remove-Item Env:WEBGRAPH_EXACT_AUDIT -ErrorAction SilentlyContinue
    }
    $psi = [System.Diagnostics.ProcessStartInfo]::new()
    $psi.FileName = $track.exe
    $psi.UseShellExecute = $false
    $psi.RedirectStandardOutput = $true
    $psi.RedirectStandardError = $true
    $psi.CreateNoWindow = $true
    $prefix = if ($track.native) { '--native ' } else { '' }
    $psi.Arguments = $prefix + '"' + $track.input + '" "' + $basename + '"'
    $watch = [System.Diagnostics.Stopwatch]::StartNew()
    $proc = [System.Diagnostics.Process]::Start($psi)
    $peak = 0L
    while (-not $proc.HasExited) {
        try { $proc.Refresh(); $peak = [Math]::Max($peak, $proc.PeakWorkingSet64) } catch {}
        if ($watch.Elapsed.TotalSeconds -gt 300) { $proc.Kill(); throw "hard timeout for $($track.corpus)/$($track.variant)" }
        Start-Sleep -Milliseconds 5
    }
    $watch.Stop()
    $stdout = $proc.StandardOutput.ReadToEnd()
    $stderr = $proc.StandardError.ReadToEnd()
    $proc.Refresh(); $peak = [Math]::Max($peak, $proc.PeakWorkingSet64)
    if ($proc.ExitCode -ne 0) { throw "$($track.corpus)/$($track.variant) failed: $stderr" }
    [System.IO.File]::WriteAllText($basename + '.stdout.txt', $stdout, [System.Text.UTF8Encoding]::new($false))
    $kv = @{}
    foreach ($line in ($stdout -split "`r?`n")) { if ($line -match '^([^=]+)=(.*)$') { $kv[$Matches[1]]=$Matches[2] } }
    foreach ($key in @('nodes','arcs','returned_bits','build_ns','sequential_validate_ns','ef_build_ns','random_validate_and_query_ns','query_checksum')) {
        if (-not $kv.ContainsKey($key)) { throw "missing $key for $($track.corpus)/$($track.variant)" }
    }
    $elapsedNs = [long]($watch.Elapsed.TotalMilliseconds * 1000000.0)
    $cpuNs = [long]($proc.TotalProcessorTime.TotalMilliseconds * 1000000.0)
    $rows.Add("$($track.corpus)`t$($track.variant)`t$($proc.ExitCode)`t$elapsedNs`t$cpuNs`t$peak`t$($kv.nodes)`t$($kv.arcs)`t$($kv.returned_bits)`t$($kv.build_ns)`t$($kv.sequential_validate_ns)`t$($kv.ef_build_ns)`t$($kv.random_validate_and_query_ns)`t$($kv.query_checksum)")
    Write-Output "completed=$($track.corpus)/$($track.variant) bits=$($kv.returned_bits)"
}
Remove-Item Env:WEBGRAPH_EXACT_AUDIT -ErrorAction SilentlyContinue
[System.IO.File]::WriteAllLines($metricsPath, $rows, [System.Text.UTF8Encoding]::new($false))

