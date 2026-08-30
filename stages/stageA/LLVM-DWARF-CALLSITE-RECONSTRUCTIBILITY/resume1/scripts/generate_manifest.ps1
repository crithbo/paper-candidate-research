param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$sourceRoot = 'src/llvm-project-e72ba6cf366a3180cbf5a8690d9e50665880ab76'
$paths = @(
    'MAINLINE_ASSIGNMENT.yaml',
    'RESOURCE_ACQUISITION_LEDGER.yaml',
    'ENVIRONMENT_LOCK.yaml',
    'BUILD_PROVENANCE.yaml',
    'EXPERIMENT_CONTRACT.yaml',
    'COMMAND_LOG.md',
    'PRE_CLAIM_FIDELITY_GATE.md',
    'CURRENT_UPSTREAM_REALITY_CHECK.md',
    'Q1_COMPARATOR_MATRIX.md',
    'RESULTS.md',
    'USER_BLOCKER_PACKET.md',
    'STAGEA_REPORT.md',
    'handoff.yaml',
    'scripts/audit_archive.py',
    'scripts/generate_manifest.ps1',
    'logs/github_commit_e72ba6cf.headers',
    'logs/llvm_source_archive.headers',
    'resources/github_commit_e72ba6cf.json',
    'resources/llvm-project-e72ba6cf366a3180cbf5a8690d9e50665880ab76.tar.gz',
    "$sourceRoot/LICENSE.TXT",
    "$sourceRoot/llvm/CMakeLists.txt",
    "$sourceRoot/clang/CMakeLists.txt",
    "$sourceRoot/llvm/lib/CodeGen/AsmPrinter/DwarfDebug.cpp",
    "$sourceRoot/llvm/lib/CodeGen/LiveDebugValues/LiveDebugValues.cpp",
    "$sourceRoot/llvm/lib/Target/X86/X86RegisterInfo.cpp",
    "$sourceRoot/llvm/lib/Target/X86/X86FrameLowering.cpp",
    'build/CMakeCache.txt',
    'build/build.ninja',
    'build/.ninja_log',
    'build/bin/libc++.dll',
    'build/bin/libunwind.dll',
    'build/bin/llc.exe',
    'build/bin/clang.exe',
    'build/bin/llvm-dwarfdump.exe',
    'build/bin/llvm-objdump.exe',
    'build/bin/llvm-readobj.exe',
    'build/bin/opt.exe',
    'smoke/reader_smoke.c',
    'smoke/reader_smoke.o',
    'smoke/reader_smoke.bc',
    'smoke/reader_smoke.verified.bc'
)

$lines = foreach ($relative in $paths) {
    $nativeRelative = $relative.Replace('/', [IO.Path]::DirectorySeparatorChar)
    $full = Join-Path $Root $nativeRelative
    if (-not (Test-Path -LiteralPath $full -PathType Leaf)) {
        throw "Missing canonical manifest item: $relative"
    }
    $hash = (Get-FileHash -LiteralPath $full -Algorithm SHA256).Hash.ToUpperInvariant()
    "$hash  $relative"
}

$manifest = Join-Path $Root 'HASH_MANIFEST.sha256'
[IO.File]::WriteAllText($manifest, (($lines -join "`n") + "`n"), [Text.UTF8Encoding]::new($false))

$verified = 0
foreach ($line in [IO.File]::ReadAllLines($manifest)) {
    if ($line -notmatch '^([0-9A-F]{64})  (.+)$') {
        throw "Malformed manifest line: $line"
    }
    $expected = $Matches[1]
    $relative = $Matches[2]
    $nativeRelative = $relative.Replace('/', [IO.Path]::DirectorySeparatorChar)
    $actual = (Get-FileHash -LiteralPath (Join-Path $Root $nativeRelative) -Algorithm SHA256).Hash.ToUpperInvariant()
    if ($actual -ne $expected) {
        throw "Manifest mismatch: $relative"
    }
    $verified++
}

[pscustomobject]@{
    manifest = $manifest
    items = $verified
    sha256 = (Get-FileHash -LiteralPath $manifest -Algorithm SHA256).Hash.ToUpperInvariant()
} | ConvertTo-Json -Compress
