.text
.align 2
.thumb
.thumb_func
.global baddreams

main:
	push {r1-r7}
	ldr r1, place
	ldrb r1, [r1, #0x0]
	mov r2, #0x0
loop:	mov r3, #0x58
	mul r3, r2
	ldr r4, place2
	add r3, r3, r4
	ldrb r3, [r3, #0x0]
	cmp r3, #0x7B
	beq exitloop
	ldr r4, numofbattlers
	ldrb r4, [r4, #0x0]
	sub r4, #0x1
	cmp r2, r4
	beq exit
	add r2, #0x1
	b loop
exit:	pop {r1-r7}
	mov r0, #0x80
	lsl r0, r0, #0x14
	and r0, r2
	cmp r0, #0x0
	bne nightmaredamage
exit2:	ldr r0, return
	bx r0
nightmaredamage:	ldr r3, return2
	bx r3
exitloop:	ldr r1, place
	strb r2, [r1, #0x3]
	ldr r2, place2
	sub r2, #0x40
	ldrb r2, [r2, #0x0]
	strb r2, [r1, #0x1]
	pop {r1-r7}
	add r3, r1, r4
	ldrh r0, [r3, #0x28]
	cmp r0, #0x0
	beq exit2
	add r0, r4, #0x0
	add r0, #0x4C
	add r0, r1, r0
	ldr r0, [r0, #0x0]
	mov r1, #0x7
	and r0, r1
	cmp r0, #0x0
	beq exit2
	ldr r1, storeloc
	ldrh r0, [r3, #0x2C]
	lsr r0, r0, #0x3
	str r0, [r1, #0x0]
	cmp r0, #0x0
	bne skip
	mov r0, #0x1
	str r0, [r1, #0x0]
skip:	ldr r0, script
	ldr r1, return3
	bx r1	
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
return:	.word 0x08018C13
numofbattlers:	.word 0x02023BCC
storeloc:	.word 0x02023D50
return2:	.word 0x080185A5
return3:	.word 0x08018C05
script:	.word 0x08FFFFFF
