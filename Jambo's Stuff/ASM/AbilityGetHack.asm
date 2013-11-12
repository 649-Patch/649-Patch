.text
.align 2
.thumb
.thumb_func
.global itemboosts

main:
	ldrb r0, [r1, #0x0]
	cmp r0, #0x3E
	bne skip
	push {r1}
	ldr r0, ramlocation
	ldrh r0, [r0, #0x0]
	lsl r1, r0, #0x1
	add r0, r0, r1
	lsl r0, r0, #0x2
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r0, [r0, #0xA]
	pop {r1}
	cmp r0, #0x0
	bne skip
	mov r0, #0x96
	push {r1}
	add r1, r7, #0x0
	bl statincrease
	pop {r1}
	add r7, r0, #0x0
skip:	ldrh r0, [r1, #0x2E]
	push {r1}
	bl getitemeffect1
	pop {r1}
	sub r0, #0x43
	cmp r0, #0xX
	bhi skip2
	push {r0}
	ldrh r0, [r1, #0x2E]
	bl getitemeffect2
	add r1, r0, #0x0
	pop {r0}
	lsl r0, r0, #0x2
	ldr r2, table
	add r0, r0, r2
	mov pc, r0
skip2:	ldr r2, return
	bx r2
statincrease:	
.align
ramlocation:	.word 0x02023D4A
attacktable:	.word 0x08FFFFFF
table:	.word 0x08FFFFFF
