.text
.align 2
.thumb
.thumb_func
.global headsmash

main:
	ldr r4, recoildamagelocation
	ldr r0, attackdamagelocation
	ldr r0, [r0, #0x0]
	asr r0, r0, #0x1
	cmp r0, #0x0
	bne skip
	mov r0, #0x1
skip:	str r0, [r4, #0x0]
	ldr r4, address
	bx r4
.align
recoildamagelocation:	.word 0x02023D50
attackdamagelocation:	.word 0x02023D54
address:	.word 0x08020F8F
