.text
.align 2
.thumb
.thumb_func
.global prankster

main:
	push {r1-r7}
	ldr r4, ramlocation
	mov r5, r9
	mov r6, r10
	add r5, r5, r4
	add r6, r6, r4
	ldrb r5, [r5, #0x0]
	ldrb r6, [r6, #0x0]
	mov r1, #0x58
	mov r2, r9
	mov r3, r10
	mul r2, r1
	mul r3, r1
	ldr r1, place2
	add r2, r2, r1
	add r3, r3, r1
	lsl r5, r5, #0x1
	lsl r6, r6, #0x1
	add r5, #0xC
	add r6, #0xC
	add r5, r5, r2
	add r6, r6, r3
	ldrh r5, [r5, #0x0]
	ldrh r6, [r6, #0x0]
	mov r4, #0xC
	mul r5, r4
	mul r6, r4
	ldr r4, attacktable
	add r5, r5, r4
	add r6, r6, r4
	add r3, #0x20
	add r2, #0x20
	ldrb r3, [r3, #0x0]
	ldrb r2, [r2, #0x0]
	mov r4, #0x0
	cmp r2, #0x9E
	bne skip
	ldrb r7, [r5, #0xA]
	cmp r7, #0x2
	bne skip
	mov r4, #0x1
skip:	ldrb r5, [r5, #0x7]
	add r5, r5, r4
	lsl r5, r5, #0x18
	asr r5, r5, #0x18
	mov r4, #0x0
	cmp r3, #0x9E
	bne skip2
	ldrb r7, [r6, #0xA]
	cmp r7, #0x2
	bne skip2
	mov r4, #0x1
skip2:	ldrb r6, [r6, #0x7]
	add r6, r6, r4
	lsl r6, r6, #0x18
	asr r6, r6, #0x18
	cmp r5, r6
	bne normal
	cmp r3, #0x64
	bne nextcheck
	cmp r2, #0x64
	beq speedcheck
one:	mov r0, #0x0
	pop {r1-r7}
	str r0, [sp, #0x8]
	b end2
nextcheck:	cmp r2, #0x64
	bne normal
two:	mov r0, #0x1
	pop {r1-r7}
	str r0, [sp, #0x8]
	b end2
speedcheck:	pop {r1-r7}
	push {r1-r7}
	cmp r8, r7
	beq alt
	cmp r8, r7
	bcs one
	b two
alt:	bl random
	mov r1, #0x1
	and r1, r0
	cmp r1, #0x0
	beq one
	b two
normal: cmp r5, r6
	blt two
	cmp r6, r5
	blt one
	pop {r1-r7}
	push {r1-r7}
	ldr r1, trickroomlocation
	ldrb r1, [r1, #0x0]
	cmp r1, #0x0
	bne alt2
	cmp r8, r7
	beq alt
	cmp r8, r7
	bcs one
	b two
alt2:	cmp r8, r7
	beq alt2
	cmp r7, r8
	bcs one
	b two
end2:	ldr r0, [sp, #0x8]
	add sp, #0xC
	pop {r3-r5}
	mov r8, r3
	mov r9, r4
	mov r10, r5
	pop {r4-r7}
	pop {r1}
	bx r1
random:	ldr r2, gorandom
	bx r2
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
ramlocation:	.word 0x02000090
attacktable:	.word 0x087453D4
gorandom:	.word 0x08044EC9
trickroomlocation:	.word 0x0203C040
