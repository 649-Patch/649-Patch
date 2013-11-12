.text
.align 2
.thumb
.thumb_func
.global changerotomforme

main:
	push {r0-r3,lr}
	ldr r0, var
	bl vardec
	ldrh r0, [r0, #0x0]
	ldr r1, partystart
	mov r2, #0x64
	mul r0, r2
	add r0, r0, r1
	mov r1, #0xB
	push {r0}
	bl decry
	ldr r1, rotom
	cmp r1, r0
	bne exit
	ldr r0, vartwo
	bl vardec
	pop {r1}
	ldrh r0, [r0, #0x0]
	ldrb r2, [r1, #0x1B]
	mov r3, #0xF0
	and r2, r3
	cmp r0, #0x1
	bne next
	cmp r2, #0x10
	beq backtonormal
	mov r0, #0x10
	b end
next:	cmp r0, #0x2
	bne next2
	cmp r2, #0x20
	beq backtonormal
	mov r0, #0x20
	b end
next2:	cmp r0, #0x3
	bne next3
	cmp r2, #0x30
	beq backtonormal
	mov r0, #0x30
	b end
next3:	cmp r0, #0x4
	bne next4
	cmp r2, #0x40
	beq backtonormal
	mov r0, #0x40
	b end
next4:	cmp r0, #0x5
	bne backtonormal
	cmp r2, #0x80
	beq backtonormal
	mov r0, #0x80
	b end
backtonormal:	mov r0, #0x0
end:	ldrb r2, [r1, #0x1B]
	mov r3, #0xF
	and r2, r3
	orr r0, r2
	strb r0, [r1, #0x1B]
	add r0, r1, #0x0
	bl statrecalc
	ldr r0, lastresult
	bl vardec
	mov r1, #0x0
	strh r1, [r0, #0x0]
getout:	pop {r0-r3,pc}
exit:	pop {r0}
	ldr r0, lastresult
	bl vardec
	mov r1, #0x1
	strh r1, [r0, #0x0]
	b getout
statrecalc:	ldr r4, statrec
	bx r4
vardec:	ldr r2, vardecry
	bx r2
decry:	ldr r2, pokedecry
	bx r2
.align
var:	.word 0x00008004
vartwo:	.word 0x00008005
lastresult:	.word 0x0000800D
pokedecry:	.word 0x0803FBE9
vardecry:	.word 0x0806E455
statrec:	.word 0x0803E47D
rotom:		.word 0x000001DF
partystart:	.word 0x02024284
