"""Static-only exceptional S04 driver contract; execution is disabled."""
from dataclasses import dataclass
from pathlib import Path
S04_SHA256='A44D49A47C34CCE86BB4952F42F6C557230A669BEC950DACDD856F9D133E0776'
FEATURE='+inline-asm-use-gpr32'
@dataclass(frozen=True)
class Receipt:
    row_id:str; argv:tuple[str,...]; cwd:str; stdout:str; stderr:str; timeout:int; exit_code:int|None
def s04_guard(input_sha256:str)->bool: return input_sha256.upper()==S04_SHA256
def build_argv(row_id,input_path,input_sha256,identity,replay,output_root,out):
    if row_id.endswith('S04-R1') or row_id.endswith('S04-R2'):
        assert s04_guard(input_sha256)
    return ('python.exe','-B','apx_r8_row_driver.py','prepare','--row-id',row_id,'--input',input_path,'--input-sha256',input_sha256,'--identity',identity,'--replay',str(replay),'--output-root',output_root,'--out',out)
def execute(*_args,**_kwargs): raise RuntimeError('STATIC_PREFLIGHT_ONLY')
