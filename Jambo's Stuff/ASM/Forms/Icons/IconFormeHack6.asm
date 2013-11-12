.text
.align 2
.thumb
.thumb_func
.global iconformehack2

main:
	push {r0}
	push {r1-r7}
	mov r0, r11
	mov r1, #0xC
	bl decrypt
	pop {r1-r7}
	cmp r0, #0xF3
	bne normal
	mov r1, #0x1
	b carryon
normal:	mov r1, #0x0
carryon:	pop {r0}
	mov r2, #0x4
	lsl r2, r2, #0x8
	mul r1, r2
	ldr r2, normaltable
	lsl r0, r0, #0x2
	add r0, r0, r2
	ldr r0, [r0, #0x0]
	add r0, r0, r1
end:	pop {r1}
	bx r1
decrypt:	ldr r2, decry
	bx r2
.align
normaltable:	.word 0x0873D744
decry:		.word 0x0803FBE9
