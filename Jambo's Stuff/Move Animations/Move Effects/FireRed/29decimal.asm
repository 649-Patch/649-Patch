.text
.align 2
.thumb
.thumb_func
.global twentyninedecimal

main:
	ldr r1, attackramlocation
	ldrh r1, [r1, #0x0]
	push {r2}
	lsl r2, r1, #0x1
	add r2, r2, r1
	lsl r2, r2, #0x2
	ldr r1, attacktable
	add r1, r1, r2
	ldrb r2, [r1, #0x9]
	cmp r2, #0x1
	beq secondarycheck
	pop {r2}
	b normal
secondarycheck:	ldrb r2, [r1, #0x0]
	cmp r2, #0x1D
	beq changerecoil
	pop {r2}
	b normal
changerecoil:	asr r0, r0, #0x1
	pop {r2}
	b normal2
normal:	asr r0, r0, #0x2
normal2:	ldr r1, storagelocation
	str r0, [r1, #0x0]
	cmp r0, #0x0
	bne alt
	ldr r0, returnone
	bx r0
alt:	ldr r4, returntwo
	bx r4
.align
attackramlocation:	.word 0x02023D4A
attacktable:	.word 0x087453D4
storagelocation:	.word 0x02023D50
returnone:	.word 0x08020B01
returntwo:	.word 0x08020B05
