.text
.align 2
.thumb
.thumb_func
.global shellosgastrodonformeone

main:
	mov r0, r11
	cmp r0, #0xFF
	bne skip
	mov r0, #0x0
	b getsprite
skip:	cmp r0, #0x1
	bne skip2
error:	mov r0, #0x0
	b getsprite
skip2:	ldrb r0, [r0, #0x1B]
	mov r1, #0xF0
	and r0, r1
	cmp r0, #0x0
	beq getsprite
	mov r0, #0x1
getsprite:	lsl r0, r0, #0x2
	ldr r1, [r6, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	ldr r1, return
	bx r1
.align
westofmap:	.word 0x0874B558
return:	.word 0x0874B4A5
decry:	.word 0x0803FBE9
