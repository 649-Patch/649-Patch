.align 2
.thumb 

.org 0xE00000
varloader:	push {r0-r3}
		ldr r0, var_id
		bl call_decrypt
		ldrh r0, [r0]
		bl Virus_Check
		
call_decrypt:	ldr r2, vardecrypt
		bx r2
		
Virus_Check:	cmp r0, #0x0
		beq No_Virus
		cmp r0, #0x1
		bge Virus_Progression
		
No_Virus:	pop {r0-r3}
		LSR R0, R1, #0x10
		LDR R2, FFFF
		AND R1, R2
		EOR R0, R1
		LSR R1, R3, #0x10
		EOR R0, R1
		AND R3, R2
		EOR R0, R3
		ldr r6, return_X
		bx r6
		
Virus_Progression:	pop {r0-r3}
		LSR R0, R1, #0x10
		LDR R2, FFFF
		AND R1, R2
		EOR R0, R1
		LSR R1, R3, #0x10
		EOR R0, R1
		AND R3, R2
		EOR R0, R3
		CMP R0, #7
		bls shiny
		LDR R0, new_pal_table
		LSL R1, R4, #2
		B End	

shiny:	LDR R0, Shiny_Pal_tbl_082380CC
		LSL R1, R5, #3
		
End:	ADD R1, R1, R0
		pop {r6}
		pop {r4}
		pop {r1}
		bx r1
		

.align 2
		

var_id: 	.word  0x000040F8
vardecrypt: 	.word  0x0806E455
new_pal_table:		.word	0x08C20000
return_X:		.word	.0x08044195
FFFF:		.word		0x0000FFFF
NRML_Pal_Tbl_0823730C:		.word	0x0823730C
Shiny_Pal_tbl_082380CC:		.word	0x082380CC
