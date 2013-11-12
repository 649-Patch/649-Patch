.align 2
.thumb 
/*Registers:
r0- Address of sprite to be loaded. Found by original routine.
r1- RAM address, make sure it gets restored.
r2- Pokemon Number to be loaded.
r3- Make sure it gets restored.
r4- Base Location
r5- Pokemom Number to be loaded.
r6- Something, make sure it gets restored.
r7- Nothing, but still push and pop.
r8- Mode
r9- Nothing, but still push and pop.
r10- PID
r11- Nothing, but still push and pop.
r12- 8 ? May be important.

For Form changes:
Needs to return with the sprite location in r0 and 0 in r1. 

For no changes:
Only r4 can have changed.
*/




.org 0x08XXXXXX
Main:
	add sp, sp, #0x8
	mov r7, sp
	sub sp, sp, #0x8
	ldr r7, [r7] /*Places the base location, which was pushed by the last routine, on r7.*/
	ldr r4, formetable
	mov r5, r2
	push {r3,r5,r6}
	mov r6 #0x0
loop:	lsl r5, r6, #0x2
	add r5, r5, r4
	ldrh r3, [r5, #0x0]
	cmp r3, r2
	beq exitloop
	ldr r5, exit
	cmp r3, r5
	beq exit2
	add r6, #0x1
	b loop
exitloop:	ldrb r4, [r3, #0x2]
	cmp r4, #0x0
	beq exit2
	pop {r3,r5,r6}
	ldr r1, formechecktable
	lsl r4, r4, #0x2
	add r4, r1, r4
	ldr r4, [r4, #0x0]
	mov pc, r4
exit2:  pop {r3,r5,r6}
	mov r4, r0
	mov r5, r1
	lsl r0, r2, #0x3
	ldr r1, front_sprite_table
	add r0, r0, r1
	mov r1, #0x0
	cmp r4, r0
	bne not_equal
	mov r1, #0x1
not_equal:
	str r1, [sp]
	mov r0, r4
	mov r1, r5
	ldr r4, return
	bx r4
.align 2
formetable:	.word form_table_location
formechecktable:	.word form_check_table_location
exit:		.word 0x0000FEFE
number1:	.word 0x00003220
return:		.word 0x0800F124
front_sprite_table:		.word 0x087273B8

.align 2

form_table_location:
.hword:
	.hword:
.hword:
	.hword:
.hword:
	.hword:
.hword:
	.hword:
.hword:
	.hword:
.hword:
	.hword:
.hword:
	.hword:
.hword:
	.hword:
.hword:
	.hword:
.hword:
	.hword:
.hword:
	.hword:
.hword:
	.hword:

.align 2

form_check_table_location:

.word 









/* My old, just for reference
varloader:	push {r1, r2}
		mov r4, r0
		ldr r0, var_id
		bl call_decrypt
		ldrh r0, [r0]
		pop {r1}
		pop {r2}
		bl Virus_Check
		
call_decrypt:	ldr r2, vardecrypt
		bx r2
		
Virus_Check:	cmp r0, #0x0
		beq No_Virus
		cmp r0, #0x1
		beq No_Virus
		cmp r0, #0x2
		beq Virus_Progression
		cmp r0, #0x3
		beq Virus_Progression
		cmp r0, #0x4
		beq Virus_Progression
		cmp r0, #0x5
		beq Virus_Progression
		cmp r0, #0x6
		beq Max_Virus
		cmp r0, #0x7
		bge Maximum_Virus
		
No_Virus:	MOVS R0, R4
		MOVS R5, R1
		LSL R0, R2, #0x3
		LDR R1, front_sprite_table
		ldr r6, return
		bx r6
		
Virus_Progression:	MOVS R5, R1
		lsl R0, R0, #0x2
		lsl r2, r2, #0x4
		add r0, r0, r2
		LDR R1, new_sprite_table
		ldr r6, return
		bx r6
		
Max_Virus:	MOVS R5, R1
		ldr r0, Derpizard_Sprite
		mov r1, #0x0
		ldr r6, return
		bx r6
		
Maximum_Virus:	MOVS R5, R1
		ldr r0, Derpizard_Sprite_Old
		mov r1, #0x0
		ldr r6, return
		bx r6

.align 2
		

var_id: 	.word  0x000040F8
vardecrypt: 	.word  0x0806E455
front_sprite_table:		.word	0x082350AC
new_sprite_table:		.word	0x08C10000
return:		.word		0x0800F115
Derpizard_Sprite:		.word	0x
Derpizard_Sprite_Old:		.word	0x*/
