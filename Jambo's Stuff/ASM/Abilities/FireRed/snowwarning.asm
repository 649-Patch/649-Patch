.text
.align 2
.thumb
.thumb_func
.global snowwarning

main:
	ldrb r4, [r3, #0x0]
	cmp r1, r4
	bcc skip
	strb r0, [r2, #0x0]
skip:	mov r1, r8
	ldrb r0, [r1, #0x0]
	cmp r0, #0x75
	bne skip2
	ldr r2, place
	ldrh r1, [r2, #0x0]
	mov r0, #0x7F
	and r0, r1
	cmp r0, #0x0
	beq skip3
	bl one
skip3:	mov r0, #0x80
	strh r0, [r2, #0x0]
	ldr r0, battlescriptloc
	bl two
	ldr r0, returntwo
	bx r0	
skip2:	ldr r1, return
	bx r1
one:	ldr r4, twoloc
	bx r4
two:	ldr r2, oneloc
	bx r2
.align
return:	.word 0x0801A13F
returntwo:	.word 0x0801A2F7
place:	.word 0x02023F1C
twoloc:	.word 0x0801BBAB
oneloc:	.word 0x0801BC25
battlescriptloc:	.word 0x08FFFFFF
