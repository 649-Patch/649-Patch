.text
.align 2
.thumb
.thumb_func
.global wideguardandquickguard1

main:
	ldr r0, attacker
	ldrb r2, [r0, #0x0]
	ldr r1, ramloc
	lsl r0, r2, #0x1
	add r0, r0, r1
	ldrh r0, [r0, #0x0]
	cmp r0, #0xB6
	beq random
	cmp r0, #0xC5
	beq random
	cmp r0, #0xCB
	beq random
	mov r3, #0xEA
	lsl r3, r3, #0x1
	add r3, #0x1
	cmp r0, r3
	beq random
	mov r3, #0xFA
	lsl r3, r3, #0x1
	add r3, #0x1
	cmp r0, r3
	beq random
normal:	ldr r2, attacker
	ldrb r3, [r2, #0x0]
	mov r4, #0x1
	and r4, r3
	mov r5, #0x2
	and r5, r3
	cmp r5, #0x0
	beq alt
	mov r5, #0x0
	b continue
alt:	mov r5, #0x2
continue:	orr r4, r5
	strb r4, [r2, #0x2]
	ldr r0, attacker
	ldrb r2, [r0, #0x0]
	ldr r1, ramloc
	lsl r0, r2, #0x1
	add r0, r0, r1
	ldr r1, attackloc
	ldrh r1, [r1, #0x0]
	strh r1, [r0, #0x0]
	bx lr
random:	push {lr}
	bl getrandom
	pop {r1}
	mov lr, r1
	mov r1, #0x1
	and r0, r1
	cmp r0, #0x0
	beq normal
	ldr r0, scriptlocation
	ldr r1, newscript
	str r1, [r0, #0x0]
	ldr r0, attacker
	ldrb r2, [r0, #0x0]
	ldr r1, ramloc
	lsl r0, r2, #0x1
	add r0, r0, r1
	mov r1, #0x0
	strh r1, [r0, #0x0]
	bx lr
getrandom:	ldr r2, randomiser
	bx r2
.align
attacker:	.word 0x02023D6B
ramloc:	.word 0x02023DB0
randomiser:	.word 0x08044EC9
scriptlocation:	.word 0x02023D74
newscript:	.word 0x08761713
attackloc:	.word 0x02023D4A
