/*
Inserted into rom @08750000.
*/

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
normal2:	lsr r0, r2, #0x3
	neg r0, r0
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
return:	.word 0x08018C08
returntwo:	.word 0x080184AF
storage:	.word 0x02023D50
