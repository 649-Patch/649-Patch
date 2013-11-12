.text
.align 2
.thumb
.thumb_func
.global smallfix2

main:
	ldr r3, othersprite
	cmp r0, r3
	beq exit
	add r3, r0, #0x0
	add r3, #0x2C
	ldrb r2, [r3, #0x0]
	mov r0, #0x40
	and r0, r2
	cmp r0, #0x0
	bne exit
	ldr r0, return
	bx r0
exit:	pop {r0}
	bx r0
.align
othersprite:	.word 0x02020680
return:		.word 0x080081E9
