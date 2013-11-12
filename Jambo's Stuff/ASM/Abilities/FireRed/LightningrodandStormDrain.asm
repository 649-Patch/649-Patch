.text
.align 2
.thumb
.thumb_func
.global simpleandcontrary

main:
	ldrb r1, [r4, #0x2]
	cmp r1, #0xD
	beq lightn
	cmp r1, #0xB
	bne later2
	ldrb r1, [r0, #0xC]
	mov r0, #0x58
	mul r0, r1
	add r0, r0, r3
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	add r3, r2, #0x0
	cmp r0, #0x72
	beq exit
	b stormdr
lightn:	ldrb r1, [r0, #0xC]
	mov r0, #0x58
	mul r0, r1
	add r0, r0, r3
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	add r3, r2, #0x0
	cmp r0, #0x1F
	beq exit
lightningrod:	ldrb r0, [r4, #0x2]
	cmp r0, #0xD
	beq continue
	b exit
stormdr:	ldrb r0, [r4, #0x2]
	cmp r0, #0xB
	bne exit
	ldr r0, attackloc
	ldrh r0, [r0, #0x0]
	push {r3}
	ldr r3, soak
	cmp r0, r3
	bne continue2
	pop {r3}
	b exit
continue2:	pop {r3}
continue:	add r0, r6, #0x0
	bl there
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r1, ramloc
	strb r5, [r1, #0x0]
	ldr r0, ramloc2
	ldrb r0, [r0, #0x0]
	cmp r5, r0
	bcs later
	add r4, r1, #0x0
loop:	ldrb r0, [r4, #0x0]
	bl there
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r6, r0
	beq later2
	ldr r0, place
	ldrb r1, [r0, #0x0]
	ldr r0, ramloc3
	ldr r0, [r0, #0x0]
	add r1, r1, r0
	ldrb r0, [r1, #0xC]
	ldrb r1, [r4, #0x0]
	cmp r0, r1
	beq later2
	ldr r1, place2
	ldrb r2, [r4, #0x0]
	mov r0, #0x58
	mul r0, r2
	add r0, r0, r1
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x1F
	beq lightningrod2
	cmp r0, #0x72
	beq lightningrod2
	b later2
lightningrod2:	add r0, r2, #0x0
	bl there2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	ldr r3, [sp, #0x0]
	cmp r0, r3
	bcs later2
	ldrb r0, [r4, #0x0]
	bl there2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x0]
later2:	ldr r4, ramloc
	ldrb r0, [r4, #0x0]
	add r0, #0x1
	strb r0, [r4, #0x0]
	ldr r1, ramloc2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	ldrb r1, [r1, #0x0]
	cmp r0, r1
	bcc loop
later:	ldr r4, return
	bx r4
exit:	ldr r0, return2
	bx r0
there:	ldr r1, gothere
	bx r1
there2:	ldr r2, gothere2
	bx r2
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
attackloc:	.word 0x02023D4A
soak:	.word 0x000001E7
gothere:	.word 0x080751C5
gothere2:	.word 0x0801FEE9
ramloc:	.word 0x02023BC4
ramloc2:	.word 0x02023BCC
ramloc3:	.word 0x02023FE8
return:	.word 0x080160A9
return2:	.word 0x080161F9
