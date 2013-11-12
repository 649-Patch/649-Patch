.text
.align 2
.thumb
.thumb_func
.global aurasphere

main:
	ldr r5, attackloc
	ldrh r5, [r5, #0x0]
	lsl r1, r5, #0x1
	add r1, r1, r5
	lsl r5, r1, #0x2
	ldr r1, attacktable
	add r5, r5, r1
	ldrb r5, [r5, #0x0]
	cmp r5, #0xA3
	bne normal
	mov r5, #0x6
	ldr r1, returnone
	bx r1
normal:	ldr r5, returntwo
	bx r5
.align
attackloc:	.word 0x02023D4A
attacktable:	.word 0x087453D4
returnone:	.word 0x0801DFC1
returntwo:	.word 0x08767A55
