.text
.align 2
.thumb
.thumb_func
.global poisonheal

main:
	add r0, r1, #0x0
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x5A
	bne normal
	mov r0, #0x0
	b store
normal2:	lsr r0, r5, #0x4
	neg r0, r0
	b store
normal:	ldrh r0, [r1, #0x2C]
	lsr r0, r0, #0x4
store:	ldr r5, storage
	str r0, [r5, #0x0]
	cmp r0, #0x0
	bne alt
	ldr r0, return
	bx r0
alt:	ldr r0, returntwo
	bx r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
return:	.word 0x080184F5
returntwo:	.word 0x080184F9
storage:	.word 0x02023D50
