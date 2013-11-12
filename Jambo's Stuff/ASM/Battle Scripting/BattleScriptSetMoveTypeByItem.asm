.text
.align 2
.thumb
.thumb_func
.global battlescriptsetmovetypebasedonhelditem

main:
	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r2, #0x58
	mul r2, r0
	ldr r1, place3
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	lsl r0, r0, #0x1
	ldr r1, place2
	add r1, r1, r2
	add r0, r0, r1
	ldrh r4, [r0, #0x22]
	cmp r4, #0x0
	beq exit
	ldrh r0, [r0, #0x0]
	mov r2, #0x0
	ldr r1, table
	ldr r6, terminator
loop:	lsl r3, r2, #0x1
	add r3, r2, r3
	lsl r3, r3, #0x1
	add r3, r3, r1
	ldrh r5, [r3, #0x0]
	cmp r5, r6
	beq exit
	cmp r5, r0
	bne skip
	ldrh r5, [r3, #0x2]
	cmp r5, r4
	bne skip
	ldrb r5, [r3, #0x4]
	mov r4, #0x80
	add r4, r4, r5
	ldr r1, place5
	mov r0, #0x2
	strb r0, [r1, #0xE]
	ldr r0, place4
	ldr r1, [r0, #0x0]
	strb r4, [r1, #0x13]
	b exit
skip:	add r2, #0x1
	b loop
exit:	pop {pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023BF0
place3:	.word 0x02000090
place5:	.word 0x02023FC4
place4:	.word 0x02023FE8
table:	.word 0x08FFFFFF
terminator:	.word 0x0000FEFE