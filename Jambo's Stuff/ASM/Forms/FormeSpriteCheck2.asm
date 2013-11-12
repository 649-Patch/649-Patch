.text
.align 2
.thumb
.thumb_func
.global shellosgastrodonformeone

main:
	mov r0, r11
	cmp r0, #0xFF
	bne skip
	mov r0, #0x0
	b getsprite
skip:	cmp r0, #0x1
	bne skip2
	mov r0, #0x0
	b getsprite
skip2:	mov r1, #0x23
	push {r2,r3}
	bl decrypt
	ldr r1, westofmap
	mov r2, #0x0
loop:	add r3, r1, r2
	ldrb r3, [r3, #0x0]
	cmp r0, r3
	beq west
	cmp r3, #0xC5
	beq east
	add r2, #0x1
	b loop
west:	mov r0, #0x0
	b getsprite2
east:	mov r0, #0x1
getsprite2:	pop {r2,r3}
getsprite:	lsl r0, r0, #0x2
	ldr r1, [r6, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	ldr r1, return
	bx r1
decrypt:	ldr r2, decry
	bx r2
.align
westofmap:	.word 0x0874B558
return:	.word 0x0874B4A5
decry:	.word 0x0803FBE9
