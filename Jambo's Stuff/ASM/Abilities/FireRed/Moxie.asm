.text
.align 2
.thumb
.thumb_func
.global mummyandironbarbs

main:
	mov r1, r8
	ldrb r0, [r1, #0x0]
	push {r1-r7}
	mov r2, #0x0
loop:	ldr r1, table
	lsl r3, r2, #0x3
	add r3, r3, r1
	ldrb r1, [r3, #0x0]
	cmp r0, r1
	beq exitloop
	cmp r1, #0xFF
	beq exitnormal
	add r2, #0x1
	b loop
exitloop:	ldr r0, [r3, #0x4]
	pop {r1-r7}
	mov pc, r0
exitnormal:	pop {r1-r7}
	cmp r0, #0xA0
	bne normal2
	mov r0, #0x18
	b normal3
normal2:	cmp r0, #0x8F
	bne normal11
	mov r0, #0x26
	b normal3
normal11:	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x99
	beq moxie
	mov r1, r8
	ldrb r0, [r1, #0x0]
normal3:	sub r0, #0x9
	cmp r0, #0x2F
	bls normal4
	bl exit
normal4:	lsl r0, r0, #0x2
	ldr r1, return
	bx r1
moxie:	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrh r1, [r0, #0x28]
	cmp r1, #0x0
	bne exit
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrh r1, [r0, #0x28]
	cmp r1, #0x0
	beq exit
	ldr r1, battlebits
	ldr r1, [r1, #0x0]
	mov r2, #0x5
	and r1, r2
	cmp r1, #0x4
	beq exit
	add r1, r0, #0x0
	add r1, #0x19
	ldrb r2, [r1, #0x0]
	cmp r2, #0xC
	beq exit
	add r2, #0x1
	strb r2, [r1, #0x0]
	bl place4
	ldr r0, scriptloc
	ldr r1, script
	str r1, [r0, #0x0]
	ldr r2, return2
	bx r2
exit:	ldr r4, exitloc
	bx r4
place4:	ldr r0, gothere2
	bx r0
.align
return:	.word 0x0801A8C9
exitloc:	.word 0x0801BBAB
scriptloc:	.word 0x02023D74
script:	.word 0x08FFFFFF
table:	.word 0x08764354
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
gothere2:	.word 0x08017545
return2:	.word 0x0801ABD9
battlebits:	.word 0x02022B4C
