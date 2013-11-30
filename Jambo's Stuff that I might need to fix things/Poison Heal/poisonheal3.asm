/*2 possible insert locations:
0x0875f1B4
0x08760640<-

I tested at:
0x0876C9D0
*/

.text
.align 2
.thumb
.thumb_func
.global poisonheal3andicebodyanddryskin2

main:
	ldrb r5, [r2, #0x0]
	cmp r5, #0x5A
	bne nextone
	b poisonheal
nextone:	cmp r5, #0x73
	bne nexttwo
	b icebody
nexttwo:	cmp r5, #0x57
	bne nextthree
	b dryskin
nextthree:	cmp r5, #0x2C
	bne nextfour
	b raindish
nextfour:	cmp r5, #0x2C
	blt nextfive
	b greaterthan
nextfive:	cmp r5, #0x3
	bne gotobl
	b speedboost
gotobl:	ldr r4, returntobl
	bx r4
poisonheal:	
    /*
    This loads the current pokemon's status 
    and then checks it to make sure that it 
    is a type of poison. 0x8 is regular poison, 
    0x80 is toxic.
    */
    	ldr r0, place
	ldrb r0, [r0, #0x0] 
	mov r1, #0x58
	mul r0, r1
	ldr r1, place2
	add r0, r0, r1
	ldr r0, [r0, #0x2C]
	cmp r0, #0x8
	beq dostuff2
	/*
	Adding check for toxic poison. 
	Nov 29, 2013
	*/
	cmp r0, #0x80
	beq dostuff2
	bl two
dostuff2:	mov r0, #0x2
	mov r10, r0
	b skipbl3
icebody:	mov r0, #0x80
	mov r11, r0
	mov r0, #0x1
	mov r10, r0
	b dostuff
dryskin:	mov r0, #0x7
	mov r11, r0
	mov r0, #0x2
	mov r10, r0
	b dostuff
raindish:	mov r0, #0x7
	mov r11, r0
	mov r0, #0x1
	mov r10, r0
dostuff:	mov r0, #0x0
	str r0, [sp, #0x0]
	mov r0, #0x13
	mov r1, #0x0
	mov r2, #0xD
	mov r3, #0x0
	push {r4}
	bl one
	pop {r4}
	cmp r0, #0x0
	beq skipbl
	bl two
skipbl:	str r0, [sp, #0x0]
	mov r0, #0x0
	str r0, [sp, #0x0]
	mov r0, #0x13
	mov r1, #0x0
	mov r2, #0x4D
	mov r3, #0x0
	push {r4}
	bl one
	pop {r4}
	lsl r0, r0, #0x18
	cmp r0, #0x0
	beq skipbl2
	bl two
skipbl2:	ldr r0, weatherloc
	ldrh r1, [r0, #0x0]
	mov r0, r11
	and r0, r1
	cmp r0, #0x0
	bne skipbl3
	bl two
skipbl3:	ldrh r0, [r4, #0x2C]
	ldrh r3, [r4, #0x28]
	bhi skipbl4
	bl two
skipbl4:	mov r0, r8
	strb r5, [r0, #0x0]
	ldr r0, randomlocation
	bl three
	ldr r1, storage
	ldrh r0, [r4, #0x2C]
	mov r1, r10
	mul r0, r1
	lsr r0, r0, #0x4
	ldr r1, storage
	str r0, [r1, #0x0]
	cmp r0, #0x0
	bne down
	ldr r0, returnone
	bx r0
greaterthan:	cmp r5, #0x36
	bne nextcheck
	b truant
nextcheck:	cmp r5, #0x3D
	beq skipbl5
	ldr r4, returntobl2
	bx r4
speedbost:	ldr r2, returnffff
	bx r2
skipbl5:	ldr r0, returnff
	bx r0
truant:	ldr r2, returnfff
	bx r2
down:	ldr r0, returntwo
	bx r0
one:	ldr r4, oneloc
	bx r4
two:	ldr r4, twoloc
	bx r4
three:	ldr r2, threeloc
	bx r2
.align
place:	.word 0x02023D6B
place2:	.word 0x02023C04
returnone:	.word 0x0801A48D
returntwo:	.word 0x0801A491
returnff:	.word 0x0801A4A9
returnfff:	.word 0x0801A5D9
returnffff:	.word 0x0801A58D
returntobl:	.word 0x0801A40D
returntobl2:	.word 0x0801A423
oneloc:	.word 0x08019F19
twoloc:	.word 0x0801BBAB
threeloc:	.word 0x0801BC25
randomlocation:	.word 0x081D92AB
storage:	.word 0x02023D50
weatherloc:	.word 0x02023F1C
