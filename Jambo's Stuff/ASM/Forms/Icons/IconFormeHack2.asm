.text
.align 2
.thumb
.thumb_func
.global iconformehack2

main:
	push {r0-r7}
	mov r0, r11
	mov r1, #0x2D
	bl decrypt
	cmp r0, #0x1
	beq eggsprite
	pop {r0-r7}
	mov r1, r11
	ldrb r1, [r1, #0x1B]
	mov r2, #0xF0
	and r1, r2
	lsr r1, r1, #0x4
	mov r2, #0x4
	lsl r2, r2, #0x8
	mul r1, r2
	ldr r2, normaltable
	lsl r0, r0, #0x2
	add r0, r0, r2
	ldr r0, [r0, #0x0]
	add r0, r0, r1
end:	pop {r1}
	bx r1
eggsprite:	mov r0, r11
	mov r1, #0xB
	bl decrypt
	ldr r1, phione
	bne normalegg
	pop {r0-r7}
	ldr r0, phioneegg
	b end
normalegg:	pop {r0-r7}
	ldr r0, normalegg2
	b end
decrypt:	ldr r2, decry
	bx r2
.align
normaltable:	.word 0x0873D744
decry:		.word 0x0803FBE9
phioneegg:	.word 0x08FEFEFE
normalegg2:	.word 0x08FEFEFE
phione:		.word 0x000001E9
