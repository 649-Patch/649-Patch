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
	mov r1, #0x23
	bl decrypt
	ldr r1, westofmap
	mov r2, #0x0
loop:	add r3, r1, r2
	ldrb r3, [r3, #0x0]
	cmp r0, r3
	beq west
	cmp r3, #0xC5
	beq east
	add r2, #0x1
	b loop
west:	mov r0, #0x0
	b getsprite
east:	mov r0, #0x1
getsprite:	pop {r1-r7}
	lsl r0, r0, #0x2
	ldr r1, [r1, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	pop {r4,r5}
	pop {r1}
	bx r1
decrypt:	ldr r2, decry
	bx r2
.align
number:		.word 0x00003290
partystart:	.word 0x0203B140
decry:		.word 0x0803FBE9
one:		.word 0x0810BC0B
two:	.word 0x0810BCC5
placaaat:	.word 0x020033C4
dexloc:		.word 0x02003400
westofmap:	.word 0x08FFFFFF
