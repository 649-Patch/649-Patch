.text
.align 2
.thumb
.thumb_func
.global doublewildbattlerun

main:
	ldr r0, battlebits
	ldrb r0, [r0, #0x0]
	mov r1, #0x5
	and r0, r1
	cmp r0, #0x5
	beq newcode
	ldrh r0, [r5, #0x6]
	ldrh r1, [r2, #0x6]
	cmp r0, r1
	bcs alt
	lsl r0, r0, #0x7
	ldrh r1, [r2, #0x6]
there:	bl divide
	ldr r4, return
	bx r4
alt:	ldr r0, returntwo
	bx r0
newcode:	ldrh r0, [r5, #0x6]
	push {r2,r5}
	add r5, #0x58
	ldrh r5, [r5, #0x6]
	ldrh r1, [r2, #0x6]
	add r2, #0x58
	ldrh r2, [r2, #0x6]
	add r0, r0, r5
	add r1, r1, r2
	pop {r2,r5}
	lsl r0, r0, #0x6
	lsr r1, r1, #0x1
	b there
divide:	ldr r3, dividecode
	bx r3
.align
battlebits:	.word 0x02022B4C
return:	.word 0x08016847
returntwo:	.word 0x08016869
dividecode:	.word 0x081E4019
