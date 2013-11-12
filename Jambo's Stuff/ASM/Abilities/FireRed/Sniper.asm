.text
.align 2
.thumb
.thumb_func
.global dryskinIII

main:
	ldr r1, place
	mov r0, #0x58
	ldrb r1, [r1, #0x0]
	mul r1, r0
	ldr r0, place2
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	cmp r0, #0x61
	bne normal
	mov r0, #0x3
	b return
normal:	mov r0, #0x2
return:	ldr r1, romlocation
	strb r0, [r1, #0x0]
	ldr r1, returnone
	bx r1
.align
returnone:	.word 0x0801E587
romlocation:	.word 0x02023D71
place:	.word 0x02023D6B
place2:	.word 0x02023C04
