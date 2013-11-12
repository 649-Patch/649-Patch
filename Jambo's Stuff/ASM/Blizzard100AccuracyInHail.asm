.text
.align 2
.thumb
.thumb_func
.global simpleandcontrary

main:
	ldr r0, place
	ldrh r0, [r0, #0x0]
	cmp r0, #0x3B
	bne hurricanechecks
	ldr r0, weather
	ldrh r0, [r0, #0x0]
	mov r1, #0x18
	lsl r1, r1, #0x4
	and r0, r1
	cmp r0, #0x0
	beq normal
	mov r3, #0x64
	b exit
hurricanechecks:	ldr r0, place
	ldrh r0, [r0, #0x0]
	mov r1, #0x87
	lsl r1, r1, #0x2
	add r1, #0x2
	cmp r0, r1
	bne normal
	ldr r0, weather
	ldrh r0, [r0, #0x0]
	mov r1, #0x7
	and r1, r0
	cmp r1, #0x0
	beq skip
	mov r3, #0x64
	b exit
skip:	mov r1, #0x60
	and r1, r0
	cmp r1, #0x0
	beq normal
	mov r3, #0x32
	b exit
normal:	ldrb r3, [r7, #0x3]
exit:	mov r8, r3
	ldr r0, battlebits
	ldr r0, [r0, #0x0]
	ldr r1, return
	bx r1
.align
weather:	.word 0x02023F1C
place:	.word 0x02023D4A
return:	.word 0x08758DF3
battlebits:	.word 0x02022B4C
