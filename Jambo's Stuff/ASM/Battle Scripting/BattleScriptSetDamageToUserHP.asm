.text
.align 2
.thumb
.thumb_func
.global battlescriptsetdamagetouserhp

main:
	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r2
	ldr r1, place2
	add r0, r0, r1
	ldrh r0, [r0, #0x28]
	ldr r1, ramlocation
	str r0, [r1, #0x0]
exit:	pop {pc}
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
ramlocation:	.word 0x02023D50