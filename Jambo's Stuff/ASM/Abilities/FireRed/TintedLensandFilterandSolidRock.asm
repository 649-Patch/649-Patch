.text
.align 2
.thumb
.thumb_func
.global simpleandcontrary

main:
	cmp r4, #0x0
	bne checks
	b nextcheck2
checks:	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r5, #0x58
	mul r0, r5
	ldr r5, place2
	add r0, r0, r5
	ldrb r0, [r0, #0x0]
	cmp r0, #0x6E
	beq tintedlens
	b nextcheck
tintedlens:	cmp r4, #0xA
	blt raise
	b nextcheck
raise:	lsl r4, r4, #0x1
nextcheck:	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r5, #0x58
	mul r0, r5
	ldr r5, place2
	add r0, r0, r5
	ldrb r0, [r0, #0x0]
	cmp r0, #0x6F
	beq filter
	cmp r0, #0x74
	beq filter
	b nextcheck2
filter:	cmp r4, #0xA
	blt nextcheck2
	lsr r5, r4, #0x2
	sub r4, r4, r5
nextcheck2:	ldr r5, storage
	ldr r0, [r5, #0x0]
	mul r0, r4
	ldr r1, return
	bx r1
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
return:	.word 0x0801E77D
storage:	.word 0x02023D50
