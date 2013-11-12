.align 2
.thumb 

.org 0xE00000
varloader:	push {r4, r5, r14}
		push {r1, r2}
		mov r11, r6
		mov r3, r0
		mov r4, r1
		mov r5, r2
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
		
No_Virus:	LSL R3, R5, #0x3
		LDR R1, front_sprite_table
		add r3, r3, r1
		mov r0, #0xCE
		lsl r0, r0, #0x1
		ldr r6, return
		bx r6
		
Virus_Progression:	sub r0, #0x2
		lsl R0, R0, #0x2
		lsl r2, r2, #0x4
		add r0, r0, r2
		lsr r2, r2, #0x4
		LDR R1, new_sprite_table
		add r3, r0, r1
		mov r0, #0xCE
		lsl r0, r0, #0x1
		ldr r6, return
		bx r6
		
Max_Virus:
		ldr r3, Derpizard_Sprite
		mov r1, #0x0
		mov r0, #0xCE
		lsl r0, r0, #0x1
		ldr r6, return
		bx r6
		
Maximum_Virus:
		ldr r0, Derpizard_Sprite_Old
		mov r1, #0x0
		mov r0, #0xCE
		lsl r0, r0, #0x1
		ldr r6, return
		bx r6

.align 2
		

var_id: 	.word  0x000040F8
vardecrypt: 	.word  0x0806E455
front_sprite_table:		.word	0x082350AC
new_sprite_table:		.word	0x08C10000
return:		.word		0x0800EC97
Derpizard_Sprite:		.word	0xFFFFFFFF
Derpizard_Sprite_Old:		.word	0xFFFFFFFF
