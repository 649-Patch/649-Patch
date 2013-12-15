.text
.align 2
.thumb
.thumb_func
.global bwexpgain

main:
	ldr r0, storageforbyte
	strh r2, [r0, #0x0]
	strb r5, [r0, #0x2]
	add r1, #0x2A
	ldrb r1, [r1, #0x0]
	strb r1, [r0, #0x3]
	add r0, r1, #0x0
	mul r0, r2
	mov r1, #0x7
	bl divide
	lsl r0, r0, #0x10
	ldr r1, return
	bx r1
divide:	ldr r3, dividecode
	bx r3
.align
dividecode:	.word 0x081E4019
storageforbyte:	.word 0x0203C002
return:	.word 0x08021BF1
