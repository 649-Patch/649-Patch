.text
.align 2
.thumb
.thumb_func
.global iconformehack2

main:
	mov r1, r11
	ldrb r1, [r1, #0x1B]
	mov r2, #0xF0
	and r1, r2
	cmp r1, #0x0
	beq jump
	cmp r1, #0x10
	bne next
there:	mov r1, #0x1
	b jump
next:	cmp r1, #0x20
	bne next2
	mov r1, #0x2
	b jump
next2:	cmp r1, #0x40
	bne next3
	mov r1, #0x3
	b jump
next3:	cmp r1, #0x80
	bne next4
	mov r1, #0x4
	b jump
next4:	cmp r1, #0x30
	bne there
	mov r1, #0x5
jump:	mov r2, #0x4
	lsl r2, r2, #0x8
	mul r1, r2
	ldr r2, normaltable
	lsl r0, r0, #0x2
	add r0, r0, r2
	ldr r0, [r0, #0x0]
	add r0, r0, r1
end:	pop {r1}
	bx r1
.align
normaltable:	.word 0x0873D744
