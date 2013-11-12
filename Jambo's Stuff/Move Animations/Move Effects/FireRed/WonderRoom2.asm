.text
.align 2
.thumb
.thumb_func
.global wonderroom

main:
	ldrb r3, [r2, #0x0]
	push {r6}
	cmp r3, #0xEE
	bne notfoulplay
	ldr r6, [sp, #0x8]
	ldrh r7, [r6, #0x2]
notfoulplay:	cmp r3, #0x6E
	bne notpsyshock
	ldr r2, wonderroomlocation
	ldrb r2, [r2, #0x0]
	cmp r2, #0x0
	bne alt
	mov r0, #0x4
	mov r3, #0x4
	b end
alt:	mov r0, #0xA
	mov r3, #0xA
end:	ldr r2, newreturn
	bx r2
notpsyshock:	ldr r2, return
	bx r2
.align
return:	.word 0x0876AC17
newreturn:	.word 0x0876AC29
wonderroomlocation:	.word 0x0203D803
