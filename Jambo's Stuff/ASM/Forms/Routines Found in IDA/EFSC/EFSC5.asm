.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, one
	cmp r0, lr
	beq battlecode
	ldr r0, darmanitan
	cmp r0, r4
	bne exit
	ldr r0, partystart
	ldr r0, [r0, #0x0]
	ldr r1, number
	add r0, r0, r1
there:	mov r9, r0
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
	bne exit
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
	bge exit
	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x4]
	b exit2
exit:	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x0]
exit2:	add r1, r4, #0x0
	bl place
	ldr r0, return
	bx r0
place:	ldr r3, place2
	bx r3
decrypt:	ldr r2, decry
	bx r2
getability:	ldr r2, abilget
	bx r2
battlecode:	ldr r0, darmanitan
	cmp r0, r7
	bne exit
	bl getspriteloc
	b there
getspriteloc:	ldr r0, getadd
	bx r0
.align
darmanitan:	.word 0x0000022B
partystart:	.word 0x0203B140
number:		.word 0x00003290
return:		.word 0x0800F1D1
decry:		.word 0x0803FBE9
abilget:	.word 0x08040D39
place2:		.word 0x081E3B71
one:		.word 0x0800F129
getadd:		.word 0x0874A459
