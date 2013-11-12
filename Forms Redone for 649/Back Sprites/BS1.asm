.align 2
.thumb 

.org 0xE00000
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
		bge Max_Virus
		
No_Virus:	MOVS R5, R1
		LSL R0, R2, #0x3
		LDR R1, front_sprite_table
		ldr r7, return
		bx r7
		
Virus_Progression:	MOVS R5, R1
		lsl R0, R0, #0x2
		lsl r2, r2, #0x4
		add r0, r0, r2
		lsr r2, r2, #0x4
		LDR R1, new_sprite_table
		ldr r7, return
		bx r7
		
Max_Virus:	MOVS R5, R1
		ldr r0, Derpizard_Sprite
		mov r1, #0x0
		ldr r7, return
		bx r7

.align 2
		

var_id: 	.word  0x000040F8
vardecrypt: 	.word  0x0806E455
front_sprite_table:		.word	0x0823654C
new_sprite_table:		.word	0x08C15000
return:		.word		0x0800ECD1
Derpizard_Sprite:		.word	0xFFFFFFFF