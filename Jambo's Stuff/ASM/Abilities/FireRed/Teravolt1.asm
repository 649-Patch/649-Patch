.text
.align 2
.thumb
.thumb_func
.global teravolt1

main:
	push {lr}
	mov r2, #0x3
	bl checkandset
	pop {r1}
	mov lr, r1
	cmp r0, #0x1
	bne skipxxxx
	b exit
skipxxxx:	ldr r0, teravoltscript
	ldr r1, return
	bx r1
exit:	ldr r3, return2
	bx r3
checkandset:	ldr r0, there
	bx r0
.align
return:	.word 0x0801BABB
return2:	.word 0x0801B6D7
there:	.word 0x087650DD
teravoltscript:	.word 0x08FFFFFF