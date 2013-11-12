.text
.align 2
.thumb
.thumb_func
.global download

main:
	push {lr}
	mov r2, #0x2
	bl checkandset
	pop {r1}
	mov lr, r1
	cmp r0, #0x1
	bne skipxxxxx
exit2:	ldr r3, return2
	bx r3
skipxxxxx:	push {r0-r7}
	ldr r0, battlebits
	ldr r0, [r0, #0x0]
	mov r1, #0x2
	and r0, r1
	cmp r0, #0x0
	bne alt
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x1
	and r0, r1
	cmp r0, #0x0
	beq alt
	pop {r0-r7}
	b exit2
alt:	mov r0, #0x0
outerloop:	ldr r2, place
	ldrb r2, [r2, #0x0]
	cmp r0, r2
	beq endinnerloop
	mov r1, #0x1
	and r2, r1
	and r1, r0
	cmp r2, r1
	beq endinnerloop
	mov r3, #0x0
	mov r7, #0x0
	mov r10, r7
innerloop:	ldr r4, place2
	add r4, #0xC
	mov r5, #0x58
	mul r5, r0
	add r4, r4, r5
	lsl r5, r3, #0x1
	add r4, r4, r5
	ldrh r1, [r4, #0x0]
	mov r6, #0xC
	mul r6, r1
	ldr r5, attacktable
	add r6, r6, r5
	ldrb r6, [r6, #0x1]
	cmp r6, r10
	blt next
	cmp r6, r10
	bne replace
	push {r0,r2-r7}
	bl random
	mov r1, #0x1
	and r1, r0
	pop {r0,r2-r7}
	cmp r1, #0x0
	bne next
replace:	mov r10, r6
	ldrh r4, [r4, #0x0]
	ldr r5, attackloc
	strh r4, [r5, #0x0]
	ldr r5, place3
	strb r0, [r5, #0x0]
	ldr r4, place
	ldrb r4, [r4, #0x0]
	strb r4, [r5, #0x3]
next:	cmp r3, #0x3
	beq endinnerloop
	add r3, #0x1
	b innerloop
endinnerloop:	ldr r2, numofbattlers
	ldrb r2, [r2, #0x0]
	sub r2, #0x1
	cmp r0, r2
	beq exit
	add r0, #0x1
	b outerloop
exit:	pop {r0-r7}
	ldr r0, forewarnscript
	ldr r1, return
	bx r1
checkandset:	ldr r0, there
	bx r0
random:	ldr r2, there2
	bx r2
.align
place:	.word 0x02023FDB
place2:	.word 0x02023BE4
place3:	.word 0x02023D6B
attackloc:	.word 0x02023D4A
numofbattlers:	.word 0x02023BCC
return:	.word 0x0801BABB
return2:	.word 0x0801B6D7
there:	.word 0x08765451
there2:	.word 0x08044EC9
attacktable:	.word 0x087453D4
forewarnscript:	.word 0x0876568A
battlebits:	.word 0x02022B4C
