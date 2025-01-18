	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 1
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	mov	x20, x1
	cmp	w0, #2
	b.ne	LBB0_7
; %bb.1:
	mov	w0, #16777216                   ; =0x1000000
	bl	_malloc
	cbz	x0, LBB0_9
; %bb.2:
	mov	x19, x0
	ldr	x0, [x20, #8]
Lloh0:
	adrp	x1, l_.str.2@PAGE
Lloh1:
	add	x1, x1, l_.str.2@PAGEOFF
	bl	_fopen
	cbz	x0, LBB0_11
; %bb.3:
	mov	x20, x0
	mov	x0, x19
	mov	w1, #1                          ; =0x1
	mov	w2, #16777216                   ; =0x1000000
	mov	x3, x20
	bl	_fread
	mov	x21, x0
	str	x0, [sp]
Lloh2:
	adrp	x0, l_.str.4@PAGE
Lloh3:
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	mov	x0, x19
	bl	_check_header
	cmp	w21, #9
	b.lt	LBB0_6
; %bb.4:
	mov	w23, #8                         ; =0x8
	add	x24, sp, #24
Lloh4:
	adrp	x22, l_.str.5@PAGE
Lloh5:
	add	x22, x22, l_.str.5@PAGEOFF
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	add	x8, x19, w23, sxtw
	ldp	w9, w8, [x8]
	rev	w9, w9
	str	w8, [sp, #24]
	strb	wzr, [sp, #28]
	add	w8, w23, w9
	add	w23, w8, #12
	subs	w8, w21, w23
	stp	x9, x8, [sp, #8]
	str	x24, [sp]
	mov	x0, x22
	bl	_printf
	cmp	w21, w23
	b.gt	LBB0_5
LBB0_6:
	mov	x0, x20
	bl	_fclose
	mov	x0, x19
	bl	_free
	mov	w19, #0                         ; =0x0
	b	LBB0_10
LBB0_7:
	ldr	x8, [x20]
	str	x8, [sp]
Lloh6:
	adrp	x0, l_.str@PAGE
Lloh7:
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
LBB0_8:
	mov	w19, #1                         ; =0x1
	b	LBB0_10
LBB0_9:
Lloh8:
	adrp	x8, ___stderrp@GOTPAGE
Lloh9:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh10:
	ldr	x3, [x8]
Lloh11:
	adrp	x0, l_.str.1@PAGE
Lloh12:
	add	x0, x0, l_.str.1@PAGEOFF
	mov	w19, #1                         ; =0x1
	mov	w1, #25                         ; =0x19
	mov	w2, #1                          ; =0x1
	bl	_fwrite
LBB0_10:
	mov	x0, x19
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #64]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #48]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
LBB0_11:
Lloh13:
	adrp	x0, l_.str.3@PAGE
Lloh14:
	add	x0, x0, l_.str.3@PAGEOFF
	bl	_perror
	mov	x0, x19
	bl	_free
	b	LBB0_8
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh11, Lloh12
	.loh AdrpLdrGotLdr	Lloh8, Lloh9, Lloh10
	.loh AdrpAdd	Lloh13, Lloh14
	.cfi_endproc
                                        ; -- End function
	.globl	_check_header                   ; -- Begin function check_header
	.p2align	2
_check_header:                          ; @check_header
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x19, x0
	mov	x20, #0                         ; =0x0
Lloh15:
	adrp	x22, l___const.check_header.pngHeaderVals@PAGE
Lloh16:
	add	x22, x22, l___const.check_header.pngHeaderVals@PAGEOFF
Lloh17:
	adrp	x21, l_.str.7@PAGE
Lloh18:
	add	x21, x21, l_.str.7@PAGEOFF
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldrb	w8, [x19, x20]
	ldr	w9, [x22, x20, lsl #2]
	cmp	w9, w8
	cset	w0, eq
	mov	x1, x21
	mov	x2, x20
	bl	_validate
	add	x20, x20, #1
	cmp	x20, #8
	b.ne	LBB1_1
; %bb.2:
Lloh19:
	adrp	x0, l_str@PAGE
Lloh20:
	add	x0, x0, l_str@PAGEOFF
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	_puts
	.loh AdrpAdd	Lloh17, Lloh18
	.loh AdrpAdd	Lloh15, Lloh16
	.loh AdrpAdd	Lloh19, Lloh20
	.cfi_endproc
                                        ; -- End function
	.globl	_get_big_endian                 ; -- Begin function get_big_endian
	.p2align	2
_get_big_endian:                        ; @get_big_endian
	.cfi_startproc
; %bb.0:
	ldr	w8, [x0]
	rev	w0, w8
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_validate                       ; -- Begin function validate
	.p2align	2
_validate:                              ; @validate
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w2 killed $w2 def $x2
	cbz	w0, LBB3_2
; %bb.1:
	ret
LBB3_2:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
Lloh21:
	adrp	x8, ___stderrp@GOTPAGE
Lloh22:
	ldr	x8, [x8, ___stderrp@GOTPAGEOFF]
Lloh23:
	ldr	x0, [x8]
	stp	x1, x2, [sp]
Lloh24:
	adrp	x1, l_.str.6@PAGE
Lloh25:
	add	x1, x1, l_.str.6@PAGEOFF
	bl	_fprintf
	mov	w0, #1                          ; =0x1
	bl	_exit
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpLdrGotLdr	Lloh21, Lloh22, Lloh23
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

l_str:                                  ; @str
	.asciz	"header valid!"

.subsections_via_symbols
