.text
.align 2
.thumb
.thumb_func
.global scrappy

main:
	push {r2}
	ldr r1, place
	ldrb r1, [r1, #0x0]
	mov r2, #0x58
	mul r1, r2
	ldr r2, place2
	add r1, r1, r2
	ldrb r1, [r1, #0x0]
	pop {r2}
	cmp r1, #0x71
	beq there
	mov r1, #0x80
	lsl r1, r1, #0x16
	and r0, r1
	cmp r0, #0x0
	beq noeffect
there:	ldr r2, return
	bx r2
noeffect:	add r3, #0x3
	ldr r0, return2
	bx r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
return:	.word 0x0801E9D5
return2:	.word 0x0801E9B1
