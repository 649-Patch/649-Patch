.text
.align 2
.thumb
.thumb_func
.global multiscaleandtoxicboostandflareboost

main:
	ldr r2, [sp, #0x28]
	ldrb r0, [r2, #0x0]
	cmp r0, #0x3F
	bne skip
	ldr r3, [sp, #0x4]
	ldr r0, [r3, #0x4C]
	cmp r0, #0x0
	beq skip
	mov r0, #0x96
	ldr r1, [sp, #0x14]
	mul r0, r1
	mov r1, #0x64
	bl divide
	str r0, [sp, #0x14]
skip:	ldr r2, [sp, #0x28]
	ldrb r0, [r2, #0x0]
	cmp r0, #0x88
	bne skip2
	ldr r2, [sp, #0x28]
	ldrh r2, [r0, #0x8]
	ldrh r0, [r0, #0xC]
	cmp r0, r2
	bne skip2
	ldr r0, [sp, #0x14]
	lsl r0, r0, #0x1
	str r0, [sp, #0x14]
skip2:	ldr r2, place
	ldrb r2, [r2, #0x0]
	mov r0, #0x58
	mul r0, r2
	ldr r2, place2
	add r2, r2, r0
	ldrb r2, [r2, #0x0]
	cmp r2, #0x89
	bne skip3
	ldr r2, place
	ldrb r2, [r2, #0x0]
	mov r0, #0x58
	mul r0, r2
	ldr r2, place2
	add r0, r2, r0
	ldr r0, [r0, #0x2C]
	mov r2, #0x8
	and r0, r2
	cmp r0, #0x8
	bne skip3
	ldr r0, [sp, #0x8]
	lsl r1, r0, #0x1
	add r1, r1, r0
	lsl r1, r1, #0x2
	ldr r0, attacks
	add r0, r0, r1
	ldrb r0, [r0, #0xA]
	cmp r0, #0x0
	bne skip3
	mov r0, #0x96
	ldr r1, [sp, #0x14]
	mul r0, r1
	mov r1, #0x64
	bl divide
	str r0, [sp, #0x14]
skip3:	ldr r2, place
	ldrb r2, [r2, #0x0]
	mov r0, #0x58
	mul r0, r2
	ldr r2, place2
	add r2, r2, r0
	ldrb r2, [r2, #0x0]
	ldrb r2, [r2, #0x0]
	cmp r2, #0x8A
	bne end
	ldr r2, place
	ldrb r2, [r2, #0x0]
	mov r0, #0x58
	mul r0, r2
	ldr r2, place2
	add r0, r2, r0
	ldr r0, [r0, #0x2C]
	mov r2, #0x10
	and r0, r2
	cmp r0, #0x10
	bne end
	ldr r0, [sp, #0x8]
	lsl r1, r0, #0x1
	add r1, r1, r0
	lsl r1, r1, #0x2
	ldr r0, attacks
	add r0, r0, r1
	ldrb r0, [r0, #0xA]
	cmp r0, #0x1
	bne end
	mov r0, #0x96
	ldr r1, [sp, #0x14]
	mul r0, r1
	mov r1, #0x64
	bl divide
	str r0, [sp, #0x14]
end:	ldr r2, return
	bx r2
divide:	ldr r2, divcode
	bx r2
.align
divcode:	.word 0x081E4019
return:	.word 0x0803F103  // If you are using Darthatron's physical/special split, change this to .word 0x0803F0F3 and insert the custom fix over the existing code as explained in the fix post
place:	.word 0x02023D6B
place2:	.word 0x02023C04
attacks:	.word 0x087453D4
