param(
    [Parameter(Mandatory=$true)][string]$ParentRoot,
    [Parameter(Mandatory=$true)][string]$RevisionRoot
)
$ErrorActionPreference = 'Stop'
$resultRoot = Join-Path $RevisionRoot 'results\claim\matched'
New-Item -ItemType Directory -Force -Path $resultRoot | Out-Null
$metricsPath = Join-Path $resultRoot 'matched-pair-raw.tsv'
if (Test-Path -LiteralPath $metricsPath) { throw 'fail-closed: claim-bearing matched-pair metrics already exist' }
if (-not (Test-Path -LiteralPath (Join-Path $RevisionRoot 'SCIENTIFIC_REVISION_CONSUMPTION.yaml'))) {
    throw 'fail-closed: scientific revision consumption record is absent'
}
$runtimeBin = Join-Path $ParentRoot 'toolchain\msys64\clang64\bin'
$runtimeUsrBin = Join-Path $ParentRoot 'toolchain\msys64\usr\bin'
$env:PATH = "$runtimeBin;$runtimeUsrBin;$env:PATH"
Remove-Item Env:WEBGRAPH_EXACT_AUDIT -ErrorAction SilentlyContinue

$corpora = @(
    [pscustomobject]@{name='cnr-2000'; native=$true; input=(Join-Path $ParentRoot 'inputs\natural\cnr-padded\cnr-2000')},
    [pscustomobject]@{name='wiki-vote'; native=$false; input=(Join-Path $ParentRoot 'inputs\natural\wiki-vote-ascending-id.lists')}
)
$exeByVariant = @{
    baseline = (Join-Path $RevisionRoot 'bin\webgraph-stagea-baseline.exe')
    candidate = (Join-Path $RevisionRoot 'build\candidate-target\release\webgraph-stagea-candidate.exe')
}
$readerExe = Join-Path $RevisionRoot 'bin\webgraph-stagea-reader-bench.exe'
$rows = [System.Collections.Generic.List[string]]::new()
$rows.Add("corpus`tpair_index`torder_position`tvariant`texit_code`telapsed_ns`tcpu_ns`tpeak_working_set_bytes`tnodes`tarcs`treturned_bits`tbuild_ns`tsequential_validate_ns`tef_build_ns`trandom_validate_and_query_ns`tharness_query_checksum`treader_exit_code`treader_process_elapsed_ns`treader_process_cpu_ns`treader_peak_working_set_bytes`treader_sequential_full_decode_ns`treader_random_100k_ns`treader_sequential_checksum`treader_random_checksum`tnative_payload_bytes`tgraph_sha256`toffsets_sha256`tproperties_sha256`tef_sha256")

foreach ($corpus in $corpora) {
    for ($pair = 0; $pair -lt 11; $pair++) {
        $order = if (($pair % 2) -eq 0) { @('baseline','candidate') } else { @('candidate','baseline') }
        for ($position = 0; $position -lt 2; $position++) {
            $variant = $order[$position]
            $pairDir = Join-Path $resultRoot ($corpus.name + '\pair-' + $pair.ToString('00'))
            New-Item -ItemType Directory -Force -Path $pairDir | Out-Null
            $basename = Join-Path $pairDir $variant

            $psi = [System.Diagnostics.ProcessStartInfo]::new()
            $psi.FileName = $exeByVariant[$variant]
            $psi.UseShellExecute = $false
            $psi.RedirectStandardOutput = $true
            $psi.RedirectStandardError = $true
            $psi.CreateNoWindow = $true
            $prefix = if ($corpus.native) { '--native ' } else { '' }
            $psi.Arguments = $prefix + '"' + $corpus.input + '" "' + $basename + '"'
            $watch = [System.Diagnostics.Stopwatch]::StartNew()
            $proc = [System.Diagnostics.Process]::Start($psi)
            $peak = 0L
            while (-not $proc.HasExited) {
                try { $proc.Refresh(); $peak = [Math]::Max($peak, $proc.PeakWorkingSet64) } catch {}
                if ($watch.Elapsed.TotalSeconds -gt 300) { $proc.Kill(); throw "hard timeout for $($corpus.name)/pair-$pair/$variant" }
                Start-Sleep -Milliseconds 5
            }
            $watch.Stop()
            $stdout = $proc.StandardOutput.ReadToEnd()
            $stderr = $proc.StandardError.ReadToEnd()
            $proc.Refresh(); $peak = [Math]::Max($peak, $proc.PeakWorkingSet64)
            if ($proc.ExitCode -ne 0) { throw "$($corpus.name)/pair-$pair/$variant failed: $stderr" }
            [System.IO.File]::WriteAllText($basename + '.stdout.txt', $stdout, [System.Text.UTF8Encoding]::new($false))
            $kv = @{}
            foreach ($line in ($stdout -split "`r?`n")) { if ($line -match '^([^=]+)=(.*)$') { $kv[$Matches[1]]=$Matches[2] } }
            foreach ($key in @('nodes','arcs','returned_bits','build_ns','sequential_validate_ns','ef_build_ns','random_validate_and_query_ns','query_checksum')) {
                if (-not $kv.ContainsKey($key)) { throw "missing harness metric $key for $($corpus.name)/pair-$pair/$variant" }
            }

            $readerPsi = [System.Diagnostics.ProcessStartInfo]::new()
            $readerPsi.FileName = $readerExe
            $readerPsi.UseShellExecute = $false
            $readerPsi.RedirectStandardOutput = $true
            $readerPsi.RedirectStandardError = $true
            $readerPsi.CreateNoWindow = $true
            $readerPsi.Arguments = '"' + $basename + '" 1'
            $readerWatch = [System.Diagnostics.Stopwatch]::StartNew()
            $readerProc = [System.Diagnostics.Process]::Start($readerPsi)
            $readerPeak = 0L
            while (-not $readerProc.HasExited) {
                try { $readerProc.Refresh(); $readerPeak = [Math]::Max($readerPeak, $readerProc.PeakWorkingSet64) } catch {}
                if ($readerWatch.Elapsed.TotalSeconds -gt 120) { $readerProc.Kill(); throw "reader hard timeout for $($corpus.name)/pair-$pair/$variant" }
                Start-Sleep -Milliseconds 2
            }
            $readerWatch.Stop()
            $readerStdout = $readerProc.StandardOutput.ReadToEnd()
            $readerStderr = $readerProc.StandardError.ReadToEnd()
            $readerProc.Refresh(); $readerPeak = [Math]::Max($readerPeak, $readerProc.PeakWorkingSet64)
            if ($readerProc.ExitCode -ne 0) { throw "reader failed for $($corpus.name)/pair-$pair/$variant`: $readerStderr" }
            [System.IO.File]::WriteAllText($basename + '.reader.tsv', $readerStdout, [System.Text.UTF8Encoding]::new($false))
            $readerLines = @($readerStdout.Trim() -split "`r?`n")
            if ($readerLines.Count -ne 2) { throw "unexpected reader output for $($corpus.name)/pair-$pair/$variant" }
            $readerHeader = $readerLines[0] -split "`t"
            $readerValues = $readerLines[1] -split "`t"
            $reader = @{}
            for ($i=0; $i -lt $readerHeader.Count; $i++) { $reader[$readerHeader[$i]]=$readerValues[$i] }

            $payloadBytes = 0L
            $hashes = @{}
            foreach ($ext in @('graph','offsets','properties','ef')) {
                $file = $basename + '.' + $ext
                $hashes[$ext] = (Get-FileHash -Algorithm SHA256 -LiteralPath $file).Hash
                if ($ext -ne 'ef') { $payloadBytes += (Get-Item -LiteralPath $file).Length }
            }
            $elapsedNs = [long]($watch.Elapsed.TotalMilliseconds * 1000000.0)
            $cpuNs = [long]($proc.TotalProcessorTime.Ticks * 100L)
            $readerElapsedNs = [long]($readerWatch.Elapsed.TotalMilliseconds * 1000000.0)
            $readerCpuNs = [long]($readerProc.TotalProcessorTime.Ticks * 100L)
            $rows.Add("$($corpus.name)`t$pair`t$position`t$variant`t$($proc.ExitCode)`t$elapsedNs`t$cpuNs`t$peak`t$($kv.nodes)`t$($kv.arcs)`t$($kv.returned_bits)`t$($kv.build_ns)`t$($kv.sequential_validate_ns)`t$($kv.ef_build_ns)`t$($kv.random_validate_and_query_ns)`t$($kv.query_checksum)`t$($readerProc.ExitCode)`t$readerElapsedNs`t$readerCpuNs`t$readerPeak`t$($reader.sequential_full_decode_ns)`t$($reader.random_100k_ns)`t$($reader.sequential_checksum)`t$($reader.random_checksum)`t$payloadBytes`t$($hashes.graph)`t$($hashes.offsets)`t$($hashes.properties)`t$($hashes.ef)")
        }
        Write-Output "completed=$($corpus.name)/pair-$pair"
    }
}
[System.IO.File]::WriteAllLines($metricsPath, $rows, [System.Text.UTF8Encoding]::new($false))

