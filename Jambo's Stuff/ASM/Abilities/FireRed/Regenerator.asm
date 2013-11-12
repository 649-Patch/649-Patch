.text
.align 2
.thumb
.thumb_func
.global regenerator

main:
	add r0, r1, r3
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x1E
	beq naturalcure
	cmp r0, #0x90
	bne exit
	add r3, #0x28
	add r0, r1, r3
	ldrh r1, [r0, #0x0]
	cmp r1, #0x0
	beq exit
	ldrh r0, [r0, #0x4]
	add r2, r0, #0x0
	push {r1-r7}
	mov r1, #0x3
	bl divide
	pop {r1-r7}
	add r0, r0, r1
	cmp r0, r2
	blt skip
	add r0, r2, #0x0
skip:	str r0, [sp, #0x0]
	bl getaddress
	mov r1, #0x39
	mov r2, sp
	bl encrypt
exit:	ldr r0, return
	bx r0
naturalcure:	add r3, #0x4C
	add r1, r1, r3
	ldr r0, return2
	bx r0
divide:	ldr r2, divcode
	bx r2
getaddress:	ldr r0, addget
	bx r0
encrypt:	ldr r3, encry
	bx r3
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
place3:	.word 0x02023D50
return:	.word 0x0802CD1B
return2:	.word 0x0802CCEB
divcode:	.word 0x081E4019
addget:	.word 0x0874A459
encry:	.word 0x0804037D
