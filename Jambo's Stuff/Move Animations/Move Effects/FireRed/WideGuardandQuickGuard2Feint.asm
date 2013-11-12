.text
.align 2
.thumb
.thumb_func
.global wideguardandquickguard1

main:
	ldr r2, attackloc
	ldrh r0, [r2, #0x0]
	lsl r1, r0, #0x1
	add r1, r1, r0
	lsl r0, r1, #0x2
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	cmp r0, #0x60
	beq feint
	ldr r0, attacker
	ldrb r0, [r0, #0x1]
	lsl r0, r0, #0x2
	ldr r1, ramloc
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	mov r1, #0x10
	lsl r1, r1, #0x10
	and r1, r0
	cmp r1, #0x0
	bne quickguard
	mov r1, #0x40
	lsl r1, r1, #0x10
	and r1, r0
	cmp r1, #0x0
	bne wideguard
	ldr r0, ramloc2
	ldrb r0, [r0, #0x0]
	cmp r0, #0x0
	beq return2
return:	ldr r1, returnone
	bx r1
feint:	ldrh r0, [r0, #0x0]
	mov r1, #0xB6
	lsl r1, r1, #0x1
	cmp r0, r1
	beq lift
	ldr r0, attacker
	ldrb r0, [r0, #0x0]
	ldr r1, ramloc3
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	mov r1, #0x10
	lsl r1, r1, #0x8
	and r0, r1
	cmp r0, #0x0
	bne lift
return2:	ldr r2, returntwo
	bx r2
lift:	ldr r0, attacker
	ldrb r0, [r0, #0x1]
	lsl r0, r0, #0x2
	ldr r1, ramloc
	add r0, r0, r1
	ldr r2, [r0, #0x0]
	mov r1, #0x50
	lsl r1, r1, #0x10
	bic r2, r1
	str r2, [r0, #0x0]
	ldr r0, ramloc2
	mov r1, #0x0
	strb r1, [r0, #0x0]
	b return2
quickguard:	ldrh r0, [r2, #0x0]
	lsl r1, r0, #0x1
	add r1, r1, r0
	lsl r0, r1, #0x2
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r0, [r0, #0x7]
	cmp r0, #0x0
	bls return2
	ldr r0, scriptlocation
	ldr r1, quickguardscript
	str r1, [r0, #0x0]
there:	add sp, #0x4
	pop {r6,r7}
	mov r8, r8
	mov r9, r7
	pop {r4-r7}
	pop {r0}
	bx r0
wideguard:	ldrh r0, [r2, #0x0]
	lsl r1, r0, #0x1
	add r1, r1, r0
	lsl r0, r1, #0x2
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r0, [r0, #0x6]
	cmp r0, #0x8
	beq skip
	cmp r0, #0x32
	beq skip
	b return2
skip:	ldr r0, scriptlocation
	ldr r1, wideguardscript
	str r1, [r0, #0x0]
	b there
.align
attacker:	.word 0x02023D6B
ramloc:	.word 0x02023DFC
attackloc:	.word 0x02023D4A
attacktable:	.word 0x087453D4
ramloc2:	.word 0x02023E8A
returnone:	.word 0x0801D773
ramloc3:	.word 0x02023C34
returntwo:	.word 0x0801D785
scriptlocation:	.word 0x02023D74
wideguardscript:	.word 0x08FEFEFE
quickguardscript:	.word 0x08FDFDFD
