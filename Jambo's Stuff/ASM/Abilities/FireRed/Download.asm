.text
.align 2
.thumb
.thumb_func
.global download

main:
	push {lr}
	mov r2, #0x0
	bl checkandset
	pop {r1}
	mov lr, r1
	cmp r0, #0x1
	bne skipx
	b exit
skipx:	ldr r0, battlebits
	ldr r0, [r0, #0x0]
	mov r1, #0x1
	and r0, r1
	cmp r0, #0x0
	beq single
	b double
single:	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x1
	and r0, r1
	cmp r0, #0x0
	beq enemy
	mov r0, #0x0
	b cont
enemy:	mov r0, #0x58
cont:	ldr r1, place2
	add r0, r0, r1
	ldrh r1, [r0, #0xA]
	ldrh r0, [r0, #0x4]
there2:	cmp r0, r1
	blt raiseattack
	ldr r0, [sp, #0x1C]
	sub r0, #0x4
	ldrb r1, [r0, #0x0]
	cmp r1, #0xC
	bne next
	b exit
next:	add r1, #0x1
	strb r1, [r0, #0x0]
	ldr r0, downloadspatkscript
	ldr r1, return
	bx r1
raiseattack:	ldr r0, [sp, #0x1C]
	sub r0, #0x7
	ldrb r1, [r0, #0x0]
	cmp r1, #0xC
	bne next2
	b exit
next2:	add r1, #0x1
	strb r1, [r0, #0x0]
	ldr r0, downloadatkscript
	ldr r1, return
	bx r1
exit:	ldr r3, return2
	bx r3
double:		ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x1
	and r0, r1
	cmp r0, #0x0
	beq enemy2
	mov r0, #0x0
	mov r1, #0x2
	b cont2
enemy2:	mov r0, #0x1
	mov r1, #0x3
cont2:	mov r2, #0x58
	mul r0, r2
	mul r1, r2
	ldr r2, place2
	add r0, r0, r2
	add r1, r1, r2
	push {r4-r7}
	ldrh r4, [r0, #0x4]
	ldrh r5, [r1, #0x4]
	ldrh r6, [r0, #0xA]
	ldrh r7, [r1, #0xA]
	add r0, r4, r5
	add r1, r6, r7
	pop {r4-r7}
	b there2
checkandset:	ldr r0, there
	bx r0
.align
place:	.word 0x02023BC4
place2:	.word 0x02023BE4
battlebits:	.word 0x02022B4C
return:	.word 0x0801BABB
return2:	.word 0x0801B6D7
there:	.word 0x087650DD
downloadatkscript:	.word 0x08FFFFFF
downloadspatkscript:	.word 0x08FFFFFF