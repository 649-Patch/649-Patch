.text
.align 2
.thumb
.thumb_func
.global bwexpgainsmallfix2

main:
	ldr r1, ramlocation
	ldrb r0, [r1, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r1, baselocation
	add r0, r0, r1
	ldrh r2, [r0, #0x0]
	lsl r2, r2, #0x1
	ldr r1, baseexptable
	add r2, r2, r1
	ldrh r2, [r2, #0x0]
	add r0, #0x2A
	ldrb r1, [r0, #0x0]
	push {r0-r2,r4-r7}
	mov r5, #0x0
	mov r6, #0x0
	mov r7, #0x0
start:	mov r0, #0x64
	add r1, r7, #0x0
	mul r1, r0
	ldr r0, partystart
	add r4, r1, r0
	add r0, r4, #0x0
	mov r1, #0xB
	bl decrypt
	cmp r0, #0x0
	beq later
	add r0, r4, #0x0
	mov r1, #0x39
	bl decrypt
	cmp r0, #0x0
	beq later
	ldr r0, weirdtable
	lsl r1, r7, #0x2
	add r1, r1, r0
	ldr r0, [r1, #0x0]
	mov r1, r8
	and r0, r1
	cmp r0, #0x0
	beq later2
	add r5, #0x1
later2:	add r0, r4, #0x0
	mov r1, #0xC
	bl decrypt
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0xAF
	bne later3
	ldr r0, memoryblock
	ldr r0, [r0, #0x0]
	ldr r2, number
	add r0, r0, r2
	ldrb r4, [r0, #0x0]
	b later4
later3:	bl itemcheck
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x19
	bne later
	add r6, #0x1
later:	add r7, #0x1
	cmp r7, #0x5
	ble start
	add r3, r5, #0x0
	pop {r0-r2,r4-r7}
	push {r1}
	ldr r1, return
	bx r1
decrypt:	ldr r2, decry
	bx r2
itemcheck:	ldr r1, itemchecker
	bx r1
.align
ramlocation:	.word 0x02023D6D
baselocation:	.word 0x02023BE4
baseexptable:	.word 0x087410A8
partystart:	.word 0x02024284
weirdtable:	.word 0x0825E45C
memoryblock:	.word 0x03005008
number:		.word 0x0000311A
return:		.word 0x0875EA53
decry:		.word 0x0803FBE9
itemchecker:	.word 0x0809A925