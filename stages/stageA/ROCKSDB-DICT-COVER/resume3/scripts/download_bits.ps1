param(
    [Parameter(Mandatory = $true)][string]$Source,
    [Parameter(Mandatory = $true)][string]$Destination,
    [Parameter(Mandatory = $true)][string]$Etag
)

$ErrorActionPreference = 'Stop'
Import-Module BitsTransfer
if (Test-Path -LiteralPath $Destination) {
    throw "Refusing to overwrite BITS destination: $Destination"
}
$parent = Split-Path -Parent $Destination
New-Item -ItemType Directory -Path $parent -Force | Out-Null
$headers = @("If-Match: $Etag", 'Accept-Encoding: identity')
Start-BitsTransfer -Source $Source -Destination $Destination -TransferType Download `
    -DisplayName 'ROCKSDB-DICT-COVER-Resume3-Route4' -Description 'Exact official NVD annual feed recovery' `
    -CustomHeaders $headers -Priority Foreground -RetryInterval 60 -RetryTimeout 300 `
    -MaxDownloadTime 900 -ErrorAction Stop
