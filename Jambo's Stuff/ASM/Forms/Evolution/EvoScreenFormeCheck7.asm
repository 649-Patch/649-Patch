.text
.align 2
.thumb
.thumb_func
.global formeitemcheck

main:
	ldr r0, burmy
	cmp r0, r2
	bne exit
	ldr r0, [sp, #0x48]
	push {r2-r7}
	mov r1, #0x2D
	bl decrypt
	pop {r2-r7}
	cmp r0, #0x1
	beq exit
	ldr r0, [sp, #0x48]
	ldrb r0, [r0, #0x1B]
	mov r1, #0xF0
	and r0, r1
	cmp r0, #0x10
	bne next
	mov r0, #0x1
	b end
next:	cmp r0, #0x20
	bne next2
	mov r0, #0x2
	b end
next2:	mov r0, #0x0
end:	lsl r1, r0, #0x2
	ldr r0, [r3, #0x0]
	add r0, r0, r1
	ldr r0, [r0, #0x0]
next3:	add r1, r4, #0x0
	bl place
	ldr r0, return
	bx r0
place:	ldr r3, place2
	bx r3
exit:	ldr r0, [r3, #0x0]
	b next3
decrypt:	decrypt:	ldr r3, decrypter
	bx r3
.align
return:		.word 0x0800ECB5
place2:		.word 0x081E3B71
burmy:	.word 0x0000019C
decrypter:	.word 0x0803FBE9
