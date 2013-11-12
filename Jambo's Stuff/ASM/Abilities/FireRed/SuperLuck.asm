.text
.align 2
.thumb
.thumb_func
.global dryskinIII

main:
	ldr r2, attackramlocation
	ldrh r2, [r2, #0x0]
	lsl r1, r2, #0x1
	add r2, r2, r1
	lsl r2, r2, #0x2
	ldr r1, attacktable
	add r1, r1, r2
	ldrb r2, [r1, #0x9]
	cmp r2, #0x1
	beq secondarycheck
	b changestat
secondarycheck:	ldrb r2, [r1, #0x0]
	cmp r2, #0x1E
	bne changestat
	b there
changestat:	ldr r2, romlocation
	lsl r1, r5, #0x1
	add r1, r1, r2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	ldrh r1, [r1, #0x0]
	push {r0,r2}
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r2, #0x58
	mul r0, r2
	ldr r2, place2
	add r0, r0, r2
	ldrb r0, [r0, #0x0]
	cmp r0, #0x69
	bne normal
	lsl r1, r1, #0x1
normal:	pop {r0,r2}
	bl divide
	lsl r0, r0, #0x10
	cmp r0, #0x0
	bne exit
there:	ldr r0, returnone
	bx r0
exit:	ldr r1, returntwo
	bx r1
divide:	ldr r2, divcode
	bx r2
.align
attackramlocation:	.word 0x02023D4A
attacktable:	.word 0x087453D4
returnone:	.word 0x0801E545
returntwo:	.word 0x0801E581
romlocation:	.word 0x08250530
place:	.word 0x02023D6B
place2:	.word 0x02023C04
divcode:	.word 0x081E4019
