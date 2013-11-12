.text
.align 2
.thumb
.thumb_func
.global wakeupslaproutine

main:
	ldr r5, attackloc
	ldrh r5, [r5, #0x0]
	mov r4, #0xB3
	lsl r4, r4, #0x1
	cmp r4, r5
	beq wakeupslap
	add r5, r0, r1
	ldr r4, [r5, #0x0]
	mov r0, #0x40
	and r0, r4
	cmp r0, #0x0
	bne yessmellingsalt
	ldr r0, memorylocation
	ldrb r0, [r0, #0x0]
	and r0, r4
	cmp r0, #0x0
	beq exit
	ldr r0, memorylocation
	ldrb r0, [r0, #0x0]
	b later
exit:	ldr r1, return
	bx r1
yessmellingsalt:	ldr r0, return2
	bx r0
wakeupslap:	add r5, r0, r1
	ldr r4, [r5, #0x0]
	mov r0, #0x7
	and r0, r4
	cmp r0, #0x0
	bne yeswakeupslap
	b exit
yeswakeupslap:	mov r0, #0x7
later:	bic r4, r0
	str r4, [r5, #0x0]
	add r0, r4, #0x0
	push {r0-r3}
	push {r0}
	ldr r0, place
	ldrb r2, [r0, #0x0]
	mov r3, #0x1
	and r3, r2
	lsl r2, r2, #0x1
	ldr r1, place3
	add r2, r2, r1
	ldrh r2, [r2, #0x0]
	mov r1, #0x64
	mov r0, #0x6
	mul r3, r0
	mul r3, r1
	mul r1, r2
	ldr r0, baselocation
	sub r0, r0, r3
	add r0, r0, r1
	mov r1, #0x37
	mov r2, sp
	push {lr}
	bl encrypt
	pop {r1}
	mov lr, r1
	pop {r0}
	pop {r0-r3}
	ldr r4, return3
	bx r4
encrypt:	ldr r3, encrypter
	bx r3
.align
attackloc:	.word 0x02023D4A
return:	.word 0x080210ED
return2:	.word 0x08020F1B
return3:	.word 0x08020F23
place:	.word 0x02023D6C
place3:	.word 0x02023BCE
baselocation:	.word 0x02024284
encrypter:	.word 0x0804037D
memorylocation:	.word 0x0203D804
