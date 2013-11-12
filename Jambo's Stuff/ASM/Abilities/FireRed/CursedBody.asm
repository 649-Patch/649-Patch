.text
.align 2
.thumb
.thumb_func
.global cursedbody

main:
	ldr r1, attacktable
	lsl r0, r4, #0x1
	add r0, r0, r4
	lsl r0, r0, #0x2
	add r0, r0, r1
	ldrb r0, [r0, #0x8]
	mov r1, #0x1
	and r0, r1
	cmp r0, #0x1
	bne exit
	bl getrandom
	mov r1, #0x3
	bl divmod
	cmp r0, #0x0
	bne exit
	ldr r0, place
	ldrb r1, [r0, #0x0]
	mov r2, #0x1C
	mul r1, r2
	ldr r2, place2
	add r1, r1, r2
	ldrh r2, [r1, #0x4]
	cmp r2, #0x0
	bne exit
	ldr r2, currentmove
	ldrh r2, [r2, #0x0]
	strh r2, [r1, #0x4]
	push {r0,r1}
	bl getrandom
	mov r1, #0x7
	bl divmod
	cmp r0, #0x3
	bge skip
	mov r0, #0x4
skip:	add r2, r0, #0x0
	pop {r0,r1}
	strb r2, [r1, #0xB]
	bl place4
	ldr r0, scriptloc
	ldr r1, script
	str r1, [r0, #0x0]
	ldr r2, return
	bx r2
exit:	bl leave
leave:	ldr r4, gothere
	bx r4
place4:	ldr r0, gothere2
	bx r0
getrandom:	ldr r2, gothere3
	bx r2
divmod:	ldr r3, gothere4
	bx r3
.align
place:	.word 0x02023D6B
place2:	.word 0x02023E0C
currentmove:	.word 0x02023D4A
scriptloc:	.word 0x02023D74
script:	.word 0x08FFFFFF
attacktable:	.word 0x087453D4
gothere:	.word 0x0801BBAB
gothere2:	.word 0x08017545
gothere3:	.word 0x08044EC9
gothere4:	.word 0x081E4685
return:	.word 0x0801ABD9
