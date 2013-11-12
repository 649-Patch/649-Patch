.text
.align 2
.thumb
.thumb_func
.global activatespikesstealthrockandtoxicspikes

main:
	ldr r0, place
	ldrb r1, [r0, #0x1]
	ldrb r0, [r0, #0x0]
	mov r2, #0x58
	mul r0, r2
	mul r1, r2
	ldr r2, place2
	add r0, r2, r0
	add r1, r2, r1
	ldrb r2, [r0, #0x0]
	ldrb r3, [r1, #0x0]
	ldrb r4, [r1, #0x1]
	cmp r2, r3
	beq checktype
	cmp r2, r4
	beq checktype
	ldrb r2, [r0, #0x1]
	cmp r2, r3
	beq checktype
	cmp r2, r4
	bne nomatch
checktype:	ldr r0, place3
	ldrb r0, [r0, #0xE]
	cmp r0, #0x2
	bne normalcheck
	ldr r0, place4
	ldr r0, [r0, #0x0]
	ldrb r0, [r0, #0x13]
	mov r1, #0x1F
	and r0, r1
	cmp r0, #0x9
	beq nomatch
normalcheck: cmp r2, #0x11
	beq nomatch
	b end
nomatch:	ldr r1, newreturn
	ldr r0, scriptlocation
	str r1, [r0, #0x0]
end:	bx lr

.align
place:	.word 0x02023D6B
place2:	.word 0x02023C05
place3:	.word 0x02023FC4
place4:	.word 0x02023FE8
newreturn:	.word 0x08767091
scriptlocation:	.word 0x02023D74
