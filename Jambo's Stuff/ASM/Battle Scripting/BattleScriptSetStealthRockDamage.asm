.text
.align 2
.thumb
.thumb_func
.global battlescriptsetstealthrockdamage

main:
	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r2, #0x58
	mul r0, r2
	ldr r2, place2
	add r0, r0, r2
	ldrh r7, [r0, #0x2C]
	add r2, r0, #0x0
	add r2, #0x20
	ldrb r0, [r2, #0x0]
	cmp r0, #0x62
	bne alt
	mov r7, #0x0
	b skip
alt:	ldrb r1, [r2, #0x1]
	ldrb r2, [r2, #0x2]
	mov r0, #0x5
	bl checkmoveeffectiveness
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	mov r1, #0x3
	add r0, r0, r1
	lsr r7, r0
	cmp r7, #0x0
	bne skip
	mov r7, #0x1
skip:	ldr r1, ramlocation
	str r7, [r1, #0x0]
exit:	pop {pc}
checkmoveeffectiveness:	push {r1-r7,lr}
	ldr r3, datalocation
	lsl r4, r0, #0x1
	lsl r0, r0, #0x4
	add r0, r0, r4
	add r0, r0, r3
	mov r3, #0x1
	mov r4, #0xA
	add r1, r1, r0
	add r2, r2, r0
	ldrb r1, [r1, #0x0]
	cmp r1, #0x1
	bne skip3
	mul r3, r4
	b next
skip3:	mul r3, r1
next:	ldrb r2, [r2, #0x0]
	cmp r2, #0x1
	bne skip2
	mul r3, r4
	b next6
skip2:	mul r3, r2
next6:	cmp r3, #0x19
	bne next2
	mov r0, #0x2
	b exit2
next2:	cmp r3, #0x32
	bne next3
	mov r0, #0x1
	b exit2
next3:	cmp r3, #0x64
	bne next4
	mov r0, #0x0
	b exit2
next4:	cmp r3, #0xC8
	bne next5
	mov r0, #0xFF
	b exit2
next5:	mov r0, #0xFE
exit2:	pop {r1-r7,pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
place3:	.word 0x02023DE4
ramlocation:	.word 0x02023D50
datalocation:	.word 0x08767B18