.text
.align 2
.thumb
.thumb_func
.global iconformehack2

main:
	mov r1, r11
	mov r1, #0x23
	bl decrypt
	ldr r1, westofmap
	push {r3}
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
getsprite:	pop {r3}
	mov r2, #0x4
	lsl r2, r2, #0x8
	mul r1, r2
	ldr r2, normaltable
	lsl r0, r0, #0x2
	add r0, r0, r2
	ldr r0, [r0, #0x0]
	add r0, r0, r1
	pop {r1}
	bx r1
decrypt:	ldr r2, decry
	bx r2
.align
normaltable:	.word 0x0873D744
decry:		.word 0x0803FBE9
westofmap:	.word 0x0874B558
