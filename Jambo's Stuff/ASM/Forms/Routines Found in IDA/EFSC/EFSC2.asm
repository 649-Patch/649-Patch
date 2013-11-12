.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, one
	cmp r0, lr
	beq battlecode
	ldr r0, arceus
	cmp r0, r4
	beq exit
	ldr r0, giratina
	cmp r0, r4
	bne exit
	ldr r0, partystart
	ldr r0, [r0, #0x0]
	ldr r1, number
	add r0, r0, r1
there:	mov r1, #0xC
	bl decrypt
	cmp r0, #0xF3
	bne exit
	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x4]
	b exit2
exit:	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x0]
exit2:	add r1, r5, #0x0
	bl place
	ldr r0, return
	bx r0
battlecode:	ldr r0, arceus
	cmp r0, r7
	beq exit
	ldr r0, giratina
	cmp r0, r7
	bne exit
	bl getspriteloc
	b there
decrypt:	ldr r2, decry
	bx r2
place:	ldr r3, place2
	bx r3
getspriteloc:	ldr r0, getadd
	bx r0
.align
arceus:		.word 0x000001ED
giratina:	.word 0x000001E7
partystart:	.word 0x0203B140
place2:		.word 0x081E3B71
number:		.word 0x00003290
return:		.word 0x0800F1D1
decry:		.word 0x0803FBE9
one:		.word 0x0800F129
getadd:		.word 0x0874A459
