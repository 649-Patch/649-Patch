.text
.align 2
.thumb
.thumb_func
.global quash

main:
	push {r1-r7,lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r1, r0, #0x0
	add r1, #0x2
	str r1, [r5, #0x0]
	ldrb r0, [r0, #0x1]
	bl bankdecrypt
	ldr r2, place3
	mov r3, #0x0
	mov r4, #0x4
loop:	add r6, r3, r2
	ldrb r6, [r6, #0x0]
	cmp r6, r0
	bne no2
	add r4, r3, #0x0
no2:	cmp r4, #0x4
	bne exit
	add r3, #0x1
	b loop
exit:	mov r0, #0x3
	sub r0, r0, r4
	cmp r0, #0x0
	beq finished
	add r6, r2, r4
	ldrb r0, [r6, #0x0]
	ldrb r1, [r6, #0x1]
	strb r1, [r6, #0x0]
	strb r0, [r6, #0x1]
	add r4, #0x1
	b exit
finished:	pop {r1-r7,pc}
bankdecrypt:	ldr r2, place
	bx r2
.align
place3:	.word 0x02023BDE
scriptloc:	.word 0x02023D74
place:	.word 0x08016E25
