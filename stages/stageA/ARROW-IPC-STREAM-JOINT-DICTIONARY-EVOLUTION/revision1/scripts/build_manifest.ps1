$ErrorActionPreference = 'Stop'
$root = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$manifest = Join-Path $root 'HASH_MANIFEST.sha256'
$files = Get-ChildItem -LiteralPath $root -Recurse -File |
    Where-Object { $_.FullName -ne $manifest } |
    Sort-Object { $_.FullName.Substring($root.Length + 1).Replace('\', '/') }
$lines = foreach ($file in $files) {
    $relative = $file.FullName.Substring($root.Length + 1).Replace('\', '/')
    $hash = (Get-FileHash -Algorithm SHA256 -LiteralPath $file.FullName).Hash.ToUpperInvariant()
    "$hash  $relative"
}
[System.IO.File]::WriteAllLines($manifest, $lines, [System.Text.UTF8Encoding]::new($false))
Write-Output "entries=$($lines.Count)"
Write-Output "manifest=$manifest"
