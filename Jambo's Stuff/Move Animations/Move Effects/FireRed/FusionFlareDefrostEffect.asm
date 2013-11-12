.text
.align 2
.thumb
.thumb_func
.global defrosteffect

main:
	ldrh r1, [r0, #0x0]
	ldr r0, fusionflare
	cmp r1, r0
	beq defrost
	lsl r0, r1, #0x1
	add r0, r0, r1
	lsl r0, r0, #0x2
	add r0, r0, r2
	ldrb r0, [r0, #0x0]
	cmp r0, #0x7D
	beq defrost
	ldr r1, returnone
	bx r1
defrost:	ldr r2, returntwo
	bx r2
.align
fusionflare:	.word 0x0000022E
returnone:	.word 0x08019527
returntwo:	.word 0x08019947
