.text
.align 2
.thumb
.thumb_func
.global incinerate

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r4, #0x58
	mul r0, r4
	ldr r4, place2
	add r4, r0, r4
	ldrh r0, [r4, #0x0]
	cmp r0, #0x85
	blt fail
	cmp r0, #0xAF
	bgt checknewberries
destroy:	mov r0, #0x0
	strh r0, [r4, #0x0]
fail:	ldr r4, address
	bx r4
checknewberries:	mov r3, #0xD2
	lsl r3, r3, #0x1
	cmp r0, r3
	ble fail
	add r3, #0x15
	cmp r0, r3
	bgt fail
	b destroy
.align
place:	.word 0x02023D6E
place2:	.word 0x02023C12
address:	.word 0x0802110B
