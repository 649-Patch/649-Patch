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
	b there
battlecode:	ldr r0, [sp, #0x4]
there:	ldrb r0, [r0, #0x1B]
	mov r5, #0xF0
	and r0, r5
	lsr r0, r0, #0x4
getsprite:	lsl r0, r0, #0x2
	ldr r1, [r1, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
there2:	pop {r4,r5}
	pop {r1}
	bx r1
.align
one:		.word 0x0810BD5B
two:	.word 0x0810BCC5
partystart:	.word 0x0203B140
number:		.word 0x00003290
placaaat:	.word 0x020033C4
dexloc:		.word 0x02003400
