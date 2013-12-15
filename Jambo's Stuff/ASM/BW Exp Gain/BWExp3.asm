.text
.align 2
.thumb
.thumb_func
.global bwexpgain

main:
	ldrh r2, [r0, #0x0]
	add r1, #0x2A
	ldrb r0, [r1, #0x0]
	mul r0, r2
	push {r1}
	mov r1, #0x5
	mul r1, r5
	bl divide

LevelModifier:
	pop {r7}
	push {r0}
	ldr r5, ramlocation
	ldr r1, [r5, #0x0]
	ldrb r1, [r1, #0x10]
	mov r2, #0x64
	mul r1, r2
	ldr r2, startinglocation
	add r1, r1, r2
	add r0, r1, #0x0
	mov r1, #0x38
	bl decrypt
	ldrb r1, [r7, #0x0]
	add r1, r1, r0
	add r1, #0xA
	push {r0,r1}
	lsl r0, r1, #0x18
	swi #0x8
	lsr r2, r0, #0xC
	pop {r0,r1}
	mul r1, r1
	mul r1, r2
	lsl r0, r0, #0x1
	add r0, #0xA
	push {r0,r1}
	lsl r0, r0, #0x18
	swi #0x8
	lsr r2, r0, #0xC
	pop {r0,r1}
	mul r0, r0
	mul r0, r2
	cmp r1, r0
	blt altcode
	add r2, r0, #0x0
	add r0, r1, #0x0
	add r1, r2, #0x0
	lsl r0, r0, #0xC
	bl divide
	add r2, r0, #0x0
	add r3, r2, #0x0
	pop {r1}
	lsl r1, r1, #0xC
	mul r0, r1
	lsr r0, r0, #0x18
	lsr r2, r2, #0x4
	lsr r1, r1, #0x4
	mul r2, r1
	lsr r2, r2, #0x18
	lsl r2, r2, #0x8
	orr r0, r2
	b continue2
altcode:	lsl r0, r0, #0xC
	bl divide
	add r1, r0, #0x0
	pop {r0}
	lsl r0, r0, #0xC
	bl divide
continue2:	add r0, #0x1

FinalTouches:
	ldr r2, storagelocation
	mov r1, r9
	strh r0, [r2, #0x0]
	strh r0, [r1, #0x0]
	ldr r1, return
	bx r1
decrypt:	ldr r2, decry
	bx r2
divide:	ldr r3, dividecode
	bx r3
.align
startinglocation:	.word 0x02024284
ramlocation:	.word 0x02023FE8
decry:		.word 0x0803FBE9
dividecode:	.word 0x081E4019
storagelocation:	.word 0x02023D50
return: .word 0x08021C05
