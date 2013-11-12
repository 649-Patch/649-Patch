.text
.align 2
.thumb
.thumb_func
.global afterbattleevs

main:
	ldrb r0, [r5, #0x0]
	strh r0, [r1, #0x0]
	cmp r0, #0x2
	bne updatestats
	b exit
updatestats:	push {r0-r7}
	mov r5, #0x0
loop:	mov r1, #0x64
	mul r1, r5
	ldr r0, baselocation
	add r4, r0, r1
	add r0, r4, #0x0
	mov r1, #0xB
	bl decrypt
	cmp r0, #0x0
	beq skip
	add r0, r4, #0x0
	mov r1, #0x39
	bl decrypt
	cmp r0, #0x0
	beq skip
	add r0, r4, #0x0
	bl recalc
skip:	cmp r5, #0x5
	beq exitloop
	add r5, #0x1
	b loop
exitloop:	pop {r0-r7}
exit:	ldr r3, ramloc
	ldr r0, number
	add r2, r3, r0
	ldr r1, return
	bx r1
decrypt:	ldr r2, decry
	bx r2
recalc:	ldr r4, recalculator
	bx r4
.align
baselocation:	.word 0x02024284
ramloc:	.word 0x030030F0
number:	.word 0x00000439
return:	.word 0x08015B95
decry:	.word 0x0803FBE9
recalculator:	.word 0x0803E47D
