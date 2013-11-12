.text
.align 2
.thumb
.thumb_func
.global battlescriptdecrementcounters

main:
	push {r1-r7,lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r0, place
	ldr r4, exit
	mov r1, #0x0
loop:	lsl r2, r1, #0x2
	add r2, r2, r0
	ldr r2, [r2, #0x0]
	cmp r2, r4
	beq getout
	ldrb r3, [r2, #0x0]
	cmp r3, #0x0
	beq skip
	sub r3, #0x1
	strb r3, [r2, #0x0]
skip:	add r1, #0x1
	b loop
getout:	pop {r1-r7,pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x08FFFFFF
exit:	.word 0x0000FEFE
