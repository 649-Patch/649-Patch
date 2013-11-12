.text
.align 2
.thumb
.thumb_func
.global moodybranch

main:
	ldrb r5, [r2, #0x0]
	cmp r5, #0x8D
	beq moody
	ldr r5, gothere
	bx r5
moody:	push {r0-r7}
	add r0, r4, #0x0
	add r0, #0x19
	mov r2, #0x0
	mov r3, #0x0
thisloop:	add r5, r0, r3
	ldrb r1, [r5, #0x0]
	cmp r1, #0xB
	bne skip
	add r2, #0x1
skip:	cmp r3, #0x6
	beq exitthisloop
	add r3, #0x1
	b thisloop
exitthisloop:	cmp r2, #0x7
	bne loopback
	mov r0, #0xFF
	b continue
loopback:	bl random
	mov r1, #0x7
	bl divmod
	add r2, r4, #0x0
	add r2, #0x19
	add r2, r2, r0
	ldrb r3, [r2, #0x0]
	cmp r3, #0xB
	blt continue
	b loopback
continue:	add r5, r0, #0x0
	add r0, r4, #0x0
	add r0, #0x19
	mov r2, #0x0
	mov r3, #0x0
thisloop2:	add r6, r0, r3
	ldrb r1, [r6, #0x0]
	cmp r1, #0x0
	bne skip2
	add r2, #0x1
skip2:	cmp r3, #0x6
	beq exitthisloop2
	add r3, #0x1
	b thisloop2
exitthisloop2:	cmp r2, #0x7
	bne loopback2
	mov r0, #0xFF
	b continue2
loopback2:	bl random
	mov r1, #0x7
	bl divmod
	cmp r0, r5
	beq loopback2
	add r2, r4, #0x0
	add r2, #0x19
	add r2, r2, r0
	ldrb r3, [r2, #0x0]
	cmp r3, #0x0
	bgt continue2
	b loopback2
continue2:	add r6, r0, #0x0
	add r0, r5, #0x0
	cmp r0, #0xFF
	bne skip3
	ldr r2, ramlocation
	b there
skip3:	add r5, r4, r0
	add r5, #0x19
	ldrb r7, [r5, #0x0]
	add r7, #0x2
	strb r7, [r5, #0x0]
	ldr r2, table
	lsl r0, r0, #0x2
	add r0, r0, r2
	ldr r0, [r0, #0x0]
	ldr r2, ramlocation
	mov r3, #0x41
	strb r3, [r2, #0x0]
	add r2, #0x1
	strb r0, [r2, #0x0]
loop:	add r2, #0x1
	lsr r0, r0, #0x8
	strb r0, [r2, #0x0]
	cmp r0, #0x0
	bne loop
there:	mov r3, #0x3C
	strb r3, [r2, #0x0]
	cmp r6, #0xFF
	bne skip4
	ldr r2, ramlocation2
	b there2
skip4:	add r5, r4, r6
	add r5, #0x19
	ldrb r7, [r5, #0x0]
	sub r7, #0x1
	strb r7, [r5, #0x0]
	lsl r0, r6, #0x2
	ldr r2, table2
	add r0, r0, r2
	ldr r0, [r0, #0x0]
	ldr r2, ramlocation2
	mov r3, #0x41
	strb r3, [r2, #0x0]
	add r2, #0x1
	strb r0, [r2, #0x0]
loop2:	add r2, #0x1
	lsr r0, r0, #0x8
	strb r0, [r2, #0x0]
	cmp r0, #0x0
	bne loop2
there2:	mov r3, #0x3C
	strb r3, [r2, #0x0]
	pop {r0-r7}
	ldr r0, script
	ldr r2, return
	bx r2
end:	ldr r4, exit
	bx r4
divmod:	ldr r3, divmodloc
	bx r3
random:	ldr r2, rand
	bx r2
.align
gothere:	.word 0x08760641
exit:	.word 0x0801BBAB
divmodloc:	.word 0x081E4685
rand:	.word 0x08044EC9
return:	.word 0x0801A5C1
script:	.word 0x08FFFFFF
ramlocation:	.word 0x0203D010
ramlocation2:	.word 0x0203D018
table:	.word 0x08FFFFFF
table2:	.word 0x08FFFFFF
