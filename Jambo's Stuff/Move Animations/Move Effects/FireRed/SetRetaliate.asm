.text
.align 2
.thumb
.thumb_func
.global retaliate

main:
	ldr r5, location
	mov r1, #0x1
	and r1, r3
	add r5, r1, r5
	mov r1, #0x2
	strb r1, [r5, #0x0]
	ldr r5, location2
	lsl r1, r2, #0x1C
	ldr r0, return
	bx r0
.align
location:	.word 0x0203D840
location2:	.word 0x02023DD0
return:	.word 0x08021397
