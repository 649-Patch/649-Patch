.text
.align 2
.thumb
.thumb_func
.global miracleeye1

main:
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r1, ramlocation
	add r0, r0, r1
	mov r1, #0x6
	strb r1, [r0, #0x0]
	bx lr
.align
place:	.word 0x02023D6B
ramlocation:	.word 0x02023C03
