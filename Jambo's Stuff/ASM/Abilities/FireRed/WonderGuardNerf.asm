.text
.align 2
.thumb
.thumb_func
.global wonderguardnerf2

main:
	ldr r0, [sp, #0x1C]
	cmp r1, #0x19
	bne skip
	push {r1,r2}
	add r0, #0x2C
	ldr r2, [r0, #0x0]
	mov r1, #0x1
	lsl r1, r1, #0xC
	orr r2, r1
	str r2, [r0, #0x0]
	sub r0, #0x2C
	pop {r1,r2}
skip:	strb r1, [r0, #0x0]
	ldrb r0, [r2, #0x0]
	ldr r1, abilitystoreloc
	strb r0, [r1, #0x0]
	ldr r0, return
	bx r0
.align
abilitystoreloc:	.word 0x02023D6A
return:	.word 0x0801B6C5
