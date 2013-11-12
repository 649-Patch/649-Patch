.text
.align 2
.thumb
.thumb_func
.global battlescriptsetsecondaryeffectbytype

main:
earlier:	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r0, moveramlocation
	ldr r1, attackdata
	ldrh r0, [r0, #0x0]
	lsl r2, r0, #0x1
	add r0, r0, r2
	lsl r0, r0, #0x2
	add r0, r0, r1
	ldrb r0, [r0, #0x2]
	ldr r1, effectbyteloc
	ldr r2, newtable
	add r0, r0, r2
	ldrb r0, [r0, #0x0]
	strb r0, [r1, #0x0]
	pop {pc}
.align
scriptlocation:	.word 0x02023D74
moveramlocation:	.word 0x02023D4A
attackdata:	.word 0x087453D4
effectbyteloc:	.word 0x02023E85
newtable:	.word 0x08FFFFFF
