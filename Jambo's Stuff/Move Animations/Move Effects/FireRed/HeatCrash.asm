.text
.align 2
.thumb
.thumb_func
.global heatcrash

main:
	ldr r0, place
	ldrb r2, [r0, #0x1]
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	mul r1, r2
	ldr r2, place2
	add r0, r0, r2
	add r1, r1, r2
	ldrh r0, [r0, #0x0]
	ldrh r1, [r1, #0x0]
	mov r2, #0x24
	mul r0, r2
	mul r1, r2
	ldr r2, pokedexdata
	add r0, r0, r2
	add r1, r1, r2
	ldrh r2, [r0, #0x0]
	ldrh r0, [r1, #0x0]
	add r1, r2, #0x0
	lsl r0, r0, #0x8
	bl divide	
	cmp r0, #0x7F
	bls nextcheck
	mov r0, #0x28
	b exit
nextcheck:	cmp r0, #0x55
	bls nextcheck2
	mov r0, #0x3C
	b exit
nextcheck2:	cmp r0, #0x3F
	bls nextcheck3
	mov r0, #0x50
	b exit
nextcheck3:	cmp r0, #0x33
	bls last
	mov r0, #0x64
	b exit
last:	mov r0, #0x78
exit:	mov r11, r0
	ldr r0, return
	mov pc, r0
divide:	ldr r2, divcode
	bx r2
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
return:	.word 0x0876175C
divcode:	.word 0x081E4019
pokedexdata:	.word 0x087205C6
