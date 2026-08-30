param([Parameter(Mandatory=$true)][string]$TopicRoot)
$ErrorActionPreference='Stop'
$dir=Join-Path $TopicRoot 'results\killer\natural\reader-replay'
New-Item -ItemType Directory -Force -Path $dir | Out-Null
$summary=Join-Path $dir 'process-metrics.tsv'
if(Test-Path -LiteralPath $summary){throw 'fail-closed: reader replay metrics exist'}
$env:PATH=(Join-Path $TopicRoot 'toolchain\msys64\clang64\bin')+';'+(Join-Path $TopicRoot 'toolchain\msys64\usr\bin')+';'+$env:PATH
$exe=Join-Path $TopicRoot 'build\reader-target\release\webgraph-stagea-reader-bench.exe'
$tracks=@('cnr-2000-baseline','cnr-2000-candidate','wiki-vote-baseline','wiki-vote-candidate')
$rows=[System.Collections.Generic.List[string]]::new(); $rows.Add("track`texit_code`telapsed_ns`tcpu_ns`tpeak_working_set_bytes")
foreach($track in $tracks){
  $base=Join-Path $TopicRoot ('results\killer\natural\'+$track)
  $psi=[Diagnostics.ProcessStartInfo]::new(); $psi.FileName=$exe; $psi.UseShellExecute=$false; $psi.RedirectStandardOutput=$true; $psi.RedirectStandardError=$true; $psi.CreateNoWindow=$true; $psi.Arguments='"'+$base+'" 11'
  $watch=[Diagnostics.Stopwatch]::StartNew(); $proc=[Diagnostics.Process]::Start($psi); $peak=0L
  while(-not $proc.HasExited){try{$proc.Refresh();$peak=[Math]::Max($peak,$proc.PeakWorkingSet64)}catch{};Start-Sleep -Milliseconds 5}
  $watch.Stop();$stdout=$proc.StandardOutput.ReadToEnd();$stderr=$proc.StandardError.ReadToEnd();$proc.Refresh();$peak=[Math]::Max($peak,$proc.PeakWorkingSet64)
  if($proc.ExitCode -ne 0){throw "$track failed: $stderr"}
  [IO.File]::WriteAllText((Join-Path $dir ($track+'.tsv')),$stdout,[Text.UTF8Encoding]::new($false))
  $rows.Add("$track`t$($proc.ExitCode)`t$([long]($watch.Elapsed.TotalMilliseconds*1000000.0))`t$([long]($proc.TotalProcessorTime.TotalMilliseconds*1000000.0))`t$peak")
  Write-Output "completed=$track"
}
[IO.File]::WriteAllLines($summary,$rows,[Text.UTF8Encoding]::new($false))
