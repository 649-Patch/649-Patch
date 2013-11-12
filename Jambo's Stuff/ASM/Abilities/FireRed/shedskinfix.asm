.text
.align 2
.thumb
.thumb_func
.global shedskinfix

main:	lsr r4, r0, #0x10
	cmp r4, #0x0
	beq clearstatus
	bl exit
clearstatus:	ldr r4, [r5, #0x0]
	mov r0, #0xFF
	bic r4, r0
	ldr r0, return
	bx r0
exit:	ldr r4, getout
	bx r4
.align
return:	.word 0x0801A4D3
getout:	.word 0x0801BBAB
