.text
.align 2
.thumb
.thumb_func
.global battlescriptsethealingwisheffect
main:
	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldr r1, [r0, #0x4C]
	mov r2, #0x7
	and r2, r1
	cmp r2, #0x0
	beq skip
	mov r1, #0x7
	b next
skip:	mov r2, #0x88
	and r2, r1
	cmp r2, #0x0
	beq skip2
	mov r1, #0x88
	b next
skip2:	mov r2, #0x70
	and r1, r2
next:	ldr r2, ramlocation2
	strb r1, [r2, #0x0]
	ldr r2, ramlocation3
	cmp r1, #0x0
	beq skip3
	mov r1, #0xA4
skip3:	strb r1, [r2, #0x0]
	ldrh r1, [r0, #0x2C]
	ldrh r2, [r0, #0x28]
	strh r1, [r0, #0x28]
	sub r0, r2, r1
	ldr r1, ramlocation
	str r0, [r1, #0x0]
exit:	pop {pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
ramlocation:	.word 0x02023D50
ramlocation2:	.word 0x0203D804
ramlocation3:	.word 0x02023E85
