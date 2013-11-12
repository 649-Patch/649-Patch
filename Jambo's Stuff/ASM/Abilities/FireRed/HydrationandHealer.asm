.text
.align 2
.thumb
.thumb_func
.global hydrationandhealer

main:	ldrb r5, [r2, #0x0]
	cmp r5, #0x5D
	beq hydration
	cmp r5, #0x83
	beq healer
	ldr r5, return2
	bx r5
hydration:	ldr r0, weatherbits
	ldrh r0, [r0, #0x0]
	mov r1, #0x7
	and r0, r1
	cmp r0, #0x0
	bne clearstatus
	bl exit
clearstatus:	add r0, r7, #0x0
	add r0, #0x4C
	add r5, r6, r0
	ldr r4, [r5, #0x0]
	mov r0, #0xFF
	bic r4, r0
	ldr r0, return
	bx r0
healer:	ldr r0, battlebits
	ldr r0, [r0, #0x0]
	mov r5, #0x1
	and r0, r5
	cmp r0, #0x0
	bne clearstatus2
	bl exit
clearstatus2:	bl random
	mov r1, #0x3
	bl divmod
	cmp r0, #0x0
	beq jump
	bl exit
jump:	push {r1-r7}
	add r0, r6, #0x0
	mov r1, #0x58
	bl divide
	pop {r1-r7}
	cmp r0, #0x2
	bge alt
	add r0, #0x2
	b continue
alt:	sub r0, #0x2
continue:	mov r1, #0x58
	mul r1, r0
	mov r11, r0
	add r0, r7, #0x0
	add r0, #0x4C
	add r5, r0, r1
	ldr r4, [r5, #0x0]
	mov r0, #0xFF
	bic r4, r0
	ldr r0, [r5, #0x0]
	mov r1, #0x88
	and r0, r1
	cmp r0, #0x0
	beq next
	ldr r0, ramloc
	ldr r1, romloc
	bl thing
next:	ldr r0, [r5, #0x0]
	mov r1, #0x7
	and r0, r1
	cmp r0, #0x0
	beq next2
	ldr r0, ramloc
	ldr r1, romloc
	add r1, #0x8
	bl thing
next2:	ldr r0, [r5, #0x0]
	mov r1, #0x40
	and r0, r1
	cmp r0, #0x0
	beq next3
	ldr r0, ramloc
	ldr r1, romloc
	add r1, #0x10
	bl thing
next3:	ldr r0, [r5, #0x0]
	mov r1, #0x10
	and r0, r1
	cmp r0, #0x0
	beq next4
	ldr r0, ramloc
	ldr r1, romloc
	add r1, #0x18
	bl thing
next4:	ldr r0, [r5, #0x0]
	mov r1, #0x20
	and r0, r1
	cmp r0, #0x0
	beq next5
	ldr r0, ramloc
	ldr r1, romloc
	add r1, #0x20
	bl thing
next5:	str r4, [r5, #0x0]
	add r1, r5, #0x4
	ldr r0, [r1, #0x0]
	ldr r2, bitclearing
	and r0, r2
	str r0, [r1, #0x0]
	ldr r0, place4
	mov r1, r10
	strb r1, [r0, #0x3]
	ldr r0, place3
	ldr r4, place2
	mov r1, r11
	strb r1, [r0, #0x0]
	strb r1, [r4, #0x17]
	ldr r0, place4
	strb r1, [r0, #0x0]
	ldr r0, script
	ldr r1, return3
	bx r1
exit:	ldr r4, getout
	bx r4
divide:	ldr r2, div
	bx r2
divmod:	ldr r3, div2
	bx r3
thing:	ldr r3, place
	bx r3
random:	ldr r2, gorandom
	bx r2
.align
weatherbits:	.word 0x02023F1C
battlebits:	.word 0x02022B4C
div:	.word 0x081E4019
div2:	.word 0x081E4685
return:	.word 0x0801A4D3
getout:	.word 0x0801BBAB
return2:	.word 0x08760641
ramloc:	.word 0x02022AB8
romloc:	.word 0x08250094
place:	.word 0x08008D85
bitclearing:	.word 0xF7FFFFFF
place2:	.word 0x02023FC4
place3:	.word 0x02023BC4
place4:	.word 0x02023D6B
script:	.word 0x08FFFFFF
return3:	.word 0x0801A549
gorandom:	.word 0x08044EC9
