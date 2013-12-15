.text
.align 2
.thumb
.thumb_func
.global doublewildpokedexupdatefix2

main:
	ldr r0, place
	ldrb r0, [r0, #0x0]
	ldr r1, ramloc
	lsl r0, r0, #0x18
	lsr r0, r0, #0x17
	add r0, r0, r1
	ldrh r0, [r0, #0x0]
	mov r1, #0x64
	mul r0, r1
	ldr r1, partystart
	add r0, r0, r1
	ldr r1, return
	bx r1
.align
place:	.word 0x02023D6C
ramloc:	.word 0x02023BCE
partystart:	.word 0x0202402C
return:	.word 0x0802D963
