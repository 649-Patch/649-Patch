.text
.align 2
.thumb
.thumb_func
.global dryskinIII

main:
	ldrb r0, [r3, #0x0]
	cmp r0, #0x57
	beq waterabsorb
	cmp r0, #0xB
	beq waterabsorb
	cmp r0, #0xB
	bgt alt
	cmp r0, #0xA
	beq voltabsorb
	b exit
alt:	cmp r0, #0x12
	beq flashfire
	b exit
voltabsorb:	cmp r5, #0xD
	bne exit
	ldr r0, returnone
	bx r0
waterabsorb:	cmp r5, #0xB
	bne exit
	ldr r0, returntwo
	bx r0
flashfire:	cmp r5, #0xA
	bne exit
	ldr r1, returnthree
	bx r1
exit:	ldr r1, returnfour
	bx r1
.align
returnone:	.word 0x0801A6BF
returntwo:	.word 0x0801A717
returnthree:	.word 0x0801A76D
returnfour:	.word 0x0801A833
