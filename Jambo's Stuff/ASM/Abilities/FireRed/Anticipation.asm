.text
.align 2
.thumb
.thumb_func
.global download

main:
	push {lr}
	mov r2, #0x1
	bl checkandset
	pop {r1}
	mov lr, r1
	cmp r0, #0x1
	bne skipxxxxx
	b exit
skipxxxxx:	push {r0-r7}
	mov r0, #0x0
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
innerloop:	ldr r4, place2
	add r4, #0xC
	mov r5, #0x58
	mul r5, r0
	add r4, r4, r5
	lsl r5, r3, #0x1
	add r4, r4, r5
	push {r0,r3}
	ldrh r1, [r4, #0x0]
	mov r6, #0xC
	mul r6, r1
	ldr r7, attacktable
	add r6, r6, r7
	add r7, r6, #0x0
	ldrb r6, [r6, #0x0]
	ldrb r7, [r7, #0x9]
	cmp r7, #0x0
	bne skip
	cmp r6, #0x26
	beq exitloops
skip:	ldr r6, attackloc
	strh r1, [r6, #0x0]
	ldr r6, place
	ldr r7, place3
	ldrb r6, [r6, #0x0]
	strb r6, [r7, #0x1]
	bl checkeffectiveness
	ldr r6, effectivenessloc
	ldrb r0, [r6, #0x0]
	cmp r0, #0x2
	beq exitloops
	pop {r0,r3}
	cmp r3, #0x3
	beq endinnerloop
	add r3, #0x1
	b innerloop
endinnerloop:	cmp r0, #0x3
	beq endouterloop
	add r0, #0x1
	b outerloop
endouterloop:	pop {r0-r7}
	b exit
exitloops:	pop {r0,r3}
	pop {r0-r7}
	ldr r0, anticipationscript
	ldr r1, return
	bx r1
exit:	ldr r3, return2
	bx r3
checkandset:	ldr r0, there
	bx r0
checkeffectiveness:	ldr r3, there2
	bx r3
.align
place:	.word 0x02023FDB
place2:	.word 0x02023BE4
place3:	.word 0x02023D6B
attackloc:	.word 0x02023D4A
effectivenessloc:	.word 0x02023DCC
return:	.word 0x0801BABB
return2:	.word 0x0801B6D7
there:	.word 0x08765451
there2:	.word 0x0801E849
attacktable:	.word 0x087453D4
anticipationscript:	.word 0x087654C1
