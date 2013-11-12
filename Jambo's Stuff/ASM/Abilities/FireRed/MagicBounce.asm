.text
.align 2
.thumb
.thumb_func
.global magicbounceroutine

main:
	push {r1,r2}
	ldr r1, place
	ldrb r1, [r1, #0x1]
	mov r2, #0x58
	mul r1, r2
	ldr r2, place2
	add r1, r1, r2
	ldrb r0, [r1, #0x0]
	pop {r1,r2}
	cmp r0, #0x9C
	beq magicbounce
	lsl r0, r3, #0x4
	add r0, r0, r2
	ldrb r0, [r0, #0x0]
	mov r8, r1
	mov r9, r2
	lsl r0, r0, #0x1B
	cmp r0, #0x0
	bge exit
	ldr r2, return
	bx r2
magicbounce:	ldr r0, currentattack
	ldrh r0, [r0, #0x0]
	mov r1, #0xC
	mul r0, r1
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r1, [r0, #0x8]
	mov r0, #0x4
	and r0, r1
	cmp r0, #0x0
	beq exit
	bl thing
	ldr r1, scriptloc
	ldr r0, script
	str r0, [r1, #0x0]
	add sp, #0x4
	pop {r3,r4}
	mov r8, r3
	mov r9, r4
	pop {r4-r7}
	pop {r0}
	bx r0
exit:	ldr r2, return2
	bx r2
thing:	ldr r0, thing2
	bx r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
return:	.word 0x0801D8E7
return2:	.word 0x0801D94D
scriptloc:	.word 0x02023D74
currentattack:	.word 0x02023D4A
attacktable:	.word 0x087453D4
thing2:	.word 0x08017545
script:	.word 0x08FFFFFF
