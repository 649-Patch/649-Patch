.text
.align 2
.thumb
.thumb_func
.global smallfix3

main:
	ldr r2, othersprite
	cmp r4, r2
	beq exit
	add r2, r4, #0x0
	add r2, #0x2B
	ldrb r0, [r2, #0x0]
	add r0, #0x1
	strb r0, [r2, #0x0]
	ldr r0, return
	bx r0
exit:	pop {r4}
	pop {r0}
	bx r0
.align
othersprite:	.word 0x02020680
return:		.word 0x080079BF
