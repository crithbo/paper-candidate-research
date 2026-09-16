@echo off
setlocal
set "RESUME_ROOT=<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\CVC5-ALETHE-SHAREMAP\resume3"
set "MSYS_ROOT=<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\CVC5-ALETHE-SHAREMAP\resume1\toolchain\msys64"
set "CARGO_HOME=%RESUME_ROOT%\toolchain\cargo-home"
set "RUSTUP_HOME=%RESUME_ROOT%\toolchain\rustup-home"
set "CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse"
set "TEMP=%RESUME_ROOT%\build\tmp"
set "TMP=%RESUME_ROOT%\build\tmp"
set "PATH=%CARGO_HOME%\bin;%RUSTUP_HOME%\toolchains\1.72.0-x86_64-pc-windows-gnu\bin;%MSYS_ROOT%\clang64\bin;%MSYS_ROOT%\usr\bin;%SystemRoot%\System32"
cd /d "%RESUME_ROOT%\sources\carcara-carcara-1.1.0"
"%CARGO_HOME%\bin\cargo.exe" fetch --locked
exit /b %ERRORLEVEL%
