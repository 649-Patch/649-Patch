.text
.align 2
.thumb
.thumb_func
.global battlescriptactivatepledgeeffect

main:
	push {lr}
	push {r1-r7}
	ldr r0, scriptlocation
	ldr r1, [r0, #0x0]
	ldrb r2, [r1, #0x1]
	cmp r2, #0x0
	beq waterfire
	cmp r2, #0x1
	beq watergrass
	cmp r2, #0x2
	beq firegrass
	b exit
waterfire:	ldr r2, ramlocation
	bl seteffect
	b exit
watergrass:	ldr r2, ramlocation
	add r2, #0x1
	bl seteffect
firegrass:	ldr r2, ramlocation
	add r2, #0x2
	bl seteffect
exit:	add r1, #0x2
	str r1, [r0, #0x0]
	pop {r1-r7}
	pop {r0}
	bx r0
seteffect:	ldr r3, battler
	ldrb r3, [r3, #0x0]
	mov r4, #0x1
	and r3, r4
	cmp r3, #0x0
	bne alt
	mov r3, #0x4
	mov r5, #0xF0
	b cont
alt:	mov r3, #0x40
	mov r5, #0xF
	ldrb r4, [r2, #0x0]
	and r4, r5
	orr r4, r3
	strb r4, [r2, #0x0]
cont:	bx lr
.align
scriptlocation:	.word 0x02023D74
battler:	.word 0x02023D6B
ramlocation:	.word 0x0203C032
