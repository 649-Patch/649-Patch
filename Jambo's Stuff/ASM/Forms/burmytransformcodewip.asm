.text
.align 2
.thumb
.thumb_func
.global newabilitycheckspreturn

main:
	mov r0, #0xCE
	lsl r0, r0, #0x1
	ldr r1, [sp, #0x1C]
	add r3, r1, #0x0
	sub r3, #0x20
	ldrh r3, [r3, #0x0]
	cmp r0, r3
	beq burmystuff
back:	ldr r1, [sp, #0x1C]
	ldrb r0, [r1, #0x0]
	cmp r0, #0x24
	bne exit
back2:	ldr r0, returnone
	bx r0
exit:	cmp r0, #0xA4
	bgt exit2
	cmp r0, #0x4B
	blt exit2
	cmp r0, #0x4D
	beq exit2
	cmp r0, #0x4C
	bne normal
	mov r0, #0x0
	b getcode
normal:	sub r0, #0x4D
getcode:	lsl r0, r0, #0x2
	ldr r1, tableofroutines
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	mov pc, r0
exit2:	ldr r3, returntwo
	bx r3
burmystuff:	push {r1}
	ldr r1, ramloc
	ldr r1, [r1, #0x0]
	ldrb r3, [r1, #0x4]
	lsl r3, r3, #0x2
	ldr r0, mapbanktable
	add r3, r3, r0
	ldr r0, [r3, #0x0]
	ldrb r3, [r1, #0x5]
	lsl r3, r3, #0x2
	add r0, r0, r3
	ldr r1, [r0, #0x0]
	ldrb r1, [r1, #0x17]
	cmp r1, #0x8
	beq trash
	cmp r1, #0x2
	bne next
trash:	mov r1, #0x20
	b write
next:	cmp r1, #0x7
	bne next2
	b sand2
next2:	bl gettile
	add r3, r0, #0x0
	ldr r0, sandtable
	push {r2}
	mov r1, #0x0
loop:	lsl r2, r1, #0x1
	add r2, r0, r2
	ldrh r2, [r2, #0x0]
	cmp r2, r1
	beq sand
	ldr r3, exit3
	cmp r2, r3
	beq grass
	add r1, #0x1
	b loop
sand:	pop {r2}
sand2:	mov r1, #0x10
	b write
grass:	pop {r2}
	mov r1, #0x0
write:	bl getpokeloc
	ldrb r0, [r0, #0x1B]
	mov r3, #0xF
	and r0, r3
	orr r1, r0
	mov r0, r10
	strb r1, [r0, #0x1B]
back3:	pop {r1}
	b back
gettile:	push {r1-r4,lr}
	ldr r0, there4
	ldrh r1, [r0, #0x12]
	ldrh r0, [r0, #0x10]
	mov r2, #0x0
	add r0, #0x7
	add r1, #0x7
	bl tilegetter
	pop {r1-r4,pc}
tilegetter:	ldr r3, there5
	bx r3
getpokeloc:	ldr r0, gettadd
	bx r0
.align
returnone:	.word 0x0801B53D
returntwo:	.word 0x0801B6D7
tableofroutines:	.word 0x08FFFFFF
place:		.word 0x02023BC4
getadd:		.word 0x0874A459
ramloc:		.word 0x03005008
mapbanktable:	.word 0x083526A8
there4:		.word 0x02036E38
there5:		.word 0x08058E49
sandtable:	.word 0x08758ECE
exit3:		.word 0x0000FEFE
friendorfoe:	.word 0x08FFFFFF
