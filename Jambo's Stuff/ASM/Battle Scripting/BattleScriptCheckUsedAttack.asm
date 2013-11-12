.text
.align 2
.thumb
.thumb_func
.global battlescriptcheckusedattacks

main:
	push {r1-r7,lr}
	ldr r0, scriptlocation
	ldr r1, [r0, #0x0]
	ldr r2, battlebits
	ldr r2, [r2, #0x0]
	mov r3, #0x1
	and r2, r3
	cmp r2, #0x0
	bne skip
	b exit
skip:	ldr r2, battler
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
	mov r3, #0x58
	mul r3, r4
	ldr r2, battledata
	add r2, r2, r3
	ldrh r3, [r2, #0x28]
	cmp r3, #0x0
	bne skip2
	b exit
skip2:	ldr r3, ramlocation
	add r3, r3, r4
	ldrb r3, [r3, #0x0]
	lsl r3, r3, #0x1
	add r2, r2, r3
	add r2, #0xC
	ldrh r2, [r2, #0x0]
	push {r0}
	add r0, r1, #0x2
	bl loadhalfword
	add r3, r0, #0x0
	add r0, r1, #0x4
	bl loadword
	add r4, r0, #0x0
	pop {r0}
	ldrb r5, [r1, #0x1]
	cmp r5, #0x0
	bne nextcheck
	cmp r2, r3
	bne exit
	b switch
nextcheck:	cmp r5, #0x1
	bne nextcheck2
	cmp r2, r3
	beq exit
	b switch
nextcheck2:	cmp r5, #0x2
	bne nextcheck3
	cmp r2, r3
	bge exit
	b switch
nextcheck3:	cmp r2, r3
	bls exit
switch:	add r1, r4, #0x0
	b exit2
exit:	add r1, #0x8
exit2:	str r1, [r0, #0x0]
	pop {r1-r7,pc}
loadword:	push {r4,r5}
	ldrb r4, [r0, #0x0]
	ldrb r5, [r0, #0x1]
	lsl r5, r5, #0x8
	orr r4, r5
	ldrb r5, [r0, #0x2]
	lsl r5, r5, #0x10
	orr r4, r5
	ldrb r5, [r0, #0x3]
	lsl r5, r5, #0x18
	orr r4, r5
	add r0, r4, #0x0
	pop {r4,r5}
	bx lr
loadhalfword:	push {r3,r4}
	ldrb r3, [r0, #0x0]
	ldrb r4, [r0, #0x1]
	lsl r4, r4, #0x8
	orr r3, r4
	add r0, r3, #0x0
	pop {r3,r4}
	bx lr
.align
scriptlocation:	.word 0x02023D74
battlebits:	.word 0x02022B4C
battler:	.word 0x02023D6B
ramlocation:	.word 0x02000090
battledata:	.word 0x02023BE4
