.text
.align 2
.thumb
.thumb_func
.global captivate

main:
	ldr r0, place
	ldrb r1, [r0, #0x1]
	ldrb r0, [r0, #0x0]
	mov r2, #0x58
	mul r0, r2
	mul r1, r2
	ldr r2, place2
	add r0, r0, r2
	add r1, r1, r2
	ldrh r2, [r0, #0x0]
	ldrh r3, [r1, #0x0]
	ldr r0, [r0, #0x48]
	ldr r1, [r1, #0x48]
	mov r4, #0xFF
	and r0, r4
	and r1, r4
	mov r4, #0x1C
	mul r2, r4
	mul r3, r4
	ldr r4, pokemondata
	add r2, r2, r4
	add r3, r3, r4
	ldrb r2, [r2, #0x10]
	ldrb r3, [r3, #0x10]
	cmp r2, #0xFF
	bne normalone
	mov r4, #0x1
	b exit
normalone:	cmp r0, r2
	blt femaleone
	mov r0, #0x0
	b nextcheck
femaleone:	mov r0, #0x1
nextcheck:	cmp r3, #0xFF
	bne normaltwo
	mov r4, #0x1
	b exit
normaltwo:	cmp r1, r3
	blt femaletwo
	mov r1, #0x0
	b maincheck
femaletwo:	mov r1, #0x1
maincheck:	cmp r0, r1
	bne success
	mov r4, #0x1
	b exit
success:	mov r4, #0x0
exit:	ldr r0, lastresult
	strh r4, [r0, #0x0]
	bx lr
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
pokemondata:	.word 0x0871BEA0
lastresult:	.word 0x020370D0
