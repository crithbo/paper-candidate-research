param(
  [Parameter(Mandatory=$true)][string]$RevisionRoot
)

$ErrorActionPreference = 'Stop'
$Commit = '1f112d62e1fa2c4f1a04887abd72da1ed61cf791'
$Python = '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
$Git = '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\git\cmd\git.exe'
$Downloads = Join-Path $RevisionRoot 'downloads'
$Tools = Join-Path $RevisionRoot 'tools'
$Source = Join-Path $RevisionRoot 'source\llvm-project'
$Build = Join-Path $RevisionRoot 'build\llvm-exact'
$Logs = Join-Path $RevisionRoot 'logs'

New-Item -ItemType Directory -Force -Path $Downloads,$Tools,$Logs | Out-Null

function Measure-RevisionBytes {
  $sum = (Get-ChildItem -LiteralPath $RevisionRoot -Recurse -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum
  if ($null -eq $sum) { return 0 }
  return [int64]$sum
}

function Assert-Budget {
  $bytes = Measure-RevisionBytes
  if ($bytes -gt 4294967296) { throw "Revision storage budget exceeded: $bytes bytes" }
  "STORAGE_BYTES=$bytes" | Tee-Object -FilePath (Join-Path $Logs 'storage.log') -Append
}

function Download-Verified {
  param([string]$Url,[string]$Path,[string]$Expected)
  if (-not (Test-Path -LiteralPath $Path)) {
    & $Python -c "import urllib.request; urllib.request.urlretrieve(r'$Url', r'$Path')"
    if ($LASTEXITCODE -ne 0) { throw "download failed: $Url" }
  }
  $actual = (Get-FileHash -Algorithm SHA256 -LiteralPath $Path).Hash.ToLower()
  if ($actual -ne $Expected) { throw "hash mismatch for $Path expected=$Expected actual=$actual" }
  Assert-Budget
}

$bootstrapZip = Join-Path $Downloads 'llvm-mingw-20260616-ucrt-x86_64.zip'
$cmakeWheel = Join-Path $Downloads 'cmake-4.1.0-py3-none-win_amd64.whl'
$ninjaWheel = Join-Path $Downloads 'ninja-1.11.1.4-py3-none-win_amd64.whl'

Download-Verified 'https://github.com/mstorsjo/llvm-mingw/releases/download/20260616/llvm-mingw-20260616-ucrt-x86_64.zip' $bootstrapZip 'b9b68a4d276e16fa25802aaba458e4638f64b3884c290aaccdc2d87083b6ca35'
Download-Verified 'https://files.pythonhosted.org/packages/7c/d0/73cae88d8c25973f2465d5a4457264f95617c16ad321824ed4c243734511/cmake-4.1.0-py3-none-win_amd64.whl' $cmakeWheel '76e8e7d80a1a9bb5c7ec13ec8da961a8c5a997247f86a08b29f0c2946290c461'
Download-Verified 'https://files.pythonhosted.org/packages/5b/10/9b8fe9ac004847490cc7b54896124c01ce2d87d95dc60aabd0b8591addff/ninja-1.11.1.4-py3-none-win_amd64.whl' $ninjaWheel '4617b3c12ff64b611a7d93fd9e378275512bb36eff8babff7c83f5116b4f8d66'

$bootstrapRoot = Join-Path $Tools 'llvm-mingw-20260616-ucrt-x86_64'
if (-not (Test-Path -LiteralPath $bootstrapRoot)) {
  Expand-Archive -LiteralPath $bootstrapZip -DestinationPath $Tools
}
Assert-Budget

$pythonPackages = Join-Path $Tools 'python-packages'
& $Python -m pip install --no-index --no-deps --target $pythonPackages $cmakeWheel $ninjaWheel
if ($LASTEXITCODE -ne 0) { throw 'cmake/ninja wheel installation failed' }
Assert-Budget

if (-not (Test-Path -LiteralPath $Source)) {
  New-Item -ItemType Directory -Force -Path $Source | Out-Null
  & $Git -C $Source init
  & $Git -C $Source remote add origin 'https://github.com/llvm/llvm-project.git'
  & $Git -C $Source sparse-checkout init --cone
  & $Git -C $Source sparse-checkout set llvm
  & $Git -C $Source -c http.sslBackend=openssl fetch --depth 1 origin $Commit
  if ($LASTEXITCODE -ne 0) { throw 'exact LLVM fetch failed' }
  & $Git -C $Source checkout --detach FETCH_HEAD
}
$head = (& $Git -C $Source rev-parse HEAD).Trim()
if ($head -ne $Commit) { throw "LLVM source commit mismatch: $head" }
Assert-Budget

$clang = Join-Path $bootstrapRoot 'bin\clang.exe'
$clangxx = Join-Path $bootstrapRoot 'bin\clang++.exe'
$ninja = (Get-ChildItem -LiteralPath $pythonPackages -Recurse -Filter ninja.exe | Select-Object -First 1).FullName
$env:PYTHONPATH = $pythonPackages
$env:PATH = (Join-Path $bootstrapRoot 'bin') + ';' + $env:PATH

New-Item -ItemType Directory -Force -Path $Build | Out-Null
& $Python -m cmake -S (Join-Path $Source 'llvm') -B $Build -G Ninja `
  -DCMAKE_BUILD_TYPE=Release `
  -DCMAKE_C_COMPILER=$clang `
  -DCMAKE_CXX_COMPILER=$clangxx `
  -DCMAKE_MAKE_PROGRAM=$ninja `
  -DLLVM_TARGETS_TO_BUILD=AMDGPU `
  -DLLVM_ENABLE_ASSERTIONS=ON `
  -DLLVM_INCLUDE_TESTS=OFF `
  -DLLVM_INCLUDE_BENCHMARKS=OFF `
  -DLLVM_INCLUDE_EXAMPLES=OFF `
  -DLLVM_ENABLE_TERMINFO=OFF `
  -DLLVM_ENABLE_ZLIB=OFF `
  -DLLVM_ENABLE_ZSTD=OFF `
  -DLLVM_ENABLE_LIBXML2=OFF `
  -DLLVM_ENABLE_LIBEDIT=OFF `
  -DLLVM_ENABLE_RTTI=OFF 2>&1 | Tee-Object -FilePath (Join-Path $Logs 'configure.log')
if ($LASTEXITCODE -ne 0) { throw 'exact LLVM configure failed' }
Assert-Budget

& $Python -m cmake --build $Build --target llc FileCheck llvm-calc-occupancy -- -j 2 2>&1 | Tee-Object -FilePath (Join-Path $Logs 'build.log')
if ($LASTEXITCODE -ne 0) { throw 'exact LLVM build failed' }
Assert-Budget

$llc = Join-Path $Build 'bin\llc.exe'
$filecheck = Join-Path $Build 'bin\FileCheck.exe'
$occupancy = Join-Path $Build 'bin\llvm-calc-occupancy.exe'
foreach ($tool in $llc,$filecheck,$occupancy) {
  if (-not (Test-Path -LiteralPath $tool)) { throw "missing exact tool: $tool" }
}
& $llc --version | Tee-Object -FilePath (Join-Path $Logs 'llc-version.txt')
if ($LASTEXITCODE -ne 0) { throw 'exact llc smoke test failed' }
Assert-Budget

