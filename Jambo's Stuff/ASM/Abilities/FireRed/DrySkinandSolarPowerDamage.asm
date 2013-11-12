.text
.align 2
.thumb
.thumb_func
.global dryskinandsolarpower

main:
	ldr r1, weather
	ldrh r1, [r1, #0x0]
	push {r0}
	mov r0, #0x60
	and r1, r0
	cmp r1, #0x0
	beq skip
	ldr r1, place
	ldrb r1, [r1, #0x0]
	mov r0, #0x58
	mul r1, r0
	ldr r0, place2
	add r0, r0, r1
	add r1, r0, #0x0
	add r1, #0x20
	ldrb r1, [r1, #0x0]
	cmp r1, #0x5E
	beq skip2
	cmp r1, #0x57
	bne skip
skip2:	ldrh r1, [r0, #0x2C]
	lsr r1, r1, #0x3
	ldrh r0, [r0, #0x28]
	cmp r1, r0
	blt skip3
	add r1, r0, #0x0
skip3:	ldr r0, storeloc
	str r1, [r0, #0x0]
	pop {r0}
	mov r1, #0x8
	and r0, r1
	cmp r0, #0x0
	bne alt
there2:	ldr r0, script
there:	ldr r1, return3
	bx r1
alt:	add r1, r3, r2
	add r0, r1, #0x0
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x5A
	beq there2
	ldr r0, script2
	b there
skip:	pop {r0}
	mov r1, #0x8
	and r0, r1
	cmp r0, #0x0
	beq exit
	ldr r1, return
	bx r1
exit:	ldr r0, return2
	bx r0
.align
weather:	.word 0x02023F1C
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
storeloc:	.word 0x02023D50
script:	.word 0x08764F54
script2:	.word 0x08FFFFFF
return:	.word 0x08018495
return3:	.word 0x08018C05
return2:	.word 0x08018C13