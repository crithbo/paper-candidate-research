$ErrorActionPreference = 'Stop'
$root = (Get-Location).Path
$python = '<LOCAL_USER_HOME>/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'
$env:TEMP = Join-Path $root 'resources/tmp'
$env:TMP = Join-Path $root 'resources/tmp'
$env:TMPDIR = Join-Path $root 'resources/tmp'
$env:PYTHONPYCACHEPREFIX = Join-Path $root 'resources/cache/pycache'
$env:PYTHONDONTWRITEBYTECODE = '1'

$staticArgv = @('-B','-m','py_compile','resources/src/apx_tpd/independent_oracle.py')
$staticLog = @(& $python @staticArgv 2>&1)
$staticExit = $LASTEXITCODE
$staticLog | Out-File -LiteralPath 'resources/logs/commands/r7c/A2_STATIC_COMPILE.output.txt' -Encoding utf8
if ($staticExit -ne 0) { exit $staticExit }

$c4 = @('-B','resources/src/apx_tpd/apx_tpd_r7c.py','preclaim','--catalog','resources/logs/control/r7c/native_action_catalog.json','--trace','resources/src/apx_tpd/tiny_trace.json','--r6-control','resources/logs/control/r7c/r6_formal_control.json','--handler-audit','resources/logs/control/r7c/action_handler_coverage.json','--native-receipt','resources/logs/control/r7c/native_baseline_parser_receipt.json','--oracle','resources/logs/control/r7c/independent_oracle.json','--out','resources/logs/control/r7c/preclaim.json')
$c4Log = @(& $python @c4 2>&1)
$c4Exit = $LASTEXITCODE
$c4Log | Out-File -LiteralPath 'resources/logs/commands/r7c/A2_C4_TINY.output.txt' -Encoding utf8
if ($c4Exit -ne 0) { exit $c4Exit }

$c5 = @('-B','resources/src/apx_tpd/apx_tpd_r7c.py','freeze-corpus','--source-root','resources/src/llvm_subset','--precommit','CORPUS_ELIGIBILITY_PRECOMMIT.yaml','--out','resources/logs/corpus/r7c_same_object_freeze.json')
$c5Log = @(& $python @c5 2>&1)
$c5Exit = $LASTEXITCODE
$c5Log | Out-File -LiteralPath 'resources/logs/commands/r7c/A2_C5_CORPUS.output.txt' -Encoding utf8
if ($c5Exit -ne 0) { exit $c5Exit }

$c6 = @('-B','resources/src/apx_tpd/apx_tpd_r7c.py','r8-plan','--corpus','resources/logs/corpus/r7c_same_object_freeze.json','--driver','resources/src/apx_tpd/apx_r8_row_driver.py','--out','R8_RESOLVED_COMMAND_PRECOMMIT.yaml')
$c6Log = @(& $python @c6 2>&1)
$c6Exit = $LASTEXITCODE
$c6Log | Out-File -LiteralPath 'resources/logs/commands/r7c/A2_C6_RESOLVED_PLAN.output.txt' -Encoding utf8
if ($c6Exit -ne 0) { exit $c6Exit }
exit 0
