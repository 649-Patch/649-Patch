.text
.align 2
.thumb
.thumb_func
.global simpleandcontrary

main:
	push {r1-r7}
	ldr r3, [sp, #0x24]
	lsl r0, r3, #0x1
	add r0, r0, r3
	lsl r0, r0, #0x2
	add r0, r0, r1
	ldrb r0, [r0, #0x1]
	mov r11, r0
	lsl r0, r3, #0x1
	add r0, r0, r3
	lsl r0, r0, #0x2
	add r0, r0, r1
	ldrb r1, [r0, #0x9]
	cmp r1, #0x1
	bne abilities
	ldrb r1, [r0, #0x0]
	cmp r1, #0xC
	blt abilities
	cmp r1, #0x19
	bgt abilities
	sub r1, #0xC
	lsl r1, r1, #0x2
	ldr r0, effectstable
	add r0, r0, r1
	ldr r0, [r0, #0x0]
	mov pc, r0
abilities:	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r2, place2
	add r0, r0, r2
	ldrb r0, [r0, #0x0]
	cmp r0, #0x78
	bne nextlatest
	mov r1, #0x0
	ldr r2, recoiltable
	b loop
nextlatest:	cmp r0, #0x7D
	bne ironfistcheck
	ldr r3, [sp, #0x24]
	mov r1, #0x0
	ldr r2, sheerforcetable
	b loop
ironfistcheck:	cmp r0, #0x59
	bne normal
	mov r1, #0x0
	ldr r2, punchtable
loop:	lsl r4, r1, #0x1
	add r4, r4, r2
	ldrh r4, [r4, #0x0]
	cmp r3, r4
	beq bigger
	ldr r5, exit
	cmp r4, r5
	bne normal4
	b normal
normal4:	add r1, #0x1
	b loop
bigger:	mov r0, #0x78
	b dividestuff
normal:	cmp r0, #0x4F
	beq rivalry
	b sandforcecheck
rivalry:	ldr r0, place
	ldrb r0, [r0, #0x0]
	mov r1, #0x58
	mul r0, r1
	ldr r2, place2
	add r0, r0, r2
	sub r0, #0x20
	ldrh r4, [r0, #0x0]
	mov r5, #0x1C
	mul r4, r5
	ldr r5, pokemontable
	add r4, r4, r5
	ldrb r4, [r4, #0x10]
	cmp r4, #0xFF
	bne jump
	b store
jump:	add r0, #0x48
	ldr r0, [r0, #0x0]
	mov r2, #0xFF
	and r0, r2
	cmp r0, r4
	blt female1
	mov r0, #0x0
	b geton
female1:	mov r0, #0x1
geton:	mov r10, r0
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r2, place2
	add r0, r0, r2
	sub r0, #0x20
	ldrh r4, [r0, #0x0]
	mov r5, #0x1C
	mul r4, r5
	ldr r5, pokemontable
	add r4, r4, r5
	ldrb r4, [r4, #0x10]
	cmp r4, #0xFF
	bne jump2
	b store
jump2:	add r0, #0x48
	ldr r0, [r0, #0x0]
	mov r2, #0xFF
	and r0, r2
	cmp r0, r4
	blt female2
	mov r0, #0x0
	b geton2
female2:	mov r0, #0x1
geton2:	mov r1, r10
	cmp r0, r1
	bne lower
	mov r0, #0x7D
	b dividestuff
lower:	mov r0, #0x4B
	b dividestuff
sandforcecheck:	cmp r0, #0x9F
	beq sandforce
	b solarpowercheck
sandforce:	ldr r3, weatherloc
	ldrb r3, [r3, #0x0]
	cmp r3, #0x18
	beq types
	b store
types:	ldr r3, [sp, #0x24]
	lsl r0, r3, #0x1
	add r0, r0, r3
	lsl r0, r0, #0x2
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r1, [r0, #0x2]
	cmp r1, #0x4
	beq raise
	cmp r1, #0x5
	beq raise
	cmp r1, #0x8
	beq raise
	b store
raise:	mov r0, #0x82
	b dividestuff
solarpowercheck:	cmp r0, #0x5E
	beq solarpower
	b flowergiftcheck
solarpower:	ldr r3, [sp, #0x24]
	lsl r0, r3, #0x1
	add r0, r0, r3
	lsl r0, r0, #0x2
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r0, [r0, #0xA]
	cmp r0, #0x1
	beq issunny
	b store
issunny:	ldr r3, weatherloc
	ldrb r3, [r3, #0x0]
	cmp r3, #0x60
	beq boost
	b store
boost:	mov r0, #0x96
	b dividestuff
flowergiftcheck:	ldr r1, battlebits
	ldrb r1, [r1, #0x0]
	mov r2, #0x1
	and r1, r2
	cmp r1, #0x0
	beq normalcheck
	ldr r1, place
	ldrb r2, [r1, #0x0]
	mov r1, #0x1
	and r1, r2
	cmp r1, #0x0
	bne altcheck
	cmp r2, #0x0
	beq getdata
	mov r2, #0x2
	b getdata
altcheck:	cmp r2, #0x1
	beq getdata
	mov r2, #0x3
getdata:	mov r1, #0x58
	mul r1, r2
	ldr r2, place2
	add r1, r1, r2
	ldrb r1, [r1, #0x0]
	cmp r1, #0x7A
	beq flowergift
normalcheck:	cmp r0, #0x7A
	beq flowergift
	b store
flowergift:	ldr r3, [sp, #0x24]
	lsl r0, r3, #0x1
	add r0, r0, r3
	lsl r0, r0, #0x2
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r0, [r0, #0xA]
	cmp r0, #0x0
	beq issunny2
	b store
issunny2:	ldr r3, weatherloc
	ldrb r3, [r3, #0x0]
	cmp r3, #0x60
	beq boost2
	b store
boost2:	mov r0, #0x96
	b dividestuff
store:	mov r0, #0x64
dividestuff:	mov r1, #0x64
	mov r2, r11
	mul r0, r2
	bl divide
	mov r11, r0
	ldr r0, place
	ldrb r0, [r0, #0x1]
	mov r1, #0x58
	mul r0, r1
	ldr r2, place2
	add r0, r0, r2
	ldrb r0, [r0, #0x0]
	cmp r0, #0x55
	beq heatproof
	b next
heatproof:	ldr r3, [sp, #0x24]
	lsl r0, r3, #0x1
	add r0, r0, r3
	lsl r0, r0, #0x2
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r1, [r0, #0x2]
	cmp r1, #0xA
	beq geton3
	b store2
geton3:	mov r0, #0x32
	b dividestuff2
next:	cmp r0, #0x57
	beq dryskin
	b flowergiftcheck2
dryskin:	ldr r3, [sp, #0x24]
	lsl r0, r3, #0x1
	add r0, r0, r3
	lsl r0, r0, #0x2
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r1, [r0, #0x2]
	cmp r1, #0xA
	beq raise2
	b store2
raise2:	mov r0, #0x7D
	b dividestuff2
flowergiftcheck2:	ldr r1, battlebits
	ldrb r1, [r1, #0x0]
	mov r2, #0x1
	and r1, r2
	cmp r1, #0x0
	beq normalcheck2
	ldr r1, place
	ldrb r2, [r1, #0x0]
	mov r1, #0x1
	and r1, r2
	cmp r1, #0x0
	bne altcheck2
	cmp r2, #0x0
	beq getdata2
	mov r2, #0x2
	b getdata2
altcheck2:	cmp r2, #0x1
	beq getdata2
	mov r2, #0x3
getdata2:	mov r1, #0x58
	mul r1, r2
	ldr r2, place2
	add r1, r1, r2
	ldrb r1, [r1, #0x0]
	cmp r1, #0x7A
	beq flowergift2
normalcheck2:	cmp r0, #0x7A
	beq flowergift2
	b store2
flowergift2:	ldr r3, [sp, #0x24]
	lsl r0, r3, #0x1
	add r0, r0, r3
	lsl r0, r0, #0x2
	ldr r1, attacktable
	add r0, r0, r1
	ldrb r0, [r0, #0xA]
	cmp r0, #0x1
	beq issunny3
	b store2
issunny3:	ldr r3, weatherloc
	ldrb r3, [r3, #0x0]
	cmp r3, #0x60
	beq boost3
	b store2
boost3:	mov r0, #0x32
	b dividestuff2
store2:	mov r0, #0x64
dividestuff2:	mov r1, #0x64
	mov r2, r11
	mul r0, r2
	bl divide
	ldr r2, saveloc
	strh r0, [r2, #0x0]
	pop {r1-r7}
	cmp r7, #0x0
	bne alt
	ldr r1, returnone
	bx r1
alt:	ldr r0, returntwo
	bx r0
divide:	ldr r2, divcode
	bx r2
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
returnone:	.word 0x0803ED49
returntwo:	.word 0x0803ED65
divcode:	.word 0x081E4019
saveloc:	.word 0x02024020
exit:	.word 0x0000FEFE
punchtable:	.word 0x0875ED20
pokemontable:	.word 0x0871BEA0
attacktable:	.word 0x087453D4
weatherloc:	.word 0x02023F1C
recoiltable:	.word 0x08760A4C
sheerforcetable:	.word 0x08760A66
battlebits:	.word 0x02022B4C
effectstable:	.word 0x08FFFFFF
