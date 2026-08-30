#!/usr/bin/env bash
set -eu

export PATH='/mingw64/bin:/usr/bin:/c/Windows/System32:/c/Windows'

relay='/d/project/writing/reserch/stages/stageA/CVC5-ALETHE-SHAREMAP/resume12-scripted-relay-smoke-build/resources/env/relay/native_tool_relay.exe'
source_file='/d/project/writing/reserch/stages/stageA/CVC5-ALETHE-SHAREMAP/resume12-scripted-relay-smoke-build/resources/src/smoke/conftest.c'
output_file='/d/project/writing/reserch/stages/stageA/CVC5-ALETHE-SHAREMAP/resume12-scripted-relay-smoke-build/resources/build/smoke/conftest.exe'

"$relay" gcc -O2 -pedantic -fomit-frame-pointer -m64 "$source_file" -o "$output_file"
"$output_file"
