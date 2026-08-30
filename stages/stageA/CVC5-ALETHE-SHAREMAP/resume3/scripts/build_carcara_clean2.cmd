@echo off
setlocal
set "RESUME_ROOT=D:\project\writing\reserch\stages\stageA\CVC5-ALETHE-SHAREMAP\resume3"
set "MSYS_ROOT=D:\project\writing\reserch\stages\stageA\CVC5-ALETHE-SHAREMAP\resume1\toolchain\msys64"
set "CARGO_HOME=%RESUME_ROOT%\toolchain\cargo-home"
set "RUSTUP_HOME=%RESUME_ROOT%\toolchain\rustup-home"
set "CARGO_TARGET_DIR=%RESUME_ROOT%\build\carcara-target-build2"
set "CARGO_NET_OFFLINE=true"
set "CC=%MSYS_ROOT%\clang64\bin\clang.exe"
set "CXX=%MSYS_ROOT%\clang64\bin\clang++.exe"
set "AR=%MSYS_ROOT%\clang64\bin\llvm-ar.exe"
set "MAKE=%MSYS_ROOT%\usr\bin\make.exe"
set "SHELL=%MSYS_ROOT%\usr\bin\sh.exe"
set "CARGO_TARGET_X86_64_PC_WINDOWS_GNU_LINKER=%MSYS_ROOT%\clang64\bin\clang.exe"
set "TEMP=%RESUME_ROOT%\build\tmp"
set "TMP=%RESUME_ROOT%\build\tmp"
set "PATH=%CARGO_HOME%\bin;%RUSTUP_HOME%\toolchains\1.72.0-x86_64-pc-windows-gnu\bin;%MSYS_ROOT%\clang64\bin;%MSYS_ROOT%\usr\bin;%SystemRoot%\System32"
cd /d "%RESUME_ROOT%\sources\carcara-carcara-1.1.0"
"%CARGO_HOME%\bin\cargo.exe" build --release --locked --offline -p carcara-cli
exit /b %ERRORLEVEL%
