.text
.align 2
.thumb
.thumb_func
.global leafguard

main:
	ldr r2, place
	ldrb r2, [r2, #0x0]
	mov r5, #0x58
	mul r2, r5
	ldr r5, place2
	add r2, r2, r5
	ldrb r2, [r2, #0x0]
	cmp r2, #0x97
	beq exit
	mov r2, #0x20
	and r2, r0
	cmp r2, #0x0
	beq exit
	ldr r5, scriptold
store:	str r5, [r6, #0x0]
	b exit2
exit:	add r0, r3, #0x0
	add r0, #0x8
	str r0, [r6, #0x0]
exit2:	pop {r4-r6}
	pop {r0}
	bx r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
scriptold:	.word 0x081D8B39
