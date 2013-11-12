.text
.align 2
.thumb
.thumb_func
.global hydration

main:	ldrb r5, [r2, #0x0]
	cmp r5, #0x5D
	beq hydration
	cmp r5, #0x83
	beq healer
	ldr r5, return2
	bx r5
hydration:	ldr r0, weatherbits
	ldrh r0, [r0, #0x0]
	mov r1, #0x7
	and r0, r1
	cmp r0, #0x0
	bne clearstatus
	bl exit
clearstatus:	ldr r0, return
	bx r0
healer:	bl exit
exit:	ldr r4, getout
	bx r4
.align
weatherbits:	.word 0x02023F1C
return:	.word 0x0801A4D3
getout:	.word 0x0801BBAB
return2:	.word 0x08760641