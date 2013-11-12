.align 2
.thumb

branch:	ldr r4, routine
		bx r4

.align 2

routine:	.word 0x08C000E1