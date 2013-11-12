.text
.align 2
.thumb
.thumb_func
.global thirtyonedecimal

main:
	ldr r4, place
	ldrb r1, [r4, #0x1]
	mov r4, #0x1
	and r1, r4
	ldr r4, ramlocation
	add r4, r4, r1
	ldrb r4, [r4, #0x0]
	cmp r4, #0x0
	bne nocrits
	ldrb r4, [r0, #0x0]
	cmp r4, #0x4
	beq nocrits
	cmp r4, #0x4B
	beq nocrits
	ldr r1, returnone
	bx r1
nocrits:	ldr r1, returntwo
	bx r1
.align
place:	.word 0x02023D6B
ramlocation:	.word 0x0203C016
returnone:	.word 0x0801E507
returntwo:	.word 0x0801E581
