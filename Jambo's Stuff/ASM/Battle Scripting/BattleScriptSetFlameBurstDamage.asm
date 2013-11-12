.text
.align 2
.thumb
.thumb_func
.global battlescriptsetflameburstdamage

main:
	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r0, place
	ldrb r1, [r0, #0x0]
	mov r0, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrh r1, [r0, #0x28]
	cmp r1, #0x0
	bne skip3
	mov r0, #0x0
	b skip2
skip3:	ldrh r0, [r0, #0x2C]
	lsr r0, r0, #0x4
	cmp r0, r1
	bls skip
	add r0, r1, #0x0
skip:	cmp r0, #0x0
	bne skip2
	mov r0, #0x1
skip2:	ldr r1, damagelocation
	str r0, [r1, #0x0]
	pop {pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
damagelocation:	.word 0x02023D50