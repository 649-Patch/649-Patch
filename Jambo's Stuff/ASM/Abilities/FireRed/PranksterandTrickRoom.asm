.text
.align 2
.thumb
.thumb_func
.global prankster

main:
	ldr r3, place
	ldrb r3, [r3, #0x0]
	push {r1}
	mov r1, #0x58
	mul r3, r1
	ldr r1, place2
	add r3, r3, r1
	ldrb r3, [r3, #0x0]
	pop {r1}
	cmp r3, #0x9E
	bne exit
	ldrb r3, [r0, #0xA]
	cmp r3, #0x2
	bne exit
	add r1, #0x1
exit:	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r3, r2, #0x1
	ldr r0, place
	ldrb r0, [r0, #0x1]
	push {r1}
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	cmp r0, #0x9E
	bne normal
	add r0, r3, r2
	lsl r0, r0, #0x2
	add r0, r0, r4
	ldrb r1, [r0, #0xA]
	cmp r1, #0x2
	bne normal
	ldrb r0, [r0, #0x7]
	add r0, #0x1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r1}
	b there
normal:	pop {r1}
	add r0, r3, r2
	lsl r0, r0, #0x2
	add r0, r0, r4
	ldrb r0, [r0, #0x7]
there:	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	cmp r1, r0
	bne nextone
	ldr r1, trickroomlocation
	ldrb r1, [r1, #0x0]
	cmp r1, #0x0
	bne alt
	cmp r8, r7
	bne orderthem1
there2:	bl random
	mov r1, #0x1
	and r1, r0
	cmp r1, #0x0
	beq orderthem1
	mov r3, #0x2
	b end
orderthem1:	cmp r8, r7
	bcs end2
	mov r0, #0x1
	str r0, [sp, #0x8]
	b end2
nextone:	cmp r1, r0
	bge end2
	mov r1, #0x1
	str r1, [sp, #0x8]
	b end2
alt:	cmp r8, r7
	beq there2
	cmp r7, r8
	bcs end2
	mov r0, #0x1
	str r0, [sp, #0x8]
	b end2
end:	str r3, [sp, #0x8]
end2:	ldr r0, [sp, #0x8]
	add sp, #0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
trickroomlocation:	.word 0x0203C040
randomiser:	.word 0x0803F427
