.text
.align 2
.thumb
.thumb_func
.global shadowforcenohit

main:
	mov r1, #0x40
	and r1, r0
	cmp r1, #0x0
	beq nextcheck
no:	ldr r0, ramloc
	ldr r1, return
	bx r1
nextcheck:	mov r1, #0x4
	lsl r1, r1, #0x1C
	and r0, r1
	cmp r0, #0x0
	beq exit
	b no
exit:	ldr r0, return2
	bx r0
.align
ramloc:	.word 0x02023DCC
return:	.word 0x0801DCD1
return2:	.word 0x0801DCF5
