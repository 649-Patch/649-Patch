.text
.align 2
.thumb
.thumb_func
.global wonderskin

main:
	push {r4-r7,lr}
	mov r7, r9
	mov r6, r8
	push {r6,r7}
	sub sp, #0x4
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	cmp r0, #0x93
	bne normal
	ldr r1, attackloc
	ldrh r1, [r1, #0x0]
	mov r0, #0xC
	mul r0, r1
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r0, [r0, #0xA]
	cmp r0, #0x2
	bne normal
	bl random
	mov r1, #0x1
	and r0, r1
	cmp r0, #0x1
	beq normal
	ldr r0, scriptloc
	ldr r1, script
	str r1, [r0, #0x0]
normal:	push {r1}
	bl normalize
	pop {r1}
	ldr r0, return
	bx r0
random:	ldr r2, gorandom
	bx r2
normalize:	ldr r0, normalizeroutine
	bx r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
return:	.word 0x0801D76B
attackloc:	.word 0x02023D4A
attacktable:	.word 0x087453D4
scriptloc:	.word 0x02023D74
normalizeroutine:	.word 0x08762715
script:	.word 0x08FFFFFF
gorandom:	.word 0x08044EC9
