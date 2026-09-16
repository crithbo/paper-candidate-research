$ErrorActionPreference = 'Stop'
$root = (Get-Location).Path
$python = '<LOCAL_USER_HOME>/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'
$pwsh = '<LOCAL_USER_HOME>/.cache/codex-runtimes/codex-primary-runtime/dependencies/native/powershell/pwsh.exe'
$env:TEMP = Join-Path $root 'resources/tmp'
$env:TMP = Join-Path $root 'resources/tmp'
$env:TMPDIR = Join-Path $root 'resources/tmp'
$env:PYTHONPYCACHEPREFIX = Join-Path $root 'resources/cache/pycache'
$env:PYTHONDONTWRITEBYTECODE = '1'
$receiptPath = 'resources/logs/commands/r7c/C3_NATIVE_PARSER.argv.json'
$receiptArgv = @('-B','resources/src/apx_tpd/apx_tpd_r7c.py','parse-native','--catalog','resources/logs/control/r7c/native_action_catalog.json','--current-mir','resources/logs/control/a2/llvm_current_complete.mir','--tuning-mir','resources/logs/control/a2/llvm_tuning_relocation_enabled.mir','--out','resources/logs/control/r7c/native_baseline_parser_receipt.json')
$receipt = [ordered]@{COMMAND_ID='C3_NATIVE_PARSER'; PYTHON_EXECUTABLE=$python; ARGV=$receiptArgv; CWD=$root; START_UTC=[DateTime]::UtcNow.ToString('o'); EXPECTED_OUTPUT_PATH='resources/logs/control/r7c/native_baseline_parser_receipt.json'; RETRY_COUNT=0}
$receipt | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $receiptPath -Encoding utf8
$c3log = @(& $python @receiptArgv 2>&1)
$c3exit = $LASTEXITCODE
$c3log | Out-File -LiteralPath 'resources/logs/commands/r7c/C3_NATIVE_PARSER.output.txt' -Encoding utf8
if ($c3exit -ne 0) { exit $c3exit }

$c4formal = @('-NoLogo','-NoProfile','-NonInteractive','-File','resources/src/r6_harness/orbit_pareto.ps1','-OutputPath','resources/logs/control/r7c/r6_formal_control.json')
$c4formalLog = @(& $pwsh @c4formal 2>&1)
$c4formalExit = $LASTEXITCODE
$c4formalLog | Out-File -LiteralPath 'resources/logs/commands/r7c/C4_R6_FORMAL_CONTROL.output.txt' -Encoding utf8
if ($c4formalExit -ne 0) { exit $c4formalExit }

$c4oracle = @('-B','resources/src/apx_tpd/independent_oracle.py','--trace','resources/src/apx_tpd/tiny_trace.json','--contract','resources/src/apx_tpd/catalog_contract.json','--out','resources/logs/control/r7c/independent_oracle.json')
$c4oracleLog = @(& $python @c4oracle 2>&1)
$c4oracleExit = $LASTEXITCODE
$c4oracleLog | Out-File -LiteralPath 'resources/logs/commands/r7c/C4_INDEPENDENT_ORACLE.output.txt' -Encoding utf8
if ($c4oracleExit -ne 0) { exit $c4oracleExit }

$c4tiny = @('-B','resources/src/apx_tpd/apx_tpd_r7c.py','preclaim','--catalog','resources/logs/control/r7c/native_action_catalog.json','--trace','resources/src/apx_tpd/tiny_trace.json','--r6-control','resources/logs/control/r7c/r6_formal_control.json','--handler-audit','resources/logs/control/r7c/action_handler_coverage.json','--native-receipt','resources/logs/control/r7c/native_baseline_parser_receipt.json','--oracle','resources/logs/control/r7c/independent_oracle.json','--out','resources/logs/control/r7c/preclaim.json')
$c4tinyLog = @(& $python @c4tiny 2>&1)
$c4tinyExit = $LASTEXITCODE
$c4tinyLog | Out-File -LiteralPath 'resources/logs/commands/r7c/C4_TINY_PRECLAIM.output.txt' -Encoding utf8
if ($c4tinyExit -ne 0) { exit $c4tinyExit }

$c5 = @('-B','resources/src/apx_tpd/apx_tpd_r7c.py','freeze-corpus','--source-root','resources/src/llvm_subset','--precommit','CORPUS_ELIGIBILITY_PRECOMMIT.yaml','--out','resources/logs/corpus/r7c_same_object_freeze.json')
$c5log = @(& $python @c5 2>&1)
$c5exit = $LASTEXITCODE
$c5log | Out-File -LiteralPath 'resources/logs/commands/r7c/C5_CORPUS_FREEZE.output.txt' -Encoding utf8
if ($c5exit -ne 0) { exit $c5exit }

$c6 = @('-B','resources/src/apx_tpd/apx_tpd_r7c.py','r8-plan','--corpus','resources/logs/corpus/r7c_same_object_freeze.json','--driver','resources/src/apx_tpd/apx_r8_row_driver.py','--out','R8_RESOLVED_COMMAND_PRECOMMIT.yaml')
$c6log = @(& $python @c6 2>&1)
$c6exit = $LASTEXITCODE
$c6log | Out-File -LiteralPath 'resources/logs/commands/r7c/C6_RESOLVED_PLAN.output.txt' -Encoding utf8
if ($c6exit -ne 0) { exit $c6exit }
exit 0
