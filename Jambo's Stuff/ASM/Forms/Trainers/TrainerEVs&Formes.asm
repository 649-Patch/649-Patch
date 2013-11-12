.text
.align 2
.thumb
.thumb_func
.global trainerevs

main:
	add r0, r7, #0x0
	mov r1, #0x2E
	mov r2, r9
	bl encrypt
	push {r0-r7}
	ldr r4, battlebits
	ldr r4, [r4, #0x0]
	mov r1, #0x6
	and r1, r4
	cmp r1, #0x0
	beq calculate
	b exit
calculate:	ldr r4, table
	ldr r1, ramoffset
	ldrh r1, [r1, #0x0]
	lsl r0, r1, #0x2
	add r0, r0, r1
	lsl r0, r0, #0x3
	add r0, r4, r0
	ldrb r1, [r0, #0x0]
	mov r2, #0x1
	and r2, r1
	cmp r2, #0x0
	bne alt
	mov r2, #0x3
	b continue
alt:	mov r2, #0x4
continue:	ldr r4, [r0, #0x24]
	ldr r0, partyoffset
	sub r0, r7, r0
	mov r1, #0x64
	push {r1-r3}
	bl divide
	pop {r1-r3}
	lsl r0, r2
	add r4, r4, r0
	ldrb r1, [r4, #0x3]
	ldrb r0, [r7, #0x1B]
	mov r2, #0xF
	and r0, r2
	orr r0, r1
	strb r0, [r7, #0x1B]
	ldrb r1, [r4, #0x1]
	mov r0, #0x0
	mov r2, #0x0
loop:	mov r3, #0x1
	lsl r3, r0
	and r3, r1
	cmp r3, #0x0
	beq skip
	add r2, #0x1
skip:	cmp r0, #0x5
	beq exitloop
	add r0, #0x1
	b loop
exitloop:	cmp r2, #0x0
	bne doevs
	b exit
doevs:	mov r3, #0xC0
	and r3, r1
	lsr r3, r3, #0x6
	cmp r3, #0x0
	bne skip3
	b exit
skip3:	mov r3, #0xC0
	and r3, r1
	lsr r3, r3, #0x6
	mov r5, #0x4
	sub r3, r5, r3
	mov r5, #0xFF
	lsl r0, r5, #0x1
	cmp r3, #0x1
	beq skip4
	push {r1-r3}
	add r1, r3, #0x0
	bl divide
	pop {r1-r3}
skip4:	cmp r2, #0x1
	beq skip5
	push {r1-r3}
	add r1, r2, #0x0
	bl divide
	add r5, r0, #0x0
	pop {r1-r3}
skip5:	cmp r5, #0xFF
	bls skip6
	mov r5, #0xFF
skip6:	mov r0, #0x0
loop2:	mov r3, #0x1
	lsl r3, r0
	and r3, r1
	cmp r3, #0x0
	beq skip2
	push {r0,r1}
	mov r6, #0x1A
	add r6, r6, r0
	push {r5}
	add r0, r7, #0x0
	add r1, r6, #0x0
	mov r2, sp
	bl encrypt
	pop {r5}
	pop {r0,r1}
skip2:	cmp r0, #0x5
	beq exit
	add r0, #0x1
	b loop2
exit:	pop {r0-r7}
	ldr r0, return
	bx r0
divide:	ldr r2, divcode
	bx r2
encrypt:	ldr r3, encrypter
	bx r3
.align
battlebits:	.word 0x02022B4C
table:	.word 0x0823EAC8
ramoffset:	.word 0x020386AE
partyoffset:	.word 0x0202402C
return:	.word 0x0803DD7F
divcode:	.word 0x081E4019
encrypter:	.word 0x0804037D
