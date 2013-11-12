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
	beq powertrick
	b next
powertrick:	ldrh r0, [r2, #0x2]
	ldrh r1, [r2, #0x4]
	strh r0, [r2, #0x4]
	strh r1, [r2, #0x2]
	ldr r0, stringone
	str r0, [r4, #0x0]
	b exit
next:	add r1, #0x5
	cmp r0, r1
	beq powerswap
	b next2
powerswap:	ldrb r0, [r2, #0x19]
	ldrb r1, [r3, #0x19]
	strb r0, [r3, #0x19]
	strb r1, [r2, #0x19]
	ldrb r0, [r2, #0x1C]
	ldrb r1, [r3, #0x1C]
	strb r0, [r3, #0x1C]
	strb r1, [r2, #0x1C]
	ldr r0, stringtwo
	str r0, [r4, #0x0]
	b exit
next2:	add r1, #0x1
	cmp r0, r1
	beq guardswap
	b next3
guardswap:	ldrb r0, [r2, #0x1A]
	ldrb r1, [r3, #0x1A]
	strb r0, [r3, #0x1A]
	strb r1, [r2, #0x1A]
	ldrb r0, [r2, #0x1D]
	ldrb r1, [r3, #0x1D]
	strb r0, [r3, #0x1D]
	strb r1, [r2, #0x1D]
	ldr r0, stringthree
	str r0, [r4, #0x0]
	b exit
next3:	add r1, #0x6
	cmp r0, r1
	beq heartswap
	b exit
heartswap:	ldr r0, [r2, #0x18]
	ldr r1, [r3, #0x18]
	str r0, [r3, #0x18]
	str r1, [r2, #0x18]
	ldr r0, [r2, #0x1C]
	ldr r1, [r3, #0x1C]
	str r0, [r3, #0x1C]
	str r1, [r2, #0x1C]
	ldr r0, stringfour
	str r0, [r4, #0x0]
exit:	pop {pc}
.align
scriptlocation:	.word 0x02023D74
battledata:	.word 0x02023BE4
place:	.word 0x02023D4A
place2:	.word 0x02023D6B
number:	.word 0x0000017B
stringone:	.word 0x08FFFFFF
stringtwo:	.word 0x08FFFFFF
stringthree:	.word 0x08FFFFFF
stringfour:	.word 0x08FFFFFF
location:	.word 0x0203C020
