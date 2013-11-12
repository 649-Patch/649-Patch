.text
.align 2
.thumb
.thumb_func
.global twelvedecimal

main:
	ldr r0, place
	ldrb r2, [r0, #0x0]
	ldrb r1, [r0, #0x1]
	mov r9, r2
	strb r1, [r0, #0x0]
	bl getstatus
	ldr r0, place
	mov r1, r9
	strb r1, [r0, #0x0]
exit:	ldr r0, return
	mov pc, r0
getstatus:	ldr r0, divcode
	bx r0
.align
place:	.word 0x02023D6B
return:	.word 0x0876175C
divcode:	.word 0x0802C535
