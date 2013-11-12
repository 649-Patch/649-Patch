.text
.align 2
.thumb
.thumb_func
.global fifteendecimal

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	add r0, #0x2E
	ldrh r1, [r0, #0x0]
	cmp r1, #0x85
	blt exit
	cmp r1, #0xAF
	bgt checknewberries
there:	mov r1, #0x0
	strh r1, [r0, #0x0]
	b store
checknewberries:	mov r2, #0xD2
	lsl r2, r2, #0x1
	cmp r1, r2
	ble exit
	add r2, #0x15
	cmp r1, r2
	bgt exit
	b there
exit:	mov r1, #0x1
store:	ldr r0, lastresult
	strh r1, [r0, #0x0]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
lastresult:	.word 0x020370D0
