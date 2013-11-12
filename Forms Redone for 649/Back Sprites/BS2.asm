.align 2
.thumb 

.org 0xE00000
varloader:	mov r5, lr
		push {r1, r2}
		mov r4, r0
		ldr r0, var_id
		bl call_decrypt
		ldrh r0, [r0]
		pop {r1}
		pop {r2}
		mov r11, r7
		ldr r7, big_number
		cmp r5, r7
		beq Virus_Check_in_PC
		ldr r7, big_number2
		cmp r5, r7
		beq Virus_Check_in_PC
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
		
No_Virus:	MOVS R5, R1
		LSL R0, R2, #0x3
		LDR R1, front_sprite_table
		ldr r7, return
		bx r7
		
Virus_Progression:	MOVS R5, R1
		sub r0, #0x2
		lsl R0, R0, #0x2
		lsl r2, r2, #0x4
		add r0, r0, r2
		lsr r2, r2, #0x4
		LDR R1, new_sprite_table
		ldr r7, return
		bx r7
		
Max_Virus:	MOVS R5, R1
		ldr r0, Derpizard_Sprite_New
		mov r1, #0x0
		ldr r7, return
		bx r7
		
Maximum_Virus:	MOVS R5, R1
		ldr r0, Derpizard_Sprite
		mov r1, #0x0
		ldr r7, return
		bx r7
		
Virus_Check_in_PC:	cmp r0, #0x0
		beq No_Virus_in_PC
		cmp r0, #0x1
		beq No_Virus_in_PC
		cmp r0, #0x2
		beq Virus_Progression_in_PC
		cmp r0, #0x3
		beq Virus_Progression_in_PC
		cmp r0, #0x4
		beq Virus_Progression_in_PC
		cmp r0, #0x5
		beq Virus_Progression_in_PC
		cmp r0, #0x6
		beq Max_Virus_in_PC
		cmp r0, #0x7
		bge Maximum_Virus_in_PC
		
No_Virus_in_PC:	MOVS R5, R1
		LSL R0, R2, #0x3
		LDR R1, front_sprite_table_in_PC
		ldr r7, return
		bx r7
		
Virus_Progression_in_PC:	MOVS R5, R1
		sub r0, #0x2
		lsl R0, R0, #0x2
		lsl r2, r2, #0x4
		add r0, r0, r2
		lsr r2, r2, #0x4
		LDR R1, new_sprite_table_in_PC
		ldr r7, return
		bx r7
		
Max_Virus_in_PC:	MOVS R5, R1
		ldr r0, Derpizard_Sprite_in_PC
		mov r1, #0x0
		ldr r7, return
		bx r7
		
Maximum_Virus_in_PC:	MOVS R5, R1
		ldr r0, Derpizard_Sprite_in_PC_New
		mov r1, #0x0
		ldr r7, return
		bx r7


.align 2
		

var_id: 	.word  0x000040F8
vardecrypt: 	.word  0x0806E455
front_sprite_table:		.word	0x0823654C
front_sprite_table_in_PC:		.word	0x082350AC
new_sprite_table:		.word	0x08C15000
new_sprite_table_in_PC:		.word	0x08C10000
return:		.word		0x0800ECD1
Derpizard_Sprite:		.word	0x0FFFFFFF
Derpizard_Sprite_in_PC:		.word	0x0FFFFFFF
Derpizard_Sprite_New:		.word	0x0FFFFFFF
Derpizard_Sprite_in_PC_New:		.word	0x0FFFFFFF
big_number:		.word	0x0808F421
big_number2:		.word	0x0811D8C3
