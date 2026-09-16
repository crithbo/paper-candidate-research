$ErrorActionPreference = 'Stop'

$ResumeRoot = '<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\resume1'
$ToolRoot = Join-Path $ResumeRoot 'resources\toolchain'
$LlvmMingwRoot = Join-Path $ToolRoot 'llvm-mingw-20260616-ucrt-x86_64'
$CMake = Join-Path $ToolRoot 'cmake-4.4.2-windows-x86_64\bin\cmake.exe'
$Ninja = Join-Path $ToolRoot 'ninja.exe'
$Python = '<LOCAL_USER_HOME>\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe'
$Source = Join-Path $ResumeRoot 's\llvm'
$Build = Join-Path $ResumeRoot 'b'

$env:PATH = (Join-Path $LlvmMingwRoot 'bin') + ';' + (Split-Path -Parent $CMake) + ';' + $ToolRoot + ';' + $env:PATH
New-Item -ItemType Directory -Force -Path $Build | Out-Null

$Arguments = @(
  '-S', $Source,
  '-B', $Build,
  '-G', 'Ninja',
  ('-DCMAKE_MAKE_PROGRAM=' + $Ninja),
  ('-DCMAKE_C_COMPILER=' + (Join-Path $LlvmMingwRoot 'bin\clang.exe')),
  ('-DCMAKE_CXX_COMPILER=' + (Join-Path $LlvmMingwRoot 'bin\clang++.exe')),
  ('-DPython3_EXECUTABLE=' + $Python),
  '-DCMAKE_BUILD_TYPE=Release',
  '-DLLVM_ENABLE_PROJECTS=lld',
  '-DLLVM_TARGETS_TO_BUILD=RISCV;X86',
  '-DLLVM_ENABLE_ASSERTIONS=ON',
  '-DLLVM_BUILD_TOOLS=ON',
  '-DLLVM_BUILD_TESTS=OFF',
  '-DLLVM_INCLUDE_TESTS=OFF',
  '-DLLVM_INCLUDE_EXAMPLES=OFF',
  '-DLLVM_INCLUDE_BENCHMARKS=OFF',
  '-DLLVM_INCLUDE_DOCS=OFF',
  '-DLLVM_ENABLE_BINDINGS=OFF',
  '-DLLVM_ENABLE_ZLIB=OFF',
  '-DLLVM_ENABLE_ZSTD=OFF',
  '-DLLVM_ENABLE_LIBXML2=OFF',
  '-DLLVM_ENABLE_CURL=OFF',
  '-DLLVM_ENABLE_TERMINFO=OFF',
  '-DLLVM_ENABLE_LIBEDIT=OFF',
  '-DLLVM_ENABLE_THREADS=ON',
  '-DLLVM_PARALLEL_COMPILE_JOBS=2',
  '-DLLVM_PARALLEL_LINK_JOBS=1'
)

& $CMake @Arguments
exit $LASTEXITCODE
