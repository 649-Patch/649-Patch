.text
.align 2
.thumb
.thumb_func
.global iconformehack2

main:
	push {r0-r7}
	mov r0, r9
	mov r1, r10
	push {r0,r1}
	mov r0, r11
	mov r9, r0
	mov r1, #0xB
	bl decrypt
	mov r10, r0
	mov r0, r9
	mov r1, #0x2E
	bl decrypt
	add r1, r0, #0x0
	mov r0, r10
	bl getability
	add r1, r0, #0x0
	mov r0, #0x0
	mov r0, r10
	cmp r1, #0xA1
	bne normal
	mov r0, r9
	mov r1, #0x3A
	bl decrypt
	lsr r0, r0, #0x1
	mov r10, r0
	mov r0, r9
	mov r1, #0x39
	bl decrypt
	add r1, r0, #0x0
	mov r2, r10
	mov r0, #0x0
	mov r10, r0
	mov r9, r0
	cmp r1, r2
	bge normal
	pop {r0,r1}
	mov r9, r0
	mov r10, r1
	pop {r0-r7}
	mov r1, #0x1
	b there
normal:	pop {r0,r1}
	mov r9, r0
	mov r10, r1
	pop {r0-r7}
	mov r1, #0x0
there:	mov r2, #0x4
	lsl r2, r2, #0x8
	mul r1, r2
	ldr r2, normaltable
	lsl r0, r0, #0x2
	add r0, r0, r2
	ldr r0, [r0, #0x0]
	add r0, r0, r1
	pop {r1}
	bx r1
decrypt:	ldr r2, decry
	bx r2
getability:	ldr r2, abilget
	bx r2
.align
normaltable:	.word 0x0873D744
decry:		.word 0x0803FBE9
abilget:	.word 0x08040D39
