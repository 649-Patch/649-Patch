.align 2
.thumb

branch:	push {r6}
		ldr r6, routine
		bx r6
		pop {r6}

.align 2

routine:	.word 0x08C00051