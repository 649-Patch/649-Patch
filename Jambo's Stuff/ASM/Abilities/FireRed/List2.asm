.text
.align 2
.thumb
.thumb_func
.global lightningrodIIstormdrainIIsapsipper

main:
	ldr r2, place
	ldrb r1, [r2, #0x1]
	mov r0, #0x58
	mul r0, r1
	add r0, r0, r5
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	add r4, r2, #0x0
	cmp r0, #0x1A
	beq levitate
	cmp r0, #0x1F
	beq lightningrod
	cmp r0, #0x4E
	beq lightningrod
	cmp r0, #0x72
	beq stormdrain
	cmp r0, #0x9D
	beq sapsipper
exit:	ldr r1, return
	bx r1
levitate:	ldr r1, gravityloc
	ldrb r1, [r1, #0x0]
	cmp r1, #0x0
	bne exit
	ldr r1, returnone
	bx r1
lightningrod:	mov r1, r8
	cmp r1, #0xD
	bne exit
	ldr r2, place
	ldrb r1, [r2, #0x1]
	mov r3, #0x58
	mul r3, r1
	add r3, r3, r5
	add r3, #0x20
	ldrb r1, [r3, #0x1]
	ldrb r3, [r3, #0x2]
	cmp r3, #0x4
	beq exit
	cmp r1, #0x4
	beq exit
	ldr r2, place
	ldrb r1, [r2, #0x1]
	mov r0, #0x58
	mul r0, r1
	add r0, r0, r5
	add r1, r0, #0x0
	add r1, #0x20
	ldrb r1, [r1, #0x0]
	cmp r1, #0x4E
	beq skip
	add r0, #0x1C
	ldrb r1, [r0, #0x0]
	cmp r1, #0xC
	beq skip2
	add r1, #0x1
	strb r1, [r0, #0x0]
	b skip
stormdrain:	mov r1, r8
	cmp r1, #0xB
	bne exit
	ldr r2, place
	ldrb r1, [r2, #0x1]
	mov r0, #0x58
	mul r0, r1
	add r0, r0, r5
	add r0, #0x1C
	ldrb r1, [r0, #0x0]
	cmp r1, #0xC
	beq skip3
	add r1, #0x1
	strb r1, [r0, #0x0]
	b skip
sapsipper:	ldr r1, movelocation
	ldrh r1, [r1, #0x0]
	mov r3, #0x9C
	lsl r3, r3, #0x1
	cmp r1, r3
	beq exit
	mov r1, r8
	cmp r1, #0xC
	bne exit
skip:	ldr r3, scriptloc
	ldr r1, script
	str r1, [r3, #0x0]
	b exit
skip2:	ldr r3, scriptloc
	ldr r1, script2
	str r1, [r3, #0x0]
	b exit
skiip3:	ldr r3, scriptloc
	ldr r1, script3
	str r1, [r3, #0x0]
	b exit
.align
returnone:	.word 0x0801E8D5
returntwo:	.word 0x0801E8DB
return:	.word 0x0801E939
place:	.word 0x02023D6B
place2:	.word 0x02023C04
scriptloc:	.word 0x02023D74
script:	.word 0x08764637
script2:	.word 0x08FFFFFF
script3:	.word 0x08FFFFFF
movelocation:	.word 0x02023D4A
gravityloc:	.word 0x0203C00F
