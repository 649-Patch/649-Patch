.text
.align 2
.thumb
.thumb_func
.global nineteendecimal

main:
	ldr r0, place
	ldrb r1, [r0, #0x0]
	ldrb r0, [r0, #0x1]
	mov r2, #0x58
	mul r0, r2
	mul r1, r2
	ldr r2, place2
	add r0, r0, r2
	add r1, r1, r2
	ldrh r0, [r0, #0x0]
	ldrh r1, [r1, #0x0]
	bl tonational
	push {r0}
	add r0, r1, #0x0
	bl tonational
	pop {r1}
	mov r2, #0x24
	mul r0, r2
	mul r0, r1
	ldr r2, pokedexdata
	add r0, r0, r2
	add r1, r1, r2
	ldrh r0, [r0, #0xE]
	ldrh r1, [r1, #0xE]
	cmp r1, r0
	bge forty
	lsr r2, r0, #0x1
	cmp r1, r2
	bge forty
	push {r0,r1,r3-r7}
	mov r1, #0x3
	bl divide
	add r2, r0, #0x0
	pop {r0,r1,r3-r7}
	cmp r1, r2
	bge sixty
	lsr r2, r0, #0x2
	cmp r1, r2
	bge eighty
	push {r0,r1,r3-r7}
	mov r1, #0x5
	bl divide
	add r2, r0, #0x0
	pop {r0,r1,r3-r7}
	cmp r1, r2
	bge hundred
	mov r0, #0x78
	b exit
forty:	mov r0, #0x28
	b exit
sixty:	mov r0, #0x3C
	b exit
eighty:	mov r0, #0x50
	b exit
hundred:	mov r0, #0x64
exit:	mov r11, r0
	ldr r0, return
	mov pc, r0
tonational:	ldr r2, convertloc
	bx r2
divide:	ldr r2, divcode
	bx r2	
.align
place:	.word 0x02023D6B
place2:	.word 0x02023BE4
pokedexdata:	.word 0x087205B8
return:	.word 0x0876175C
divcode:	.word 0x081E4019
convertloc:	.word 0x08043201
