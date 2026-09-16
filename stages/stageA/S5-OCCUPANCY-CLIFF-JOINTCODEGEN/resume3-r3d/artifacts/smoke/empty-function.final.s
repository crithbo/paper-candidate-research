	.section	.AMDGPU.config,"",@progbits
	.long	47176
	.long	11469504
	.long	47180
	.long	5008
	.long	47200
	.long	0
	.long	4
	.long	0
	.long	8
	.long	0
	.text
	.globl	empty_function_ret              ; -- Begin function empty_function_ret
	.p2align	8
	.type	empty_function_ret,@function
empty_function_ret:                     ; @empty_function_ret
; %bb.0:
	s_endpgm
.Lfunc_end0:
	.size	empty_function_ret, .Lfunc_end0-empty_function_ret
                                        ; -- End function
	.set .Lempty_function_ret.num_vgpr, 0
	.set .Lempty_function_ret.num_agpr, 0
	.set .Lempty_function_ret.numbered_sgpr, 0
	.set .Lempty_function_ret.num_named_barrier, 0
	.set .Lempty_function_ret.private_seg_size, 0
	.set .Lempty_function_ret.uses_vcc, 0
	.set .Lempty_function_ret.uses_flat_scratch, 0
	.set .Lempty_function_ret.has_dyn_sized_stack, 0
	.set .Lempty_function_ret.has_recursion, 0
	.set .Lempty_function_ret.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 4
; TotalNumSgprs: 96
; NumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 11
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 96
; NumVGPRsForWavesPerEU: 1
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 1
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 2
	.section	.AMDGPU.config,"",@progbits
	.long	47176
	.long	11469504
	.long	47180
	.long	5008
	.long	47200
	.long	0
	.long	4
	.long	0
	.long	8
	.long	0
	.text
	.globl	empty_function_unreachable      ; -- Begin function empty_function_unreachable
	.p2align	8
	.type	empty_function_unreachable,@function
empty_function_unreachable:             ; @empty_function_unreachable
; %bb.0:
.Lfunc_end1:
	.size	empty_function_unreachable, .Lfunc_end1-empty_function_unreachable
                                        ; -- End function
	.set .Lempty_function_unreachable.num_vgpr, 0
	.set .Lempty_function_unreachable.num_agpr, 0
	.set .Lempty_function_unreachable.numbered_sgpr, 0
	.set .Lempty_function_unreachable.num_named_barrier, 0
	.set .Lempty_function_unreachable.private_seg_size, 0
	.set .Lempty_function_unreachable.uses_vcc, 0
	.set .Lempty_function_unreachable.uses_flat_scratch, 0
	.set .Lempty_function_unreachable.has_dyn_sized_stack, 0
	.set .Lempty_function_unreachable.has_recursion, 0
	.set .Lempty_function_unreachable.has_indirect_call, 0
	.section	.AMDGPU.csdata,"",@progbits
; Kernel info:
; codeLenInByte = 0
; TotalNumSgprs: 96
; NumVgprs: 0
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 11
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 96
; NumVGPRsForWavesPerEU: 1
; Occupancy: 8
; WaveLimiterHint : 0
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 1
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 2
	.section	.AMDGPU.gpr_maximums,"",@progbits
	.set amdgpu.max_num_vgpr, 0
	.set amdgpu.max_num_agpr, 0
	.set amdgpu.max_num_sgpr, 0
	.set amdgpu.max_num_named_barrier, 0
	.section	.AMDGPU.csdata,"",@progbits
	.section	".note.GNU-stack","",@progbits
	.amd_amdgpu_isa "amdgpu8.02-unknown-unknown-unknown-gfx802"
