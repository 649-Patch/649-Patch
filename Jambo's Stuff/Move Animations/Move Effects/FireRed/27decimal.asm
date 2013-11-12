.text
.align 2
.thumb
.thumb_func
.global twentysevendecimal

main:
	ldr r2, attackramlocation
	ldrh r2, [r2, #0x0]
	lsl r3, r2, #0x1
	add r3, r3, r2
	lsl r3, r3, #0x2
	ldr r2, attacktable
	add r2, r2, r3
	ldrb r3, [r2, #0x9]
	cmp r3, #0x1
	beq secondarycheck
	b normal
secondarycheck:	ldrb r3, [r2, #0x0]
	cmp r3, #0x1B
	beq changestat
	b normal
changestat:	ldr r2, [sp, #0x4]
	ldrh r2, [r2, #0x4]
	str r2, [sp, #0x14]
	ldrh r3, [r6, #0x8]
	mov r8, r3
	ldr r0, [sp, #0x4]
	ldrh r0, [r0, #0x4]
	b normal2
normal:	ldr r2, [sp, #0x4]
	ldrh r2, [r2, #0x4]
	str r2, [sp, #0x14]
	ldrh r3, [r6, #0x8]
	mov r8, r3
	ldr r0, [sp, #0x4]
	ldrh r0, [r0, #0xA]
normal2:	str r0, [sp, #0x18]
	ldrh r0, [r6, #0x2E]
	cmp r0, #0xAF
	bne alt
	ldr r1, returnone
	bx r1
alt:	ldr r0, returntwo
	bx r0
.align
attackramlocation:	.word 0x02023D4A
attacktable:	.word 0x087453D4
returnone:	.word 0x0803ED87
returntwo:	.word 0x0803EDA1
