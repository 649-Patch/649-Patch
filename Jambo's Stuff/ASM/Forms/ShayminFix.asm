.text
.align 2
.thumb
.thumb_func
.global shaymincodefix

main:
	pop {r0}
	ldrb r1, [r0, #0x1B]
	mov r0, #0xF0
	and r0, r1
	cmp r0, #0x10
	bne exit
	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x4]
	b goback
exit:	ldr r0, [r6, #0x0]
	ldr r0, [r0, #0x0]
goback:		ldr r1, return
	bx r1	
.align
return:	.word 0x0874B8B1
