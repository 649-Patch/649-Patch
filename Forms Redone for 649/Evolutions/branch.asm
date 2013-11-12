.align 2
.thumb

branch:	ldr r0, routine
		bx r0
		
.align 2

routine:	.word 0x08C002A1