.text
.align 2
.thumb
.thumb_func
.global battlescriptsethealingwisheffect
main:
	push {lr}
	ldr r5, scriptlocation
	ldr r0, [r5, #0x0]
	add r0, #0x1
	str r0, [r5, #0x0]
	ldr r0, place
	ldrb r2, [r0, #0x1]
	lsl r0, r2, #0x1
	ldr r1, place3
	add r0, r0, r1
	ldrh r0, [r0, #0x0]
	mov r1, #0x1
	and r1, r2
	mov r4, #0x6
	mov r3, #0x64
	mul r0, r3
	mul r4, r3
	mul r1, r3
	mul r1, r4
	ldr r3, data
	sub r1, r3, r1
	add r0, r0, r1
	add r4, r0, #0x0
	push {r2,r4}
	mov r1, #0x15
	bl decrypt
	pop {r2,r4}
	add r5, r0, #0x0
	ldr r6, movedata
	mov r3, #0x0
	mov r1, #0x58
	mul r2, r1
	ldr r1, place2
	add r0, r2, r1
	add r1, r0, #0x0
	add r1, #0x18
loop:	mov r7, #0x3
	lsl r2, r3, #0x1
	lsl r7, r2
	and r7, r5
	lsr r7, r2
	add r2, r2, r0
	ldrh r2, [r2, #0x0]
	push {r0,r1}
	add r0, r7, #0x5
	mov r1, #0x5
	lsl r7, r2, #0x1
	add r2, r2, r7
	lsl r2, r2, #0x2
	add r2, r2, r6
	ldrb r2, [r2, #0x4]
	cmp r0, r1
	beq skip
	mul r0, r2
	push {r2-r7}
	bl divide
	pop {r2-r7}
	add r2, r0, #0x0
skip:	pop {r0,r1}
	add r7, r3, r1
	strb r2, [r7, #0x0]
	push {r2}
	mov r2, sp
	push {r0,r1}
	add r0, r4, #0x0
	mov r1, #0x11
	add r1, r1, r3
	push {r3-r7}
	bl encrypt
	pop {r3-r7}
	pop {r0,r1}
	pop {r2}
	add r3, #0x1
	cmp r3, #0x3
	bls loop
exit:	pop {pc}
decrypt:	ldr r2, decry
	bx r2
encrypt:	ldr r3, encry
	bx r3
divide:	ldr r3, div
	bx r3
.align
scriptlocation:	.word 0x02023D74
place:	.word 0x02023D6B
place2:	.word 0x02023BF0
place3:	.word 0x02023BCE
data:	.word 0x02024284
movedata:	.word 0x087453D4
decry:	.word 0x0803FBE9
encry:	.word 0x0804037D
div:	.word 0x081E4019
