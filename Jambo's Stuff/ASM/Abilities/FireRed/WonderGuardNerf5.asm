.text
.align 2
.thumb
.thumb_func
.global wonderguardnerf5

main:
	sub r0, r4, #0x1
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	add r0, r0, r2
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x68
	beq exit
	cmp r0, #0xA3
	beq exit
	cmp r0, #0xA4
	bne normal
exit:	ldr r0, return
	bx r0
normal:	ldr r0, there
	bx r0
.align
there:	.word 0x08765C85
return:	.word 0x0801EA53
