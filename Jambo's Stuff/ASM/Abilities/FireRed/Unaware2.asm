.text
.align 2
.thumb
.thumb_func
.global unaware2

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r7, #0x58
	mul r0, r7
	ldr r2, place2
	add r0, r0, r2
	ldrb r0, [r0, #0x0]
	ldr r2, dead
	ldr r7, [sp, #0x4]
	cmp r0, #0x6D
	bne normal
	mov r0, #0x6
	b continue
normal:	mov r0, #0x1D
	ldrb r0, [r7, r0]
continue:	lsl r0, r0, #0x1
	ldr r1, return
	bx r1
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
return:	.word 0x0803F427
dead:	.word 0x0825DEAD
