.text
.align 2
.thumb
.thumb_func
.global bwexpgainsmallfix

main:
	push {r0-r7}
	ldr r0, whichexpsystemflag
	bl flagdecrypt
	cmp r0, #0x1
	beq oldway
	pop {r0-r7}
return:	ldr r0, returnone
	bx r0
oldway:	pop {r0-r7}
	ldr r4, storagelocation
	ldr r1, [r4, #0x0]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl divide
	str r0, [r4, #0x0]
	b return
flagdecrypt:	ldr r2, flagdecry
	bx r2
divide:	ldr r3, dividecode
	bx r3
.align
whichexpsystemflag:	.word 0x000008D0
returnone:	.word 0x08021DEB
flagdecry:	.word 0x0806E6D1
dividecode:	.word 0x081E4019
storagelocation:	.word 0x02023D50
