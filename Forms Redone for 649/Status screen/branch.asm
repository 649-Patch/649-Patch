.align 2
.thumb

branch:	ldr r0, routine
		bx r0
		mov r7, r4

.align 2

routine:	.word 0x08C00201