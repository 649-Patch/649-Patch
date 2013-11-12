.text
.align 2
.thumb
.thumb_func
.global battlescriptgetmefirsteffect

main:
	push {r0-r7,lr}
	ldr r0, scriptlocation
	ldr r1, [r0, #0x0]
	add r1, #0x1
	str r1, [r0, #0x0]
	ldr r0, ramloc
	ldr r1, place
	ldrb r1, [r1, #0x1]
	mov r2, #0x58
	mul r2, r1
	add r0, r0, r1
	ldrb r0, [r0, #0x0]
	ldr r1, place2
	add r1, r1, r2
	lsl r0, r0, #0x1
	add r0, r0, r1
	ldrh r0, [r0, #0x0]
	ldr r2, movetable
	lsl r4, r0, #0x1
	add r4, r4, r0
	lsl r4, r4, #0x2
	add r4, r4, r2
	ldrb r4, [r4, #0xA]
	cmp r4, #0x2
	beq alt
	mov r1, #0x0
	ldr r3, terminator
	ldr r4, movescannotuse
loop:	lsl r2, r1, #0x1
	add r2, r2, r4
	ldrh r2, [r2, #0x0]
	cmp r2, r3
	beq exit
	cmp r2, r0
	beq alt
	add r1, #0x1
	b loop
exit:	ldr r4, movelocation
	strh r0, [r4, #0x0]
	mov r1, #0x0
	bl something
	ldr r0, place3
	ldr r1, [r0, #0x0]
	mov r2, #0xC0
	lsl r2, r2, #0x3
	bic r1, r2
	str r1, [r0, #0x0]
	ldrh r0, [r4, #0x0]
	ldr r1, effecttable
	ldr r2, movetable
	ldr r3, scriptlocation
	lsl r4, r0, #0x1
	add r4, r4, r0
	lsl r0, r4, #0x2
	add r0, r0, r2
	ldrb r0, [r0, #0x0]
	lsl r0, r0, #0x2
	add r0, r0, r1
	ldr r0, [r0, #0x0]
skip:	str r0, [r3, #0x0]
	pop {r0-r7,pc}
alt:	ldr r0, butitfailed
	b skip
something:	ldr r2, somethingbx
	bx r2
.align
scriptlocation:	.word 0x02023D74
ramloc:	.word 0x02000090
place:	.word 0x02023D6B
place2:	.word 0x02023BF0
place3:	.word 0x02023DD0
movelocation:	.word 0x02023D4A
somethingbx:	.word 0x0801D05D
movetable:	.word 0x087453D4
effecttable:	.word 0x08768E5C
butitfailed:	.word 0x08761719
movescannotuse:	.word 0x08FFFFFF
terminator:	.word 0x0000FEFE
