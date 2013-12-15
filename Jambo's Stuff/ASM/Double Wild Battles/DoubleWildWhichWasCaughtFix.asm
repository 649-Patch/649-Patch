.text
.align 2
.thumb
.thumb_func
.global doublewildwhichwascaughtfix

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	bl thatplace
	ldr r1, ramloc
	lsl r0, r0, #0x18
	lsr r0, r0, #0x17
	add r0, r0, r1
	ldr r1, return
	bx r1
thatplace:	ldr r3, there
	bx r3
.align
place:	.word 0x02023D6C
there:	.word 0x080751E9
ramloc:	.word 0x02023BCE
return:	.word 0x080D7A33
