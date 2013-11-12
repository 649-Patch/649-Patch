.text
.align 2
.thumb
.thumb_func
.global simpleandcontrary

main:
	ldr r1, attacktable
	lsl r0, r4, #0x1
	add r0, r0, r4
	lsl r0, r0, #0x2
	add r0, r0, r1
	ldrb r0, [r0, #0xA]
	cmp r0, #0x0
	bne exit
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrh r1, [r0, #0x28]
	cmp r1, #0x0
	beq exit
	add r1, r0, #0x0
	add r1, #0x1A
	mov r3, #0x0
	ldrb r2, [r1, #0x1]
	cmp r2, #0xC
	beq nextcheck
	add r2, #0x1
	mov r4, #0x1
	orr r3, r4
	strb r2, [r1, #0x1]
nextcheck:	ldrb r2, [r1, #0x0]
	cmp r2, #0x0
	beq nextcheck2
	sub r2, #0x1
	mov r4, #0x2
	orr r3, r4
	strb r2, [r1, #0x0]
nextcheck2:	push {r3}
	bl place4
	pop {r3}
	mov r2, #0x3
	and r2, r3
	cmp r2, #0x0
	beq exit
	cmp r2, #0x1
	beq justspeed
	cmp r2, #0x2
	beq justdefense
	ldr r1, scriptboth
there:	ldr r0, scriptloc
	str r1, [r0, #0x0]
	ldr r0, place
	add r1, r0, #0x3
	ldrb r0, [r0, #0x1]
	strb r0, [r1, #0x0]
	ldr r2, return
	bx r2
justspeed:	ldr r1, scriptspeed
	b there
justdefense:	ldr r1, scriptdefense
	b there
exit:	bl leave
leave:	ldr r4, gothere
	bx r4
place4:	ldr r0, gothere2
	bx r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
place3:	.word 0x02023E82
scriptloc:	.word 0x02023D74
scriptboth:	.word 0x0876418C
scriptspeed:	.word 0x08764150
scriptdefense:	.word 0x0876416E
attacktable:	.word 0x087453D4
gothere:	.word 0x0801BBAB
gothere2:	.word 0x08017545
return:	.word 0x0801ABD9
