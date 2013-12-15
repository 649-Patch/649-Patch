.text
.align 2
.thumb
.thumb_func
.global doublewildwhotocatchfix

main:
	ldr r1, battlebits
	ldr r1, [r1, #0x0]
	cmp r1, #0x5
	bne normal
	mov r0, #0x58
	ldr r1, battledatastart
	add r0, r0, r1
	ldrh r0, [r0, #0x28]
	cmp r0, #0x0
	bne pokeone
	mov r0, #0x3
	b store
pokeone:	mov r0, #0x1
	b store
normal:	mov r1, #0x1
	eor r0, r1
store:	strb r0, [r6, #0x0]
	ldr r0, battlebits
	ldr r1, return
	bx r1
.align
battlebits:	.word 0x02022B4C
battledatastart:	.word 0x02023BE4
return:	.word 0x0802D455
