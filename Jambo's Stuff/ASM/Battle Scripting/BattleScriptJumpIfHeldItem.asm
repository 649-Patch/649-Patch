.text
.align 2
.thumb
.thumb_func
.global battlescriptjumpifhelditem

main:
	push {r1-r7,lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r4, r0, #0x0
	add r1, r0, #0x0
	add r1, #0x9
	str r1, [r5, #0x0]
	ldrb r0, [r0, #0x1]
	bl bankdecrypt
	mov r1, #0x58
	mul r0, r1
	ldr r1, battledata
	add r0, r0, r1
	ldrh r1, [r0, #0x2E]
	add r0, r4, #0x3
	bl gethalfword
	add r2, r0, #0x0
	add r0, r4, #0x5
	bl getword
	add r3, r0, #0x0
	ldrb r0, [r4, #0x2]
	cmp r0, #0x0
	bne nextcheck
	cmp r2, r1
	bne exit
	b switch
nextcheck:	cmp r0, #0x1
	bne nextcheck2
	cmp r2, r1
	beq exit
	b switch
nextcheck2:	cmp r0, #0x2
	bne nextcheck3
	cmp r2, r1
	bge exit
	b switch
nextcheck3:	cmp r2, r1
	bls exit
switch:	str r3, [r5, #0x0]
exit:	pop {r1-r7,pc}
bankdecrypt:	ldr r2, place
	bx r2
gethalfword:
getword:
.align
scriptlocation:	.word 0x02023D74
battledata:	.word 0x02023BE4
place:	.word 0x08016E25
