.text
.align 2
.thumb
.thumb_func
.global iconformehack1

main:
	mov r1, r11
	ldrb r1, [r1, #0x1B]
	mov r0, #0xF0
	and r1, r0
	cmp r1, #0x0
	bne female
male:	pop {r0-r3}
	ldrb r0, [r0, #0x0]
	b continue
female:	pop {r0-r3}
	ldrb r0, [r5, #0x3]
continue:	mov r5, #0x0
	mov r11, r5
	ldr r5, number
	ldr r1, return
	bx r1
.align
number:		.word 0x0000DAC0
return:		.word 0x08096E63
