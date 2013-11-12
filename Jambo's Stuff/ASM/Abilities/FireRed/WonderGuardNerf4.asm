.text
.align 2
.thumb
.thumb_func
.global wonderguardnerf4

main:
	ldr r1, place2
	mov r0, #0x58
	mul r0, r2
	add r1, #0x4C
	add r0, r0, r1
	ldr r2, [r0, #0x0]
	mov r0, #0xFF
	and r2, r0
	ldr r0, return
	bx r0
.align
place2:	.word 0x02023BE4
return:	.word 0x08025D53
