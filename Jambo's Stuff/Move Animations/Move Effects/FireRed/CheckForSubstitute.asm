.text
.align 2
.thumb
.thumb_func
.global checksubstitute

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	lsl r1, r0, #0x2
	ldr r0, place2
	add r0, r1, r0
	mov r1, #0x8
	lsl r1, r1, #0x10
	ldr r0, [r0, #0x0]
	and r0, r1
	cmp r0, #0x0
	bne alt
	ldr r1, lastresult
	strh r0, [r1, #0x0]
	b end
alt:	mov r0, #0x1
	ldr r1, lastresult
	strh r0, [r1, #0x0]
end:	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023DFC
lastresult:	.word 0x020370D0
