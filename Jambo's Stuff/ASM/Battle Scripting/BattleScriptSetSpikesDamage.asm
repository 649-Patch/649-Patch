.text
.align 2
.thumb
.thumb_func
.global battlescriptsetspikesdamage

main:
	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x1
	and r1, r0
	lsl r2, r1, #0x1
	add r1, r1, r2
	lsl r1, r1, #0x2
	ldr r2, place3
	add r2, r2, r1
	ldrb r2, [r2, #0xA]
	mov r1, #0x3
	and r2, r1
	mov r1, #0x5
	sub r1, r1, r2
	lsl r1, r1, #0x1
	mov r2, #0x58
	mul r0, r2
	ldr r2, place2
	add r0, r0, r2
	add r3, r0, #0x0
	add r3, #0x20
	ldr r4, gravity
	ldrb r4, [r4, #0x0]
	cmp r4, #0x0
	bne skip2
	ldr r6, place
	ldrb r6, [r6, #0x1]
	ldr r4, specialstatus
	lsl r6, r6, #0x2
	add r4, r4, r6
	ldr r4, [r4, #0x0]
	mov r6, #0x10
	lsl r6, r6, #0x4
	and r4, r6
	cmp r4, #0x0
	bne skip2
	ldrb r4, [r3, #0x1]
	ldrb r6, [r3, #0x2]
	cmp r4, #0x2
	beq null
	cmp r6, #0x2
	beq null
	ldrb r4, [r3, #0x0]
	cmp r4, #0x1A
	beq null
skip2:	ldrb r4, [r3, #0x0]
	cmp r4, #0x62
	bne damage
null:	mov r0, #0x0
	b skip
damage:	ldrh r0, [r0, #0x2C]
	bl divide
	cmp r0, #0x0
	bne skip
	mov r0, #0x1
skip:	ldr r1, ramlocation
	str r0, [r1, #0x0]
exit:	pop {pc}
divide:	ldr r3, div
	bx r3
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
place3:	.word 0x02023DE4
ramlocation:	.word 0x02023D50
div:	.word 0x081E4019
gravity:	.word 0x0203D802
specialstatus:	.word 0x02023DFC