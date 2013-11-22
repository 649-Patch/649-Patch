.text
.align 2
.thumb
.thumb_func
.global activatespikesstealthrockandtoxicspikes

main:
	ldr r0, place
	ldrh r0, [r0, #0x0]
	cmp r0, #0xBF
	beq spikes
	mov r1, #0xDF
	lsl r1, r1, #0x1
	cmp r0, r1
	beq stealthrock
	mov r1, #0x4
	b continue
spikes:	mov r1, #0x0
	b continue
stealthrock:	mov r1, #0x2
continue:	push {r2}
	mov r2, #0x3
	lsl r2, r1
	ldrb r0, [r3, #0xA]
	push {r4}
	add r4, r0, #0x0
	and r0, r2
	bic r4, r2
	lsr r0, r1
	cmp r1, #0x2
	bne skip
	cmp r0, #0x1
	bne increment
	b fail
skip:	cmp r0, #0x3
	bne increment
fail:	pop {r4}
	pop {r2}
	ldr r2, place3
	ldr r1, returnone
	bx r1
increment:	add r0, #0x1
	lsl r0, r1
	orr r0, r4
	pop {r4}
	strb r0, [r3, #0xA]
	pop {r2}
	ldr r1, place2
	add r1, r1, r2
	ldrh r2, [r1, #0x0]
	mov r0, #0x10
	orr r0, r2
	strh r0, [r1, #0x0]
	ldr r1, returntwo
	bx r1	
.align
place:	.word 0x02023D4A
place2:	.word 0x02023DDE
place3:	.word 0x02023ECC
returnone:	.word 0x0802AA3D
returntwo:	.word 0x0802AA8F
scriptlocation:	.word 0x02023D74
