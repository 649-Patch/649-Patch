/*
This was inserted into the ROM at 0x75F04C.
Branch @080184EC

Tested @0876CB14
*/

.text
.align 2
.thumb
.thumb_func
.global poisonheal

main:
	add r0, r1, #0x0
	add r0, #0x20
	ldrb r0, [r0, #0x0]
	cmp r0, #0x5A
	bne normal
	mov r0, #0x0
	b store
/*
normal2:	lsr r0, r5, #0x4
	neg r0, r0
	b store
*/
normal:	ldrh r0, [r1, #0x2C]
	lsr r0, r0, #0x4
store:	ldr r5, storage
	str r0, [r5, #0x0]
	cmp r0, #0x0
	bne alt
	/*In order for this to not give the poison damage
	message, a bl about 20 lines down from the return
	address needs to be skipped.*/
	ldrb r0, [r6]
	mov r1, r8
	mul r1, r0
	mov r0, r1
	add r2, r0, r3
	ldr r1, [r2]
	mov r4, #0xF0
	lsl r4,r4,#0x4
	mov r0,r1
	and r0, r4
	cmp r0, r4
	beq beq_jump_address
	mov r7, #0x80
	lsl r7,r7,#0x1
	add r0,r1,r7
	str r0,[r2]
beq_jump_address: ldrb r0,[r6]
	mov r1, r8
	mul r1, r0
	mov r0, r1
	add r0, r0, r3
	ldr r0, [r0]
	and r0, r4
	lsr r0, r0, #0x8
	ldr r1, [r5]
	mul r0, r1
	str r0, [r5]
	ldr r0, .offset_0x081D9053
	/*The rom's code branches here to bl to the routine that 
	loads poison damage. This return will return just after that
	line.*/
	ldr r0, return
	bx r0
alt:	ldr r0, returntwo
	bx r0
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
/*
old used by Jambo:
return:	.word 0x080184F5
*/
return: .word 0x08018C09
returntwo:	.word 0x080184F9
storage:	.word 0x02023D50
.offset_0x081D9053: .word 0x081D9053
