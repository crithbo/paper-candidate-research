param(
  [Parameter(Mandatory=$true)][string]$RevisionRoot
)

$ErrorActionPreference = 'Stop'
$Commit = '269e9068d6fd6e68b1cc5a76eb77744f88af42ec'
$Git = '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\git\cmd\git.exe'
$Corpus = Join-Path $RevisionRoot 'corpus\rocm-examples'

if (-not (Test-Path -LiteralPath $Corpus)) {
  New-Item -ItemType Directory -Force -Path $Corpus | Out-Null
  & $Git -C $Corpus init
  & $Git -C $Corpus remote add origin 'https://github.com/ROCm/rocm-examples.git'
  & $Git -C $Corpus sparse-checkout init --cone
  & $Git -C $Corpus sparse-checkout set `
    'Programming-Guide/Tutorials/Performance-Optimization/basic_image_gamma_correction' `
    'Programming-Guide/Tutorials/Performance-Optimization/grid_stride_image_gamma_correction' `
    'Programming-Guide/Tutorials/Performance-Optimization/tiling_matrix_multiply' `
    'Programming-Guide/Tutorials/Performance-Optimization/tiling_matrix_transpose' `
    'Tutorials/reduction' `
    'HIP-Basic/matrix_multiplication' `
    'HIP-Basic/moving_average' `
    'HIP-Basic/saxpy'
  & $Git -C $Corpus -c http.sslBackend=openssl fetch --depth 1 origin $Commit
  if ($LASTEXITCODE -ne 0) { throw 'natural corpus fetch failed' }
  & $Git -C $Corpus checkout --detach FETCH_HEAD
}
$head = (& $Git -C $Corpus rev-parse HEAD).Trim()
if ($head -ne $Commit) { throw "corpus commit mismatch: $head" }
if (-not (Test-Path -LiteralPath (Join-Path $Corpus 'LICENSE'))) { throw 'corpus license missing' }

