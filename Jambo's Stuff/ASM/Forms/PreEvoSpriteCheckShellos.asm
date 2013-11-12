.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:	ldr r0, [sp, #0x0]
	push {r3}
there:	mov r1, #0x23
	bl decrypt
	pop {r3}
	ldr r1, westofmap
	push {r2,r3}
	mov r2, #0x0
loop:	add r3, r1, r2
	ldrb r3, [r3, #0x0]
	cmp r0, r3
	beq west
	cmp r3, #0xC5
	beq east
	add r2, #0x1
	b loop
west:	mov r1, #0x0
	b getsprite
east:	mov r1, #0x1
getsprite:	pop {r2,r3}
	lsl r1, r1, #0x2
	ldr r0, [r3, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	add r1, r4, #0x0
	bl place
	ldr r0, return
	bx r0
place:	ldr r3, place2
	bx r3
decrypt:	ldr r2, decry
	bx r2
.align
return:		.word 0x0800ECB5
place2:		.word 0x081E3B71
decry:		.word 0x0803FBE9
westofmap:	.word 0x0874B558
