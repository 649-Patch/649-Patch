.text
.align 2
.thumb
.thumb_func
.global cantthrowballdoublewild

main:
	push {r0-r7}
	ldr r0, battlebits
	ldr r0, [r0, #0x0]
	mov r1, #0x5
	and r0, r1
	cmp r0, #0x5
	bne normal
	mov r2, #0x58
	mov r0, #0x1
	mov r1, #0x3
	mul r1, r2
	mul r0, r2
	ldr r2, battledatastart
	add r0, r0, r2
	add r1, r1, r2
	mov r2, #0x0
	ldrh r0, [r0, #0x28]
	ldrh r1, [r1, #0x28]
	cmp r0, #0x0
	beq skip
	add r2, #0x1
skip:	cmp r1, #0x0
	beq skip2
	add r2, #0x1
skip2:	cmp r2, #0x1
	bhi cantthrow
normal:	pop {r0-r7}
	ldr r1, pokeballthrow
	bx r1
cantthrow:	pop {r0-r7}
	push {lr}
	mov r1, #0x0
	mov r2, #0x4
	ldr r3, text
	bl settextwriter
	pop {r0}
	bx r0
storetext:	ldr r2, textstorer
	bx r2
settextwriter:	push {r4}
	ldr r4, textwriter
	mov r10, r4
	pop {r4}
	bx r10
.align
text:		.word 0x08760BB4
ramaddress:	.word 0x02021D18
battlebits:	.word 0x02022B4C
textstorer:	.word 0x08008FCD
battledatastart:	.word 0x02023BE4
pokeballthrow:	.word 0x080A1E1D
ramlocation:	.word 0x03005090
textwriter:	.word 0x080A10C5
