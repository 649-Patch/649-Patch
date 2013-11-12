.text
.align 2
.thumb
.thumb_func
.global iconformehack1

main:
	push {r0-r7}
	mov r0, r11
	cmp r0, #0x0
	beq normalcode
	mov r1, #0xB
	bl decrypt
	cmp r0, #0xC9
	beq differenttable
	pop {r0-r7}
	push {r1,r3}
	mov r1, #0x0
loop:	ldr r2, table
	lsl r3, r1, #0x2
	add r3, r3, r2
	ldrh r3, [r3, #0x0]
	cmp r0, r3
	beq outofloop
	ldr r2, exitcondition
	cmp r2, r3
	beq exit
	add r1, #0x1
	b loop
outofloop:	ldr r2, table
	lsl r3, r1, #0x2
	add r3, r3, r2
	ldrb r2, [r3, #0x2]
	lsl r2, r2, #0x2
	ldr r1, codetable
	add r2, r2, r1
	pop {r1,r3}
	ldr r2, [r2, #0x0]
	mov pc, r2
exit:	pop {r1,r3}
	ldr r2, normaltable
exit2:	lsl r1, r0, #0x2
	add r1, r1, r2
	ldr r2, return
	bx r2
normalcode:	pop {r0-r7}
	ldr r2, normaltable
	b exit2
differenttable:	pop {r0-r7}
	ldr r2, originaltable
	b exit2
decrypt:	ldr r2, decry
	bx r2
.align
table:		.word 0x08756B14
originaltable:	.word 0x083D37A0
normaltable:	.word 0x0873D744
exitcondition:	.word 0x00001C0E
return:		.word 0x08097037
decry:		.word 0x0803FBE9
codetable:	.word 0x08FFFFFF
