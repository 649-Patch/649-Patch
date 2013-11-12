.text
.align 2
.thumb
.thumb_func
.global flameburst

main:
	ldr r0, place
	ldrb r1, [r0, #0x1]
	ldr r3, loopcounter
	ldrb r4, [r3, #0x0]
	cmp r1, r4
	beq exit
	mov r2, #0x1
	and r1, r2
	and r4, r2
	cmp r1, r4
	bne exit
	ldrb r4, [r3, #0x0]
	mov r2, #0x58
	mul r2, r4
	ldr r0, place2
	add r0, r2, r0
	add r1, r0, #0x4
	ldrh r1, [r1, #0x0]
	lsr r1, r1, #0x4
	ldrh r2, [r0, #0x0]
	cmp r1, r2
	blt skip
	add r2, r1, #0x0
skip:	sub r2, r2, r1
	strh r2, [r0, #0x0]
	ldr r4, location
	strh r1, [r4, #0x0]
	ldr r4, [sp, #0x0]
	str r2, [sp, #0x0]
	ldrb r2, [r3, #0x0]
	mov r3, #0x1
	and r3, r2
	lsl r2, r2, #0x1
	ldr r1, place3
	add r2, r2, r1
	ldrh r2, [r2, #0x0]
	mov r1, #0x64
	mov r5, #0x6
	mul r3, r5
	mul r3, r1
	mul r1, r2
	ldr r0, baselocation
	sub r0, r0, r3
	add r0, r0, r1
	mov r1, #0x39
	mov r2, sp
	push {lr}
	bl encrypt
	pop {r1}
	mov lr, r1
	str r4, [sp, #0x0]
end:	bx lr
exit:	ldr r1, newreturn
	ldr r0, scriptlocation
	str r1, [r0, #0x0]
	b end
encrypt:	ldr r3, encrypter
	bx r3
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C0C
place3:	.word 0x02023BCE
loopcounter:	.word 0x02023D72
newreturn:	.word 0x08766F47
scriptlocation:	.word 0x02023D74
baselocation:	.word 0x02024284
encrypter:	.word 0x0804037D
location:	.word 0x02023D50
