.text
.align 2
.thumb
.thumb_func
.global klutz

main:
	mov r1, #0x2C
	mul r0, r1
	add r0, r0, r4
	ldrb r0, [r0, #0x12]
	cmp r0, #0x0
	beq exit
	cmp r0, #0x28
	beq exit3
	cmp r0, #0x18
	beq exit3
	cmp r0, #0x20
	beq exit3
	push {r0}
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	cmp r0, #0x67
	bne exit2
	pop {r0}
	mov r0, #0x0
	b exit
exit2:	pop {r0}
exit3:	cmp r0, #0x15
	bhi exit
	push {r0-r7}
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x1
	and r0, r1
	mov r1, #0x0
loop:	mov r2, #0x1
	and r2, r1
	cmp r0, r2
	beq skip
	mov r2, #0x58
	mul r2, r1
	ldr r3, place2
	add r2, r2, r3
	ldrb r2, [r2, #0x0]
	cmp r2, #0x7F
	beq exit4
skip:	ldr r2, numofbattlers
	ldrb r2, [r2, #0x0]
	sub r2, #0x1
	cmp r1, r2
	beq exit5
	add r1, #0x1
	b loop
exit4:	pop {r0-r7}
	mov r0, #0x0
	b exit
exit5:	pop {r0-r7}
exit:	pop {r4}
	pop {r1}
	bx r1
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
numofbattlers:	.word 0x02023BCC
