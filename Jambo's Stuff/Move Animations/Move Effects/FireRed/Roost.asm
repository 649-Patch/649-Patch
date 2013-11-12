.text
.align 2
.thumb
.thumb_func
.global roost

main:
	ldr r0, place
	ldrb r2, [r0, #0x0]
	mov r1, #0x58
	mul r1, r2
	ldr r0, place2
	add r0, r1, r0
	add r0, #0x28
	ldrh r3, [r0, #0x4]
	ldrh r1, [r0, #0x0]
	cmp r1, r3
	blt continue
	b exit
continue:	ldr r0, roostramlocation
	mov r1, #0x1
	lsl r1, r2
	ldrb r2, [r0, #0x0]
	orr r1, r2
	strb r1, [r0, #0x0]
exit:	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
roostramlocation:	.word 0x0203D801
