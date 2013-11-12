.text
.align 2
.thumb
.thumb_func
.global battlescriptsetstatswap

main:
earlier:	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r0, place
	ldrh r0, [r0, #0x0]
	ldr r1, place
	cmp r0, r1
	beq heartswap
	b next
heartswap:	
	b exit
exit:	pop {pc}
.align
scriptlocation:	.word 0x02023D74
battledata:	.word 0x02023C04
place:	.word 0x02023D4A
number:	.word 0x00000187