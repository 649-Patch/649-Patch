.text
.align 2
.thumb
.thumb_func
.global heatproof2

main:
	add r0, r2, #0x0
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x73
	beq nodamage
	cmp r0, #0x51
	beq nodamage
	add r0, r2, #0x0
	add r0, #0x21
	ldrb r0, [r0, #0x0]
	cmp r0, #0xF
	beq nodamage
	ldr r0, return
	bx r0
nodamage:	ldr r1, returntwo
	bx r1
.align
return:	.word 0x08028DFB
returntwo:	.word 0x08028E3D
