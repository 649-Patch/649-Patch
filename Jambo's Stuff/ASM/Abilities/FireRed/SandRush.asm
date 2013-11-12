.text
.align 2
.thumb
.thumb_func
.global SandRushCode

main:
	mov r2, r9
	mov r0, #0x58
	mul r2, r0
	ldr r1, place2
	add r1, #0x20
	add r0, r1, r2
	ldrb r3, [r0, #0x0]
	cmp r3, #0x92
	beq sandrush
	cmp r3, #0x5F
	beq quickfeet
	cmp r3, #0x21
	beq swiftswim
	cmp r3, #0x22
	beq chlorophyll
	b noboost
sandrush:	mov r0, #0x18
	b universalcheck1
swiftswim:	mov r0, #0x7
	b universalcheck1
chlorophyll:	mov r0, #0x60
universalcheck1:	ldr r1, weatherbits
	ldrh r1, [r1, #0x0]
	and r0, r1
	cmp r0, #0x0
	beq noboost
	mov r3, #0x2
	b nextcheck3
noboost:	mov r3, #0x1
nextcheck3:	mov r0, #0x58
	mov r1, r10
	mul r1, r0
	ldr r0, place2
	add r0, #0x20
	add r0, r0, r1
	ldrb r2, [r0, #0x0]
	cmp r2, #0x92
	beq sandrush2
	cmp r2, #0x5F
	beq quickfeet2
	cmp r2, #0x21
	beq swiftswim2
	cmp r2, #0x22
	beq chlorophyll2
	b noboost2
quickfeet2:	add r0, #0x4C
	ldr r0, [r0, #0x0]
	cmp r0, #0x0
	bne noboost2
sandrush2:	mov r0, #0x18
	b universalcheck2
swiftswim2:	mov r0, #0x7
	b universalcheck2
chlorophyll2:	mov r0, #0x60
universalcheck2:	ldr r1, weatherbits
	ldrh r1, [r1, #0x0]
	and r0, r1
	cmp r0, #0x0
	beq noboost2
	mov r7, #0x2
	b exit
noboost2:	mov r7, #0x1
exit:	ldr r1, return
	bx r1
.align
place2:	.word 0x02023BE4
return:	.word 0x08014DA5
weatherbits:	.word 0x02023F1C
