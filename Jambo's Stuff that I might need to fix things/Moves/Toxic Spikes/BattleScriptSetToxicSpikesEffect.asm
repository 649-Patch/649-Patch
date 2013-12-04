.text
.align 2
.thumb
.thumb_func
.global battlescriptsettoxicspikeseffect

main:
	push {lr}
	mov r4, #0x30
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x1
	and r0, r1
	ldr r1, place2
	lsl r2, r0, #0x1
	add r0, r0, r2
	lsl r0, r0, #0x2
	add r0, r0, r1
	ldrb r0, [r0, #0xA]
	and r0, r4
	lsr r0, r0, #0x4
	cmp r0, #0x1
	bne alt
	mov r0, #0x2
	b store
alt:	mov r0, #0x6
store:	ldr r1, place3
	strb r0, [r1, #0x0]
success:	pop {pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023DE4
place3:	.word 0x02023E85