	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 1
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	stur	x1, [x29, #-16]
	ldur	w8, [x29, #-8]
	subs	w8, w8, #2
	cset	w8, eq
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	ldur	x8, [x29, #-16]
	ldr	x8, [x8]
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	w8, #1                          ; =0x1
	stur	w8, [x29, #-4]
	b	LBB0_10
LBB0_2:
	mov	x0, #16777216                   ; =0x1000000
	bl	_malloc
	stur	x0, [x29, #-24]
	ldur	x8, [x29, #-24]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_4
	b	LBB0_3
LBB0_3:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	adrp	x1, l_.str.1@PAGE
	add	x1, x1, l_.str.1@PAGEOFF
	bl	_fprintf
	mov	w8, #1                          ; =0x1
	stur	w8, [x29, #-4]
	b	LBB0_10
LBB0_4:
	ldur	x8, [x29, #-16]
	ldr	x0, [x8, #8]
	adrp	x1, l_.str.2@PAGE
	add	x1, x1, l_.str.2@PAGEOFF
	bl	_fopen
	stur	x0, [x29, #-32]
	ldur	x8, [x29, #-32]
	subs	x8, x8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB0_6
	b	LBB0_5
LBB0_5:
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_perror
	ldur	x0, [x29, #-24]
	bl	_free
	mov	w8, #1                          ; =0x1
	stur	w8, [x29, #-4]
	b	LBB0_10
LBB0_6:
	ldur	x0, [x29, #-24]
	ldur	x3, [x29, #-32]
	mov	x1, #1                          ; =0x1
	mov	x2, #16777216                   ; =0x1000000
	bl	_fread
	mov	x8, x0
	stur	w8, [x29, #-36]
	ldur	w9, [x29, #-36]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	ldur	x0, [x29, #-24]
	bl	_check_header
	mov	w8, #8                          ; =0x8
	str	w8, [sp, #40]
	b	LBB0_7
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #40]
	ldur	w9, [x29, #-36]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_9
	b	LBB0_8
LBB0_8:                                 ;   in Loop: Header=BB0_7 Depth=1
	ldur	x8, [x29, #-24]
	ldrsw	x9, [sp, #40]
	ldr	w8, [x8, x9]
	add	x0, sp, #36
	str	w8, [sp, #36]
	bl	_get_big_endian
	str	w0, [sp, #32]
	ldr	w8, [sp, #40]
	add	w8, w8, #4
	str	w8, [sp, #40]
	ldur	x8, [x29, #-24]
	ldrsw	x9, [sp, #40]
	ldr	w8, [x8, x9]
	add	x11, sp, #24
	str	w8, [sp, #24]
	strb	wzr, [sp, #28]
	ldr	w8, [sp, #40]
	add	w8, w8, #8
	ldr	w9, [sp, #32]
	add	w8, w8, w9
	str	w8, [sp, #40]
	ldr	w9, [sp, #32]
                                        ; implicit-def: $x8
	mov	x8, x9
	ldur	w9, [x29, #-36]
	ldr	w10, [sp, #40]
	subs	w10, w9, w10
	mov	x9, sp
	str	x11, [x9]
	str	x8, [x9, #8]
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9, #16]
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	bl	_printf
	b	LBB0_7
LBB0_9:
	ldur	x0, [x29, #-32]
	bl	_fclose
	ldur	x0, [x29, #-24]
	bl	_free
	stur	wzr, [x29, #-4]
	b	LBB0_10
LBB0_10:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_check_header                   ; -- Begin function check_header
	.p2align	2
_check_header:                          ; @check_header
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	str	x0, [sp, #8]
	adrp	x8, l___const.check_header.pngHeaderVals@PAGE
	add	x8, x8, l___const.check_header.pngHeaderVals@PAGEOFF
	ldr	q0, [x8]
	str	q0, [sp, #16]
	ldr	q0, [x8, #16]
	str	q0, [sp, #32]
	str	wzr, [sp, #4]
	b	LBB1_1
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #4]
	subs	w8, w8, #8
	cset	w8, hs
	tbnz	w8, #0, LBB1_4
	b	LBB1_2
LBB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	x8, [sp, #8]
	ldr	w9, [sp, #4]
                                        ; kill: def $x9 killed $w9
	ldrb	w8, [x8, x9]
	ldr	w9, [sp, #4]
	mov	x10, x9
	add	x9, sp, #16
	ldr	w9, [x9, x10, lsl #2]
	subs	w8, w8, w9
	cset	w8, eq
	and	w0, w8, #0x1
	ldr	w2, [sp, #4]
	adrp	x1, l_.str.7@PAGE
	add	x1, x1, l_.str.7@PAGEOFF
	bl	_validate
	b	LBB1_3
LBB1_3:                                 ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #4]
	add	w8, w8, #1
	str	w8, [sp, #4]
	b	LBB1_1
LBB1_4:
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB1_6
	b	LBB1_5
LBB1_5:
	bl	___stack_chk_fail
LBB1_6:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_get_big_endian                 ; -- Begin function get_big_endian
	.p2align	2
_get_big_endian:                        ; @get_big_endian
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	ldrb	w9, [x8]
	ldr	x8, [sp, #8]
	ldrb	w8, [x8, #1]
	lsl	w8, w8, #16
	orr	w8, w8, w9, lsl #24
	ldr	x9, [sp, #8]
	ldrb	w9, [x9, #2]
	orr	w8, w8, w9, lsl #8
	ldr	x9, [sp, #8]
	ldrb	w9, [x9, #3]
	orr	w0, w8, w9
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_validate                       ; -- Begin function validate
	.p2align	2
_validate:                              ; @validate
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	stur	x1, [x29, #-16]
	stur	w2, [x29, #-20]
	ldur	w8, [x29, #-4]
	subs	w8, w8, #0
	cset	w8, ne
	tbnz	w8, #0, LBB3_2
	b	LBB3_1
LBB3_1:
	adrp	x8, ___stderrp@GOTPAGE
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
	ldr	x0, [x8]
	ldur	x10, [x29, #-16]
	ldur	w9, [x29, #-20]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x1, l_.str.6@PAGE
	add	x1, x1, l_.str.6@PAGEOFF
	bl	_fprintf
	mov	w0, #1                          ; =0x1
	bl	_exit
LBB3_2:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Usage: %s <png file>\n"

l_.str.1:                               ; @.str.1
	.asciz	"Couldn't allocate memory\n"

l_.str.2:                               ; @.str.2
	.asciz	"r"

l_.str.3:                               ; @.str.3
	.asciz	"fopen"

l_.str.4:                               ; @.str.4
	.asciz	"file size: %d\n"

l_.str.5:                               ; @.str.5
	.asciz	"chunk: %s - len: %d (%d)\n"

l_.str.6:                               ; @.str.6
	.asciz	"Invalid file: %s %d\n"

	.section	__TEXT,__const
	.p2align	2, 0x0                          ; @__const.check_header.pngHeaderVals
l___const.check_header.pngHeaderVals:
	.long	137                             ; 0x89
	.long	80                              ; 0x50
	.long	78                              ; 0x4e
	.long	71                              ; 0x47
	.long	13                              ; 0xd
	.long	10                              ; 0xa
	.long	26                              ; 0x1a
	.long	10                              ; 0xa

	.section	__TEXT,__cstring,cstring_literals
l_.str.7:                               ; @.str.7
	.asciz	"header byte "

l_.str.8:                               ; @.str.8
	.asciz	"header valid!\n"

.subsections_via_symbols
