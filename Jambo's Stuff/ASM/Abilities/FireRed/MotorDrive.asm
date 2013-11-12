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
	ldrb r0, [r0, #0x2]
	cmp r0, #0xD
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
	add r1, #0x1B
	ldrb r1, [r1, #0x0]
	cmp r1, #0xC
	beq exit
	ldr r1, place3
	mov r0, #0x45
	strb r0, [r1, #0x3]
	bl place4
	ldr r0, scriptloc
	ldr r1, script
	str r1, [r0, #0x0]
	ldr r2, return
	bx r2
exit:	bl leave
leave:	ldr r4, gothere
	bx r4
place4:	ldr r0, gothere2
	bx r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
place3:	.word 0x02023E82
scriptloc:	.word 0x02023D74
script:	.word 0x08FFFFFF
attacktable:	.word 0x087453D4
gothere:	.word 0x0801BBAB
gothere2:	.word 0x08017545
return:	.word 0x0801ABD9
