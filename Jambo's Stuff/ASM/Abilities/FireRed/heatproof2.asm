.text
.align 2
.thumb
.thumb_func
.global heatproof2

main:
	add r0, r1, #0x0
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x55
	bne normal
	ldrh r0, [r1, #0x2C]
	lsr r0, r0, #0x4
	b store
normal:	ldrh r0, [r1, #0x2C]
	lsr r0, r0, #0x3
store:	ldr r2, storage
	str r0, [r2, #0x0]
	cmp r0, #0x0
	bne alt
	ldr r0, return
	bx r0
alt:	ldr r0, returntwo
	bx r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
return:	.word 0x08018473
returntwo:	.word 0x08018477
storage:	.word 0x02023D50
