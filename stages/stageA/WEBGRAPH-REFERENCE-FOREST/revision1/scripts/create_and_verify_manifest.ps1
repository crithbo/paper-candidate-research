param([Parameter(Mandatory=$true)][string]$TopicRoot)
$ErrorActionPreference='Stop'
$root=(Resolve-Path -LiteralPath $TopicRoot).Path
$manifest=Join-Path $root 'HASH_MANIFEST.sha256'
if(Test-Path -LiteralPath $manifest){throw "fail-closed: manifest already exists"}
$files=@(Get-ChildItem -LiteralPath $root -Recurse -File | Where-Object {$_.FullName -ne $manifest} | Sort-Object {$_.FullName.Substring($root.Length+1).Replace('\','/')})
$sha=[Security.Cryptography.SHA256]::Create()
$lines=[Collections.Generic.List[string]]::new()
foreach($file in $files){
  $stream=[IO.File]::OpenRead($file.FullName)
  try{$hash=([BitConverter]::ToString($sha.ComputeHash($stream))).Replace('-','')}finally{$stream.Dispose()}
  $relative=$file.FullName.Substring($root.Length+1).Replace('\','/')
  $lines.Add("$hash  $relative")
}
[IO.File]::WriteAllLines($manifest,$lines,[Text.UTF8Encoding]::new($false))
$verified=0
foreach($line in [IO.File]::ReadLines($manifest)){
  if($line -notmatch '^([0-9A-F]{64})  (.+)$'){throw "malformed manifest line: $line"}
  $target=Join-Path $root ($Matches[2].Replace('/','\'))
  $stream=[IO.File]::OpenRead($target)
  try{$actual=([BitConverter]::ToString($sha.ComputeHash($stream))).Replace('-','')}finally{$stream.Dispose()}
  if($actual -ne $Matches[1]){throw "hash mismatch: $($Matches[2])"}
  $verified++
}
$sha.Dispose()
$manifestHash=(Get-FileHash -Algorithm SHA256 -LiteralPath $manifest).Hash
$totalBytes=($files|Measure-Object Length -Sum).Sum
Write-Output "manifest_entries=$verified"
Write-Output "manifest_self_sha256=$manifestHash"
Write-Output "manifested_bytes=$totalBytes"
