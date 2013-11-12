.text
.align 2
.thumb
.thumb_func
.global battlescriptsetstatswap

main:
earlier:	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r4, location
	ldr r0, place2
	ldrb r2, [r0, #0x1]
	ldrb r1, [r0, #0x0]
	mov r0, #0x58
	mul r2, r0
	mul r1, r0
	ldr r0, battledata
	add r3, r2, r0
	add r2, r1, r0
	ldr r0, place
	ldrh r0, [r0, #0x0]
	ldr r1, number
	cmp r0, r1
	beq guardsplit
	b next
guardsplit:	ldrh r0, [r2, #0x4]
	ldrh r1, [r3, #0x4]
	add r0, r0, r1
	lsr r0, r0, #0x1
	cmp r0, #0x0
	bhi skip
	mov r0, #0x1
skip:	strh r0, [r2, #0x4]
	strh r0, [r3, #0x4]
	ldrh r0, [r2, #0xA]
	ldrh r1, [r3, #0xA]
	add r0, r0, r1
	lsr r0, r0, #0x1
	cmp r0, #0x0
	bhi skip2
	mov r0, #0x1
skip2:	strh r0, [r2, #0xA]
	strh r0, [r3, #0xA]
	ldr r0, stringone
	str r0, [r4, #0x0]
	b exit
next:	add r1, #0x1
	cmp r0, r1
	beq powersplit
	b exit
powersplit:	ldrh r0, [r2, #0x2]
	ldrh r1, [r3, #0x2]
	add r0, r0, r1
	lsr r0, r0, #0x1
	cmp r0, #0x0
	bhi skip3
	mov r0, #0x1
skip3:	strh r0, [r2, #0x2]
	strh r0, [r3, #0x2]
	ldrh r0, [r2, #0x8]
	ldrh r1, [r3, #0x8]
	add r0, r0, r1
	lsr r0, r0, #0x1
	cmp r0, #0x0
	bhi skip4
	mov r0, #0x1
skip4:	strh r0, [r2, #0x8]
	strh r0, [r3, #0x8]
	ldr r0, stringtwo
	str r0, [r4, #0x0]
exit:	pop {pc}
.align
scriptlocation:	.word 0x02023D74
battledata:	.word 0x02023BE4
place:	.word 0x02023D4A
place2:	.word 0x02023D6B
number:	.word 0x000001D7
stringone:	.word 0x08FFFFFF
stringtwo:	.word 0x08FFFFFF
location:	.word 0x0203C020
