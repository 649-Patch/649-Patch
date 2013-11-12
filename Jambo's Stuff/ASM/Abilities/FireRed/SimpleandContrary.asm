.text
.align 2
.thumb
.thumb_func
.global simpleandcontrary

main:
	ldrb r0, [r2, #0x0]
	mul r0, r4
	add r0, r0, r2
	add r0, #0x40
	ldrb r0, [r1, #0x0]
	cmp r0, #0x56
	bne normal
	lsl r0, r6, #0x18
	asr r0, r0, #0x17
	b continue
normal:	cmp r0, #0x7E
	bne next
	lsl r0, r6, #0x18
	asr r0, r0, #0x18
	neg r0, r0
	b continue
next:	lsl r0, r6, #0x18
	asr r0, r0, #0x18
continue:	ldrb r6, [r1, #0x0]
	add r0, r0, r6
	cmp r0, #0x0
	bge continue3
	mov r0, #0x0
	b continue2
continue3:	cmp r0, #0xC
	ble continue2
	mov r0, #0xC
continue2:	strb r0, [r1, #0x0]
	ldr r0, return
	bx r0
.align
return:	.word 0x0802800D
