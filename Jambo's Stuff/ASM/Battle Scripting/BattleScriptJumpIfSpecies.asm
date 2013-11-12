.text
.align 2
.thumb
.thumb_func
.global battlescriptjumpifspecies

main:
earlier:	push {r1-r7,lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r4, r0, #0x0
	add r1, r0, #0x0
	add r1, #0x9
	str r1, [r5, #0x0]
	ldrb r0, [r0, #0x1]
	bl bankdecrypt
	mov r1, #0x58
	mul r0, r1
	ldr r1, battledata
	add r0, r0, r1
	ldrh r1, [r0, #0x0]
	b earlier
bankdecrypt:	ldr r2, place
	bx r2
.align
scriptlocation:	.word 0x02023D74
battledata:	.word 0x02023BE4
place:	.word 0x08016E25
