.text
.align 2
.thumb
.thumb_func
.global brine

main:
	ldr r0, place
	ldrb r2, [r0, #0x1]
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	mul r2, r1
	ldr r1, ramlocation
	add r0, r0, r1
	add r2, r2, r1
	ldr r1, [r0, #0x4C]
	mov r3, #0xFF
	and r3, r1
	ldr r4, [r2, #0x4C]
	mov r5, #0xFF
	bic r4, r5
	orr r3, r4
	str r3, [r2, #0x4C]
	mov r3, #0xFF
	bic r1, r3
	str r1, [r0, #0x4C]
	add r4, r0, #0x0
	add r5, r2, #0x0
	ldr r0, place
	ldrb r1, [r0, #0x1]
	ldrb r0, [r0, #0x0]
	mov r3, #0x1
	add r2, r3, #0x0
	and r3, r1
	and r2, r0
	lsl r0, r0, #0x1
	lsl r1, r1, #0x1
	ldr r6, place2
	add r0, r0, r6
	add r1, r1, r6
	ldrh r0, [r0, #0x0]
	ldrh r1, [r1, #0x0]
	mov r6, #0x64
	mov r7, #0x6
	mul r7, r6
	mul r3, r7
	mul r2, r7
	mul r1, r6
	mul r0, r6
	push {r1,r3}
	ldr r6, baselocation
	sub r6, r6, r2
	add r0, r0, r6
	mov r1, #0x37
	ldr r2, [r4, #0x4C]
	mov r4, #0xFF
	and r2, r4
	push {r2}
	mov r2, sp
	push {lr}
	bl encrypt
	pop {r0}
	mov lr, r0
	pop {r2}
	pop {r1,r3}
	ldr r6, baselocation
	sub r6, r6, r3
	add r0, r1, r6
	mov r1, #0x37
	ldr r2, [r5, #0x4C]
	mov r4, #0xFF
	and r2, r4
	push {r2}
	mov r2, sp
	push {lr}
	bl encrypt
	pop {r0}
	mov lr, r0
	pop {r2}
exit:	bx lr
encrypt:	ldr r3, encrypter
	bx r3
.align
place:	.word 0x02023D6B
ramlocation:	.word 0x02023BE4
place2:	.word 0x02023BCE
encrypter:	.word 0x0804037D
baselocation:	.word 0x02024284
