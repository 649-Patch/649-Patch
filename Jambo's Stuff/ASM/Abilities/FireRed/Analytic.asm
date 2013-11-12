.text
.align 2
.thumb
.thumb_func
.global analytic

main:
	ldr r4, storeloc
	str r0, [r4, #0x0]
	push {r1-r7}
	ldr r1, place
	ldrb r2, [r1, #0x1]
	ldrb r1, [r1, #0x0]
	ldr r7, place3
	mov r3, #0x4
	mov r4, #0x4
	mov r5, #0x0
loop:	add r6, r5, r7
	ldrb r6, [r6, #0x0]
	cmp r6, r1
	bne no
	add r3, r5, #0x0
no:	cmp r6, r2
	bne no2
	add r4, r5, #0x0
no2:	cmp r3, #0x4
	beq skip
	cmp r4, #0x4
	bne exit
skip:	add r5, #0x1
	b loop
exit:	cmp r3, r4
	ble exit2
	mov r2, #0x58
	mul r1, r2
	ldr r2, place2
	add r1, r1, r2
	ldrb r1, [r1, #0x0]
	cmp r1, #0x94
	bne exit2
	mov r1, #0x82
	mul r0, r1
	mov r1, #0x64
	bl div
	pop {r1-r7}
	str r0, [r4, #0x0]
	b skip2
exit2:	pop {r1-r7}
skip2:	cmp r0, #0x0
	bne alt
	mov r0, #0x1
	str r0, [r4, #0x0]
alt:	ldr r7, return
	bx r7
div:	ldr r2, divide
	bx r2
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
place3:	.word 0x02023BDE
storeloc:	.word 0x02023D50
return:	.word 0x0801F137
divide:	.word 0x081E4019
