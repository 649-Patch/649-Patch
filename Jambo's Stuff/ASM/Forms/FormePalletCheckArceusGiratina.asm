.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, one
	cmp r0, lr
	beq checkdex
	ldr r0, two
	cmp r0, lr
	beq check
	b battlecode
checkdex:	ldr r0, placaaat
	ldr r0, [r0, #0x0]
	ldr r5, dexloc
	cmp r0, r5
	bne battlecode
	mov r0, #0x0
	b getsprite
check:	ldr r0, partystart
	ldr r0, [r0, #0x0]
	ldr r5, number
	add r0, r5, r0
	b there3
battlecode:	ldr r0, [sp, #0x4]
there3:	push {r1-r7}
	mov r1, #0xC
	bl decrypt
	ldr r1, giratina
	cmp r1, r4
	beq giratcode
	add r1, #0x6
	cmp r1, r4
	beq arccode
	pop {r1-r7}
exit:	mov r0, #0x0
	b getsprite
arccode:	pop {r1-r7}
	sub r0, #0xE1
	cmp r0, #0x1
	blt exit
	cmp r0, #0x11
	bhi exit
	cmp r0, #0x9
	beq exit
	cmp r0, #0x9
	blt getsprite
	sub r0, #0x1
	b getsprite
giratcode:	pop {r1-r7}
	cmp r0, #0xF3
	bne exit
	mov r0, #0x1
getsprite:	lsl r0, r0, #0x2
	ldr r1, [r1, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
there2:	pop {r4,r5}
	pop {r1}
	bx r1
decrypt:	ldr r2, decry
	bx r2
.align
one:		.word 0x0810BD5B
two:	.word 0x0810BCC5
partystart:	.word 0x0203B140
number:		.word 0x00003290
placaaat:	.word 0x020033C4
dexloc:		.word 0x02003400
decry:	.word 0x0803FBE9
giratina:	.word 0x000001E7
