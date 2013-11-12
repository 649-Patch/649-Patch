.text
.align 2
.thumb
.thumb_func
.global battlescriptsecondarycommands

main:
	push {r1-r7,lr}
	ldr r5, scriptlocation
	ldr r1, [r5, #0x0]
	add r1, #0x1
	str r1, [r5, #0x0]
	ldrb r1, [r1, #0x0]
	lsl r1, r1, #0x2
	ldr r2, newtable
	add r0, r1, r2
	ldr r0, [r0, #0x0]
	bl bx_r0
exit:	pop {r1-r7,pc}
bx_r0:	bx r0
.align
scriptlocation:	.word 0x02023D74
newtable:	.word 0x08FFFFFF
