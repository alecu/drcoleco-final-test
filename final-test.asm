; z80dasm 1.1.5
; command line: z80dasm -g 0x8000 -t -l -a colecovision-final-test-1982-coleco.rom

	org	08000h

	ld d,l			;8000	55 	U 
l8001h:
	xor d			;8001	aa 	. 
	nop			;8002	00 	. 
	nop			;8003	00 	. 
	nop			;8004	00 	. 
	nop			;8005	00 	. 
	nop			;8006	00 	. 
	nop			;8007	00 	. 
	nop			;8008	00 	. 
	ld (hl),d			;8009	72 	r 
	inc h			;800a	24 	$ 
	add a,b			;800b	80 	. 
	jp 00000h		;800c	c3 00 00 	. . . 
	jp 00000h		;800f	c3 00 00 	. . . 
	jp 00000h		;8012	c3 00 00 	. . . 
	jp 00000h		;8015	c3 00 00 	. . . 
	jp 00000h		;8018	c3 00 00 	. . . 
	jp 00000h		;801b	c3 00 00 	. . . 
	jp l8390h		;801e	c3 90 83 	. . . 
	jp l8678h		;8021	c3 78 86 	. x . 
	im 1		;8024	ed 56 	. V 
	ld a,09fh		;8026	3e 9f 	> . 
	out (0e0h),a		;8028	d3 e0 	. . 
	ld a,0bfh		;802a	3e bf 	> . 
	out (0e0h),a		;802c	d3 e0 	. . 
	ld a,0dfh		;802e	3e df 	> . 
	out (0e0h),a		;8030	d3 e0 	. . 
	ld a,0ffh		;8032	3e ff 	> . 
	out (0e0h),a		;8034	d3 e0 	. . 
	call sub_874eh		;8036	cd 4e 87 	. N . 
	ld hl,l_rom_checksum		;8039	21 9b 83 	! . .  
	ld bc,00604h		;803c	01 04 06 	. . .
	call 08361h		;803f	cd 61 83 	. a . 
	ld bc,02000h		;8042	01 00 20 	. .   
	ld hl,00000h		;8045	21 00 00 	! . . 
	ld iy,00000h		;8048	fd 21 00 00 	. ! . . 
l804ch:
	ld a,(hl)			;804c	7e 	~ 
	ld e,a			;804d	5f 	_ 
	ld d,000h		;804e	16 00 	. . 
	add iy,de		;8050	fd 19 	. . 
	inc hl			;8052	23 	# 
	dec bc			;8053	0b 	. 
	ld a,b			;8054	78 	x 
	or c			;8055	b1 	. 
	jr nz,l804ch		;8056	20 f4 	  . 
	push iy		;8058	fd e5 	. . 
	pop de			;805a	d1 	. 
	push de			;805b	d5 	. 
	ld hl,07000h		;805c	21 00 70 	! . p 
	ld a,d			;805f	7a 	z 
	call sub_8371h		;8060	cd 71 83 	. q . 
	ld a,e			;8063	7b 	{ 
	call sub_8371h		;8064	cd 71 83 	. q . 
	ld (hl),000h		;8067	36 00 	6 . 
	ld hl,07000h		;8069	21 00 70 	! . p 
	ld bc,00611h		;806c	01 11 06 	. . . 
	call sub_8701h		;806f	cd 01 87 	. . . 
	ld bc,00704h		;8072	01 04 07 	. . . 
; split check HERE
	jp l_double_check
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	;pop de			;8078	d1 	. 
	;ld a,d			;8079	7a 	z 
	;cp 0d4h		;807a	fe d4 	. . 
	;jr nz,rom_check_bad		;807c	20 05 	  . 
	;ld a,e			;807e	7b 	{ 
	;cp 083h		;807f	fe 83 	. . 
	;jr z,rom_check_ok		;8081	28 03 	( . 
rom_check_bad:
	ld hl,l_rom_bad		;8083	21 e2 83 	! . . 
rom_check_ok:
	call 08361h		;8086	cd 61 83 	. a . 
	ld hl,l_ram_test		;8089	21 a8 83 	! . . 
	ld bc,00904h		;808c	01 04 09 	. . . 
	call 08361h		;808f	cd 61 83 	. a . 
	ld b,004h		;8092	06 04 	. . 
l8094h:
	ld a,b			;8094	78 	x 
	ex af,af'			;8095	08 	. 
	ld hl,l852ch		;8096	21 2c 85 	! , . 
	ld d,000h		;8099	16 00 	. . 
	ld e,b			;809b	58 	X 
	add hl,de			;809c	19 	. 
	ld a,(hl)			;809d	7e 	~ 
	ld hl,07000h		;809e	21 00 70 	! . p 
	ld (hl),a			;80a1	77 	w 
	ld e,l			;80a2	5d 	] 
	ld d,h			;80a3	54 	T 
	inc de			;80a4	13 	. 
	ld bc,003ffh		;80a5	01 ff 03 	. . . 
	ldir		;80a8	ed b0 	. . 
	ld hl,07000h		;80aa	21 00 70 	! . p 
	ld bc,00400h		;80ad	01 00 04 	. . . 
l80b0h:
	cp (hl)			;80b0	be 	. 
	jr nz,l80c2h		;80b1	20 0f 	  . 
	inc hl			;80b3	23 	# 
	dec bc			;80b4	0b 	. 
	ld d,a			;80b5	57 	W 
	ld a,b			;80b6	78 	x 
	or c			;80b7	b1 	. 
	ld a,d			;80b8	7a 	z 
	jr nz,l80b0h		;80b9	20 f5 	  . 
	ex af,af'			;80bb	08 	. 
	ld b,a			;80bc	47 	G 
	djnz l8094h		;80bd	10 d5 	. . 
	xor a			;80bf	af 	. 
	jr l80c4h		;80c0	18 02 	. . 
l80c2h:
	ld a,001h		;80c2	3e 01 	> . 
l80c4h:
	ld hl,l_ram_good		;80c4	21 c7 83 	! . . 
	or a			;80c7	b7 	. 
	jr z,l80cdh		;80c8	28 03 	( . 
	ld hl,l_ram_bad		;80ca	21 d0 83 	! . . 
l80cdh:
	ld bc,00910h		;80cd	01 10 09 	. . . 
	call 08361h		;80d0	cd 61 83 	. a . 
; SKIP VIDEO and SOUND TEST, jmp to CONTROL TESTS
	jp 08192h
;	ld hl,l_video_test		;80d3	21 b1 83 	! . . 
	ld bc,00b04h		;80d6	01 04 0b 	. . . 
	call 08361h		;80d9	cd 61 83 	. a . 
	ld de,04000h		;80dc	11 00 40 	. . @ 
	ld bc,02000h		;80df	01 00 20 	. .   
l80e2h:
	ld a,00fh		;80e2	3e 0f 	> . 
	call sub_8733h		;80e4	cd 33 87 	. 3 . 
	inc de			;80e7	13 	. 
	dec bc			;80e8	0b 	. 
	ld a,b			;80e9	78 	x 
	or c			;80ea	b1 	. 
	jr nz,l80e2h		;80eb	20 f5 	  . 
	ld c,000h		;80ed	0e 00 	. . 
	ld b,008h		;80ef	06 08 	. . 
l80f1h:
	ld a,c			;80f1	79 	y 
	out (0bfh),a		;80f2	d3 bf 	. . 
	ld a,082h		;80f4	3e 82 	> . 
	out (0bfh),a		;80f6	d3 bf 	. . 
	ld hl,00000h		;80f8	21 00 00 	! . . 
l80fbh:
	dec hl			;80fb	2b 	+ 
	ld a,l			;80fc	7d 	} 
	or h			;80fd	b4 	. 
	jr nz,l80fbh		;80fe	20 fb 	  . 
	inc c			;8100	0c 	. 
	djnz l80f1h		;8101	10 ee 	. . 
	call sub_874eh		;8103	cd 4e 87 	. N . 
	ld de,04800h		;8106	11 00 48 	. . H 
	ld bc,00400h		;8109	01 00 04 	. . . 
l810ch:
	ld a,0ffh		;810c	3e ff 	> . 
	call sub_8733h		;810e	cd 33 87 	. 3 . 
	inc de			;8111	13 	. 
	dec bc			;8112	0b 	. 
	ld a,b			;8113	78 	x 
	or c			;8114	b1 	. 
	jr nz,l810ch		;8115	20 f5 	  . 
	ld hl,l828dh		;8117	21 8d 82 	! . . 
	ld de,04700h		;811a	11 00 47 	. . G 
	ld b,010h		;811d	06 10 	. . 
l811fh:
	ld a,(hl)			;811f	7e 	~ 
	call sub_8733h		;8120	cd 33 87 	. 3 . 
	inc de			;8123	13 	. 
	inc hl			;8124	23 	# 
	djnz l811fh		;8125	10 f8 	. . 
	ld de,04400h		;8127	11 00 44 	. . D 
	ld bc,00300h		;812a	01 00 03 	. . . 
	ld l,000h		;812d	2e 00 	. . 
l812fh:
	ld a,l			;812f	7d 	} 
	call sub_8733h		;8130	cd 33 87 	. 3 . 
	bit 0,c		;8133	cb 41 	. A 
	jr z,l813dh		;8135	28 06 	( . 
	ld a,l			;8137	7d 	} 
	add a,008h		;8138	c6 08 	. . 
	and 07fh		;813a	e6 7f 	.  
	ld l,a			;813c	6f 	o 
l813dh:
	inc de			;813d	13 	. 
	dec bc			;813e	0b 	. 
	ld a,b			;813f	78 	x 
	or c			;8140	b1 	. 
	jr nz,l812fh		;8141	20 ec 	  . 
	ld hl,00000h		;8143	21 00 00 	! . . 
	ld b,004h		;8146	06 04 	. . 
l8148h:
	dec hl			;8148	2b 	+ 
	ld a,h			;8149	7c 	| 
	or l			;814a	b5 	. 
	jr nz,l8148h		;814b	20 fb 	  . 
	djnz l8148h		;814d	10 f9 	. . 
	ld hl,l829dh		;814f	21 9d 82 	! . . 
	ld de,04800h		;8152	11 00 48 	. . H 
	ld b,008h		;8155	06 08 	. . 
l8157h:
	ld a,(hl)			;8157	7e 	~ 
	call sub_8733h		;8158	cd 33 87 	. 3 . 
	inc hl			;815b	23 	# 
	inc de			;815c	13 	. 
	djnz l8157h		;815d	10 f8 	. . 
	ld de,04700h		;815f	11 00 47 	. . G 
	ld a,0f0h		;8162	3e f0 	> . 
	call sub_8733h		;8164	cd 33 87 	. 3 . 
	ld de,04400h		;8167	11 00 44 	. . D 
	ld bc,00300h		;816a	01 00 03 	. . . 
l816dh:
	xor a			;816d	af 	. 
	call sub_8733h		;816e	cd 33 87 	. 3 . 
	inc de			;8171	13 	. 
	dec bc			;8172	0b 	. 
	ld a,b			;8173	78 	x 
	or c			;8174	b1 	. 
	jr nz,l816dh		;8175	20 f6 	  . 
	ld hl,00000h		;8177	21 00 00 	! . . 
	ld b,004h		;817a	06 04 	. . 
l817ch:
	dec hl			;817c	2b 	+ 
	ld a,h			;817d	7c 	| 
	or l			;817e	b5 	. 
	jr nz,l817ch		;817f	20 fb 	  . 
	djnz l817ch		;8181	10 f9 	. . 
	call sub_874eh		;8183	cd 4e 87 	. N . 
	ld hl,l_sound_test		;8186	21 bc 83 	! . . 
	ld bc,00604h		;8189	01 04 06 	. . . 
	call 08361h		;818c	cd 61 83 	. a . 
	call sub_8531h		;818f	cd 31 85 	. 1 . 
	call sub_875fh		;8192	cd 5f 87 	. _ . 
	ld hl,07000h		;8195	21 00 70 	! . p 
	ld de,07001h		;8198	11 01 70 	. . p 
	ld bc,001ffh		;819b	01 ff 01 	. . . 
	ld (hl),020h		;819e	36 20 	6   
	ldir		;81a0	ed b0 	. . 
	ld hl,l_control1		;81a2	21 ea 83 	! . . 
	ld de,07000h		;81a5	11 00 70 	. . p 
	ld bc,00117h		;81a8	01 17 01 	. . . 
	ldir		;81ab	ed b0 	. . 
	ld de,07200h		;81ad	11 00 72 	. . r 
	ld hl,l82a5h		;81b0	21 a5 82 	! . . 
	ld bc,0000ch		;81b3	01 0c 00 	. . . 
	ldir		;81b6	ed b0 	. . 
l81b8h:
	ld iy,l8501h		;81b8	fd 21 01 85 	. ! . . 
	call sub_876ch		;81bc	cd 6c 87 	. l . 
	ld hl,07000h		;81bf	21 00 70 	! . p 
	ld bc,00117h		;81c2	01 17 01 	. . . 
l81c5h:
	ld a,(hl)			;81c5	7e 	~ 
	cp 068h		;81c6	fe 68 	. h 
	jr z,l81d2h		;81c8	28 08 	( . 
	cp 069h		;81ca	fe 69 	. i 
	jr z,l81d2h		;81cc	28 04 	( . 
	bit 7,a		;81ce	cb 7f 	.  
	jr z,l81d4h		;81d0	28 02 	( . 
l81d2h:
	ld (hl),020h		;81d2	36 20 	6   
l81d4h:
	inc hl			;81d4	23 	# 
	dec bc			;81d5	0b 	. 
	ld a,b			;81d6	78 	x 
	or c			;81d7	b1 	. 
	jr nz,l81c5h		;81d8	20 eb 	  . 
	call 01febh		;81da	cd eb 1f 	. . . 
	ld a,(07204h)		;81dd	3a 04 72 	: . r 
	or a			;81e0	b7 	. 
	jr z,l81f5h		;81e1	28 12 	( . 
	push af			;81e3	f5 	. 
	xor a			;81e4	af 	. 
	ld (07204h),a		;81e5	32 04 72 	2 . r 
	ld hl,07070h		;81e8	21 70 70 	! p p 
	ld b,068h		;81eb	06 68 	. h 
	pop af			;81ed	f1 	. 
	bit 7,a		;81ee	cb 7f 	.  
	jr z,l81f4h		;81f0	28 02 	( . 
	ld b,069h		;81f2	06 69 	. i 
l81f4h:
	ld (hl),b			;81f4	70 	p 
l81f5h:
	ld a,(07209h)		;81f5	3a 09 72 	: . r 
	or a			;81f8	b7 	. 
	jr z,l820dh		;81f9	28 12 	( . 
	push af			;81fb	f5 	. 
	xor a			;81fc	af 	. 
	ld (07209h),a		;81fd	32 09 72 	2 . r 
	ld hl,07083h		;8200	21 83 70 	! . p 
	ld b,068h		;8203	06 68 	. h 
	pop af			;8205	f1 	. 
	bit 7,a		;8206	cb 7f 	.  
	jr z,l820ch		;8208	28 02 	( . 
	ld b,069h		;820a	06 69 	. i 
l820ch:
	ld (hl),b			;820c	70 	p 
l820dh:
	ld hl,07202h		;820d	21 02 72 	! . r 
	ld de,l82a7h		;8210	11 a7 82 	. . . 
	ld bc,00a01h		;8213	01 01 0a 	. . . 
l8216h:
	ld a,(de)			;8216	1a 	. 
	cp (hl)			;8217	be 	. 
	jr z,l821eh		;8218	28 04 	( . 
	push hl			;821a	e5 	. 
	pop iy		;821b	fd e1 	. . 
	dec c			;821d	0d 	. 
l821eh:
	inc hl			;821e	23 	# 
	inc de			;821f	13 	. 
	djnz l8216h		;8220	10 f4 	. . 
	ld a,c			;8222	79 	y 
	or a			;8223	b7 	. 
	jp nz,l81b8h		;8224	c2 b8 81 	. . . 
	push iy		;8227	fd e5 	. . 
	pop hl			;8229	e1 	. 
	ld a,l			;822a	7d 	} 
	sub 002h		;822b	d6 02 	. . 
	cp 000h		;822d	fe 00 	. . 
	jr z,l8285h		;822f	28 54 	( T 
	cp 003h		;8231	fe 03 	. . 
	jr z,l8285h		;8233	28 50 	( P 
	cp 005h		;8235	fe 05 	. . 
	jr z,l8285h		;8237	28 4c 	( L 
	cp 008h		;8239	fe 08 	. . 
	jr z,l8285h		;823b	28 48 	( H 
	cp 002h		;823d	fe 02 	. . 
	jr z,l828ah		;823f	28 49 	( I 
	cp 007h		;8241	fe 07 	. . 
	jr z,l828ah		;8243	28 45 	( E 
	sla a		;8245	cb 27 	. ' 
	sla a		;8247	cb 27 	. ' 
	sla a		;8249	cb 27 	. ' 
	sla a		;824b	cb 27 	. ' 
	or (hl)			;824d	b6 	. 
l824eh:
	ld iy,l82b1h		;824e	fd 21 b1 82 	. ! . . 
	ld b,02ch		;8252	06 2c 	. , 
l8254h:
	ld c,a			;8254	4f 	O 
	xor (iy+000h)		;8255	fd ae 00 	. . . 
	jr z,l826ah		;8258	28 10 	( . 
	inc iy		;825a	fd 23 	. # 
	inc iy		;825c	fd 23 	. # 
	inc iy		;825e	fd 23 	. # 
	inc iy		;8260	fd 23 	. # 
	ld a,c			;8262	79 	y 
	djnz l8254h		;8263	10 ef 	. . 
	ld (hl),000h		;8265	36 00 	6 . 
	jp l81b8h		;8267	c3 b8 81 	. . . 
l826ah:
	ld e,(iy+001h)		;826a	fd 5e 01 	. ^ . 
	ld d,(iy+002h)		;826d	fd 56 02 	. V . 
	ld hl,07000h		;8270	21 00 70 	! . p 
	add hl,de			;8273	19 	. 
	ld a,(hl)			;8274	7e 	~ 
	cp 020h		;8275	fe 20 	.   
	jr z,l827eh		;8277	28 05 	( . 
	ld (hl),020h		;8279	36 20 	6   
	jp l81b8h		;827b	c3 b8 81 	. . . 
l827eh:
	ld a,(iy+003h)		;827e	fd 7e 03 	. ~ . 
	ld (hl),a			;8281	77 	w 
	jp l81b8h		;8282	c3 b8 81 	. . . 
l8285h:
	or 0e0h		;8285	f6 e0 	. . 
	jp l824eh		;8287	c3 4e 82 	. N . 
l828ah:
	jp l81b8h		;828a	c3 b8 81 	. . . 
l828dh:
	rrca			;828d	0f 	. 
	ret p			;828e	f0 	. 
	ret po			;828f	e0 	. 
	or b			;8290	b0 	. 
	and b			;8291	a0 	. 
	ld (hl),b			;8292	70 	p 
	jr nc,l82b5h		;8293	30 20 	0   
	ret nz			;8295	c0 	. 
	ret nc			;8296	d0 	. 
	sub b			;8297	90 	. 
	add a,b			;8298	80 	. 
	ld h,b			;8299	60 	` 
	ld d,b			;829a	50 	P 
	ld b,b			;829b	40 	@ 
	rra			;829c	1f 	. 
l829dh:
	djnz l82afh		;829d	10 10 	. . 
	djnz $+1		;829f	10 ff 	. . 
	djnz l82b3h		;82a1	10 10 	. . 
	djnz l82b5h		;82a3	10 10 	. . 
l82a5h:
	sbc a,a			;82a5	9f 	. 
	sbc a,a			;82a6	9f 	. 
l82a7h:
	nop			;82a7	00 	. 
	nop			;82a8	00 	. 
	nop			;82a9	00 	. 
	nop			;82aa	00 	. 
	rrca			;82ab	0f 	. 
	nop			;82ac	00 	. 
	nop			;82ad	00 	. 
	nop			;82ae	00 	. 
l82afh:
	nop			;82af	00 	. 
	rrca			;82b0	0f 	. 
l82b1h:
	ex (sp),hl			;82b1	e3 	. 
	adc a,(hl)			;82b2	8e 	. 
l82b3h:
	nop			;82b3	00 	. 
	sub e			;82b4	93 	. 
l82b5h:
	ret po			;82b5	e0 	. 
	add a,(hl)			;82b6	86 	. 
	nop			;82b7	00 	. 
	sub d			;82b8	92 	. 
	ret pe			;82b9	e8 	. 
	and c			;82ba	a1 	. 
	nop			;82bb	00 	. 
	sub e			;82bc	93 	. 
	push hl			;82bd	e5 	. 
	sbc a,c			;82be	99 	. 
	nop			;82bf	00 	. 
	sub d			;82c0	92 	. 
	ld de,00020h		;82c1	11 20 00 	.   . 
	adc a,e			;82c4	8b 	. 
	ld (de),a			;82c5	12 	. 
	ld b,b			;82c6	40 	@ 
	nop			;82c7	00 	. 
	adc a,d			;82c8	8a 	. 
	inc de			;82c9	13 	. 
	inc hl			;82ca	23 	# 
	nop			;82cb	00 	. 
	sub c			;82cc	91 	. 
	inc d			;82cd	14 	. 
	ld e,b			;82ce	58 	X 
	nop			;82cf	00 	. 
	adc a,h			;82d0	8c 	. 
	ld d,05bh		;82d1	16 5b 	. [ 
	nop			;82d3	00 	. 
	adc a,a			;82d4	8f 	. 
	jr l830fh		;82d5	18 38 	. 8 
	nop			;82d7	00 	. 
	adc a,l			;82d8	8d 	. 
	add hl,de			;82d9	19 	. 
	dec e			;82da	1d 	. 
	nop			;82db	00 	. 
	sub b			;82dc	90 	. 
	inc e			;82dd	1c 	. 
	ld d,l			;82de	55 	U 
	nop			;82df	00 	. 
	adc a,(hl)			;82e0	8e 	. 
	ld h,c			;82e1	61 	a 
	inc sp			;82e2	33 	3 
	nop			;82e3	00 	. 
	adc a,e			;82e4	8b 	. 
	ld h,d			;82e5	62 	b 
	ld d,e			;82e6	53 	S 
	nop			;82e7	00 	. 
	adc a,d			;82e8	8a 	. 
	ld h,e			;82e9	63 	c 
	ld (hl),000h		;82ea	36 00 	6 . 
	sub c			;82ec	91 	. 
	ld h,h			;82ed	64 	d 
	ld l,e			;82ee	6b 	k 
	nop			;82ef	00 	. 
	adc a,h			;82f0	8c 	. 
	ld h,(hl)			;82f1	66 	f 
	ld l,(hl)			;82f2	6e 	n 
	nop			;82f3	00 	. 
	adc a,a			;82f4	8f 	. 
	ld l,b			;82f5	68 	h 
	ld c,e			;82f6	4b 	K 
	nop			;82f7	00 	. 
	adc a,l			;82f8	8d 	. 
	ld l,c			;82f9	69 	i 
	jr nc,l82fch		;82fa	30 00 	0 . 
l82fch:
	sub b			;82fc	90 	. 
	ld l,h			;82fd	6c 	l 
	ld l,b			;82fe	68 	h 
	nop			;82ff	00 	. 
	adc a,(hl)			;8300	8e 	. 
	ld b,b			;8301	40 	@ 
	cp 000h		;8302	fe 00 	. . 
	add a,b			;8304	80 	. 
	ld b,c			;8305	41 	A 
	and e			;8306	a3 	. 
	nop			;8307	00 	. 
	add a,c			;8308	81 	. 
	ld b,d			;8309	42 	B 
	and a			;830a	a7 	. 
	nop			;830b	00 	. 
	add a,d			;830c	82 	. 
	ld b,e			;830d	43 	C 
	xor e			;830e	ab 	. 
l830fh:
	nop			;830f	00 	. 
	add a,e			;8310	83 	. 
	ld b,h			;8311	44 	D 
	ret nz			;8312	c0 	. 
	nop			;8313	00 	. 
	add a,h			;8314	84 	. 
	ld b,l			;8315	45 	E 
	call nz,sub_8500h		;8316	c4 00 85 	. . . 
	ld b,(hl)			;8319	46 	F 
	ret z			;831a	c8 	. 
	nop			;831b	00 	. 
	add a,(hl)			;831c	86 	. 
	ld b,a			;831d	47 	G 
	defb 0ddh,000h,087h	;illegal sequence		;831e	dd 00 87 	. . . 
	ld c,b			;8321	48 	H 
	pop hl			;8322	e1 	. 
	nop			;8323	00 	. 
	adc a,b			;8324	88 	. 
	ld c,c			;8325	49 	I 
	push hl			;8326	e5 	. 
	nop			;8327	00 	. 
	adc a,c			;8328	89 	. 
	ld c,d			;8329	4a 	J 
	jp m,l9500h		;832a	fa 00 95 	. . . 
	ld c,e			;832d	4b 	K 
	ld (bc),a			;832e	02 	. 
	ld bc,l9094h		;832f	01 94 90 	. . . 
	ld de,l8001h		;8332	11 01 80 	. . . 
	sub c			;8335	91 	. 
	or (hl)			;8336	b6 	. 
	nop			;8337	00 	. 
	add a,c			;8338	81 	. 
	sub d			;8339	92 	. 
	cp d			;833a	ba 	. 
	nop			;833b	00 	. 
	add a,d			;833c	82 	. 
	sub e			;833d	93 	. 
	cp (hl)			;833e	be 	. 
	nop			;833f	00 	. 
	add a,e			;8340	83 	. 
	sub h			;8341	94 	. 
	out (000h),a		;8342	d3 00 	. . 
	add a,h			;8344	84 	. 
	sub l			;8345	95 	. 
	rst 10h			;8346	d7 	. 
	nop			;8347	00 	. 
	add a,l			;8348	85 	. 
	sub (hl)			;8349	96 	. 
	in a,(000h)		;834a	db 00 	. . 
	add a,(hl)			;834c	86 	. 
	sub a			;834d	97 	. 
	ret p			;834e	f0 	. 
	nop			;834f	00 	. 
	add a,a			;8350	87 	. 
	sbc a,b			;8351	98 	. 
	call p,sub_8800h		;8352	f4 00 88 	. . . 
	sbc a,c			;8355	99 	. 
	ret m			;8356	f8 	. 
	nop			;8357	00 	. 
	adc a,c			;8358	89 	. 
	sbc a,d			;8359	9a 	. 
	dec c			;835a	0d 	. 
	ld bc,l9b95h		;835b	01 95 9b 	. . . 
	dec d			;835e	15 	. 
	ld bc,0cd94h		;835f	01 94 cd 	. . . 
	ld bc,02187h		;8362	01 87 21 	. . ! 
	nop			;8365	00 	. 
	nop			;8366	00 	. 
	ld b,002h		;8367	06 02 	. . 
l8369h:
	dec hl			;8369	2b 	+ 
	ld a,h			;836a	7c 	| 
	or l			;836b	b5 	. 
	jr nz,l8369h		;836c	20 fb 	  . 
	djnz l8369h		;836e	10 f9 	. . 
	ret			;8370	c9 	. 
sub_8371h:
	push af			;8371	f5 	. 
	srl a		;8372	cb 3f 	. ? 
	srl a		;8374	cb 3f 	. ? 
	srl a		;8376	cb 3f 	. ? 
	srl a		;8378	cb 3f 	. ? 
	call sub_8382h		;837a	cd 82 83 	. . . 
	pop af			;837d	f1 	. 
	call sub_8382h		;837e	cd 82 83 	. . . 
	ret			;8381	c9 	. 
sub_8382h:
	and 00fh		;8382	e6 0f 	. . 
	cp 00ah		;8384	fe 0a 	. . 
	jp m,l838bh		;8386	fa 8b 83 	. . . 
	add a,007h		;8389	c6 07 	. . 
l838bh:
	add a,030h		;838b	c6 30 	. 0 
	ld (hl),a			;838d	77 	w 
	inc hl			;838e	23 	# 
	ret			;838f	c9 	. 
l8390h:
	di			;8390	f3 	. 
	push af			;8391	f5 	. 
	push hl			;8392	e5 	. 
	call 01f88h		;8393	cd 88 1f 	. . . 
	pop hl			;8396	e1 	. 
	pop af			;8397	f1 	. 
	ei			;8398	fb 	. 
	reti		;8399	ed 4d 	. M 
l_rom_checksum:
	ld d,d			;839b	52 	R 
	ld c,a			;839c	4f 	O 
	ld c,l			;839d	4d 	M 
	jr nz,l83e3h		;839e	20 43 	  C 
	ld c,b			;83a0	48 	H 
	ld b,l			;83a1	45 	E 
	ld b,e			;83a2	43 	C 
	ld c,e			;83a3	4b 	K 
	ld d,e			;83a4	53 	S 
	ld d,l			;83a5	55 	U 
	ld c,l			;83a6	4d 	M 
	nop			;83a7	00 	. 
l_ram_test:
	ld d,d			;83a8	52 	R 
	ld b,c			;83a9	41 	A 
	ld c,l			;83aa	4d 	M 
	jr nz,l8401h		;83ab	20 54 	  T 
	ld b,l			;83ad	45 	E 
	ld d,e			;83ae	53 	S 
	ld d,h			;83af	54 	T 
	nop			;83b0	00 	. 
l_video_test:
	ld d,(hl)			;83b1	56 	V 
	ld c,c			;83b2	49 	I 
	ld b,h			;83b3	44 	D 
	ld b,l			;83b4	45 	E 
	ld c,a			;83b5	4f 	O 
	jr nz,$+86		;83b6	20 54 	  T 
	ld b,l			;83b8	45 	E 
	ld d,e			;83b9	53 	S 
	ld d,h			;83ba	54 	T 
	nop			;83bb	00 	. 
l_sound_test:
	ld d,e			;83bc	53 	S 
	ld c,a			;83bd	4f 	O 
	ld d,l			;83be	55 	U 
	ld c,(hl)			;83bf	4e 	N 
	ld b,h			;83c0	44 	D 
	jr nz,$+86		;83c1	20 54 	  T 
	ld b,l			;83c3	45 	E 
	ld d,e			;83c4	53 	S 
	ld d,h			;83c5	54 	T 
	nop			;83c6	00 	. 
l_ram_good:
	ld d,d			;83c7	52 	R 
	ld b,c			;83c8	41 	A 
	ld c,l			;83c9	4d 	M 
	jr nz,$+73		;83ca	20 47 	  G 
	ld c,a			;83cc	4f 	O 
	ld c,a			;83cd	4f 	O 
	ld b,h			;83ce	44 	D 
	nop			;83cf	00 	. 
l_ram_bad:
	ld d,d			;83d0	52 	R 
	ld b,c			;83d1	41 	A 
	ld c,l			;83d2	4d 	M 
	jr nz,$+68		;83d3	20 42 	  B 
	ld b,c			;83d5	41 	A 
	ld b,h			;83d6	44 	D 
	jr nz,l83fdh		;83d7	20 24 	  $ 
l_rom_good:
	ld d,d			;83d9	52 	R 
	ld c,a			;83da	4f 	O 
	ld c,l			;83db	4d 	M 
	jr nz,l8425h		;83dc	20 47 	  G 
	ld c,a			;83de	4f 	O 
	ld c,a			;83df	4f 	O 
	ld b,h			;83e0	44 	D 
	nop			;83e1	00 	. 
l_rom_bad:
	ld d,d			;83e2	52 	R 
l83e3h:
	ld c,a			;83e3	4f 	O 
	ld c,l			;83e4	4d 	M 
	jr nz,l8429h		;83e5	20 42 	  B 
	ld b,c			;83e7	41 	A 
	ld b,h			;83e8	44 	D 
	inc h			;83e9	24 	$ 
l_control1:
	ld b,e			;83ea	43 	C 
	ld c,a			;83eb	4f 	O 
	ld c,(hl)			;83ec	4e 	N 
	ld d,h			;83ed	54 	T 
	ld d,d			;83ee	52 	R 
	ld c,a			;83ef	4f 	O 
	ld c,h			;83f0	4c 	L 
	jr nz,$+51		;83f1	20 31 	  1 
	jr nz,$+34		;83f3	20 20 	    
	jr nz,$+34		;83f5	20 20 	    
	jr nz,$+34		;83f7	20 20 	    
	jr nz,l841bh		;83f9	20 20 	    
	jr nz,l841dh		;83fb	20 20 	    
l83fdh:
	ld b,e			;83fd	43 	C 
	ld c,a			;83fe	4f 	O 
	ld c,(hl)			;83ff	4e 	N 
	ld d,h			;8400	54 	T 
l8401h:
	ld d,d			;8401	52 	R 
	ld c,a			;8402	4f 	O 
	ld c,h			;8403	4c 	L 
	jr nz,l8438h		;8404	20 32 	  2 
	nop			;8406	00 	. 
	ld h,d			;8407	62 	b 
	jr nz,$+34		;8408	20 20 	    
	ld c,(hl)			;840a	4e 	N 
	jr nz,l842dh		;840b	20 20 	    
	ld h,e			;840d	63 	c 
	jr nz,$+34		;840e	20 20 	    
	jr nz,$+34		;8410	20 20 	    
	jr nz,$+34		;8412	20 20 	    
	jr nz,l8436h		;8414	20 20 	    
	jr nz,l8438h		;8416	20 20 	    
	jr nz,l843ah		;8418	20 20 	    
	ld h,d			;841a	62 	b 
l841bh:
	jr nz,$+34		;841b	20 20 	    
l841dh:
	ld c,(hl)			;841d	4e 	N 
	jr nz,l8440h		;841e	20 20 	    
	ld h,e			;8420	63 	c 
	nop			;8421	00 	. 
	ld d,a			;8422	57 	W 
	jr nz,l8445h		;8423	20 20 	    
l8425h:
	jr nz,$+34		;8425	20 20 	    
	jr nz,$+34		;8427	20 20 	    
l8429h:
	jr nz,l8470h		;8429	20 45 	  E 
	jr nz,$+34		;842b	20 20 	    
l842dh:
	jr nz,$+34		;842d	20 20 	    
	jr nz,$+34		;842f	20 20 	    
	jr nz,l8453h		;8431	20 20 	    
	jr nz,l8455h		;8433	20 20 	    
	ld d,a			;8435	57 	W 
l8436h:
	jr nz,l8458h		;8436	20 20 	    
l8438h:
	jr nz,l845ah		;8438	20 20 	    
l843ah:
	jr nz,l845ch		;843a	20 20 	    
	jr nz,l8483h		;843c	20 45 	  E 
	nop			;843e	00 	. 
	ld h,b			;843f	60 	` 
l8440h:
	jr nz,l8462h		;8440	20 20 	    
	ld d,e			;8442	53 	S 
	jr nz,$+34		;8443	20 20 	    
l8445h:
	ld h,c			;8445	61 	a 
	jr nz,l8468h		;8446	20 20 	    
	jr nz,l846ah		;8448	20 20 	    
	jr nz,l846ch		;844a	20 20 	    
	jr nz,l846eh		;844c	20 20 	    
	jr nz,l8470h		;844e	20 20 	    
	jr nz,$+34		;8450	20 20 	    
	ld h,b			;8452	60 	` 
l8453h:
	jr nz,l8475h		;8453	20 20 	    
l8455h:
	ld d,e			;8455	53 	S 
	jr nz,$+34		;8456	20 20 	    
l8458h:
	ld h,c			;8458	61 	a 
	nop			;8459	00 	. 
l845ah:
	jr nz,$+34		;845a	20 20 	    
l845ch:
	jr nz,$+34		;845c	20 20 	    
	jr nz,$+34		;845e	20 20 	    
	jr nz,$+34		;8460	20 20 	    
l8462h:
	jr nz,l8484h		;8462	20 20 	    
	jr nz,l8486h		;8464	20 20 	    
	jr nz,l8488h		;8466	20 20 	    
l8468h:
	jr nz,l848ah		;8468	20 20 	    
l846ah:
	jr nz,l848ch		;846a	20 20 	    
l846ch:
	jr nz,$+34		;846c	20 20 	    
l846eh:
	jr nz,l8470h		;846e	20 00 	  . 
l8470h:
	ld h,h			;8470	64 	d 
	jr nz,$+34		;8471	20 20 	    
	jr nz,$+34		;8473	20 20 	    
l8475h:
	jr nz,$+34		;8475	20 20 	    
	jr nz,$+103		;8477	20 65 	  e 
	jr nz,$+34		;8479	20 20 	    
	jr nz,$+34		;847b	20 20 	    
	jr nz,$+34		;847d	20 20 	    
	jr nz,$+34		;847f	20 20 	    
	jr nz,l84a3h		;8481	20 20 	    
l8483h:
	ld h,h			;8483	64 	d 
l8484h:
	jr nz,$+34		;8484	20 20 	    
l8486h:
	jr nz,$+34		;8486	20 20 	    
l8488h:
	jr nz,l84aah		;8488	20 20 	    
l848ah:
	jr nz,l84f1h		;848a	20 65 	  e 
l848ch:
	nop			;848c	00 	. 
	ld sp,02020h		;848d	31 20 20 	1     
	jr nz,l84c4h		;8490	20 32 	  2 
	jr nz,$+34		;8492	20 20 	    
	jr nz,$+53		;8494	20 33 	  3 
	jr nz,$+34		;8496	20 20 	    
	jr nz,$+34		;8498	20 20 	    
	jr nz,$+34		;849a	20 20 	    
	jr nz,l84beh		;849c	20 20 	    
	jr nz,l84c0h		;849e	20 20 	    
	ld sp,02020h		;84a0	31 20 20 	1     
l84a3h:
	jr nz,$+52		;84a3	20 32 	  2 
	jr nz,l84c7h		;84a5	20 20 	    
	jr nz,$+53		;84a7	20 33 	  3 
	nop			;84a9	00 	. 
l84aah:
	inc (hl)			;84aa	34 	4 
	jr nz,$+34		;84ab	20 20 	    
	jr nz,l84e4h		;84ad	20 35 	  5 
	jr nz,$+34		;84af	20 20 	    
	jr nz,l84e9h		;84b1	20 36 	  6 
	jr nz,$+34		;84b3	20 20 	    
	jr nz,$+34		;84b5	20 20 	    
	jr nz,$+34		;84b7	20 20 	    
	jr nz,l84dbh		;84b9	20 20 	    
	jr nz,l84ddh		;84bb	20 20 	    
	inc (hl)			;84bd	34 	4 
l84beh:
	jr nz,$+34		;84be	20 20 	    
l84c0h:
	jr nz,l84f7h		;84c0	20 35 	  5 
	jr nz,l84e4h		;84c2	20 20 	    
l84c4h:
	jr nz,l84fch		;84c4	20 36 	  6 
	nop			;84c6	00 	. 
l84c7h:
	scf			;84c7	37 	7 
	jr nz,$+34		;84c8	20 20 	    
	jr nz,l8504h		;84ca	20 38 	  8 
	jr nz,$+34		;84cc	20 20 	    
	jr nz,l8509h		;84ce	20 39 	  9 
	jr nz,$+34		;84d0	20 20 	    
	jr nz,$+34		;84d2	20 20 	    
	jr nz,$+34		;84d4	20 20 	    
	jr nz,l84f8h		;84d6	20 20 	    
	jr nz,l84fah		;84d8	20 20 	    
	scf			;84da	37 	7 
l84dbh:
	jr nz,$+34		;84db	20 20 	    
l84ddh:
	jr nz,l8517h		;84dd	20 38 	  8 
	jr nz,l8501h		;84df	20 20 	    
	jr nz,l851ch		;84e1	20 39 	  9 
	nop			;84e3	00 	. 
l84e4h:
	ld h,a			;84e4	67 	g 
	jr nz,l8507h		;84e5	20 20 	    
	jr nz,l8519h		;84e7	20 30 	  0 
l84e9h:
	jr nz,l850bh		;84e9	20 20 	    
	jr nz,l8553h		;84eb	20 66 	  f 
	jr nz,l850fh		;84ed	20 20 	    
	jr nz,l8511h		;84ef	20 20 	    
l84f1h:
	jr nz,l8513h		;84f1	20 20 	    
	jr nz,l8515h		;84f3	20 20 	    
	jr nz,l8517h		;84f5	20 20 	    
l84f7h:
	ld h,a			;84f7	67 	g 
l84f8h:
	jr nz,l851ah		;84f8	20 20 	    
l84fah:
	jr nz,l852ch		;84fa	20 30 	  0 
l84fch:
	jr nz,l851eh		;84fc	20 20 	    
	jr nz,$+104		;84fe	20 66 	  f 
sub_8500h:
	nop			;8500	00 	. 
l8501h:
	nop			;8501	00 	. 
	ld (hl),b			;8502	70 	p 
	inc bc			;8503	03 	. 
l8504h:
	ld bc,0701dh		;8504	01 1d 70 	. . p 
l8507h:
	inc b			;8507	04 	. 
	inc b			;8508	04 	. 
l8509h:
	jr c,l857bh		;8509	38 70 	8 p 
l850bh:
	inc bc			;850b	03 	. 
	ld b,055h		;850c	06 55 	. U 
	ld (hl),b			;850e	70 	p 
l850fh:
	inc b			;850f	04 	. 
	ex af,af'			;8510	08 	. 
l8511h:
	ld (hl),b			;8511	70 	p 
	ld (hl),b			;8512	70 	p 
l8513h:
	rlca			;8513	07 	. 
	add hl,bc			;8514	09 	. 
l8515h:
	add a,(hl)			;8515	86 	. 
	ld (hl),b			;8516	70 	p 
l8517h:
	inc bc			;8517	03 	. 
	dec bc			;8518	0b 	. 
l8519h:
	and e			;8519	a3 	. 
l851ah:
	ld (hl),b			;851a	70 	p 
	inc bc			;851b	03 	. 
l851ch:
	ld c,0c0h		;851c	0e c0 	. . 
l851eh:
	ld (hl),b			;851e	70 	p 
	inc bc			;851f	03 	. 
	djnz $-33		;8520	10 dd 	. . 
	ld (hl),b			;8522	70 	p 
	inc bc			;8523	03 	. 
	ld (de),a			;8524	12 	. 
	jp m,00370h		;8525	fa 70 03 	. p . 
	inc d			;8528	14 	. 
	nop			;8529	00 	. 
	nop			;852a	00 	. 
	nop			;852b	00 	. 
l852ch:
	nop			;852c	00 	. 
	nop			;852d	00 	. 
	ld d,l			;852e	55 	U 
	xor d			;852f	aa 	. 
	rst 38h			;8530	ff 	. 
sub_8531h:
	ld a,09fh		;8531	3e 9f 	> . 
	out (0e0h),a		;8533	d3 e0 	. . 
	ld a,0bfh		;8535	3e bf 	> . 
	out (0e0h),a		;8537	d3 e0 	. . 
	ld a,0dfh		;8539	3e df 	> . 
	out (0e0h),a		;853b	d3 e0 	. . 
	ld a,0ffh		;853d	3e ff 	> . 
	out (0e0h),a		;853f	d3 e0 	. . 
	ld a,0e2h		;8541	3e e2 	> . 
	out (0bfh),a		;8543	d3 bf 	. . 
	ld a,081h		;8545	3e 81 	> . 
	out (0bfh),a		;8547	d3 bf 	. . 
	ld hl,07210h		;8549	21 10 72 	! . r 
	res 0,(hl)		;854c	cb 86 	. . 
	ld hl,l8606h		;854e	21 06 86 	! . . 
	push hl			;8551	e5 	. 
l8552h:
	pop hl			;8552	e1 	. 
l8553h:
	ld c,(hl)			;8553	4e 	N 
	inc hl			;8554	23 	# 
	ld b,(hl)			;8555	46 	F 
	inc hl			;8556	23 	# 
	ld a,b			;8557	78 	x 
	or c			;8558	b1 	. 
	jr nz,l85beh		;8559	20 63 	  c 
	ld a,09fh		;855b	3e 9f 	> . 
	out (0e0h),a		;855d	d3 e0 	. . 
	ld a,0bfh		;855f	3e bf 	> . 
	out (0e0h),a		;8561	d3 e0 	. . 
	ld a,0dfh		;8563	3e df 	> . 
	out (0e0h),a		;8565	d3 e0 	. . 
	ld a,0ffh		;8567	3e ff 	> . 
	out (0e0h),a		;8569	d3 e0 	. . 
	ld a,0e7h		;856b	3e e7 	> . 
	out (0e0h),a		;856d	d3 e0 	. . 
	ld a,0f0h		;856f	3e f0 	> . 
	out (0e0h),a		;8571	d3 e0 	. . 
	ld b,010h		;8573	06 10 	. . 
	ld c,0c0h		;8575	0e c0 	. . 
l8577h:
	call sub_85fch		;8577	cd fc 85 	. . . 
	ld a,c			;857a	79 	y 
l857bh:
	out (0e0h),a		;857b	d3 e0 	. . 
	xor a			;857d	af 	. 
	out (0e0h),a		;857e	d3 e0 	. . 
	inc c			;8580	0c 	. 
	djnz l8577h		;8581	10 f4 	. . 
	ld a,0f2h		;8583	3e f2 	> . 
	out (0e0h),a		;8585	d3 e0 	. . 
	ld b,010h		;8587	06 10 	. . 
	ld c,0c0h		;8589	0e c0 	. . 
l858bh:
	call sub_85fch		;858b	cd fc 85 	. . . 
	ld a,c			;858e	79 	y 
	out (0e0h),a		;858f	d3 e0 	. . 
	ld a,001h		;8591	3e 01 	> . 
	out (0e0h),a		;8593	d3 e0 	. . 
	inc c			;8595	0c 	. 
	djnz l858bh		;8596	10 f3 	. . 
	ld a,0f4h		;8598	3e f4 	> . 
	out (0e0h),a		;859a	d3 e0 	. . 
	ld b,010h		;859c	06 10 	. . 
	ld c,0c0h		;859e	0e c0 	. . 
l85a0h:
	call sub_85fch		;85a0	cd fc 85 	. . . 
	ld a,c			;85a3	79 	y 
	out (0e0h),a		;85a4	d3 e0 	. . 
	ld a,002h		;85a6	3e 02 	> . 
	out (0e0h),a		;85a8	d3 e0 	. . 
	inc c			;85aa	0c 	. 
	djnz l85a0h		;85ab	10 f3 	. . 
	ld a,09fh		;85ad	3e 9f 	> . 
	out (0e0h),a		;85af	d3 e0 	. . 
	ld a,0bfh		;85b1	3e bf 	> . 
	out (0e0h),a		;85b3	d3 e0 	. . 
	ld a,0dfh		;85b5	3e df 	> . 
	out (0e0h),a		;85b7	d3 e0 	. . 
	ld a,0ffh		;85b9	3e ff 	> . 
	out (0e0h),a		;85bb	d3 e0 	. . 
	ret			;85bd	c9 	. 
l85beh:
	push bc			;85be	c5 	. 
	ld b,00bh		;85bf	06 0b 	. . 
	ld c,0e0h		;85c1	0e e0 	. . 
	otir		;85c3	ed b3 	. . 
	pop bc			;85c5	c1 	. 
	push hl			;85c6	e5 	. 
l85c7h:
	ld hl,07210h		;85c7	21 10 72 	! . r 
	bit 0,(hl)		;85ca	cb 46 	. F 
	jr z,l85c7h		;85cc	28 f9 	( . 
	res 0,(hl)		;85ce	cb 86 	. . 
	dec bc			;85d0	0b 	. 
	ld a,b			;85d1	78 	x 
	or c			;85d2	b1 	. 
	jr nz,l85c7h		;85d3	20 f2 	  . 
	ld a,09fh		;85d5	3e 9f 	> . 
	out (0e0h),a		;85d7	d3 e0 	. . 
	ld a,0bfh		;85d9	3e bf 	> . 
	out (0e0h),a		;85db	d3 e0 	. . 
	ld a,0dfh		;85dd	3e df 	> . 
	out (0e0h),a		;85df	d3 e0 	. . 
	ld a,0ffh		;85e1	3e ff 	> . 
	out (0e0h),a		;85e3	d3 e0 	. . 
	pop hl			;85e5	e1 	. 
	ld a,(hl)			;85e6	7e 	~ 
	inc hl			;85e7	23 	# 
	push hl			;85e8	e5 	. 
	or a			;85e9	b7 	. 
	jp z,l8552h		;85ea	ca 52 85 	. R . 
	ld b,a			;85ed	47 	G 
l85eeh:
	ld hl,07210h		;85ee	21 10 72 	! . r 
	bit 0,(hl)		;85f1	cb 46 	. F 
	jr z,l85eeh		;85f3	28 f9 	( . 
	res 0,(hl)		;85f5	cb 86 	. . 
	djnz l85eeh		;85f7	10 f5 	. . 
	jp l8552h		;85f9	c3 52 85 	. R . 
sub_85fch:
	ld hl,07210h		;85fc	21 10 72 	! . r 
	bit 0,(hl)		;85ff	cb 46 	. F 
	jr z,sub_85fch		;8601	28 f9 	( . 
	res 0,(hl)		;8603	cb 86 	. . 
	ret			;8605	c9 	. 
l8606h:
	rrca			;8606	0f 	. 
	nop			;8607	00 	. 
	adc a,c			;8608	89 	. 
	ld a,(bc)			;8609	0a 	. 
	sub (hl)			;860a	96 	. 
	and l			;860b	a5 	. 
	dec c			;860c	0d 	. 
	or (hl)			;860d	b6 	. 
	adc a,011h		;860e	ce 11 	. . 
	sub 0e0h		;8610	d6 e0 	. . 
	rst 38h			;8612	ff 	. 
	dec b			;8613	05 	. 
	rrca			;8614	0f 	. 
	nop			;8615	00 	. 
	add a,l			;8616	85 	. 
	dec c			;8617	0d 	. 
	sbc a,c			;8618	99 	. 
	xor (hl)			;8619	ae 	. 
	ld de,0c3b9h		;861a	11 b9 c3 	. . . 
	dec d			;861d	15 	. 
	exx			;861e	d9 	. 
	ret po			;861f	e0 	. 
	rst 38h			;8620	ff 	. 
	dec b			;8621	05 	. 
	rrca			;8622	0f 	. 
	nop			;8623	00 	. 
	adc a,(hl)			;8624	8e 	. 
	dec bc			;8625	0b 	. 
	sub a			;8626	97 	. 
	and d			;8627	a2 	. 
	ld c,0b7h		;8628	0e b7 	. . 
	ret nz			;862a	c0 	. 
	inc d			;862b	14 	. 
	rst 10h			;862c	d7 	. 
	ret po			;862d	e0 	. 
	rst 38h			;862e	ff 	. 
	dec b			;862f	05 	. 
	rrca			;8630	0f 	. 
	nop			;8631	00 	. 
	adc a,(hl)			;8632	8e 	. 
	ld de,0a099h		;8633	11 99 a0 	. . . 
	inc d			;8636	14 	. 
	cp c			;8637	b9 	. 
	call z,0d917h		;8638	cc 17 d9 	. . . 
	ret po			;863b	e0 	. 
	rst 38h			;863c	ff 	. 
	dec b			;863d	05 	. 
	rrca			;863e	0f 	. 
	nop			;863f	00 	. 
	adc a,(hl)			;8640	8e 	. 
	ld de,0a096h		;8641	11 96 a0 	. . . 
	inc d			;8644	14 	. 
	or (hl)			;8645	b6 	. 
	call z,0d617h		;8646	cc 17 d6 	. . . 
	ret po			;8649	e0 	. 
	rst 38h			;864a	ff 	. 
	dec b			;864b	05 	. 
	rrca			;864c	0f 	. 
	nop			;864d	00 	. 
	adc a,(hl)			;864e	8e 	. 
	dec bc			;864f	0b 	. 
	sbc a,c			;8650	99 	. 
	and d			;8651	a2 	. 
	ld c,0b9h		;8652	0e b9 	. . 
	ret nz			;8654	c0 	. 
	inc d			;8655	14 	. 
	exx			;8656	d9 	. 
	ret po			;8657	e0 	. 
	rst 38h			;8658	ff 	. 
	dec b			;8659	05 	. 
	rrca			;865a	0f 	. 
	nop			;865b	00 	. 
	adc a,c			;865c	89 	. 
	ld a,(bc)			;865d	0a 	. 
	sub a			;865e	97 	. 
	and l			;865f	a5 	. 
	dec c			;8660	0d 	. 
	or a			;8661	b7 	. 
	adc a,011h		;8662	ce 11 	. . 
	rst 10h			;8664	d7 	. 
	ret po			;8665	e0 	. 
	rst 38h			;8666	ff 	. 
	dec b			;8667	05 	. 
	rrca			;8668	0f 	. 
	nop			;8669	00 	. 
	add a,l			;866a	85 	. 
	dec c			;866b	0d 	. 
	sbc a,c			;866c	99 	. 
	xor (hl)			;866d	ae 	. 
	ld de,0c3b9h		;866e	11 b9 c3 	. . . 
	dec d			;8671	15 	. 
	exx			;8672	d9 	. 
	ret po			;8673	e0 	. 
	rst 38h			;8674	ff 	. 
	dec b			;8675	05 	. 
	nop			;8676	00 	. 
	nop			;8677	00 	. 
l8678h:
	push af			;8678	f5 	. 
	push hl			;8679	e5 	. 
	ld hl,07210h		;867a	21 10 72 	! . r 
	set 0,(hl)		;867d	cb c6 	. . 
	in a,(0bfh)		;867f	db bf 	. . 
	pop hl			;8681	e1 	. 
	pop af			;8682	f1 	. 
	retn		;8683	ed 45 	. E 
sub_8685h:
	ld de,04800h		;8685	11 00 48 	. . H 
	ld hl,l8817h		;8688	21 17 88 	! . . 
	ld bc,00230h		;868b	01 30 02 	. 0 . 
l868eh:
	di			;868e	f3 	. 
	ld a,e			;868f	7b 	{ 
	out (0bfh),a		;8690	d3 bf 	. . 
	nop			;8692	00 	. 
	nop			;8693	00 	. 
	nop			;8694	00 	. 
	nop			;8695	00 	. 
	ld a,d			;8696	7a 	z 
	out (0bfh),a		;8697	d3 bf 	. . 
	ld a,(hl)			;8699	7e 	~ 
	nop			;869a	00 	. 
	nop			;869b	00 	. 
	nop			;869c	00 	. 
	nop			;869d	00 	. 
	nop			;869e	00 	. 
	nop			;869f	00 	. 
	nop			;86a0	00 	. 
	nop			;86a1	00 	. 
	nop			;86a2	00 	. 
	nop			;86a3	00 	. 
	out (0beh),a		;86a4	d3 be 	. . 
	ei			;86a6	fb 	. 
	inc de			;86a7	13 	. 
	inc hl			;86a8	23 	# 
	dec bc			;86a9	0b 	. 
	ld a,b			;86aa	78 	x 
	or c			;86ab	b1 	. 
	jr nz,l868eh		;86ac	20 e0 	  . 
	ret			;86ae	c9 	. 
sub_86afh:
	ld de,04700h		;86af	11 00 47 	. . G 
	ld b,020h		;86b2	06 20 	.   
	ld a,0f1h		;86b4	3e f1 	> . 
	ld c,006h		;86b6	0e 06 	. . 
l86b8h:
	call sub_8733h		;86b8	cd 33 87 	. 3 . 
	dec c			;86bb	0d 	. 
	jr nz,l86c0h		;86bc	20 02 	  . 
	ld a,01fh		;86be	3e 1f 	> . 
l86c0h:
	inc de			;86c0	13 	. 
	djnz l86b8h		;86c1	10 f5 	. . 
	ret			;86c3	c9 	. 
sub_86c4h:
	ld hl,l86ceh		;86c4	21 ce 86 	! . . 
	ld b,010h		;86c7	06 10 	. . 
	ld c,0bfh		;86c9	0e bf 	. . 
	otir		;86cb	ed b3 	. . 
	ret			;86cd	c9 	. 
l86ceh:
	nop			;86ce	00 	. 
	add a,b			;86cf	80 	. 
	jp 00181h		;86d0	c3 81 01 	. . . 
	add a,d			;86d3	82 	. 
	inc e			;86d4	1c 	. 
	add a,e			;86d5	83 	. 
	ld bc,00084h		;86d6	01 84 00 	. . . 
	add a,l			;86d9	85 	. 
	ld (bc),a			;86da	02 	. 
	add a,(hl)			;86db	86 	. 
	nop			;86dc	00 	. 
	add a,a			;86dd	87 	. 
sub_86deh:
	ld b,018h		;86de	06 18 	. . 
	ld c,001h		;86e0	0e 01 	. . 
l86e2h:
	push bc			;86e2	c5 	. 
	call sub_86ebh		;86e3	cd eb 86 	. . . 
	pop bc			;86e6	c1 	. 
	inc c			;86e7	0c 	. 
	djnz l86e2h		;86e8	10 f8 	. . 
	ret			;86ea	c9 	. 
sub_86ebh:
	ld hl,043e0h		;86eb	21 e0 43 	! . C 
	ld de,00020h		;86ee	11 20 00 	.   . 
l86f1h:
	add hl,de			;86f1	19 	. 
	dec c			;86f2	0d 	. 
	jr nz,l86f1h		;86f3	20 fc 	  . 
	ld c,020h		;86f5	0e 20 	.   
	xor a			;86f7	af 	. 
	ex de,hl			;86f8	eb 	. 
l86f9h:
	call sub_8733h		;86f9	cd 33 87 	. 3 . 
	inc de			;86fc	13 	. 
	dec c			;86fd	0d 	. 
	jr nz,l86f9h		;86fe	20 f9 	  . 
	ret			;8700	c9 	. 
sub_8701h:
	call sub_8724h		;8701	cd 24 87 	. $ . 
l8704h:
	jp l8a77h		;8704	c3 77 8a 	. w . 
l8707h:
	call sub_8711h		;8707	cd 11 87 	. . . 
	call sub_8733h		;870a	cd 33 87 	. 3 . 
	inc de			;870d	13 	. 
	inc hl			;870e	23 	# 
	jr l8704h		;870f	18 f3 	. . 
sub_8711h:
	ld iy,l878dh		;8711	fd 21 8d 87 	. ! . . 
l8715h:
	cp (iy+000h)		;8715	fd be 00 	. . . 
	jr z,l8720h		;8718	28 06 	( . 
	inc iy		;871a	fd 23 	. # 
	inc iy		;871c	fd 23 	. # 
	jr l8715h		;871e	18 f5 	. . 
l8720h:
	ld a,(iy+001h)		;8720	fd 7e 01 	. ~ . 
	ret			;8723	c9 	. 
sub_8724h:
	push hl			;8724	e5 	. 
	ld hl,043e0h		;8725	21 e0 43 	! . C 
	ld de,00020h		;8728	11 20 00 	.   . 
l872bh:
	add hl,de			;872b	19 	. 
	djnz l872bh		;872c	10 fd 	. . 
	ld e,c			;872e	59 	Y 
	add hl,de			;872f	19 	. 
	ex de,hl			;8730	eb 	. 
	pop hl			;8731	e1 	. 
	ret			;8732	c9 	. 
sub_8733h:
	di			;8733	f3 	. 
	push af			;8734	f5 	. 
	ld a,e			;8735	7b 	{ 
	out (0bfh),a		;8736	d3 bf 	. . 
	nop			;8738	00 	. 
	nop			;8739	00 	. 
	nop			;873a	00 	. 
	nop			;873b	00 	. 
	ld a,d			;873c	7a 	z 
	out (0bfh),a		;873d	d3 bf 	. . 
	pop af			;873f	f1 	. 
	nop			;8740	00 	. 
	nop			;8741	00 	. 
	nop			;8742	00 	. 
	nop			;8743	00 	. 
	nop			;8744	00 	. 
	nop			;8745	00 	. 
	nop			;8746	00 	. 
	nop			;8747	00 	. 
	nop			;8748	00 	. 
	nop			;8749	00 	. 
	out (0beh),a		;874a	d3 be 	. . 
	ei			;874c	fb 	. 
	ret			;874d	c9 	. 
sub_874eh:
	ld de,04000h		;874e	11 00 40 	. . @ 
	ld bc,02000h		;8751	01 00 20 	. .   
l8754h:
	ld a,000h		;8754	3e 00 	> . 
	call sub_8733h		;8756	cd 33 87 	. 3 . 
	inc de			;8759	13 	. 
	dec bc			;875a	0b 	. 
	ld a,b			;875b	78 	x 
	or c			;875c	b1 	. 
	jr nz,l8754h		;875d	20 f5 	  . 
sub_875fh:
	call sub_86c4h		;875f	cd c4 86 	. . . 
	call sub_86deh		;8762	cd de 86 	. . . 
	call sub_86afh		;8765	cd af 86 	. . . 
	call sub_8685h		;8768	cd 85 86 	. . . 
	ret			;876b	c9 	. 
sub_876ch:
	ld a,(iy+000h)		;876c	fd 7e 00 	. ~ . 
l876fh:
	or (iy+001h)		;876f	fd b6 01 	. . . 
	ret z			;8772	c8 	. 
	ld l,(iy+000h)		;8773	fd 6e 00 	. n . 
	ld h,(iy+001h)		;8776	fd 66 01 	. f . 
	ld c,(iy+002h)		;8779	fd 4e 02 	. N . 
	ld b,(iy+003h)		;877c	fd 46 03 	. F . 
	push iy		;877f	fd e5 	. . 
	call sub_8701h		;8781	cd 01 87 	. . . 
	pop iy		;8784	fd e1 	. . 
	ld de,00004h		;8786	11 04 00 	. . . 
	add iy,de		;8789	fd 19 	. . 
	jr sub_876ch		;878b	18 df 	. . 
l878dh:
	jr nz,l878fh		;878d	20 00 	  . 
l878fh:
	jr nc,$+3		;878f	30 01 	0 . 
	ld sp,03202h		;8791	31 02 32 	1 . 2 
	inc bc			;8794	03 	. 
	inc sp			;8795	33 	3 
	inc b			;8796	04 	. 
	inc (hl)			;8797	34 	4 
	dec b			;8798	05 	. 
	dec (hl)			;8799	35 	5 
	ld b,036h		;879a	06 36 	. 6 
	rlca			;879c	07 	. 
	scf			;879d	37 	7 
	ex af,af'			;879e	08 	. 
	jr c,l87aah		;879f	38 09 	8 . 
	add hl,sp			;87a1	39 	9 
	ld a,(bc)			;87a2	0a 	. 
	ld b,c			;87a3	41 	A 
	dec bc			;87a4	0b 	. 
	ld b,d			;87a5	42 	B 
	inc c			;87a6	0c 	. 
	ld b,e			;87a7	43 	C 
	dec c			;87a8	0d 	. 
	ld b,h			;87a9	44 	D 
l87aah:
	ld c,045h		;87aa	0e 45 	. E 
	rrca			;87ac	0f 	. 
	ld b,(hl)			;87ad	46 	F 
	djnz l87f7h		;87ae	10 47 	. G 
	ld de,01248h		;87b0	11 48 12 	. H . 
	ld c,c			;87b3	49 	I 
	inc de			;87b4	13 	. 
	ld c,d			;87b5	4a 	J 
	inc d			;87b6	14 	. 
	ld c,e			;87b7	4b 	K 
	dec d			;87b8	15 	. 
	ld c,h			;87b9	4c 	L 
	ld d,04dh		;87ba	16 4d 	. M 
	rla			;87bc	17 	. 
	ld c,(hl)			;87bd	4e 	N 
	jr l880fh		;87be	18 4f 	. O 
	add hl,de			;87c0	19 	. 
	ld d,b			;87c1	50 	P 
	ld a,(de)			;87c2	1a 	. 
	ld d,c			;87c3	51 	Q 
	dec de			;87c4	1b 	. 
	ld d,d			;87c5	52 	R 
	inc e			;87c6	1c 	. 
	ld d,e			;87c7	53 	S 
	dec e			;87c8	1d 	. 
	ld d,h			;87c9	54 	T 
	ld e,055h		;87ca	1e 55 	. U 
	rra			;87cc	1f 	. 
	ld d,(hl)			;87cd	56 	V 
	jr nz,l8827h		;87ce	20 57 	  W 
	ld hl,02258h		;87d0	21 58 22 	! X " 
	ld e,c			;87d3	59 	Y 
	inc hl			;87d4	23 	# 
	ld e,d			;87d5	5a 	Z 
	inc h			;87d6	24 	$ 
	ld h,b			;87d7	60 	` 
	dec h			;87d8	25 	% 
	ld h,c			;87d9	61 	a 
	ld h,062h		;87da	26 62 	& b 
	daa			;87dc	27 	' 
	ld h,e			;87dd	63 	c 
	jr z,l8844h		;87de	28 64 	( d 
	add hl,hl			;87e0	29 	) 
	ld h,l			;87e1	65 	e 
	ld hl,(02b66h)		;87e2	2a 66 2b 	* f + 
	ld h,a			;87e5	67 	g 
	inc l			;87e6	2c 	, 
	ld l,b			;87e7	68 	h 
	dec l			;87e8	2d 	- 
	ld l,c			;87e9	69 	i 
	ld l,080h		;87ea	2e 80 	. . 
	jr nc,l876fh		;87ec	30 81 	0 . 
	ld sp,03282h		;87ee	31 82 32 	1 . 2 
	add a,e			;87f1	83 	. 
	inc sp			;87f2	33 	3 
	add a,h			;87f3	84 	. 
	inc (hl)			;87f4	34 	4 
	add a,l			;87f5	85 	. 
	dec (hl)			;87f6	35 	5 
l87f7h:
	add a,(hl)			;87f7	86 	. 
	ld (hl),087h		;87f8	36 87 	6 . 
	scf			;87fa	37 	7 
	adc a,b			;87fb	88 	. 
	jr c,$-117		;87fc	38 89 	8 . 
	add hl,sp			;87fe	39 	9 
	adc a,d			;87ff	8a 	. 
sub_8800h:
	ld a,(03b8bh)		;8800	3a 8b 3b 	: . ; 
	adc a,h			;8803	8c 	. 
	inc a			;8804	3c 	< 
	adc a,l			;8805	8d 	. 
	dec a			;8806	3d 	= 
	adc a,(hl)			;8807	8e 	. 
	ld a,08fh		;8808	3e 8f 	> . 
	ccf			;880a	3f 	? 
	sub b			;880b	90 	. 
	ld b,b			;880c	40 	@ 
	sub c			;880d	91 	. 
	ld b,c			;880e	41 	A 
l880fh:
	sub d			;880f	92 	. 
	ld b,d			;8810	42 	B 
	sub e			;8811	93 	. 
	ld b,e			;8812	43 	C 
	sub h			;8813	94 	. 
	ld b,h			;8814	44 	D 
	sub l			;8815	95 	. 
	ld b,l			;8816	45 	E 
l8817h:
	nop			;8817	00 	. 
	nop			;8818	00 	. 
	nop			;8819	00 	. 
	nop			;881a	00 	. 
	nop			;881b	00 	. 
	nop			;881c	00 	. 
	nop			;881d	00 	. 
	nop			;881e	00 	. 
	nop			;881f	00 	. 
	inc a			;8820	3c 	< 
	ld b,d			;8821	42 	B 
	ld b,d			;8822	42 	B 
	ld b,d			;8823	42 	B 
	ld b,d			;8824	42 	B 
	ld b,d			;8825	42 	B 
	inc a			;8826	3c 	< 
l8827h:
	nop			;8827	00 	. 
	ex af,af'			;8828	08 	. 
	jr l8833h		;8829	18 08 	. . 
	ex af,af'			;882b	08 	. 
	ex af,af'			;882c	08 	. 
	ex af,af'			;882d	08 	. 
	ld a,000h		;882e	3e 00 	> . 
	inc a			;8830	3c 	< 
	ld b,d			;8831	42 	B 
	ld (bc),a			;8832	02 	. 
l8833h:
	inc e			;8833	1c 	. 
	jr nz,l8876h		;8834	20 40 	  @ 
	ld a,(hl)			;8836	7e 	~ 
	nop			;8837	00 	. 
	inc a			;8838	3c 	< 
	ld b,d			;8839	42 	B 
	ld (bc),a			;883a	02 	. 
	inc e			;883b	1c 	. 
	ld (bc),a			;883c	02 	. 
	ld b,d			;883d	42 	B 
	inc a			;883e	3c 	< 
	nop			;883f	00 	. 
	inc h			;8840	24 	$ 
	inc h			;8841	24 	$ 
	ld b,h			;8842	44 	D 
	ld a,(hl)			;8843	7e 	~ 
l8844h:
	inc b			;8844	04 	. 
	inc b			;8845	04 	. 
	inc b			;8846	04 	. 
	nop			;8847	00 	. 
	ld a,(hl)			;8848	7e 	~ 
	ld b,b			;8849	40 	@ 
	ld b,b			;884a	40 	@ 
	ld a,h			;884b	7c 	| 
	ld (bc),a			;884c	02 	. 
	ld b,d			;884d	42 	B 
	inc a			;884e	3c 	< 
	nop			;884f	00 	. 
	inc a			;8850	3c 	< 
	ld b,d			;8851	42 	B 
	ld b,b			;8852	40 	@ 
	ld a,h			;8853	7c 	| 
	ld b,d			;8854	42 	B 
	ld b,d			;8855	42 	B 
	inc a			;8856	3c 	< 
	nop			;8857	00 	. 
	ld a,(hl)			;8858	7e 	~ 
	ld (bc),a			;8859	02 	. 
	ld (bc),a			;885a	02 	. 
	inc b			;885b	04 	. 
	ex af,af'			;885c	08 	. 
	ex af,af'			;885d	08 	. 
	ex af,af'			;885e	08 	. 
	nop			;885f	00 	. 
	inc a			;8860	3c 	< 
	ld b,d			;8861	42 	B 
	ld b,d			;8862	42 	B 
	inc a			;8863	3c 	< 
	ld b,d			;8864	42 	B 
	ld b,d			;8865	42 	B 
	inc a			;8866	3c 	< 
	nop			;8867	00 	. 
	inc a			;8868	3c 	< 
	ld b,d			;8869	42 	B 
	ld b,d			;886a	42 	B 
	ld a,002h		;886b	3e 02 	> . 
	ld b,d			;886d	42 	B 
	inc a			;886e	3c 	< 
	nop			;886f	00 	. 
	jr l8896h		;8870	18 24 	. $ 
	ld b,d			;8872	42 	B 
	ld a,(hl)			;8873	7e 	~ 
	ld b,d			;8874	42 	B 
	ld b,d			;8875	42 	B 
l8876h:
	ld b,d			;8876	42 	B 
	nop			;8877	00 	. 
	ld a,h			;8878	7c 	| 
	ld b,d			;8879	42 	B 
	ld b,d			;887a	42 	B 
	ld a,h			;887b	7c 	| 
	ld b,d			;887c	42 	B 
	ld b,d			;887d	42 	B 
	ld a,h			;887e	7c 	| 
	nop			;887f	00 	. 
	inc a			;8880	3c 	< 
	ld b,d			;8881	42 	B 
	ld b,b			;8882	40 	@ 
	ld b,b			;8883	40 	@ 
	ld b,b			;8884	40 	@ 
	ld b,d			;8885	42 	B 
	inc a			;8886	3c 	< 
	nop			;8887	00 	. 
	ld a,h			;8888	7c 	| 
	ld b,d			;8889	42 	B 
	ld b,d			;888a	42 	B 
	ld b,d			;888b	42 	B 
	ld b,d			;888c	42 	B 
	ld b,d			;888d	42 	B 
	ld a,h			;888e	7c 	| 
	nop			;888f	00 	. 
	ld a,(hl)			;8890	7e 	~ 
	ld b,b			;8891	40 	@ 
	ld b,b			;8892	40 	@ 
	ld a,b			;8893	78 	x 
	ld b,b			;8894	40 	@ 
	ld b,b			;8895	40 	@ 
l8896h:
	ld a,(hl)			;8896	7e 	~ 
	nop			;8897	00 	. 
	ld a,(hl)			;8898	7e 	~ 
	ld b,b			;8899	40 	@ 
	ld b,b			;889a	40 	@ 
	ld a,b			;889b	78 	x 
	ld b,b			;889c	40 	@ 
	ld b,b			;889d	40 	@ 
	ld b,b			;889e	40 	@ 
	nop			;889f	00 	. 
	inc a			;88a0	3c 	< 
	ld b,d			;88a1	42 	B 
	ld b,b			;88a2	40 	@ 
	ld b,b			;88a3	40 	@ 
	ld b,(hl)			;88a4	46 	F 
	ld b,d			;88a5	42 	B 
	ld a,000h		;88a6	3e 00 	> . 
	ld b,d			;88a8	42 	B 
	ld b,d			;88a9	42 	B 
	ld b,d			;88aa	42 	B 
	ld a,(hl)			;88ab	7e 	~ 
	ld b,d			;88ac	42 	B 
	ld b,d			;88ad	42 	B 
	ld b,d			;88ae	42 	B 
	nop			;88af	00 	. 
	ld a,h			;88b0	7c 	| 
	djnz l88c3h		;88b1	10 10 	. . 
	djnz l88c5h		;88b3	10 10 	. . 
	djnz $+126		;88b5	10 7c 	. | 
	nop			;88b7	00 	. 
	ld (bc),a			;88b8	02 	. 
	ld (bc),a			;88b9	02 	. 
	ld (bc),a			;88ba	02 	. 
	ld (bc),a			;88bb	02 	. 
	ld b,d			;88bc	42 	B 
	ld b,h			;88bd	44 	D 
	jr c,l88c0h		;88be	38 00 	8 . 
l88c0h:
	ld b,d			;88c0	42 	B 
	ld b,h			;88c1	44 	D 
	ld c,b			;88c2	48 	H 
l88c3h:
	ld d,h			;88c3	54 	T 
	ld h,h			;88c4	64 	d 
l88c5h:
	ld b,d			;88c5	42 	B 
	ld b,d			;88c6	42 	B 
	nop			;88c7	00 	. 
	ld b,b			;88c8	40 	@ 
	ld b,b			;88c9	40 	@ 
	ld b,b			;88ca	40 	@ 
	ld b,b			;88cb	40 	@ 
	ld b,b			;88cc	40 	@ 
	ld b,b			;88cd	40 	@ 
	ld a,(hl)			;88ce	7e 	~ 
	nop			;88cf	00 	. 
	ld b,d			;88d0	42 	B 
	ld h,(hl)			;88d1	66 	f 
	ld e,d			;88d2	5a 	Z 
	ld b,d			;88d3	42 	B 
	ld b,d			;88d4	42 	B 
	ld b,d			;88d5	42 	B 
	ld b,d			;88d6	42 	B 
	nop			;88d7	00 	. 
	ld b,d			;88d8	42 	B 
	ld h,d			;88d9	62 	b 
	ld d,d			;88da	52 	R 
	ld c,d			;88db	4a 	J 
	ld b,(hl)			;88dc	46 	F 
	ld b,d			;88dd	42 	B 
	ld b,d			;88de	42 	B 
	nop			;88df	00 	. 
	inc a			;88e0	3c 	< 
	ld b,d			;88e1	42 	B 
	ld b,d			;88e2	42 	B 
	ld b,d			;88e3	42 	B 
	ld b,d			;88e4	42 	B 
	ld b,d			;88e5	42 	B 
	inc a			;88e6	3c 	< 
	nop			;88e7	00 	. 
	ld a,h			;88e8	7c 	| 
	ld b,d			;88e9	42 	B 
	ld b,d			;88ea	42 	B 
	ld a,h			;88eb	7c 	| 
	ld b,b			;88ec	40 	@ 
	ld b,b			;88ed	40 	@ 
	ld b,b			;88ee	40 	@ 
	nop			;88ef	00 	. 
	inc a			;88f0	3c 	< 
	ld b,d			;88f1	42 	B 
	ld b,d			;88f2	42 	B 
	ld b,d			;88f3	42 	B 
	ld c,d			;88f4	4a 	J 
	ld b,h			;88f5	44 	D 
	ld a,(07c00h)		;88f6	3a 00 7c 	: . | 
	ld b,d			;88f9	42 	B 
	ld b,d			;88fa	42 	B 
	ld a,h			;88fb	7c 	| 
	ld b,h			;88fc	44 	D 
	ld b,d			;88fd	42 	B 
	ld b,d			;88fe	42 	B 
	nop			;88ff	00 	. 
	inc a			;8900	3c 	< 
	ld b,d			;8901	42 	B 
	ld b,b			;8902	40 	@ 
	inc a			;8903	3c 	< 
	ld (bc),a			;8904	02 	. 
	ld b,d			;8905	42 	B 
	inc a			;8906	3c 	< 
	nop			;8907	00 	. 
	ld a,h			;8908	7c 	| 
	djnz l891bh		;8909	10 10 	. . 
	djnz l891dh		;890b	10 10 	. . 
	djnz $+18		;890d	10 10 	. . 
	nop			;890f	00 	. 
	ld b,d			;8910	42 	B 
	ld b,d			;8911	42 	B 
	ld b,d			;8912	42 	B 
	ld b,d			;8913	42 	B 
	ld b,d			;8914	42 	B 
	ld b,d			;8915	42 	B 
	inc a			;8916	3c 	< 
	nop			;8917	00 	. 
	ld b,d			;8918	42 	B 
	ld b,d			;8919	42 	B 
	ld b,d			;891a	42 	B 
l891bh:
	ld b,d			;891b	42 	B 
	inc h			;891c	24 	$ 
l891dh:
	inc h			;891d	24 	$ 
	jr l8920h		;891e	18 00 	. . 
l8920h:
	ld b,d			;8920	42 	B 
	ld b,d			;8921	42 	B 
	ld b,d			;8922	42 	B 
	ld e,d			;8923	5a 	Z 
	ld e,d			;8924	5a 	Z 
	ld e,d			;8925	5a 	Z 
	inc h			;8926	24 	$ 
	nop			;8927	00 	. 
	ld b,d			;8928	42 	B 
l8929h:
	ld b,d			;8929	42 	B 
	inc h			;892a	24 	$ 
	jr l8951h		;892b	18 24 	. $ 
	ld b,d			;892d	42 	B 
	ld b,d			;892e	42 	B 
	nop			;892f	00 	. 
	ld b,h			;8930	44 	D 
	ld b,h			;8931	44 	D 
	jr z,l8944h		;8932	28 10 	( . 
	djnz l8946h		;8934	10 10 	. . 
	djnz l8938h		;8936	10 00 	. . 
l8938h:
	ld a,(hl)			;8938	7e 	~ 
	inc b			;8939	04 	. 
	ex af,af'			;893a	08 	. 
	djnz l895dh		;893b	10 20 	.   
	ld b,b			;893d	40 	@ 
	ld a,(hl)			;893e	7e 	~ 
	nop			;893f	00 	. 
	ld h,b			;8940	60 	` 
	add a,b			;8941	80 	. 
	ld d,c			;8942	51 	Q 
	dec (hl)			;8943	35 	5 
l8944h:
	push de			;8944	d5 	. 
	dec d			;8945	15 	. 
l8946h:
	ld a,(bc)			;8946	0a 	. 
	nop			;8947	00 	. 
	ld h,b			;8948	60 	` 
	add a,b			;8949	80 	. 
	ld e,a			;894a	5f 	_ 
	jr nc,l8929h		;894b	30 dc 	0 . 
	djnz l896eh		;894d	10 1f 	. . 
	nop			;894f	00 	. 
	sub b			;8950	90 	. 
l8951h:
	ret nc			;8951	d0 	. 
	or c			;8952	b1 	. 
	or l			;8953	b5 	. 
	sub l			;8954	95 	. 
	dec d			;8955	15 	. 
	ld a,(bc)			;8956	0a 	. 
	nop			;8957	00 	. 
	sub b			;8958	90 	. 
	ret nc			;8959	d0 	. 
	cp a			;895a	bf 	. 
	or b			;895b	b0 	. 
	sbc a,h			;895c	9c 	. 
l895dh:
	djnz l897eh		;895d	10 1f 	. . 
	nop			;895f	00 	. 
	ret p			;8960	f0 	. 
	add a,b			;8961	80 	. 
	ret z			;8962	c8 	. 
	adc a,b			;8963	88 	. 
	adc a,b			;8964	88 	. 
	ex af,af'			;8965	08 	. 
	ld c,000h		;8966	0e 00 	. . 
	ret p			;8968	f0 	. 
	add a,b			;8969	80 	. 
	call z,sub_8c8ah		;896a	cc 8a 8c 	. . . 
	ld a,(bc)			;896d	0a 	. 
l896eh:
	ld a,(bc)			;896e	0a 	. 
	nop			;896f	00 	. 
	ret nz			;8970	c0 	. 
	and b			;8971	a0 	. 
	call nz,0a4a8h		;8972	c4 a8 a4 	. . . 
	ld (bc),a			;8975	02 	. 
	inc b			;8976	04 	. 
	nop			;8977	00 	. 
	djnz l89ceh		;8978	10 54 	. T 
l897ah:
	jr c,l897ah		;897a	38 fe 	8 . 
	jr c,l89d2h		;897c	38 54 	8 T 
l897eh:
	djnz l8980h		;897e	10 00 	. . 
l8980h:
	nop			;8980	00 	. 
	djnz l899fh		;8981	10 1c 	. . 
	cp 01ch		;8983	fe 1c 	. . 
	djnz l8987h		;8985	10 00 	. . 
l8987h:
	nop			;8987	00 	. 
	nop			;8988	00 	. 
	djnz l89fbh		;8989	10 70 	. p 
	cp 070h		;898b	fe 70 	. p 
	djnz l898fh		;898d	10 00 	. . 
l898fh:
	nop			;898f	00 	. 
	nop			;8990	00 	. 
	nop			;8991	00 	. 
	nop			;8992	00 	. 
	nop			;8993	00 	. 
	nop			;8994	00 	. 
	nop			;8995	00 	. 
	nop			;8996	00 	. 
	nop			;8997	00 	. 
	inc a			;8998	3c 	< 
	ld b,d			;8999	42 	B 
	ld b,d			;899a	42 	B 
	ld b,d			;899b	42 	B 
	ld b,d			;899c	42 	B 
	ld b,d			;899d	42 	B 
	inc a			;899e	3c 	< 
l899fh:
	nop			;899f	00 	. 
	ex af,af'			;89a0	08 	. 
	jr l89abh		;89a1	18 08 	. . 
	ex af,af'			;89a3	08 	. 
	ex af,af'			;89a4	08 	. 
	ex af,af'			;89a5	08 	. 
	ld a,000h		;89a6	3e 00 	> . 
	inc a			;89a8	3c 	< 
	ld b,d			;89a9	42 	B 
	ld (bc),a			;89aa	02 	. 
l89abh:
	inc e			;89ab	1c 	. 
	jr nz,l89eeh		;89ac	20 40 	  @ 
	ld a,(hl)			;89ae	7e 	~ 
	nop			;89af	00 	. 
	inc a			;89b0	3c 	< 
	ld b,d			;89b1	42 	B 
	ld (bc),a			;89b2	02 	. 
	inc e			;89b3	1c 	. 
	ld (bc),a			;89b4	02 	. 
	ld b,d			;89b5	42 	B 
	inc a			;89b6	3c 	< 
	nop			;89b7	00 	. 
	inc h			;89b8	24 	$ 
	inc h			;89b9	24 	$ 
	ld b,h			;89ba	44 	D 
	ld a,(hl)			;89bb	7e 	~ 
	inc b			;89bc	04 	. 
	inc b			;89bd	04 	. 
	inc b			;89be	04 	. 
	nop			;89bf	00 	. 
	ld a,(hl)			;89c0	7e 	~ 
	ld b,b			;89c1	40 	@ 
	ld b,b			;89c2	40 	@ 
	ld a,h			;89c3	7c 	| 
	ld (bc),a			;89c4	02 	. 
	ld b,d			;89c5	42 	B 
	inc a			;89c6	3c 	< 
	nop			;89c7	00 	. 
	inc a			;89c8	3c 	< 
	ld b,d			;89c9	42 	B 
	ld b,b			;89ca	40 	@ 
	ld a,h			;89cb	7c 	| 
	ld b,d			;89cc	42 	B 
	ld b,d			;89cd	42 	B 
l89ceh:
	inc a			;89ce	3c 	< 
	nop			;89cf	00 	. 
	ld a,(hl)			;89d0	7e 	~ 
	ld (bc),a			;89d1	02 	. 
l89d2h:
	ld (bc),a			;89d2	02 	. 
	inc b			;89d3	04 	. 
	ex af,af'			;89d4	08 	. 
	ex af,af'			;89d5	08 	. 
	ex af,af'			;89d6	08 	. 
	nop			;89d7	00 	. 
	inc a			;89d8	3c 	< 
	ld b,d			;89d9	42 	B 
	ld b,d			;89da	42 	B 
	inc a			;89db	3c 	< 
	ld b,d			;89dc	42 	B 
	ld b,d			;89dd	42 	B 
	inc a			;89de	3c 	< 
	nop			;89df	00 	. 
	inc a			;89e0	3c 	< 
	ld b,d			;89e1	42 	B 
	ld b,d			;89e2	42 	B 
	ld a,002h		;89e3	3e 02 	> . 
	ld b,d			;89e5	42 	B 
	inc a			;89e6	3c 	< 
	nop			;89e7	00 	. 
	ld a,(hl)			;89e8	7e 	~ 
	ld b,b			;89e9	40 	@ 
	ld b,b			;89ea	40 	@ 
	ld a,b			;89eb	78 	x 
	ld b,b			;89ec	40 	@ 
	ld b,b			;89ed	40 	@ 
l89eeh:
	ld a,(hl)			;89ee	7e 	~ 
	nop			;89ef	00 	. 
	ld b,d			;89f0	42 	B 
l89f1h:
	ld h,d			;89f1	62 	b 
	ld d,d			;89f2	52 	R 
	ld c,d			;89f3	4a 	J 
	ld b,(hl)			;89f4	46 	F 
	ld b,d			;89f5	42 	B 
	ld b,d			;89f6	42 	B 
	nop			;89f7	00 	. 
	inc a			;89f8	3c 	< 
	ld b,d			;89f9	42 	B 
	ld b,b			;89fa	40 	@ 
l89fbh:
	inc a			;89fb	3c 	< 
	ld (bc),a			;89fc	02 	. 
	ld b,d			;89fd	42 	B 
	inc a			;89fe	3c 	< 
	nop			;89ff	00 	. 
	ld b,d			;8a00	42 	B 
	ld b,d			;8a01	42 	B 
	ld b,d			;8a02	42 	B 
	ld e,d			;8a03	5a 	Z 
	ld e,d			;8a04	5a 	Z 
	ld e,d			;8a05	5a 	Z 
	inc h			;8a06	24 	$ 
	nop			;8a07	00 	. 
	ld h,b			;8a08	60 	` 
	add a,b			;8a09	80 	. 
	ld d,c			;8a0a	51 	Q 
	dec (hl)			;8a0b	35 	5 
	push de			;8a0c	d5 	. 
	dec d			;8a0d	15 	. 
	ld a,(bc)			;8a0e	0a 	. 
	nop			;8a0f	00 	. 
	ld h,b			;8a10	60 	` 
	add a,b			;8a11	80 	. 
	ld e,a			;8a12	5f 	_ 
	jr nc,l89f1h		;8a13	30 dc 	0 . 
	djnz l8a36h		;8a15	10 1f 	. . 
	nop			;8a17	00 	. 
	sub b			;8a18	90 	. 
	ret nc			;8a19	d0 	. 
	or c			;8a1a	b1 	. 
	or l			;8a1b	b5 	. 
	sub l			;8a1c	95 	. 
	dec d			;8a1d	15 	. 
	ld a,(bc)			;8a1e	0a 	. 
	nop			;8a1f	00 	. 
	sub b			;8a20	90 	. 
	ret nc			;8a21	d0 	. 
	cp a			;8a22	bf 	. 
	or b			;8a23	b0 	. 
	sbc a,h			;8a24	9c 	. 
	djnz l8a46h		;8a25	10 1f 	. . 
	nop			;8a27	00 	. 
	ret p			;8a28	f0 	. 
	add a,b			;8a29	80 	. 
	ret z			;8a2a	c8 	. 
	adc a,b			;8a2b	88 	. 
	adc a,b			;8a2c	88 	. 
	ex af,af'			;8a2d	08 	. 
	ld c,000h		;8a2e	0e 00 	. . 
	ret p			;8a30	f0 	. 
	add a,b			;8a31	80 	. 
	call z,sub_8c8ah		;8a32	cc 8a 8c 	. . . 
	ld a,(bc)			;8a35	0a 	. 
l8a36h:
	ld a,(bc)			;8a36	0a 	. 
	nop			;8a37	00 	. 
	ret nz			;8a38	c0 	. 
	and b			;8a39	a0 	. 
	call nz,0a4a8h		;8a3a	c4 a8 a4 	. . . 
	ld (bc),a			;8a3d	02 	. 
	inc b			;8a3e	04 	. 
	nop			;8a3f	00 	. 
	djnz l8a96h		;8a40	10 54 	. T 
l8a42h:
	jr c,l8a42h		;8a42	38 fe 	8 . 
	jr c,l8a9ah		;8a44	38 54 	8 T 
l8a46h:
	djnz l8a48h		;8a46	10 00 	. . 
l8a48h:
	nop			;8a48	00 	. 
	nop			;8a49	00 	. 
	nop			;8a4a	00 	. 
	nop			;8a4b	00 	. 
	nop			;8a4c	00 	. 
	nop			;8a4d	00 	. 
	nop			;8a4e	00 	. 
	nop			;8a4f	00 	. 
	nop			;8a50	00 	. 
	nop			;8a51	00 	. 
	nop			;8a52	00 	. 
	nop			;8a53	00 	. 
	nop			;8a54	00 	. 
	nop			;8a55	00 	. 
	nop			;8a56	00 	. 
	nop			;8a57	00 	. 
	nop			;8a58	00 	. 
	nop			;8a59	00 	. 
	nop			;8a5a	00 	. 
	nop			;8a5b	00 	. 
	nop			;8a5c	00 	. 
	nop			;8a5d	00 	. 
	nop			;8a5e	00 	. 
	nop			;8a5f	00 	. 
	nop			;8a60	00 	. 
	nop			;8a61	00 	. 
	nop			;8a62	00 	. 
	nop			;8a63	00 	. 
	nop			;8a64	00 	. 
	nop			;8a65	00 	. 
	nop			;8a66	00 	. 
	nop			;8a67	00 	. 
	nop			;8a68	00 	. 
	nop			;8a69	00 	. 
	nop			;8a6a	00 	. 
	nop			;8a6b	00 	. 
	nop			;8a6c	00 	. 
	nop			;8a6d	00 	. 
	nop			;8a6e	00 	. 
	nop			;8a6f	00 	. 
	nop			;8a70	00 	. 
	nop			;8a71	00 	. 
	nop			;8a72	00 	. 
	nop			;8a73	00 	. 
	nop			;8a74	00 	. 
	nop			;8a75	00 	. 
	nop			;8a76	00 	. 
l8a77h:
	ld a,(hl)			;8a77	7e 	~ 
	cp 024h		;8a78	fe 24 	. $ 
	jp z,l8a82h		;8a7a	ca 82 8a 	. . . 
	or a			;8a7d	b7 	. 
	ret z			;8a7e	c8 	. 
	jp l8707h		;8a7f	c3 07 87 	. . . 
l8a82h:
	ld a,09fh		;8a82	3e 9f 	> . 
	out (0e0h),a		;8a84	d3 e0 	. . 
	ld a,0bfh		;8a86	3e bf 	> . 
	out (0e0h),a		;8a88	d3 e0 	. . 
	ld a,0dfh		;8a8a	3e df 	> . 
	out (0e0h),a		;8a8c	d3 e0 	. . 
	ld a,0ffh		;8a8e	3e ff 	> . 
	out (0e0h),a		;8a90	d3 e0 	. . 
	nop			;8a92	00 	. 
	nop			;8a93	00 	. 
	nop			;8a94	00 	. 
	nop			;8a95	00 	. 
l8a96h:
	nop			;8a96	00 	. 
	nop			;8a97	00 	. 
	nop			;8a98	00 	. 
	nop			;8a99	00 	. 
l8a9ah:
	call sub_8acfh		;8a9a	cd cf 8a 	. . . 
	ld a,089h		;8a9d	3e 89 	> . 
	out (0e0h),a		;8a9f	d3 e0 	. . 
	ld a,0a0h		;8aa1	3e a0 	> . 
	out (0e0h),a		;8aa3	d3 e0 	. . 
	ld a,096h		;8aa5	3e 96 	> . 
	out (0e0h),a		;8aa7	d3 e0 	. . 
	ld a,0a5h		;8aa9	3e a5 	> . 
	out (0e0h),a		;8aab	d3 e0 	. . 
	ld a,00dh		;8aad	3e 0d 	> . 
	out (0e0h),a		;8aaf	d3 e0 	. . 
	ld a,0b6h		;8ab1	3e b6 	> . 
	out (0e0h),a		;8ab3	d3 e0 	. . 
	ld a,0ceh		;8ab5	3e ce 	> . 
	out (0e0h),a		;8ab7	d3 e0 	. . 
	ld a,011h		;8ab9	3e 11 	> . 
	out (0e0h),a		;8abb	d3 e0 	. . 
	ld a,0d6h		;8abd	3e d6 	> . 
	out (0e0h),a		;8abf	d3 e0 	. . 
	ld a,0e0h		;8ac1	3e e0 	> . 
	out (0e0h),a		;8ac3	d3 e0 	. . 
	ld a,0ffh		;8ac5	3e ff 	> . 
	out (0e0h),a		;8ac7	d3 e0 	. . 
	call sub_8acfh		;8ac9	cd cf 8a 	. . . 
	jp l8a82h		;8acc	c3 82 8a 	. . . 
sub_8acfh:
	ld bc,0f0ffh		;8acf	01 ff f0 	. . . 
l8ad2h:
	dec bc			;8ad2	0b 	. 
	ld a,b			;8ad3	78 	x 
	or c			;8ad4	b1 	. 
	jp nz,l8ad2h		;8ad5	c2 d2 8a 	. . . 
	ret			;8ad8	c9 	. 
	nop			;8ad9	00 	. 
	nop			;8ada	00 	. 
	nop			;8adb	00 	. 
	nop			;8adc	00 	. 
	nop			;8add	00 	. 
	nop			;8ade	00 	. 
	nop			;8adf	00 	. 
	nop			;8ae0	00 	. 
	nop			;8ae1	00 	. 
	nop			;8ae2	00 	. 
	nop			;8ae3	00 	. 
	nop			;8ae4	00 	. 
	nop			;8ae5	00 	. 
	nop			;8ae6	00 	. 
	nop			;8ae7	00 	. 
	nop			;8ae8	00 	. 
	nop			;8ae9	00 	. 
	nop			;8aea	00 	. 
	nop			;8aeb	00 	. 
	nop			;8aec	00 	. 
	nop			;8aed	00 	. 
	nop			;8aee	00 	. 
	nop			;8aef	00 	. 
	nop			;8af0	00 	. 
	nop			;8af1	00 	. 
	nop			;8af2	00 	. 
	nop			;8af3	00 	. 
	nop			;8af4	00 	. 
	nop			;8af5	00 	. 
	nop			;8af6	00 	. 
	nop			;8af7	00 	. 
	nop			;8af8	00 	. 
	nop			;8af9	00 	. 
	nop			;8afa	00 	. 
	nop			;8afb	00 	. 
	nop			;8afc	00 	. 
	nop			;8afd	00 	. 
	nop			;8afe	00 	. 
	nop			;8aff	00 	. 
l_double_check:
	pop de
; try checking NTSC
	ld hl,l_rom_good_ntsc
	ld a,d
	cp 0d4h
	jp nz,l_try_pal
	ld a,e
	cp 083h
	jp z,rom_check_ok

l_try_pal:
; now check PAL
	ld hl,l_rom_good_pal
	ld a,d
	cp 0beh
	jp nz,rom_check_bad
	ld a,e
	cp 086h
	jp z,rom_check_ok
	jp rom_check_bad

l_rom_good_ntsc:
	db "NTSC ROM GOOD", 0
l_rom_good_pal:
	db "PAL ROM GOOD", 0
	rst 38h			;8b00	ff 	. 
	rst 38h			;8b01	ff 	. 
	rst 38h			;8b02	ff 	. 
	rst 38h			;8b03	ff 	. 
	rst 38h			;8b04	ff 	. 
	rst 38h			;8b05	ff 	. 
	rst 38h			;8b06	ff 	. 
	rst 38h			;8b07	ff 	. 
	rst 38h			;8b45	ff 	. 
	rst 38h			;8b46	ff 	. 
	rst 38h			;8b47	ff 	. 
	rst 38h			;8b48	ff 	. 
	rst 38h			;8b49	ff 	. 
	rst 38h			;8b4a	ff 	. 
	rst 38h			;8b4b	ff 	. 
	rst 38h			;8b4c	ff 	. 
	rst 38h			;8b4d	ff 	. 
	rst 38h			;8b4e	ff 	. 
	rst 38h			;8b4f	ff 	. 
	rst 38h			;8b50	ff 	. 
	rst 38h			;8b51	ff 	. 
	rst 38h			;8b52	ff 	. 
	rst 38h			;8b53	ff 	. 
	rst 38h			;8b54	ff 	. 
	rst 38h			;8b55	ff 	. 
	rst 38h			;8b56	ff 	. 
	rst 38h			;8b57	ff 	. 
	rst 38h			;8b58	ff 	. 
	rst 38h			;8b59	ff 	. 
	rst 38h			;8b5a	ff 	. 
	rst 38h			;8b5b	ff 	. 
	rst 38h			;8b5c	ff 	. 
	rst 38h			;8b5d	ff 	. 
	rst 38h			;8b5e	ff 	. 
	rst 38h			;8b5f	ff 	. 
	rst 38h			;8b60	ff 	. 
	rst 38h			;8b61	ff 	. 
	rst 38h			;8b62	ff 	. 
	rst 38h			;8b63	ff 	. 
	rst 38h			;8b64	ff 	. 
	rst 38h			;8b65	ff 	. 
	rst 38h			;8b66	ff 	. 
	rst 38h			;8b67	ff 	. 
	rst 38h			;8b68	ff 	. 
	rst 38h			;8b69	ff 	. 
	rst 38h			;8b6a	ff 	. 
	rst 38h			;8b6b	ff 	. 
	rst 38h			;8b6c	ff 	. 
	rst 38h			;8b6d	ff 	. 
	rst 38h			;8b6e	ff 	. 
	rst 38h			;8b6f	ff 	. 
	rst 38h			;8b70	ff 	. 
	rst 38h			;8b71	ff 	. 
	rst 38h			;8b72	ff 	. 
	rst 38h			;8b73	ff 	. 
	rst 38h			;8b74	ff 	. 
	rst 38h			;8b75	ff 	. 
	rst 38h			;8b76	ff 	. 
	rst 38h			;8b77	ff 	. 
	rst 38h			;8b78	ff 	. 
	rst 38h			;8b79	ff 	. 
	rst 38h			;8b7a	ff 	. 
	rst 38h			;8b7b	ff 	. 
	rst 38h			;8b7c	ff 	. 
	rst 38h			;8b7d	ff 	. 
	rst 38h			;8b7e	ff 	. 
	rst 38h			;8b7f	ff 	. 
	rst 38h			;8b80	ff 	. 
	rst 38h			;8b81	ff 	. 
	rst 38h			;8b82	ff 	. 
	rst 38h			;8b83	ff 	. 
	rst 38h			;8b84	ff 	. 
	rst 38h			;8b85	ff 	. 
	rst 38h			;8b86	ff 	. 
	rst 38h			;8b87	ff 	. 
	rst 38h			;8b88	ff 	. 
	rst 38h			;8b89	ff 	. 
	rst 38h			;8b8a	ff 	. 
	rst 38h			;8b8b	ff 	. 
	rst 38h			;8b8c	ff 	. 
	rst 38h			;8b8d	ff 	. 
	rst 38h			;8b8e	ff 	. 
	rst 38h			;8b8f	ff 	. 
	rst 38h			;8b90	ff 	. 
	rst 38h			;8b91	ff 	. 
	rst 38h			;8b92	ff 	. 
	rst 38h			;8b93	ff 	. 
	rst 38h			;8b94	ff 	. 
	rst 38h			;8b95	ff 	. 
	rst 38h			;8b96	ff 	. 
	rst 38h			;8b97	ff 	. 
	rst 38h			;8b98	ff 	. 
	rst 38h			;8b99	ff 	. 
	rst 38h			;8b9a	ff 	. 
	rst 38h			;8b9b	ff 	. 
	rst 38h			;8b9c	ff 	. 
	rst 38h			;8b9d	ff 	. 
	rst 38h			;8b9e	ff 	. 
	rst 38h			;8b9f	ff 	. 
	rst 38h			;8ba0	ff 	. 
	rst 38h			;8ba1	ff 	. 
	rst 38h			;8ba2	ff 	. 
	rst 38h			;8ba3	ff 	. 
	rst 38h			;8ba4	ff 	. 
	rst 38h			;8ba5	ff 	. 
	rst 38h			;8ba6	ff 	. 
	rst 38h			;8ba7	ff 	. 
	rst 38h			;8ba8	ff 	. 
	rst 38h			;8ba9	ff 	. 
	rst 38h			;8baa	ff 	. 
	rst 38h			;8bab	ff 	. 
	rst 38h			;8bac	ff 	. 
	rst 38h			;8bad	ff 	. 
	rst 38h			;8bae	ff 	. 
	rst 38h			;8baf	ff 	. 
	rst 38h			;8bb0	ff 	. 
	rst 38h			;8bb1	ff 	. 
	rst 38h			;8bb2	ff 	. 
	rst 38h			;8bb3	ff 	. 
	rst 38h			;8bb4	ff 	. 
	rst 38h			;8bb5	ff 	. 
	rst 38h			;8bb6	ff 	. 
	rst 38h			;8bb7	ff 	. 
	rst 38h			;8bb8	ff 	. 
	rst 38h			;8bb9	ff 	. 
	rst 38h			;8bba	ff 	. 
	rst 38h			;8bbb	ff 	. 
	rst 38h			;8bbc	ff 	. 
	rst 38h			;8bbd	ff 	. 
	rst 38h			;8bbe	ff 	. 
	rst 38h			;8bbf	ff 	. 
	rst 38h			;8bc0	ff 	. 
	rst 38h			;8bc1	ff 	. 
	rst 38h			;8bc2	ff 	. 
	rst 38h			;8bc3	ff 	. 
	rst 38h			;8bc4	ff 	. 
	rst 38h			;8bc5	ff 	. 
	rst 38h			;8bc6	ff 	. 
	rst 38h			;8bc7	ff 	. 
	rst 38h			;8bc8	ff 	. 
	rst 38h			;8bc9	ff 	. 
	rst 38h			;8bca	ff 	. 
	rst 38h			;8bcb	ff 	. 
	rst 38h			;8bcc	ff 	. 
	rst 38h			;8bcd	ff 	. 
	rst 38h			;8bce	ff 	. 
	rst 38h			;8bcf	ff 	. 
	rst 38h			;8bd0	ff 	. 
	rst 38h			;8bd1	ff 	. 
	rst 38h			;8bd2	ff 	. 
	rst 38h			;8bd3	ff 	. 
	rst 38h			;8bd4	ff 	. 
	rst 38h			;8bd5	ff 	. 
	rst 38h			;8bd6	ff 	. 
	rst 38h			;8bd7	ff 	. 
	rst 38h			;8bd8	ff 	. 
	rst 38h			;8bd9	ff 	. 
	rst 38h			;8bda	ff 	. 
	rst 38h			;8bdb	ff 	. 
	rst 38h			;8bdc	ff 	. 
	rst 38h			;8bdd	ff 	. 
	rst 38h			;8bde	ff 	. 
	rst 38h			;8bdf	ff 	. 
	rst 38h			;8be0	ff 	. 
	rst 38h			;8be1	ff 	. 
	rst 38h			;8be2	ff 	. 
	rst 38h			;8be3	ff 	. 
	rst 38h			;8be4	ff 	. 
	rst 38h			;8be5	ff 	. 
	rst 38h			;8be6	ff 	. 
	rst 38h			;8be7	ff 	. 
	rst 38h			;8be8	ff 	. 
	rst 38h			;8be9	ff 	. 
	rst 38h			;8bea	ff 	. 
	rst 38h			;8beb	ff 	. 
	rst 38h			;8bec	ff 	. 
	rst 38h			;8bed	ff 	. 
	rst 38h			;8bee	ff 	. 
	rst 38h			;8bef	ff 	. 
	rst 38h			;8bf0	ff 	. 
	rst 38h			;8bf1	ff 	. 
	rst 38h			;8bf2	ff 	. 
	rst 38h			;8bf3	ff 	. 
	rst 38h			;8bf4	ff 	. 
	rst 38h			;8bf5	ff 	. 
	rst 38h			;8bf6	ff 	. 
	rst 38h			;8bf7	ff 	. 
	rst 38h			;8bf8	ff 	. 
	rst 38h			;8bf9	ff 	. 
	rst 38h			;8bfa	ff 	. 
	rst 38h			;8bfb	ff 	. 
	rst 38h			;8bfc	ff 	. 
	rst 38h			;8bfd	ff 	. 
	rst 38h			;8bfe	ff 	. 
	rst 38h			;8bff	ff 	. 
	rst 38h			;8c00	ff 	. 
	rst 38h			;8c01	ff 	. 
	rst 38h			;8c02	ff 	. 
	rst 38h			;8c03	ff 	. 
	rst 38h			;8c04	ff 	. 
	rst 38h			;8c05	ff 	. 
	rst 38h			;8c06	ff 	. 
	rst 38h			;8c07	ff 	. 
	rst 38h			;8c08	ff 	. 
	rst 38h			;8c09	ff 	. 
	rst 38h			;8c0a	ff 	. 
	rst 38h			;8c0b	ff 	. 
	rst 38h			;8c0c	ff 	. 
	rst 38h			;8c0d	ff 	. 
	rst 38h			;8c0e	ff 	. 
	rst 38h			;8c0f	ff 	. 
	rst 38h			;8c10	ff 	. 
	rst 38h			;8c11	ff 	. 
	rst 38h			;8c12	ff 	. 
	rst 38h			;8c13	ff 	. 
	rst 38h			;8c14	ff 	. 
	rst 38h			;8c15	ff 	. 
	rst 38h			;8c16	ff 	. 
	rst 38h			;8c17	ff 	. 
	rst 38h			;8c18	ff 	. 
	rst 38h			;8c19	ff 	. 
	rst 38h			;8c1a	ff 	. 
	rst 38h			;8c1b	ff 	. 
	rst 38h			;8c1c	ff 	. 
	rst 38h			;8c1d	ff 	. 
	rst 38h			;8c1e	ff 	. 
	rst 38h			;8c1f	ff 	. 
	rst 38h			;8c20	ff 	. 
	rst 38h			;8c21	ff 	. 
	rst 38h			;8c22	ff 	. 
	rst 38h			;8c23	ff 	. 
	rst 38h			;8c24	ff 	. 
	rst 38h			;8c25	ff 	. 
	rst 38h			;8c26	ff 	. 
	rst 38h			;8c27	ff 	. 
	rst 38h			;8c28	ff 	. 
	rst 38h			;8c29	ff 	. 
	rst 38h			;8c2a	ff 	. 
	rst 38h			;8c2b	ff 	. 
	rst 38h			;8c2c	ff 	. 
	rst 38h			;8c2d	ff 	. 
	rst 38h			;8c2e	ff 	. 
	rst 38h			;8c2f	ff 	. 
	rst 38h			;8c30	ff 	. 
	rst 38h			;8c31	ff 	. 
	rst 38h			;8c32	ff 	. 
	rst 38h			;8c33	ff 	. 
	rst 38h			;8c34	ff 	. 
	rst 38h			;8c35	ff 	. 
	rst 38h			;8c36	ff 	. 
	rst 38h			;8c37	ff 	. 
	rst 38h			;8c38	ff 	. 
	rst 38h			;8c39	ff 	. 
	rst 38h			;8c3a	ff 	. 
	rst 38h			;8c3b	ff 	. 
	rst 38h			;8c3c	ff 	. 
	rst 38h			;8c3d	ff 	. 
	rst 38h			;8c3e	ff 	. 
	rst 38h			;8c3f	ff 	. 
	rst 38h			;8c40	ff 	. 
	rst 38h			;8c41	ff 	. 
	rst 38h			;8c42	ff 	. 
	rst 38h			;8c43	ff 	. 
	rst 38h			;8c44	ff 	. 
	rst 38h			;8c45	ff 	. 
	rst 38h			;8c46	ff 	. 
	rst 38h			;8c47	ff 	. 
	rst 38h			;8c48	ff 	. 
	rst 38h			;8c49	ff 	. 
	rst 38h			;8c4a	ff 	. 
	rst 38h			;8c4b	ff 	. 
	rst 38h			;8c4c	ff 	. 
	rst 38h			;8c4d	ff 	. 
	rst 38h			;8c4e	ff 	. 
	rst 38h			;8c4f	ff 	. 
	rst 38h			;8c50	ff 	. 
	rst 38h			;8c51	ff 	. 
	rst 38h			;8c52	ff 	. 
	rst 38h			;8c53	ff 	. 
	rst 38h			;8c54	ff 	. 
	rst 38h			;8c55	ff 	. 
	rst 38h			;8c56	ff 	. 
	rst 38h			;8c57	ff 	. 
	rst 38h			;8c58	ff 	. 
	rst 38h			;8c59	ff 	. 
	rst 38h			;8c5a	ff 	. 
	rst 38h			;8c5b	ff 	. 
	rst 38h			;8c5c	ff 	. 
	rst 38h			;8c5d	ff 	. 
	rst 38h			;8c5e	ff 	. 
	rst 38h			;8c5f	ff 	. 
	rst 38h			;8c60	ff 	. 
	rst 38h			;8c61	ff 	. 
	rst 38h			;8c62	ff 	. 
	rst 38h			;8c63	ff 	. 
	rst 38h			;8c64	ff 	. 
	rst 38h			;8c65	ff 	. 
	rst 38h			;8c66	ff 	. 
	rst 38h			;8c67	ff 	. 
	rst 38h			;8c68	ff 	. 
	rst 38h			;8c69	ff 	. 
	rst 38h			;8c6a	ff 	. 
	rst 38h			;8c6b	ff 	. 
	rst 38h			;8c6c	ff 	. 
	rst 38h			;8c6d	ff 	. 
	rst 38h			;8c6e	ff 	. 
	rst 38h			;8c6f	ff 	. 
	rst 38h			;8c70	ff 	. 
	rst 38h			;8c71	ff 	. 
	rst 38h			;8c72	ff 	. 
	rst 38h			;8c73	ff 	. 
	rst 38h			;8c74	ff 	. 
	rst 38h			;8c75	ff 	. 
	rst 38h			;8c76	ff 	. 
	rst 38h			;8c77	ff 	. 
	rst 38h			;8c78	ff 	. 
	rst 38h			;8c79	ff 	. 
	rst 38h			;8c7a	ff 	. 
	rst 38h			;8c7b	ff 	. 
	rst 38h			;8c7c	ff 	. 
	rst 38h			;8c7d	ff 	. 
	rst 38h			;8c7e	ff 	. 
	rst 38h			;8c7f	ff 	. 
	rst 38h			;8c80	ff 	. 
	rst 38h			;8c81	ff 	. 
	rst 38h			;8c82	ff 	. 
	rst 38h			;8c83	ff 	. 
	rst 38h			;8c84	ff 	. 
	rst 38h			;8c85	ff 	. 
	rst 38h			;8c86	ff 	. 
	rst 38h			;8c87	ff 	. 
	rst 38h			;8c88	ff 	. 
	rst 38h			;8c89	ff 	. 
sub_8c8ah:
	rst 38h			;8c8a	ff 	. 
	rst 38h			;8c8b	ff 	. 
	rst 38h			;8c8c	ff 	. 
	rst 38h			;8c8d	ff 	. 
	rst 38h			;8c8e	ff 	. 
	rst 38h			;8c8f	ff 	. 
	rst 38h			;8c90	ff 	. 
	rst 38h			;8c91	ff 	. 
	rst 38h			;8c92	ff 	. 
	rst 38h			;8c93	ff 	. 
	rst 38h			;8c94	ff 	. 
	rst 38h			;8c95	ff 	. 
	rst 38h			;8c96	ff 	. 
	rst 38h			;8c97	ff 	. 
	rst 38h			;8c98	ff 	. 
	rst 38h			;8c99	ff 	. 
	rst 38h			;8c9a	ff 	. 
	rst 38h			;8c9b	ff 	. 
	rst 38h			;8c9c	ff 	. 
	rst 38h			;8c9d	ff 	. 
	rst 38h			;8c9e	ff 	. 
	rst 38h			;8c9f	ff 	. 
	rst 38h			;8ca0	ff 	. 
	rst 38h			;8ca1	ff 	. 
	rst 38h			;8ca2	ff 	. 
	rst 38h			;8ca3	ff 	. 
	rst 38h			;8ca4	ff 	. 
	rst 38h			;8ca5	ff 	. 
	rst 38h			;8ca6	ff 	. 
	rst 38h			;8ca7	ff 	. 
	rst 38h			;8ca8	ff 	. 
	rst 38h			;8ca9	ff 	. 
	rst 38h			;8caa	ff 	. 
	rst 38h			;8cab	ff 	. 
	rst 38h			;8cac	ff 	. 
	rst 38h			;8cad	ff 	. 
	rst 38h			;8cae	ff 	. 
	rst 38h			;8caf	ff 	. 
	rst 38h			;8cb0	ff 	. 
	rst 38h			;8cb1	ff 	. 
	rst 38h			;8cb2	ff 	. 
	rst 38h			;8cb3	ff 	. 
	rst 38h			;8cb4	ff 	. 
	rst 38h			;8cb5	ff 	. 
	rst 38h			;8cb6	ff 	. 
	rst 38h			;8cb7	ff 	. 
	rst 38h			;8cb8	ff 	. 
	rst 38h			;8cb9	ff 	. 
	rst 38h			;8cba	ff 	. 
	rst 38h			;8cbb	ff 	. 
	rst 38h			;8cbc	ff 	. 
	rst 38h			;8cbd	ff 	. 
	rst 38h			;8cbe	ff 	. 
	rst 38h			;8cbf	ff 	. 
	rst 38h			;8cc0	ff 	. 
	rst 38h			;8cc1	ff 	. 
	rst 38h			;8cc2	ff 	. 
	rst 38h			;8cc3	ff 	. 
	rst 38h			;8cc4	ff 	. 
	rst 38h			;8cc5	ff 	. 
	rst 38h			;8cc6	ff 	. 
	rst 38h			;8cc7	ff 	. 
	rst 38h			;8cc8	ff 	. 
	rst 38h			;8cc9	ff 	. 
	rst 38h			;8cca	ff 	. 
	rst 38h			;8ccb	ff 	. 
	rst 38h			;8ccc	ff 	. 
	rst 38h			;8ccd	ff 	. 
	rst 38h			;8cce	ff 	. 
	rst 38h			;8ccf	ff 	. 
	rst 38h			;8cd0	ff 	. 
	rst 38h			;8cd1	ff 	. 
	rst 38h			;8cd2	ff 	. 
	rst 38h			;8cd3	ff 	. 
	rst 38h			;8cd4	ff 	. 
	rst 38h			;8cd5	ff 	. 
	rst 38h			;8cd6	ff 	. 
	rst 38h			;8cd7	ff 	. 
	rst 38h			;8cd8	ff 	. 
	rst 38h			;8cd9	ff 	. 
	rst 38h			;8cda	ff 	. 
	rst 38h			;8cdb	ff 	. 
	rst 38h			;8cdc	ff 	. 
	rst 38h			;8cdd	ff 	. 
	rst 38h			;8cde	ff 	. 
	rst 38h			;8cdf	ff 	. 
	rst 38h			;8ce0	ff 	. 
	rst 38h			;8ce1	ff 	. 
	rst 38h			;8ce2	ff 	. 
	rst 38h			;8ce3	ff 	. 
	rst 38h			;8ce4	ff 	. 
	rst 38h			;8ce5	ff 	. 
	rst 38h			;8ce6	ff 	. 
	rst 38h			;8ce7	ff 	. 
	rst 38h			;8ce8	ff 	. 
	rst 38h			;8ce9	ff 	. 
	rst 38h			;8cea	ff 	. 
	rst 38h			;8ceb	ff 	. 
	rst 38h			;8cec	ff 	. 
	rst 38h			;8ced	ff 	. 
	rst 38h			;8cee	ff 	. 
	rst 38h			;8cef	ff 	. 
	rst 38h			;8cf0	ff 	. 
	rst 38h			;8cf1	ff 	. 
	rst 38h			;8cf2	ff 	. 
	rst 38h			;8cf3	ff 	. 
	rst 38h			;8cf4	ff 	. 
	rst 38h			;8cf5	ff 	. 
	rst 38h			;8cf6	ff 	. 
	rst 38h			;8cf7	ff 	. 
	rst 38h			;8cf8	ff 	. 
	rst 38h			;8cf9	ff 	. 
	rst 38h			;8cfa	ff 	. 
	rst 38h			;8cfb	ff 	. 
	rst 38h			;8cfc	ff 	. 
	rst 38h			;8cfd	ff 	. 
	rst 38h			;8cfe	ff 	. 
	rst 38h			;8cff	ff 	. 
	rst 38h			;8d00	ff 	. 
	rst 38h			;8d01	ff 	. 
	rst 38h			;8d02	ff 	. 
	rst 38h			;8d03	ff 	. 
	rst 38h			;8d04	ff 	. 
	rst 38h			;8d05	ff 	. 
	rst 38h			;8d06	ff 	. 
	rst 38h			;8d07	ff 	. 
	rst 38h			;8d08	ff 	. 
	rst 38h			;8d09	ff 	. 
	rst 38h			;8d0a	ff 	. 
	rst 38h			;8d0b	ff 	. 
	rst 38h			;8d0c	ff 	. 
	rst 38h			;8d0d	ff 	. 
	rst 38h			;8d0e	ff 	. 
	rst 38h			;8d0f	ff 	. 
	rst 38h			;8d10	ff 	. 
	rst 38h			;8d11	ff 	. 
	rst 38h			;8d12	ff 	. 
	rst 38h			;8d13	ff 	. 
	rst 38h			;8d14	ff 	. 
	rst 38h			;8d15	ff 	. 
	rst 38h			;8d16	ff 	. 
	rst 38h			;8d17	ff 	. 
	rst 38h			;8d18	ff 	. 
	rst 38h			;8d19	ff 	. 
	rst 38h			;8d1a	ff 	. 
	rst 38h			;8d1b	ff 	. 
	rst 38h			;8d1c	ff 	. 
	rst 38h			;8d1d	ff 	. 
	rst 38h			;8d1e	ff 	. 
	rst 38h			;8d1f	ff 	. 
	rst 38h			;8d20	ff 	. 
	rst 38h			;8d21	ff 	. 
	rst 38h			;8d22	ff 	. 
	rst 38h			;8d23	ff 	. 
	rst 38h			;8d24	ff 	. 
	rst 38h			;8d25	ff 	. 
	rst 38h			;8d26	ff 	. 
	rst 38h			;8d27	ff 	. 
	rst 38h			;8d28	ff 	. 
	rst 38h			;8d29	ff 	. 
	rst 38h			;8d2a	ff 	. 
	rst 38h			;8d2b	ff 	. 
	rst 38h			;8d2c	ff 	. 
	rst 38h			;8d2d	ff 	. 
	rst 38h			;8d2e	ff 	. 
	rst 38h			;8d2f	ff 	. 
	rst 38h			;8d30	ff 	. 
	rst 38h			;8d31	ff 	. 
	rst 38h			;8d32	ff 	. 
	rst 38h			;8d33	ff 	. 
	rst 38h			;8d34	ff 	. 
	rst 38h			;8d35	ff 	. 
	rst 38h			;8d36	ff 	. 
	rst 38h			;8d37	ff 	. 
	rst 38h			;8d38	ff 	. 
	rst 38h			;8d39	ff 	. 
	rst 38h			;8d3a	ff 	. 
	rst 38h			;8d3b	ff 	. 
	rst 38h			;8d3c	ff 	. 
	rst 38h			;8d3d	ff 	. 
	rst 38h			;8d3e	ff 	. 
	rst 38h			;8d3f	ff 	. 
	rst 38h			;8d40	ff 	. 
	rst 38h			;8d41	ff 	. 
	rst 38h			;8d42	ff 	. 
	rst 38h			;8d43	ff 	. 
	rst 38h			;8d44	ff 	. 
	rst 38h			;8d45	ff 	. 
	rst 38h			;8d46	ff 	. 
	rst 38h			;8d47	ff 	. 
	rst 38h			;8d48	ff 	. 
	rst 38h			;8d49	ff 	. 
	rst 38h			;8d4a	ff 	. 
	rst 38h			;8d4b	ff 	. 
	rst 38h			;8d4c	ff 	. 
	rst 38h			;8d4d	ff 	. 
	rst 38h			;8d4e	ff 	. 
	rst 38h			;8d4f	ff 	. 
	rst 38h			;8d50	ff 	. 
	rst 38h			;8d51	ff 	. 
	rst 38h			;8d52	ff 	. 
	rst 38h			;8d53	ff 	. 
	rst 38h			;8d54	ff 	. 
	rst 38h			;8d55	ff 	. 
	rst 38h			;8d56	ff 	. 
	rst 38h			;8d57	ff 	. 
	rst 38h			;8d58	ff 	. 
	rst 38h			;8d59	ff 	. 
	rst 38h			;8d5a	ff 	. 
	rst 38h			;8d5b	ff 	. 
	rst 38h			;8d5c	ff 	. 
	rst 38h			;8d5d	ff 	. 
	rst 38h			;8d5e	ff 	. 
	rst 38h			;8d5f	ff 	. 
	rst 38h			;8d60	ff 	. 
	rst 38h			;8d61	ff 	. 
	rst 38h			;8d62	ff 	. 
	rst 38h			;8d63	ff 	. 
	rst 38h			;8d64	ff 	. 
	rst 38h			;8d65	ff 	. 
	rst 38h			;8d66	ff 	. 
	rst 38h			;8d67	ff 	. 
	rst 38h			;8d68	ff 	. 
	rst 38h			;8d69	ff 	. 
	rst 38h			;8d6a	ff 	. 
	rst 38h			;8d6b	ff 	. 
	rst 38h			;8d6c	ff 	. 
	rst 38h			;8d6d	ff 	. 
	rst 38h			;8d6e	ff 	. 
	rst 38h			;8d6f	ff 	. 
	rst 38h			;8d70	ff 	. 
	rst 38h			;8d71	ff 	. 
	rst 38h			;8d72	ff 	. 
	rst 38h			;8d73	ff 	. 
	rst 38h			;8d74	ff 	. 
	rst 38h			;8d75	ff 	. 
	rst 38h			;8d76	ff 	. 
	rst 38h			;8d77	ff 	. 
	rst 38h			;8d78	ff 	. 
	rst 38h			;8d79	ff 	. 
	rst 38h			;8d7a	ff 	. 
	rst 38h			;8d7b	ff 	. 
	rst 38h			;8d7c	ff 	. 
	rst 38h			;8d7d	ff 	. 
	rst 38h			;8d7e	ff 	. 
	rst 38h			;8d7f	ff 	. 
	rst 38h			;8d80	ff 	. 
	rst 38h			;8d81	ff 	. 
	rst 38h			;8d82	ff 	. 
	rst 38h			;8d83	ff 	. 
	rst 38h			;8d84	ff 	. 
	rst 38h			;8d85	ff 	. 
	rst 38h			;8d86	ff 	. 
	rst 38h			;8d87	ff 	. 
	rst 38h			;8d88	ff 	. 
	rst 38h			;8d89	ff 	. 
	rst 38h			;8d8a	ff 	. 
	rst 38h			;8d8b	ff 	. 
	rst 38h			;8d8c	ff 	. 
	rst 38h			;8d8d	ff 	. 
	rst 38h			;8d8e	ff 	. 
	rst 38h			;8d8f	ff 	. 
	rst 38h			;8d90	ff 	. 
	rst 38h			;8d91	ff 	. 
	rst 38h			;8d92	ff 	. 
	rst 38h			;8d93	ff 	. 
	rst 38h			;8d94	ff 	. 
	rst 38h			;8d95	ff 	. 
	rst 38h			;8d96	ff 	. 
	rst 38h			;8d97	ff 	. 
	rst 38h			;8d98	ff 	. 
	rst 38h			;8d99	ff 	. 
	rst 38h			;8d9a	ff 	. 
	rst 38h			;8d9b	ff 	. 
	rst 38h			;8d9c	ff 	. 
	rst 38h			;8d9d	ff 	. 
	rst 38h			;8d9e	ff 	. 
	rst 38h			;8d9f	ff 	. 
	rst 38h			;8da0	ff 	. 
	rst 38h			;8da1	ff 	. 
	rst 38h			;8da2	ff 	. 
	rst 38h			;8da3	ff 	. 
	rst 38h			;8da4	ff 	. 
	rst 38h			;8da5	ff 	. 
	rst 38h			;8da6	ff 	. 
	rst 38h			;8da7	ff 	. 
	rst 38h			;8da8	ff 	. 
	rst 38h			;8da9	ff 	. 
	rst 38h			;8daa	ff 	. 
	rst 38h			;8dab	ff 	. 
	rst 38h			;8dac	ff 	. 
	rst 38h			;8dad	ff 	. 
	rst 38h			;8dae	ff 	. 
	rst 38h			;8daf	ff 	. 
	rst 38h			;8db0	ff 	. 
	rst 38h			;8db1	ff 	. 
	rst 38h			;8db2	ff 	. 
	rst 38h			;8db3	ff 	. 
	rst 38h			;8db4	ff 	. 
	rst 38h			;8db5	ff 	. 
	rst 38h			;8db6	ff 	. 
	rst 38h			;8db7	ff 	. 
	rst 38h			;8db8	ff 	. 
	rst 38h			;8db9	ff 	. 
	rst 38h			;8dba	ff 	. 
	rst 38h			;8dbb	ff 	. 
	rst 38h			;8dbc	ff 	. 
	rst 38h			;8dbd	ff 	. 
	rst 38h			;8dbe	ff 	. 
	rst 38h			;8dbf	ff 	. 
	rst 38h			;8dc0	ff 	. 
	rst 38h			;8dc1	ff 	. 
	rst 38h			;8dc2	ff 	. 
	rst 38h			;8dc3	ff 	. 
	rst 38h			;8dc4	ff 	. 
	rst 38h			;8dc5	ff 	. 
	rst 38h			;8dc6	ff 	. 
	rst 38h			;8dc7	ff 	. 
	rst 38h			;8dc8	ff 	. 
	rst 38h			;8dc9	ff 	. 
	rst 38h			;8dca	ff 	. 
	rst 38h			;8dcb	ff 	. 
	rst 38h			;8dcc	ff 	. 
	rst 38h			;8dcd	ff 	. 
	rst 38h			;8dce	ff 	. 
	rst 38h			;8dcf	ff 	. 
	rst 38h			;8dd0	ff 	. 
	rst 38h			;8dd1	ff 	. 
	rst 38h			;8dd2	ff 	. 
	rst 38h			;8dd3	ff 	. 
	rst 38h			;8dd4	ff 	. 
	rst 38h			;8dd5	ff 	. 
	rst 38h			;8dd6	ff 	. 
	rst 38h			;8dd7	ff 	. 
	rst 38h			;8dd8	ff 	. 
	rst 38h			;8dd9	ff 	. 
	rst 38h			;8dda	ff 	. 
	rst 38h			;8ddb	ff 	. 
	rst 38h			;8ddc	ff 	. 
	rst 38h			;8ddd	ff 	. 
	rst 38h			;8dde	ff 	. 
	rst 38h			;8ddf	ff 	. 
	rst 38h			;8de0	ff 	. 
	rst 38h			;8de1	ff 	. 
	rst 38h			;8de2	ff 	. 
	rst 38h			;8de3	ff 	. 
	rst 38h			;8de4	ff 	. 
	rst 38h			;8de5	ff 	. 
	rst 38h			;8de6	ff 	. 
	rst 38h			;8de7	ff 	. 
	rst 38h			;8de8	ff 	. 
	rst 38h			;8de9	ff 	. 
	rst 38h			;8dea	ff 	. 
	rst 38h			;8deb	ff 	. 
	rst 38h			;8dec	ff 	. 
	rst 38h			;8ded	ff 	. 
	rst 38h			;8dee	ff 	. 
	rst 38h			;8def	ff 	. 
	rst 38h			;8df0	ff 	. 
	rst 38h			;8df1	ff 	. 
	rst 38h			;8df2	ff 	. 
	rst 38h			;8df3	ff 	. 
	rst 38h			;8df4	ff 	. 
	rst 38h			;8df5	ff 	. 
	rst 38h			;8df6	ff 	. 
	rst 38h			;8df7	ff 	. 
	rst 38h			;8df8	ff 	. 
	rst 38h			;8df9	ff 	. 
	rst 38h			;8dfa	ff 	. 
	rst 38h			;8dfb	ff 	. 
	rst 38h			;8dfc	ff 	. 
	rst 38h			;8dfd	ff 	. 
	rst 38h			;8dfe	ff 	. 
	rst 38h			;8dff	ff 	. 
	rst 38h			;8e00	ff 	. 
	rst 38h			;8e01	ff 	. 
	rst 38h			;8e02	ff 	. 
	rst 38h			;8e03	ff 	. 
	rst 38h			;8e04	ff 	. 
	rst 38h			;8e05	ff 	. 
	rst 38h			;8e06	ff 	. 
	rst 38h			;8e07	ff 	. 
	rst 38h			;8e08	ff 	. 
	rst 38h			;8e09	ff 	. 
	rst 38h			;8e0a	ff 	. 
	rst 38h			;8e0b	ff 	. 
	rst 38h			;8e0c	ff 	. 
	rst 38h			;8e0d	ff 	. 
	rst 38h			;8e0e	ff 	. 
	rst 38h			;8e0f	ff 	. 
	rst 38h			;8e10	ff 	. 
	rst 38h			;8e11	ff 	. 
	rst 38h			;8e12	ff 	. 
	rst 38h			;8e13	ff 	. 
	rst 38h			;8e14	ff 	. 
	rst 38h			;8e15	ff 	. 
	rst 38h			;8e16	ff 	. 
	rst 38h			;8e17	ff 	. 
	rst 38h			;8e18	ff 	. 
	rst 38h			;8e19	ff 	. 
	rst 38h			;8e1a	ff 	. 
	rst 38h			;8e1b	ff 	. 
	rst 38h			;8e1c	ff 	. 
	rst 38h			;8e1d	ff 	. 
	rst 38h			;8e1e	ff 	. 
	rst 38h			;8e1f	ff 	. 
	rst 38h			;8e20	ff 	. 
	rst 38h			;8e21	ff 	. 
	rst 38h			;8e22	ff 	. 
	rst 38h			;8e23	ff 	. 
	rst 38h			;8e24	ff 	. 
	rst 38h			;8e25	ff 	. 
	rst 38h			;8e26	ff 	. 
	rst 38h			;8e27	ff 	. 
	rst 38h			;8e28	ff 	. 
	rst 38h			;8e29	ff 	. 
	rst 38h			;8e2a	ff 	. 
	rst 38h			;8e2b	ff 	. 
	rst 38h			;8e2c	ff 	. 
	rst 38h			;8e2d	ff 	. 
	rst 38h			;8e2e	ff 	. 
	rst 38h			;8e2f	ff 	. 
	rst 38h			;8e30	ff 	. 
	rst 38h			;8e31	ff 	. 
	rst 38h			;8e32	ff 	. 
	rst 38h			;8e33	ff 	. 
	rst 38h			;8e34	ff 	. 
	rst 38h			;8e35	ff 	. 
	rst 38h			;8e36	ff 	. 
	rst 38h			;8e37	ff 	. 
	rst 38h			;8e38	ff 	. 
	rst 38h			;8e39	ff 	. 
	rst 38h			;8e3a	ff 	. 
	rst 38h			;8e3b	ff 	. 
	rst 38h			;8e3c	ff 	. 
	rst 38h			;8e3d	ff 	. 
	rst 38h			;8e3e	ff 	. 
	rst 38h			;8e3f	ff 	. 
	rst 38h			;8e40	ff 	. 
	rst 38h			;8e41	ff 	. 
	rst 38h			;8e42	ff 	. 
	rst 38h			;8e43	ff 	. 
	rst 38h			;8e44	ff 	. 
	rst 38h			;8e45	ff 	. 
	rst 38h			;8e46	ff 	. 
	rst 38h			;8e47	ff 	. 
	rst 38h			;8e48	ff 	. 
	rst 38h			;8e49	ff 	. 
	rst 38h			;8e4a	ff 	. 
	rst 38h			;8e4b	ff 	. 
	rst 38h			;8e4c	ff 	. 
	rst 38h			;8e4d	ff 	. 
	rst 38h			;8e4e	ff 	. 
	rst 38h			;8e4f	ff 	. 
	rst 38h			;8e50	ff 	. 
	rst 38h			;8e51	ff 	. 
	rst 38h			;8e52	ff 	. 
	rst 38h			;8e53	ff 	. 
	rst 38h			;8e54	ff 	. 
	rst 38h			;8e55	ff 	. 
	rst 38h			;8e56	ff 	. 
	rst 38h			;8e57	ff 	. 
	rst 38h			;8e58	ff 	. 
	rst 38h			;8e59	ff 	. 
	rst 38h			;8e5a	ff 	. 
	rst 38h			;8e5b	ff 	. 
	rst 38h			;8e5c	ff 	. 
	rst 38h			;8e5d	ff 	. 
	rst 38h			;8e5e	ff 	. 
	rst 38h			;8e5f	ff 	. 
	rst 38h			;8e60	ff 	. 
	rst 38h			;8e61	ff 	. 
	rst 38h			;8e62	ff 	. 
	rst 38h			;8e63	ff 	. 
	rst 38h			;8e64	ff 	. 
	rst 38h			;8e65	ff 	. 
	rst 38h			;8e66	ff 	. 
	rst 38h			;8e67	ff 	. 
	rst 38h			;8e68	ff 	. 
	rst 38h			;8e69	ff 	. 
	rst 38h			;8e6a	ff 	. 
	rst 38h			;8e6b	ff 	. 
	rst 38h			;8e6c	ff 	. 
	rst 38h			;8e6d	ff 	. 
	rst 38h			;8e6e	ff 	. 
	rst 38h			;8e6f	ff 	. 
	rst 38h			;8e70	ff 	. 
	rst 38h			;8e71	ff 	. 
	rst 38h			;8e72	ff 	. 
	rst 38h			;8e73	ff 	. 
	rst 38h			;8e74	ff 	. 
	rst 38h			;8e75	ff 	. 
	rst 38h			;8e76	ff 	. 
	rst 38h			;8e77	ff 	. 
	rst 38h			;8e78	ff 	. 
	rst 38h			;8e79	ff 	. 
	rst 38h			;8e7a	ff 	. 
	rst 38h			;8e7b	ff 	. 
	rst 38h			;8e7c	ff 	. 
	rst 38h			;8e7d	ff 	. 
	rst 38h			;8e7e	ff 	. 
	rst 38h			;8e7f	ff 	. 
	rst 38h			;8e80	ff 	. 
	rst 38h			;8e81	ff 	. 
	rst 38h			;8e82	ff 	. 
	rst 38h			;8e83	ff 	. 
	rst 38h			;8e84	ff 	. 
	rst 38h			;8e85	ff 	. 
	rst 38h			;8e86	ff 	. 
	rst 38h			;8e87	ff 	. 
	rst 38h			;8e88	ff 	. 
	rst 38h			;8e89	ff 	. 
	rst 38h			;8e8a	ff 	. 
	rst 38h			;8e8b	ff 	. 
	rst 38h			;8e8c	ff 	. 
	rst 38h			;8e8d	ff 	. 
	rst 38h			;8e8e	ff 	. 
	rst 38h			;8e8f	ff 	. 
	rst 38h			;8e90	ff 	. 
	rst 38h			;8e91	ff 	. 
	rst 38h			;8e92	ff 	. 
	rst 38h			;8e93	ff 	. 
	rst 38h			;8e94	ff 	. 
	rst 38h			;8e95	ff 	. 
	rst 38h			;8e96	ff 	. 
	rst 38h			;8e97	ff 	. 
	rst 38h			;8e98	ff 	. 
	rst 38h			;8e99	ff 	. 
	rst 38h			;8e9a	ff 	. 
	rst 38h			;8e9b	ff 	. 
	rst 38h			;8e9c	ff 	. 
	rst 38h			;8e9d	ff 	. 
	rst 38h			;8e9e	ff 	. 
	rst 38h			;8e9f	ff 	. 
	rst 38h			;8ea0	ff 	. 
	rst 38h			;8ea1	ff 	. 
	rst 38h			;8ea2	ff 	. 
	rst 38h			;8ea3	ff 	. 
	rst 38h			;8ea4	ff 	. 
	rst 38h			;8ea5	ff 	. 
	rst 38h			;8ea6	ff 	. 
	rst 38h			;8ea7	ff 	. 
	rst 38h			;8ea8	ff 	. 
	rst 38h			;8ea9	ff 	. 
	rst 38h			;8eaa	ff 	. 
	rst 38h			;8eab	ff 	. 
	rst 38h			;8eac	ff 	. 
	rst 38h			;8ead	ff 	. 
	rst 38h			;8eae	ff 	. 
	rst 38h			;8eaf	ff 	. 
	rst 38h			;8eb0	ff 	. 
	rst 38h			;8eb1	ff 	. 
	rst 38h			;8eb2	ff 	. 
	rst 38h			;8eb3	ff 	. 
	rst 38h			;8eb4	ff 	. 
	rst 38h			;8eb5	ff 	. 
	rst 38h			;8eb6	ff 	. 
	rst 38h			;8eb7	ff 	. 
	rst 38h			;8eb8	ff 	. 
	rst 38h			;8eb9	ff 	. 
	rst 38h			;8eba	ff 	. 
	rst 38h			;8ebb	ff 	. 
	rst 38h			;8ebc	ff 	. 
	rst 38h			;8ebd	ff 	. 
	rst 38h			;8ebe	ff 	. 
	rst 38h			;8ebf	ff 	. 
	rst 38h			;8ec0	ff 	. 
	rst 38h			;8ec1	ff 	. 
	rst 38h			;8ec2	ff 	. 
	rst 38h			;8ec3	ff 	. 
	rst 38h			;8ec4	ff 	. 
	rst 38h			;8ec5	ff 	. 
	rst 38h			;8ec6	ff 	. 
	rst 38h			;8ec7	ff 	. 
	rst 38h			;8ec8	ff 	. 
	rst 38h			;8ec9	ff 	. 
	rst 38h			;8eca	ff 	. 
	rst 38h			;8ecb	ff 	. 
	rst 38h			;8ecc	ff 	. 
	rst 38h			;8ecd	ff 	. 
	rst 38h			;8ece	ff 	. 
	rst 38h			;8ecf	ff 	. 
	rst 38h			;8ed0	ff 	. 
	rst 38h			;8ed1	ff 	. 
	rst 38h			;8ed2	ff 	. 
	rst 38h			;8ed3	ff 	. 
	rst 38h			;8ed4	ff 	. 
	rst 38h			;8ed5	ff 	. 
	rst 38h			;8ed6	ff 	. 
	rst 38h			;8ed7	ff 	. 
	rst 38h			;8ed8	ff 	. 
	rst 38h			;8ed9	ff 	. 
	rst 38h			;8eda	ff 	. 
	rst 38h			;8edb	ff 	. 
	rst 38h			;8edc	ff 	. 
	rst 38h			;8edd	ff 	. 
	rst 38h			;8ede	ff 	. 
	rst 38h			;8edf	ff 	. 
	rst 38h			;8ee0	ff 	. 
	rst 38h			;8ee1	ff 	. 
	rst 38h			;8ee2	ff 	. 
	rst 38h			;8ee3	ff 	. 
	rst 38h			;8ee4	ff 	. 
	rst 38h			;8ee5	ff 	. 
	rst 38h			;8ee6	ff 	. 
	rst 38h			;8ee7	ff 	. 
	rst 38h			;8ee8	ff 	. 
	rst 38h			;8ee9	ff 	. 
	rst 38h			;8eea	ff 	. 
	rst 38h			;8eeb	ff 	. 
	rst 38h			;8eec	ff 	. 
	rst 38h			;8eed	ff 	. 
	rst 38h			;8eee	ff 	. 
	rst 38h			;8eef	ff 	. 
	rst 38h			;8ef0	ff 	. 
	rst 38h			;8ef1	ff 	. 
	rst 38h			;8ef2	ff 	. 
	rst 38h			;8ef3	ff 	. 
	rst 38h			;8ef4	ff 	. 
	rst 38h			;8ef5	ff 	. 
	rst 38h			;8ef6	ff 	. 
	rst 38h			;8ef7	ff 	. 
	rst 38h			;8ef8	ff 	. 
	rst 38h			;8ef9	ff 	. 
	rst 38h			;8efa	ff 	. 
	rst 38h			;8efb	ff 	. 
	rst 38h			;8efc	ff 	. 
	rst 38h			;8efd	ff 	. 
	rst 38h			;8efe	ff 	. 
	rst 38h			;8eff	ff 	. 
	rst 38h			;8f00	ff 	. 
	rst 38h			;8f01	ff 	. 
	rst 38h			;8f02	ff 	. 
	rst 38h			;8f03	ff 	. 
	rst 38h			;8f04	ff 	. 
	rst 38h			;8f05	ff 	. 
	rst 38h			;8f06	ff 	. 
	rst 38h			;8f07	ff 	. 
	rst 38h			;8f08	ff 	. 
	rst 38h			;8f09	ff 	. 
	rst 38h			;8f0a	ff 	. 
	rst 38h			;8f0b	ff 	. 
	rst 38h			;8f0c	ff 	. 
	rst 38h			;8f0d	ff 	. 
	rst 38h			;8f0e	ff 	. 
	rst 38h			;8f0f	ff 	. 
	rst 38h			;8f10	ff 	. 
	rst 38h			;8f11	ff 	. 
	rst 38h			;8f12	ff 	. 
	rst 38h			;8f13	ff 	. 
	rst 38h			;8f14	ff 	. 
	rst 38h			;8f15	ff 	. 
	rst 38h			;8f16	ff 	. 
	rst 38h			;8f17	ff 	. 
	rst 38h			;8f18	ff 	. 
	rst 38h			;8f19	ff 	. 
	rst 38h			;8f1a	ff 	. 
	rst 38h			;8f1b	ff 	. 
	rst 38h			;8f1c	ff 	. 
	rst 38h			;8f1d	ff 	. 
	rst 38h			;8f1e	ff 	. 
	rst 38h			;8f1f	ff 	. 
	rst 38h			;8f20	ff 	. 
	rst 38h			;8f21	ff 	. 
	rst 38h			;8f22	ff 	. 
	rst 38h			;8f23	ff 	. 
	rst 38h			;8f24	ff 	. 
	rst 38h			;8f25	ff 	. 
	rst 38h			;8f26	ff 	. 
	rst 38h			;8f27	ff 	. 
	rst 38h			;8f28	ff 	. 
	rst 38h			;8f29	ff 	. 
	rst 38h			;8f2a	ff 	. 
	rst 38h			;8f2b	ff 	. 
	rst 38h			;8f2c	ff 	. 
	rst 38h			;8f2d	ff 	. 
	rst 38h			;8f2e	ff 	. 
	rst 38h			;8f2f	ff 	. 
	rst 38h			;8f30	ff 	. 
	rst 38h			;8f31	ff 	. 
	rst 38h			;8f32	ff 	. 
	rst 38h			;8f33	ff 	. 
	rst 38h			;8f34	ff 	. 
	rst 38h			;8f35	ff 	. 
	rst 38h			;8f36	ff 	. 
	rst 38h			;8f37	ff 	. 
	rst 38h			;8f38	ff 	. 
	rst 38h			;8f39	ff 	. 
	rst 38h			;8f3a	ff 	. 
	rst 38h			;8f3b	ff 	. 
	rst 38h			;8f3c	ff 	. 
	rst 38h			;8f3d	ff 	. 
	rst 38h			;8f3e	ff 	. 
	rst 38h			;8f3f	ff 	. 
	rst 38h			;8f40	ff 	. 
	rst 38h			;8f41	ff 	. 
	rst 38h			;8f42	ff 	. 
	rst 38h			;8f43	ff 	. 
	rst 38h			;8f44	ff 	. 
	rst 38h			;8f45	ff 	. 
	rst 38h			;8f46	ff 	. 
	rst 38h			;8f47	ff 	. 
	rst 38h			;8f48	ff 	. 
	rst 38h			;8f49	ff 	. 
	rst 38h			;8f4a	ff 	. 
	rst 38h			;8f4b	ff 	. 
	rst 38h			;8f4c	ff 	. 
	rst 38h			;8f4d	ff 	. 
	rst 38h			;8f4e	ff 	. 
	rst 38h			;8f4f	ff 	. 
	rst 38h			;8f50	ff 	. 
	rst 38h			;8f51	ff 	. 
	rst 38h			;8f52	ff 	. 
	rst 38h			;8f53	ff 	. 
	rst 38h			;8f54	ff 	. 
	rst 38h			;8f55	ff 	. 
	rst 38h			;8f56	ff 	. 
	rst 38h			;8f57	ff 	. 
	rst 38h			;8f58	ff 	. 
	rst 38h			;8f59	ff 	. 
	rst 38h			;8f5a	ff 	. 
	rst 38h			;8f5b	ff 	. 
	rst 38h			;8f5c	ff 	. 
	rst 38h			;8f5d	ff 	. 
	rst 38h			;8f5e	ff 	. 
	rst 38h			;8f5f	ff 	. 
	rst 38h			;8f60	ff 	. 
	rst 38h			;8f61	ff 	. 
	rst 38h			;8f62	ff 	. 
	rst 38h			;8f63	ff 	. 
	rst 38h			;8f64	ff 	. 
	rst 38h			;8f65	ff 	. 
	rst 38h			;8f66	ff 	. 
	rst 38h			;8f67	ff 	. 
	rst 38h			;8f68	ff 	. 
	rst 38h			;8f69	ff 	. 
	rst 38h			;8f6a	ff 	. 
	rst 38h			;8f6b	ff 	. 
	rst 38h			;8f6c	ff 	. 
	rst 38h			;8f6d	ff 	. 
	rst 38h			;8f6e	ff 	. 
	rst 38h			;8f6f	ff 	. 
	rst 38h			;8f70	ff 	. 
	rst 38h			;8f71	ff 	. 
	rst 38h			;8f72	ff 	. 
	rst 38h			;8f73	ff 	. 
	rst 38h			;8f74	ff 	. 
	rst 38h			;8f75	ff 	. 
	rst 38h			;8f76	ff 	. 
	rst 38h			;8f77	ff 	. 
	rst 38h			;8f78	ff 	. 
	rst 38h			;8f79	ff 	. 
	rst 38h			;8f7a	ff 	. 
	rst 38h			;8f7b	ff 	. 
	rst 38h			;8f7c	ff 	. 
	rst 38h			;8f7d	ff 	. 
	rst 38h			;8f7e	ff 	. 
	rst 38h			;8f7f	ff 	. 
	rst 38h			;8f80	ff 	. 
	rst 38h			;8f81	ff 	. 
	rst 38h			;8f82	ff 	. 
	rst 38h			;8f83	ff 	. 
	rst 38h			;8f84	ff 	. 
	rst 38h			;8f85	ff 	. 
	rst 38h			;8f86	ff 	. 
	rst 38h			;8f87	ff 	. 
	rst 38h			;8f88	ff 	. 
	rst 38h			;8f89	ff 	. 
	rst 38h			;8f8a	ff 	. 
	rst 38h			;8f8b	ff 	. 
	rst 38h			;8f8c	ff 	. 
	rst 38h			;8f8d	ff 	. 
	rst 38h			;8f8e	ff 	. 
	rst 38h			;8f8f	ff 	. 
	rst 38h			;8f90	ff 	. 
	rst 38h			;8f91	ff 	. 
	rst 38h			;8f92	ff 	. 
	rst 38h			;8f93	ff 	. 
	rst 38h			;8f94	ff 	. 
	rst 38h			;8f95	ff 	. 
	rst 38h			;8f96	ff 	. 
	rst 38h			;8f97	ff 	. 
	rst 38h			;8f98	ff 	. 
	rst 38h			;8f99	ff 	. 
	rst 38h			;8f9a	ff 	. 
	rst 38h			;8f9b	ff 	. 
	rst 38h			;8f9c	ff 	. 
	rst 38h			;8f9d	ff 	. 
	rst 38h			;8f9e	ff 	. 
	rst 38h			;8f9f	ff 	. 
	rst 38h			;8fa0	ff 	. 
	rst 38h			;8fa1	ff 	. 
	rst 38h			;8fa2	ff 	. 
	rst 38h			;8fa3	ff 	. 
	rst 38h			;8fa4	ff 	. 
	rst 38h			;8fa5	ff 	. 
	rst 38h			;8fa6	ff 	. 
	rst 38h			;8fa7	ff 	. 
	rst 38h			;8fa8	ff 	. 
	rst 38h			;8fa9	ff 	. 
	rst 38h			;8faa	ff 	. 
	rst 38h			;8fab	ff 	. 
	rst 38h			;8fac	ff 	. 
	rst 38h			;8fad	ff 	. 
	rst 38h			;8fae	ff 	. 
	rst 38h			;8faf	ff 	. 
	rst 38h			;8fb0	ff 	. 
	rst 38h			;8fb1	ff 	. 
	rst 38h			;8fb2	ff 	. 
	rst 38h			;8fb3	ff 	. 
	rst 38h			;8fb4	ff 	. 
	rst 38h			;8fb5	ff 	. 
	rst 38h			;8fb6	ff 	. 
	rst 38h			;8fb7	ff 	. 
	rst 38h			;8fb8	ff 	. 
	rst 38h			;8fb9	ff 	. 
	rst 38h			;8fba	ff 	. 
	rst 38h			;8fbb	ff 	. 
	rst 38h			;8fbc	ff 	. 
	rst 38h			;8fbd	ff 	. 
	rst 38h			;8fbe	ff 	. 
	rst 38h			;8fbf	ff 	. 
	rst 38h			;8fc0	ff 	. 
	rst 38h			;8fc1	ff 	. 
	rst 38h			;8fc2	ff 	. 
	rst 38h			;8fc3	ff 	. 
	rst 38h			;8fc4	ff 	. 
	rst 38h			;8fc5	ff 	. 
	rst 38h			;8fc6	ff 	. 
	rst 38h			;8fc7	ff 	. 
	rst 38h			;8fc8	ff 	. 
	rst 38h			;8fc9	ff 	. 
	rst 38h			;8fca	ff 	. 
	rst 38h			;8fcb	ff 	. 
	rst 38h			;8fcc	ff 	. 
	rst 38h			;8fcd	ff 	. 
	rst 38h			;8fce	ff 	. 
	rst 38h			;8fcf	ff 	. 
	rst 38h			;8fd0	ff 	. 
	rst 38h			;8fd1	ff 	. 
	rst 38h			;8fd2	ff 	. 
	rst 38h			;8fd3	ff 	. 
	rst 38h			;8fd4	ff 	. 
	rst 38h			;8fd5	ff 	. 
	rst 38h			;8fd6	ff 	. 
	rst 38h			;8fd7	ff 	. 
	rst 38h			;8fd8	ff 	. 
	rst 38h			;8fd9	ff 	. 
	rst 38h			;8fda	ff 	. 
	rst 38h			;8fdb	ff 	. 
	rst 38h			;8fdc	ff 	. 
	rst 38h			;8fdd	ff 	. 
	rst 38h			;8fde	ff 	. 
	rst 38h			;8fdf	ff 	. 
	rst 38h			;8fe0	ff 	. 
	rst 38h			;8fe1	ff 	. 
	rst 38h			;8fe2	ff 	. 
	rst 38h			;8fe3	ff 	. 
	rst 38h			;8fe4	ff 	. 
	rst 38h			;8fe5	ff 	. 
	rst 38h			;8fe6	ff 	. 
	rst 38h			;8fe7	ff 	. 
	rst 38h			;8fe8	ff 	. 
	rst 38h			;8fe9	ff 	. 
	rst 38h			;8fea	ff 	. 
	rst 38h			;8feb	ff 	. 
	rst 38h			;8fec	ff 	. 
	rst 38h			;8fed	ff 	. 
	rst 38h			;8fee	ff 	. 
	rst 38h			;8fef	ff 	. 
	rst 38h			;8ff0	ff 	. 
	rst 38h			;8ff1	ff 	. 
	rst 38h			;8ff2	ff 	. 
	rst 38h			;8ff3	ff 	. 
	rst 38h			;8ff4	ff 	. 
	rst 38h			;8ff5	ff 	. 
	rst 38h			;8ff6	ff 	. 
	rst 38h			;8ff7	ff 	. 
	rst 38h			;8ff8	ff 	. 
	rst 38h			;8ff9	ff 	. 
	rst 38h			;8ffa	ff 	. 
	rst 38h			;8ffb	ff 	. 
	rst 38h			;8ffc	ff 	. 
	rst 38h			;8ffd	ff 	. 
	rst 38h			;8ffe	ff 	. 
	rst 38h			;8fff	ff 	. 
	rst 38h			;9000	ff 	. 
	rst 38h			;9001	ff 	. 
	rst 38h			;9002	ff 	. 
	rst 38h			;9003	ff 	. 
	rst 38h			;9004	ff 	. 
	rst 38h			;9005	ff 	. 
	rst 38h			;9006	ff 	. 
	rst 38h			;9007	ff 	. 
	rst 38h			;9008	ff 	. 
	rst 38h			;9009	ff 	. 
	rst 38h			;900a	ff 	. 
	rst 38h			;900b	ff 	. 
	rst 38h			;900c	ff 	. 
	rst 38h			;900d	ff 	. 
	rst 38h			;900e	ff 	. 
	rst 38h			;900f	ff 	. 
	rst 38h			;9010	ff 	. 
	rst 38h			;9011	ff 	. 
	rst 38h			;9012	ff 	. 
	rst 38h			;9013	ff 	. 
	rst 38h			;9014	ff 	. 
	rst 38h			;9015	ff 	. 
	rst 38h			;9016	ff 	. 
	rst 38h			;9017	ff 	. 
	rst 38h			;9018	ff 	. 
	rst 38h			;9019	ff 	. 
	rst 38h			;901a	ff 	. 
	rst 38h			;901b	ff 	. 
	rst 38h			;901c	ff 	. 
	rst 38h			;901d	ff 	. 
	rst 38h			;901e	ff 	. 
	rst 38h			;901f	ff 	. 
	rst 38h			;9020	ff 	. 
	rst 38h			;9021	ff 	. 
	rst 38h			;9022	ff 	. 
	rst 38h			;9023	ff 	. 
	rst 38h			;9024	ff 	. 
	rst 38h			;9025	ff 	. 
	rst 38h			;9026	ff 	. 
	rst 38h			;9027	ff 	. 
	rst 38h			;9028	ff 	. 
	rst 38h			;9029	ff 	. 
	rst 38h			;902a	ff 	. 
	rst 38h			;902b	ff 	. 
	rst 38h			;902c	ff 	. 
	rst 38h			;902d	ff 	. 
	rst 38h			;902e	ff 	. 
	rst 38h			;902f	ff 	. 
	rst 38h			;9030	ff 	. 
	rst 38h			;9031	ff 	. 
	rst 38h			;9032	ff 	. 
	rst 38h			;9033	ff 	. 
	rst 38h			;9034	ff 	. 
	rst 38h			;9035	ff 	. 
	rst 38h			;9036	ff 	. 
	rst 38h			;9037	ff 	. 
	rst 38h			;9038	ff 	. 
	rst 38h			;9039	ff 	. 
	rst 38h			;903a	ff 	. 
	rst 38h			;903b	ff 	. 
	rst 38h			;903c	ff 	. 
	rst 38h			;903d	ff 	. 
	rst 38h			;903e	ff 	. 
	rst 38h			;903f	ff 	. 
	rst 38h			;9040	ff 	. 
	rst 38h			;9041	ff 	. 
	rst 38h			;9042	ff 	. 
	rst 38h			;9043	ff 	. 
	rst 38h			;9044	ff 	. 
	rst 38h			;9045	ff 	. 
	rst 38h			;9046	ff 	. 
	rst 38h			;9047	ff 	. 
	rst 38h			;9048	ff 	. 
	rst 38h			;9049	ff 	. 
	rst 38h			;904a	ff 	. 
	rst 38h			;904b	ff 	. 
	rst 38h			;904c	ff 	. 
	rst 38h			;904d	ff 	. 
	rst 38h			;904e	ff 	. 
	rst 38h			;904f	ff 	. 
	rst 38h			;9050	ff 	. 
	rst 38h			;9051	ff 	. 
	rst 38h			;9052	ff 	. 
	rst 38h			;9053	ff 	. 
	rst 38h			;9054	ff 	. 
	rst 38h			;9055	ff 	. 
	rst 38h			;9056	ff 	. 
	rst 38h			;9057	ff 	. 
	rst 38h			;9058	ff 	. 
	rst 38h			;9059	ff 	. 
	rst 38h			;905a	ff 	. 
	rst 38h			;905b	ff 	. 
	rst 38h			;905c	ff 	. 
	rst 38h			;905d	ff 	. 
	rst 38h			;905e	ff 	. 
	rst 38h			;905f	ff 	. 
	rst 38h			;9060	ff 	. 
	rst 38h			;9061	ff 	. 
	rst 38h			;9062	ff 	. 
	rst 38h			;9063	ff 	. 
	rst 38h			;9064	ff 	. 
	rst 38h			;9065	ff 	. 
	rst 38h			;9066	ff 	. 
	rst 38h			;9067	ff 	. 
	rst 38h			;9068	ff 	. 
	rst 38h			;9069	ff 	. 
	rst 38h			;906a	ff 	. 
	rst 38h			;906b	ff 	. 
	rst 38h			;906c	ff 	. 
	rst 38h			;906d	ff 	. 
	rst 38h			;906e	ff 	. 
	rst 38h			;906f	ff 	. 
	rst 38h			;9070	ff 	. 
	rst 38h			;9071	ff 	. 
	rst 38h			;9072	ff 	. 
	rst 38h			;9073	ff 	. 
	rst 38h			;9074	ff 	. 
	rst 38h			;9075	ff 	. 
	rst 38h			;9076	ff 	. 
	rst 38h			;9077	ff 	. 
	rst 38h			;9078	ff 	. 
	rst 38h			;9079	ff 	. 
	rst 38h			;907a	ff 	. 
	rst 38h			;907b	ff 	. 
	rst 38h			;907c	ff 	. 
	rst 38h			;907d	ff 	. 
	rst 38h			;907e	ff 	. 
	rst 38h			;907f	ff 	. 
	rst 38h			;9080	ff 	. 
	rst 38h			;9081	ff 	. 
	rst 38h			;9082	ff 	. 
	rst 38h			;9083	ff 	. 
	rst 38h			;9084	ff 	. 
	rst 38h			;9085	ff 	. 
	rst 38h			;9086	ff 	. 
	rst 38h			;9087	ff 	. 
	rst 38h			;9088	ff 	. 
	rst 38h			;9089	ff 	. 
	rst 38h			;908a	ff 	. 
	rst 38h			;908b	ff 	. 
	rst 38h			;908c	ff 	. 
	rst 38h			;908d	ff 	. 
	rst 38h			;908e	ff 	. 
	rst 38h			;908f	ff 	. 
	rst 38h			;9090	ff 	. 
	rst 38h			;9091	ff 	. 
	rst 38h			;9092	ff 	. 
	rst 38h			;9093	ff 	. 
l9094h:
	rst 38h			;9094	ff 	. 
	rst 38h			;9095	ff 	. 
	rst 38h			;9096	ff 	. 
	rst 38h			;9097	ff 	. 
	rst 38h			;9098	ff 	. 
	rst 38h			;9099	ff 	. 
	rst 38h			;909a	ff 	. 
	rst 38h			;909b	ff 	. 
	rst 38h			;909c	ff 	. 
	rst 38h			;909d	ff 	. 
	rst 38h			;909e	ff 	. 
	rst 38h			;909f	ff 	. 
	rst 38h			;90a0	ff 	. 
	rst 38h			;90a1	ff 	. 
	rst 38h			;90a2	ff 	. 
	rst 38h			;90a3	ff 	. 
	rst 38h			;90a4	ff 	. 
	rst 38h			;90a5	ff 	. 
	rst 38h			;90a6	ff 	. 
	rst 38h			;90a7	ff 	. 
	rst 38h			;90a8	ff 	. 
	rst 38h			;90a9	ff 	. 
	rst 38h			;90aa	ff 	. 
	rst 38h			;90ab	ff 	. 
	rst 38h			;90ac	ff 	. 
	rst 38h			;90ad	ff 	. 
	rst 38h			;90ae	ff 	. 
	rst 38h			;90af	ff 	. 
	rst 38h			;90b0	ff 	. 
	rst 38h			;90b1	ff 	. 
	rst 38h			;90b2	ff 	. 
	rst 38h			;90b3	ff 	. 
	rst 38h			;90b4	ff 	. 
	rst 38h			;90b5	ff 	. 
	rst 38h			;90b6	ff 	. 
	rst 38h			;90b7	ff 	. 
	rst 38h			;90b8	ff 	. 
	rst 38h			;90b9	ff 	. 
	rst 38h			;90ba	ff 	. 
	rst 38h			;90bb	ff 	. 
	rst 38h			;90bc	ff 	. 
	rst 38h			;90bd	ff 	. 
	rst 38h			;90be	ff 	. 
	rst 38h			;90bf	ff 	. 
	rst 38h			;90c0	ff 	. 
	rst 38h			;90c1	ff 	. 
	rst 38h			;90c2	ff 	. 
	rst 38h			;90c3	ff 	. 
	rst 38h			;90c4	ff 	. 
	rst 38h			;90c5	ff 	. 
	rst 38h			;90c6	ff 	. 
	rst 38h			;90c7	ff 	. 
	rst 38h			;90c8	ff 	. 
	rst 38h			;90c9	ff 	. 
	rst 38h			;90ca	ff 	. 
	rst 38h			;90cb	ff 	. 
	rst 38h			;90cc	ff 	. 
	rst 38h			;90cd	ff 	. 
	rst 38h			;90ce	ff 	. 
	rst 38h			;90cf	ff 	. 
	rst 38h			;90d0	ff 	. 
	rst 38h			;90d1	ff 	. 
	rst 38h			;90d2	ff 	. 
	rst 38h			;90d3	ff 	. 
	rst 38h			;90d4	ff 	. 
	rst 38h			;90d5	ff 	. 
	rst 38h			;90d6	ff 	. 
	rst 38h			;90d7	ff 	. 
	rst 38h			;90d8	ff 	. 
	rst 38h			;90d9	ff 	. 
	rst 38h			;90da	ff 	. 
	rst 38h			;90db	ff 	. 
	rst 38h			;90dc	ff 	. 
	rst 38h			;90dd	ff 	. 
	rst 38h			;90de	ff 	. 
	rst 38h			;90df	ff 	. 
	rst 38h			;90e0	ff 	. 
	rst 38h			;90e1	ff 	. 
	rst 38h			;90e2	ff 	. 
	rst 38h			;90e3	ff 	. 
	rst 38h			;90e4	ff 	. 
	rst 38h			;90e5	ff 	. 
	rst 38h			;90e6	ff 	. 
	rst 38h			;90e7	ff 	. 
	rst 38h			;90e8	ff 	. 
	rst 38h			;90e9	ff 	. 
	rst 38h			;90ea	ff 	. 
	rst 38h			;90eb	ff 	. 
	rst 38h			;90ec	ff 	. 
	rst 38h			;90ed	ff 	. 
	rst 38h			;90ee	ff 	. 
	rst 38h			;90ef	ff 	. 
	rst 38h			;90f0	ff 	. 
	rst 38h			;90f1	ff 	. 
	rst 38h			;90f2	ff 	. 
	rst 38h			;90f3	ff 	. 
	rst 38h			;90f4	ff 	. 
	rst 38h			;90f5	ff 	. 
	rst 38h			;90f6	ff 	. 
	rst 38h			;90f7	ff 	. 
	rst 38h			;90f8	ff 	. 
	rst 38h			;90f9	ff 	. 
	rst 38h			;90fa	ff 	. 
	rst 38h			;90fb	ff 	. 
	rst 38h			;90fc	ff 	. 
	rst 38h			;90fd	ff 	. 
	rst 38h			;90fe	ff 	. 
	rst 38h			;90ff	ff 	. 
	rst 38h			;9100	ff 	. 
	rst 38h			;9101	ff 	. 
	rst 38h			;9102	ff 	. 
	rst 38h			;9103	ff 	. 
	rst 38h			;9104	ff 	. 
	rst 38h			;9105	ff 	. 
	rst 38h			;9106	ff 	. 
	rst 38h			;9107	ff 	. 
	rst 38h			;9108	ff 	. 
	rst 38h			;9109	ff 	. 
	rst 38h			;910a	ff 	. 
	rst 38h			;910b	ff 	. 
	rst 38h			;910c	ff 	. 
	rst 38h			;910d	ff 	. 
	rst 38h			;910e	ff 	. 
	rst 38h			;910f	ff 	. 
	rst 38h			;9110	ff 	. 
	rst 38h			;9111	ff 	. 
	rst 38h			;9112	ff 	. 
	rst 38h			;9113	ff 	. 
	rst 38h			;9114	ff 	. 
	rst 38h			;9115	ff 	. 
	rst 38h			;9116	ff 	. 
	rst 38h			;9117	ff 	. 
	rst 38h			;9118	ff 	. 
	rst 38h			;9119	ff 	. 
	rst 38h			;911a	ff 	. 
	rst 38h			;911b	ff 	. 
	rst 38h			;911c	ff 	. 
	rst 38h			;911d	ff 	. 
	rst 38h			;911e	ff 	. 
	rst 38h			;911f	ff 	. 
	rst 38h			;9120	ff 	. 
	rst 38h			;9121	ff 	. 
	rst 38h			;9122	ff 	. 
	rst 38h			;9123	ff 	. 
	rst 38h			;9124	ff 	. 
	rst 38h			;9125	ff 	. 
	rst 38h			;9126	ff 	. 
	rst 38h			;9127	ff 	. 
	rst 38h			;9128	ff 	. 
	rst 38h			;9129	ff 	. 
	rst 38h			;912a	ff 	. 
	rst 38h			;912b	ff 	. 
	rst 38h			;912c	ff 	. 
	rst 38h			;912d	ff 	. 
	rst 38h			;912e	ff 	. 
	rst 38h			;912f	ff 	. 
	rst 38h			;9130	ff 	. 
	rst 38h			;9131	ff 	. 
	rst 38h			;9132	ff 	. 
	rst 38h			;9133	ff 	. 
	rst 38h			;9134	ff 	. 
	rst 38h			;9135	ff 	. 
	rst 38h			;9136	ff 	. 
	rst 38h			;9137	ff 	. 
	rst 38h			;9138	ff 	. 
	rst 38h			;9139	ff 	. 
	rst 38h			;913a	ff 	. 
	rst 38h			;913b	ff 	. 
	rst 38h			;913c	ff 	. 
	rst 38h			;913d	ff 	. 
	rst 38h			;913e	ff 	. 
	rst 38h			;913f	ff 	. 
	rst 38h			;9140	ff 	. 
	rst 38h			;9141	ff 	. 
	rst 38h			;9142	ff 	. 
	rst 38h			;9143	ff 	. 
	rst 38h			;9144	ff 	. 
	rst 38h			;9145	ff 	. 
	rst 38h			;9146	ff 	. 
	rst 38h			;9147	ff 	. 
	rst 38h			;9148	ff 	. 
	rst 38h			;9149	ff 	. 
	rst 38h			;914a	ff 	. 
	rst 38h			;914b	ff 	. 
	rst 38h			;914c	ff 	. 
	rst 38h			;914d	ff 	. 
	rst 38h			;914e	ff 	. 
	rst 38h			;914f	ff 	. 
	rst 38h			;9150	ff 	. 
	rst 38h			;9151	ff 	. 
	rst 38h			;9152	ff 	. 
	rst 38h			;9153	ff 	. 
	rst 38h			;9154	ff 	. 
	rst 38h			;9155	ff 	. 
	rst 38h			;9156	ff 	. 
	rst 38h			;9157	ff 	. 
	rst 38h			;9158	ff 	. 
	rst 38h			;9159	ff 	. 
	rst 38h			;915a	ff 	. 
	rst 38h			;915b	ff 	. 
	rst 38h			;915c	ff 	. 
	rst 38h			;915d	ff 	. 
	rst 38h			;915e	ff 	. 
	rst 38h			;915f	ff 	. 
	rst 38h			;9160	ff 	. 
	rst 38h			;9161	ff 	. 
	rst 38h			;9162	ff 	. 
	rst 38h			;9163	ff 	. 
	rst 38h			;9164	ff 	. 
	rst 38h			;9165	ff 	. 
	rst 38h			;9166	ff 	. 
	rst 38h			;9167	ff 	. 
	rst 38h			;9168	ff 	. 
	rst 38h			;9169	ff 	. 
	rst 38h			;916a	ff 	. 
	rst 38h			;916b	ff 	. 
	rst 38h			;916c	ff 	. 
	rst 38h			;916d	ff 	. 
	rst 38h			;916e	ff 	. 
	rst 38h			;916f	ff 	. 
	rst 38h			;9170	ff 	. 
	rst 38h			;9171	ff 	. 
	rst 38h			;9172	ff 	. 
	rst 38h			;9173	ff 	. 
	rst 38h			;9174	ff 	. 
	rst 38h			;9175	ff 	. 
	rst 38h			;9176	ff 	. 
	rst 38h			;9177	ff 	. 
	rst 38h			;9178	ff 	. 
	rst 38h			;9179	ff 	. 
	rst 38h			;917a	ff 	. 
	rst 38h			;917b	ff 	. 
	rst 38h			;917c	ff 	. 
	rst 38h			;917d	ff 	. 
	rst 38h			;917e	ff 	. 
	rst 38h			;917f	ff 	. 
	rst 38h			;9180	ff 	. 
	rst 38h			;9181	ff 	. 
	rst 38h			;9182	ff 	. 
	rst 38h			;9183	ff 	. 
	rst 38h			;9184	ff 	. 
	rst 38h			;9185	ff 	. 
	rst 38h			;9186	ff 	. 
	rst 38h			;9187	ff 	. 
	rst 38h			;9188	ff 	. 
	rst 38h			;9189	ff 	. 
	rst 38h			;918a	ff 	. 
	rst 38h			;918b	ff 	. 
	rst 38h			;918c	ff 	. 
	rst 38h			;918d	ff 	. 
	rst 38h			;918e	ff 	. 
	rst 38h			;918f	ff 	. 
	rst 38h			;9190	ff 	. 
	rst 38h			;9191	ff 	. 
	rst 38h			;9192	ff 	. 
	rst 38h			;9193	ff 	. 
	rst 38h			;9194	ff 	. 
	rst 38h			;9195	ff 	. 
	rst 38h			;9196	ff 	. 
	rst 38h			;9197	ff 	. 
	rst 38h			;9198	ff 	. 
	rst 38h			;9199	ff 	. 
	rst 38h			;919a	ff 	. 
	rst 38h			;919b	ff 	. 
	rst 38h			;919c	ff 	. 
	rst 38h			;919d	ff 	. 
	rst 38h			;919e	ff 	. 
	rst 38h			;919f	ff 	. 
	rst 38h			;91a0	ff 	. 
	rst 38h			;91a1	ff 	. 
	rst 38h			;91a2	ff 	. 
	rst 38h			;91a3	ff 	. 
	rst 38h			;91a4	ff 	. 
	rst 38h			;91a5	ff 	. 
	rst 38h			;91a6	ff 	. 
	rst 38h			;91a7	ff 	. 
	rst 38h			;91a8	ff 	. 
	rst 38h			;91a9	ff 	. 
	rst 38h			;91aa	ff 	. 
	rst 38h			;91ab	ff 	. 
	rst 38h			;91ac	ff 	. 
	rst 38h			;91ad	ff 	. 
	rst 38h			;91ae	ff 	. 
	rst 38h			;91af	ff 	. 
	rst 38h			;91b0	ff 	. 
	rst 38h			;91b1	ff 	. 
	rst 38h			;91b2	ff 	. 
	rst 38h			;91b3	ff 	. 
	rst 38h			;91b4	ff 	. 
	rst 38h			;91b5	ff 	. 
	rst 38h			;91b6	ff 	. 
	rst 38h			;91b7	ff 	. 
	rst 38h			;91b8	ff 	. 
	rst 38h			;91b9	ff 	. 
	rst 38h			;91ba	ff 	. 
	rst 38h			;91bb	ff 	. 
	rst 38h			;91bc	ff 	. 
	rst 38h			;91bd	ff 	. 
	rst 38h			;91be	ff 	. 
	rst 38h			;91bf	ff 	. 
	rst 38h			;91c0	ff 	. 
	rst 38h			;91c1	ff 	. 
	rst 38h			;91c2	ff 	. 
	rst 38h			;91c3	ff 	. 
	rst 38h			;91c4	ff 	. 
	rst 38h			;91c5	ff 	. 
	rst 38h			;91c6	ff 	. 
	rst 38h			;91c7	ff 	. 
	rst 38h			;91c8	ff 	. 
	rst 38h			;91c9	ff 	. 
	rst 38h			;91ca	ff 	. 
	rst 38h			;91cb	ff 	. 
	rst 38h			;91cc	ff 	. 
	rst 38h			;91cd	ff 	. 
	rst 38h			;91ce	ff 	. 
	rst 38h			;91cf	ff 	. 
	rst 38h			;91d0	ff 	. 
	rst 38h			;91d1	ff 	. 
	rst 38h			;91d2	ff 	. 
	rst 38h			;91d3	ff 	. 
	rst 38h			;91d4	ff 	. 
	rst 38h			;91d5	ff 	. 
	rst 38h			;91d6	ff 	. 
	rst 38h			;91d7	ff 	. 
	rst 38h			;91d8	ff 	. 
	rst 38h			;91d9	ff 	. 
	rst 38h			;91da	ff 	. 
	rst 38h			;91db	ff 	. 
	rst 38h			;91dc	ff 	. 
	rst 38h			;91dd	ff 	. 
	rst 38h			;91de	ff 	. 
	rst 38h			;91df	ff 	. 
	rst 38h			;91e0	ff 	. 
	rst 38h			;91e1	ff 	. 
	rst 38h			;91e2	ff 	. 
	rst 38h			;91e3	ff 	. 
	rst 38h			;91e4	ff 	. 
	rst 38h			;91e5	ff 	. 
	rst 38h			;91e6	ff 	. 
	rst 38h			;91e7	ff 	. 
	rst 38h			;91e8	ff 	. 
	rst 38h			;91e9	ff 	. 
	rst 38h			;91ea	ff 	. 
	rst 38h			;91eb	ff 	. 
	rst 38h			;91ec	ff 	. 
	rst 38h			;91ed	ff 	. 
	rst 38h			;91ee	ff 	. 
	rst 38h			;91ef	ff 	. 
	rst 38h			;91f0	ff 	. 
	rst 38h			;91f1	ff 	. 
	rst 38h			;91f2	ff 	. 
	rst 38h			;91f3	ff 	. 
	rst 38h			;91f4	ff 	. 
	rst 38h			;91f5	ff 	. 
	rst 38h			;91f6	ff 	. 
	rst 38h			;91f7	ff 	. 
	rst 38h			;91f8	ff 	. 
	rst 38h			;91f9	ff 	. 
	rst 38h			;91fa	ff 	. 
	rst 38h			;91fb	ff 	. 
	rst 38h			;91fc	ff 	. 
	rst 38h			;91fd	ff 	. 
	rst 38h			;91fe	ff 	. 
	rst 38h			;91ff	ff 	. 
	rst 38h			;9200	ff 	. 
	rst 38h			;9201	ff 	. 
	rst 38h			;9202	ff 	. 
	rst 38h			;9203	ff 	. 
	rst 38h			;9204	ff 	. 
	rst 38h			;9205	ff 	. 
	rst 38h			;9206	ff 	. 
	rst 38h			;9207	ff 	. 
	rst 38h			;9208	ff 	. 
	rst 38h			;9209	ff 	. 
	rst 38h			;920a	ff 	. 
	rst 38h			;920b	ff 	. 
	rst 38h			;920c	ff 	. 
	rst 38h			;920d	ff 	. 
	rst 38h			;920e	ff 	. 
	rst 38h			;920f	ff 	. 
	rst 38h			;9210	ff 	. 
	rst 38h			;9211	ff 	. 
	rst 38h			;9212	ff 	. 
	rst 38h			;9213	ff 	. 
	rst 38h			;9214	ff 	. 
	rst 38h			;9215	ff 	. 
	rst 38h			;9216	ff 	. 
	rst 38h			;9217	ff 	. 
	rst 38h			;9218	ff 	. 
	rst 38h			;9219	ff 	. 
	rst 38h			;921a	ff 	. 
	rst 38h			;921b	ff 	. 
	rst 38h			;921c	ff 	. 
	rst 38h			;921d	ff 	. 
	rst 38h			;921e	ff 	. 
	rst 38h			;921f	ff 	. 
	rst 38h			;9220	ff 	. 
	rst 38h			;9221	ff 	. 
	rst 38h			;9222	ff 	. 
	rst 38h			;9223	ff 	. 
	rst 38h			;9224	ff 	. 
	rst 38h			;9225	ff 	. 
	rst 38h			;9226	ff 	. 
	rst 38h			;9227	ff 	. 
	rst 38h			;9228	ff 	. 
	rst 38h			;9229	ff 	. 
	rst 38h			;922a	ff 	. 
	rst 38h			;922b	ff 	. 
	rst 38h			;922c	ff 	. 
	rst 38h			;922d	ff 	. 
	rst 38h			;922e	ff 	. 
	rst 38h			;922f	ff 	. 
	rst 38h			;9230	ff 	. 
	rst 38h			;9231	ff 	. 
	rst 38h			;9232	ff 	. 
	rst 38h			;9233	ff 	. 
	rst 38h			;9234	ff 	. 
	rst 38h			;9235	ff 	. 
	rst 38h			;9236	ff 	. 
	rst 38h			;9237	ff 	. 
	rst 38h			;9238	ff 	. 
	rst 38h			;9239	ff 	. 
	rst 38h			;923a	ff 	. 
	rst 38h			;923b	ff 	. 
	rst 38h			;923c	ff 	. 
	rst 38h			;923d	ff 	. 
	rst 38h			;923e	ff 	. 
	rst 38h			;923f	ff 	. 
	rst 38h			;9240	ff 	. 
	rst 38h			;9241	ff 	. 
	rst 38h			;9242	ff 	. 
	rst 38h			;9243	ff 	. 
	rst 38h			;9244	ff 	. 
	rst 38h			;9245	ff 	. 
	rst 38h			;9246	ff 	. 
	rst 38h			;9247	ff 	. 
	rst 38h			;9248	ff 	. 
	rst 38h			;9249	ff 	. 
	rst 38h			;924a	ff 	. 
	rst 38h			;924b	ff 	. 
	rst 38h			;924c	ff 	. 
	rst 38h			;924d	ff 	. 
	rst 38h			;924e	ff 	. 
	rst 38h			;924f	ff 	. 
	rst 38h			;9250	ff 	. 
	rst 38h			;9251	ff 	. 
	rst 38h			;9252	ff 	. 
	rst 38h			;9253	ff 	. 
	rst 38h			;9254	ff 	. 
	rst 38h			;9255	ff 	. 
	rst 38h			;9256	ff 	. 
	rst 38h			;9257	ff 	. 
	rst 38h			;9258	ff 	. 
	rst 38h			;9259	ff 	. 
	rst 38h			;925a	ff 	. 
	rst 38h			;925b	ff 	. 
	rst 38h			;925c	ff 	. 
	rst 38h			;925d	ff 	. 
	rst 38h			;925e	ff 	. 
	rst 38h			;925f	ff 	. 
	rst 38h			;9260	ff 	. 
	rst 38h			;9261	ff 	. 
	rst 38h			;9262	ff 	. 
	rst 38h			;9263	ff 	. 
	rst 38h			;9264	ff 	. 
	rst 38h			;9265	ff 	. 
	rst 38h			;9266	ff 	. 
	rst 38h			;9267	ff 	. 
	rst 38h			;9268	ff 	. 
	rst 38h			;9269	ff 	. 
	rst 38h			;926a	ff 	. 
	rst 38h			;926b	ff 	. 
	rst 38h			;926c	ff 	. 
	rst 38h			;926d	ff 	. 
	rst 38h			;926e	ff 	. 
	rst 38h			;926f	ff 	. 
	rst 38h			;9270	ff 	. 
	rst 38h			;9271	ff 	. 
	rst 38h			;9272	ff 	. 
	rst 38h			;9273	ff 	. 
	rst 38h			;9274	ff 	. 
	rst 38h			;9275	ff 	. 
	rst 38h			;9276	ff 	. 
	rst 38h			;9277	ff 	. 
	rst 38h			;9278	ff 	. 
	rst 38h			;9279	ff 	. 
	rst 38h			;927a	ff 	. 
	rst 38h			;927b	ff 	. 
	rst 38h			;927c	ff 	. 
	rst 38h			;927d	ff 	. 
	rst 38h			;927e	ff 	. 
	rst 38h			;927f	ff 	. 
	rst 38h			;9280	ff 	. 
	rst 38h			;9281	ff 	. 
	rst 38h			;9282	ff 	. 
	rst 38h			;9283	ff 	. 
	rst 38h			;9284	ff 	. 
	rst 38h			;9285	ff 	. 
	rst 38h			;9286	ff 	. 
	rst 38h			;9287	ff 	. 
	rst 38h			;9288	ff 	. 
	rst 38h			;9289	ff 	. 
	rst 38h			;928a	ff 	. 
	rst 38h			;928b	ff 	. 
	rst 38h			;928c	ff 	. 
	rst 38h			;928d	ff 	. 
	rst 38h			;928e	ff 	. 
	rst 38h			;928f	ff 	. 
	rst 38h			;9290	ff 	. 
	rst 38h			;9291	ff 	. 
	rst 38h			;9292	ff 	. 
	rst 38h			;9293	ff 	. 
	rst 38h			;9294	ff 	. 
	rst 38h			;9295	ff 	. 
	rst 38h			;9296	ff 	. 
	rst 38h			;9297	ff 	. 
	rst 38h			;9298	ff 	. 
	rst 38h			;9299	ff 	. 
	rst 38h			;929a	ff 	. 
	rst 38h			;929b	ff 	. 
	rst 38h			;929c	ff 	. 
	rst 38h			;929d	ff 	. 
	rst 38h			;929e	ff 	. 
	rst 38h			;929f	ff 	. 
	rst 38h			;92a0	ff 	. 
	rst 38h			;92a1	ff 	. 
	rst 38h			;92a2	ff 	. 
	rst 38h			;92a3	ff 	. 
	rst 38h			;92a4	ff 	. 
	rst 38h			;92a5	ff 	. 
	rst 38h			;92a6	ff 	. 
	rst 38h			;92a7	ff 	. 
	rst 38h			;92a8	ff 	. 
	rst 38h			;92a9	ff 	. 
	rst 38h			;92aa	ff 	. 
	rst 38h			;92ab	ff 	. 
	rst 38h			;92ac	ff 	. 
	rst 38h			;92ad	ff 	. 
	rst 38h			;92ae	ff 	. 
	rst 38h			;92af	ff 	. 
	rst 38h			;92b0	ff 	. 
	rst 38h			;92b1	ff 	. 
	rst 38h			;92b2	ff 	. 
	rst 38h			;92b3	ff 	. 
	rst 38h			;92b4	ff 	. 
	rst 38h			;92b5	ff 	. 
	rst 38h			;92b6	ff 	. 
	rst 38h			;92b7	ff 	. 
	rst 38h			;92b8	ff 	. 
	rst 38h			;92b9	ff 	. 
	rst 38h			;92ba	ff 	. 
	rst 38h			;92bb	ff 	. 
	rst 38h			;92bc	ff 	. 
	rst 38h			;92bd	ff 	. 
	rst 38h			;92be	ff 	. 
	rst 38h			;92bf	ff 	. 
	rst 38h			;92c0	ff 	. 
	rst 38h			;92c1	ff 	. 
	rst 38h			;92c2	ff 	. 
	rst 38h			;92c3	ff 	. 
	rst 38h			;92c4	ff 	. 
	rst 38h			;92c5	ff 	. 
	rst 38h			;92c6	ff 	. 
	rst 38h			;92c7	ff 	. 
	rst 38h			;92c8	ff 	. 
	rst 38h			;92c9	ff 	. 
	rst 38h			;92ca	ff 	. 
	rst 38h			;92cb	ff 	. 
	rst 38h			;92cc	ff 	. 
	rst 38h			;92cd	ff 	. 
	rst 38h			;92ce	ff 	. 
	rst 38h			;92cf	ff 	. 
	rst 38h			;92d0	ff 	. 
	rst 38h			;92d1	ff 	. 
	rst 38h			;92d2	ff 	. 
	rst 38h			;92d3	ff 	. 
	rst 38h			;92d4	ff 	. 
	rst 38h			;92d5	ff 	. 
	rst 38h			;92d6	ff 	. 
	rst 38h			;92d7	ff 	. 
	rst 38h			;92d8	ff 	. 
	rst 38h			;92d9	ff 	. 
	rst 38h			;92da	ff 	. 
	rst 38h			;92db	ff 	. 
	rst 38h			;92dc	ff 	. 
	rst 38h			;92dd	ff 	. 
	rst 38h			;92de	ff 	. 
	rst 38h			;92df	ff 	. 
	rst 38h			;92e0	ff 	. 
	rst 38h			;92e1	ff 	. 
	rst 38h			;92e2	ff 	. 
	rst 38h			;92e3	ff 	. 
	rst 38h			;92e4	ff 	. 
	rst 38h			;92e5	ff 	. 
	rst 38h			;92e6	ff 	. 
	rst 38h			;92e7	ff 	. 
	rst 38h			;92e8	ff 	. 
	rst 38h			;92e9	ff 	. 
	rst 38h			;92ea	ff 	. 
	rst 38h			;92eb	ff 	. 
	rst 38h			;92ec	ff 	. 
	rst 38h			;92ed	ff 	. 
	rst 38h			;92ee	ff 	. 
	rst 38h			;92ef	ff 	. 
	rst 38h			;92f0	ff 	. 
	rst 38h			;92f1	ff 	. 
	rst 38h			;92f2	ff 	. 
	rst 38h			;92f3	ff 	. 
	rst 38h			;92f4	ff 	. 
	rst 38h			;92f5	ff 	. 
	rst 38h			;92f6	ff 	. 
	rst 38h			;92f7	ff 	. 
	rst 38h			;92f8	ff 	. 
	rst 38h			;92f9	ff 	. 
	rst 38h			;92fa	ff 	. 
	rst 38h			;92fb	ff 	. 
	rst 38h			;92fc	ff 	. 
	rst 38h			;92fd	ff 	. 
	rst 38h			;92fe	ff 	. 
	rst 38h			;92ff	ff 	. 
	rst 38h			;9300	ff 	. 
	rst 38h			;9301	ff 	. 
	rst 38h			;9302	ff 	. 
	rst 38h			;9303	ff 	. 
	rst 38h			;9304	ff 	. 
	rst 38h			;9305	ff 	. 
	rst 38h			;9306	ff 	. 
	rst 38h			;9307	ff 	. 
	rst 38h			;9308	ff 	. 
	rst 38h			;9309	ff 	. 
	rst 38h			;930a	ff 	. 
	rst 38h			;930b	ff 	. 
	rst 38h			;930c	ff 	. 
	rst 38h			;930d	ff 	. 
	rst 38h			;930e	ff 	. 
	rst 38h			;930f	ff 	. 
	rst 38h			;9310	ff 	. 
	rst 38h			;9311	ff 	. 
	rst 38h			;9312	ff 	. 
	rst 38h			;9313	ff 	. 
	rst 38h			;9314	ff 	. 
	rst 38h			;9315	ff 	. 
	rst 38h			;9316	ff 	. 
	rst 38h			;9317	ff 	. 
	rst 38h			;9318	ff 	. 
	rst 38h			;9319	ff 	. 
	rst 38h			;931a	ff 	. 
	rst 38h			;931b	ff 	. 
	rst 38h			;931c	ff 	. 
	rst 38h			;931d	ff 	. 
	rst 38h			;931e	ff 	. 
	rst 38h			;931f	ff 	. 
	rst 38h			;9320	ff 	. 
	rst 38h			;9321	ff 	. 
	rst 38h			;9322	ff 	. 
	rst 38h			;9323	ff 	. 
	rst 38h			;9324	ff 	. 
	rst 38h			;9325	ff 	. 
	rst 38h			;9326	ff 	. 
	rst 38h			;9327	ff 	. 
	rst 38h			;9328	ff 	. 
	rst 38h			;9329	ff 	. 
	rst 38h			;932a	ff 	. 
	rst 38h			;932b	ff 	. 
	rst 38h			;932c	ff 	. 
	rst 38h			;932d	ff 	. 
	rst 38h			;932e	ff 	. 
	rst 38h			;932f	ff 	. 
	rst 38h			;9330	ff 	. 
	rst 38h			;9331	ff 	. 
	rst 38h			;9332	ff 	. 
	rst 38h			;9333	ff 	. 
	rst 38h			;9334	ff 	. 
	rst 38h			;9335	ff 	. 
	rst 38h			;9336	ff 	. 
	rst 38h			;9337	ff 	. 
	rst 38h			;9338	ff 	. 
	rst 38h			;9339	ff 	. 
	rst 38h			;933a	ff 	. 
	rst 38h			;933b	ff 	. 
	rst 38h			;933c	ff 	. 
	rst 38h			;933d	ff 	. 
	rst 38h			;933e	ff 	. 
	rst 38h			;933f	ff 	. 
	rst 38h			;9340	ff 	. 
	rst 38h			;9341	ff 	. 
	rst 38h			;9342	ff 	. 
	rst 38h			;9343	ff 	. 
	rst 38h			;9344	ff 	. 
	rst 38h			;9345	ff 	. 
	rst 38h			;9346	ff 	. 
	rst 38h			;9347	ff 	. 
	rst 38h			;9348	ff 	. 
	rst 38h			;9349	ff 	. 
	rst 38h			;934a	ff 	. 
	rst 38h			;934b	ff 	. 
	rst 38h			;934c	ff 	. 
	rst 38h			;934d	ff 	. 
	rst 38h			;934e	ff 	. 
	rst 38h			;934f	ff 	. 
	rst 38h			;9350	ff 	. 
	rst 38h			;9351	ff 	. 
	rst 38h			;9352	ff 	. 
	rst 38h			;9353	ff 	. 
	rst 38h			;9354	ff 	. 
	rst 38h			;9355	ff 	. 
	rst 38h			;9356	ff 	. 
	rst 38h			;9357	ff 	. 
	rst 38h			;9358	ff 	. 
	rst 38h			;9359	ff 	. 
	rst 38h			;935a	ff 	. 
	rst 38h			;935b	ff 	. 
	rst 38h			;935c	ff 	. 
	rst 38h			;935d	ff 	. 
	rst 38h			;935e	ff 	. 
	rst 38h			;935f	ff 	. 
	rst 38h			;9360	ff 	. 
	rst 38h			;9361	ff 	. 
	rst 38h			;9362	ff 	. 
	rst 38h			;9363	ff 	. 
	rst 38h			;9364	ff 	. 
	rst 38h			;9365	ff 	. 
	rst 38h			;9366	ff 	. 
	rst 38h			;9367	ff 	. 
	rst 38h			;9368	ff 	. 
	rst 38h			;9369	ff 	. 
	rst 38h			;936a	ff 	. 
	rst 38h			;936b	ff 	. 
	rst 38h			;936c	ff 	. 
	rst 38h			;936d	ff 	. 
	rst 38h			;936e	ff 	. 
	rst 38h			;936f	ff 	. 
	rst 38h			;9370	ff 	. 
	rst 38h			;9371	ff 	. 
	rst 38h			;9372	ff 	. 
	rst 38h			;9373	ff 	. 
	rst 38h			;9374	ff 	. 
	rst 38h			;9375	ff 	. 
	rst 38h			;9376	ff 	. 
	rst 38h			;9377	ff 	. 
	rst 38h			;9378	ff 	. 
	rst 38h			;9379	ff 	. 
	rst 38h			;937a	ff 	. 
	rst 38h			;937b	ff 	. 
	rst 38h			;937c	ff 	. 
	rst 38h			;937d	ff 	. 
	rst 38h			;937e	ff 	. 
	rst 38h			;937f	ff 	. 
	rst 38h			;9380	ff 	. 
	rst 38h			;9381	ff 	. 
	rst 38h			;9382	ff 	. 
	rst 38h			;9383	ff 	. 
	rst 38h			;9384	ff 	. 
	rst 38h			;9385	ff 	. 
	rst 38h			;9386	ff 	. 
	rst 38h			;9387	ff 	. 
	rst 38h			;9388	ff 	. 
	rst 38h			;9389	ff 	. 
	rst 38h			;938a	ff 	. 
	rst 38h			;938b	ff 	. 
	rst 38h			;938c	ff 	. 
	rst 38h			;938d	ff 	. 
	rst 38h			;938e	ff 	. 
	rst 38h			;938f	ff 	. 
	rst 38h			;9390	ff 	. 
	rst 38h			;9391	ff 	. 
	rst 38h			;9392	ff 	. 
	rst 38h			;9393	ff 	. 
	rst 38h			;9394	ff 	. 
	rst 38h			;9395	ff 	. 
	rst 38h			;9396	ff 	. 
	rst 38h			;9397	ff 	. 
	rst 38h			;9398	ff 	. 
	rst 38h			;9399	ff 	. 
	rst 38h			;939a	ff 	. 
	rst 38h			;939b	ff 	. 
	rst 38h			;939c	ff 	. 
	rst 38h			;939d	ff 	. 
	rst 38h			;939e	ff 	. 
	rst 38h			;939f	ff 	. 
	rst 38h			;93a0	ff 	. 
	rst 38h			;93a1	ff 	. 
	rst 38h			;93a2	ff 	. 
	rst 38h			;93a3	ff 	. 
	rst 38h			;93a4	ff 	. 
	rst 38h			;93a5	ff 	. 
	rst 38h			;93a6	ff 	. 
	rst 38h			;93a7	ff 	. 
	rst 38h			;93a8	ff 	. 
	rst 38h			;93a9	ff 	. 
	rst 38h			;93aa	ff 	. 
	rst 38h			;93ab	ff 	. 
	rst 38h			;93ac	ff 	. 
	rst 38h			;93ad	ff 	. 
	rst 38h			;93ae	ff 	. 
	rst 38h			;93af	ff 	. 
	rst 38h			;93b0	ff 	. 
	rst 38h			;93b1	ff 	. 
	rst 38h			;93b2	ff 	. 
	rst 38h			;93b3	ff 	. 
	rst 38h			;93b4	ff 	. 
	rst 38h			;93b5	ff 	. 
	rst 38h			;93b6	ff 	. 
	rst 38h			;93b7	ff 	. 
	rst 38h			;93b8	ff 	. 
	rst 38h			;93b9	ff 	. 
	rst 38h			;93ba	ff 	. 
	rst 38h			;93bb	ff 	. 
	rst 38h			;93bc	ff 	. 
	rst 38h			;93bd	ff 	. 
	rst 38h			;93be	ff 	. 
	rst 38h			;93bf	ff 	. 
	rst 38h			;93c0	ff 	. 
	rst 38h			;93c1	ff 	. 
	rst 38h			;93c2	ff 	. 
	rst 38h			;93c3	ff 	. 
	rst 38h			;93c4	ff 	. 
	rst 38h			;93c5	ff 	. 
	rst 38h			;93c6	ff 	. 
	rst 38h			;93c7	ff 	. 
	rst 38h			;93c8	ff 	. 
	rst 38h			;93c9	ff 	. 
	rst 38h			;93ca	ff 	. 
	rst 38h			;93cb	ff 	. 
	rst 38h			;93cc	ff 	. 
	rst 38h			;93cd	ff 	. 
	rst 38h			;93ce	ff 	. 
	rst 38h			;93cf	ff 	. 
	rst 38h			;93d0	ff 	. 
	rst 38h			;93d1	ff 	. 
	rst 38h			;93d2	ff 	. 
	rst 38h			;93d3	ff 	. 
	rst 38h			;93d4	ff 	. 
	rst 38h			;93d5	ff 	. 
	rst 38h			;93d6	ff 	. 
	rst 38h			;93d7	ff 	. 
	rst 38h			;93d8	ff 	. 
	rst 38h			;93d9	ff 	. 
	rst 38h			;93da	ff 	. 
	rst 38h			;93db	ff 	. 
	rst 38h			;93dc	ff 	. 
	rst 38h			;93dd	ff 	. 
	rst 38h			;93de	ff 	. 
	rst 38h			;93df	ff 	. 
	rst 38h			;93e0	ff 	. 
	rst 38h			;93e1	ff 	. 
	rst 38h			;93e2	ff 	. 
	rst 38h			;93e3	ff 	. 
	rst 38h			;93e4	ff 	. 
	rst 38h			;93e5	ff 	. 
	rst 38h			;93e6	ff 	. 
	rst 38h			;93e7	ff 	. 
	rst 38h			;93e8	ff 	. 
	rst 38h			;93e9	ff 	. 
	rst 38h			;93ea	ff 	. 
	rst 38h			;93eb	ff 	. 
	rst 38h			;93ec	ff 	. 
	rst 38h			;93ed	ff 	. 
	rst 38h			;93ee	ff 	. 
	rst 38h			;93ef	ff 	. 
	rst 38h			;93f0	ff 	. 
	rst 38h			;93f1	ff 	. 
	rst 38h			;93f2	ff 	. 
	rst 38h			;93f3	ff 	. 
	rst 38h			;93f4	ff 	. 
	rst 38h			;93f5	ff 	. 
	rst 38h			;93f6	ff 	. 
	rst 38h			;93f7	ff 	. 
	rst 38h			;93f8	ff 	. 
	rst 38h			;93f9	ff 	. 
	rst 38h			;93fa	ff 	. 
	rst 38h			;93fb	ff 	. 
	rst 38h			;93fc	ff 	. 
	rst 38h			;93fd	ff 	. 
	rst 38h			;93fe	ff 	. 
	rst 38h			;93ff	ff 	. 
	rst 38h			;9400	ff 	. 
	rst 38h			;9401	ff 	. 
	rst 38h			;9402	ff 	. 
	rst 38h			;9403	ff 	. 
	rst 38h			;9404	ff 	. 
	rst 38h			;9405	ff 	. 
	rst 38h			;9406	ff 	. 
	rst 38h			;9407	ff 	. 
	rst 38h			;9408	ff 	. 
	rst 38h			;9409	ff 	. 
	rst 38h			;940a	ff 	. 
	rst 38h			;940b	ff 	. 
	rst 38h			;940c	ff 	. 
	rst 38h			;940d	ff 	. 
	rst 38h			;940e	ff 	. 
	rst 38h			;940f	ff 	. 
	rst 38h			;9410	ff 	. 
	rst 38h			;9411	ff 	. 
	rst 38h			;9412	ff 	. 
	rst 38h			;9413	ff 	. 
	rst 38h			;9414	ff 	. 
	rst 38h			;9415	ff 	. 
	rst 38h			;9416	ff 	. 
	rst 38h			;9417	ff 	. 
	rst 38h			;9418	ff 	. 
	rst 38h			;9419	ff 	. 
	rst 38h			;941a	ff 	. 
	rst 38h			;941b	ff 	. 
	rst 38h			;941c	ff 	. 
	rst 38h			;941d	ff 	. 
	rst 38h			;941e	ff 	. 
	rst 38h			;941f	ff 	. 
	rst 38h			;9420	ff 	. 
	rst 38h			;9421	ff 	. 
	rst 38h			;9422	ff 	. 
	rst 38h			;9423	ff 	. 
	rst 38h			;9424	ff 	. 
	rst 38h			;9425	ff 	. 
	rst 38h			;9426	ff 	. 
	rst 38h			;9427	ff 	. 
	rst 38h			;9428	ff 	. 
	rst 38h			;9429	ff 	. 
	rst 38h			;942a	ff 	. 
	rst 38h			;942b	ff 	. 
	rst 38h			;942c	ff 	. 
	rst 38h			;942d	ff 	. 
	rst 38h			;942e	ff 	. 
	rst 38h			;942f	ff 	. 
	rst 38h			;9430	ff 	. 
	rst 38h			;9431	ff 	. 
	rst 38h			;9432	ff 	. 
	rst 38h			;9433	ff 	. 
	rst 38h			;9434	ff 	. 
	rst 38h			;9435	ff 	. 
	rst 38h			;9436	ff 	. 
	rst 38h			;9437	ff 	. 
	rst 38h			;9438	ff 	. 
	rst 38h			;9439	ff 	. 
	rst 38h			;943a	ff 	. 
	rst 38h			;943b	ff 	. 
	rst 38h			;943c	ff 	. 
	rst 38h			;943d	ff 	. 
	rst 38h			;943e	ff 	. 
	rst 38h			;943f	ff 	. 
	rst 38h			;9440	ff 	. 
	rst 38h			;9441	ff 	. 
	rst 38h			;9442	ff 	. 
	rst 38h			;9443	ff 	. 
	rst 38h			;9444	ff 	. 
	rst 38h			;9445	ff 	. 
	rst 38h			;9446	ff 	. 
	rst 38h			;9447	ff 	. 
	rst 38h			;9448	ff 	. 
	rst 38h			;9449	ff 	. 
	rst 38h			;944a	ff 	. 
	rst 38h			;944b	ff 	. 
	rst 38h			;944c	ff 	. 
	rst 38h			;944d	ff 	. 
	rst 38h			;944e	ff 	. 
	rst 38h			;944f	ff 	. 
	rst 38h			;9450	ff 	. 
	rst 38h			;9451	ff 	. 
	rst 38h			;9452	ff 	. 
	rst 38h			;9453	ff 	. 
	rst 38h			;9454	ff 	. 
	rst 38h			;9455	ff 	. 
	rst 38h			;9456	ff 	. 
	rst 38h			;9457	ff 	. 
	rst 38h			;9458	ff 	. 
	rst 38h			;9459	ff 	. 
	rst 38h			;945a	ff 	. 
	rst 38h			;945b	ff 	. 
	rst 38h			;945c	ff 	. 
	rst 38h			;945d	ff 	. 
	rst 38h			;945e	ff 	. 
	rst 38h			;945f	ff 	. 
	rst 38h			;9460	ff 	. 
	rst 38h			;9461	ff 	. 
	rst 38h			;9462	ff 	. 
	rst 38h			;9463	ff 	. 
	rst 38h			;9464	ff 	. 
	rst 38h			;9465	ff 	. 
	rst 38h			;9466	ff 	. 
	rst 38h			;9467	ff 	. 
	rst 38h			;9468	ff 	. 
	rst 38h			;9469	ff 	. 
	rst 38h			;946a	ff 	. 
	rst 38h			;946b	ff 	. 
	rst 38h			;946c	ff 	. 
	rst 38h			;946d	ff 	. 
	rst 38h			;946e	ff 	. 
	rst 38h			;946f	ff 	. 
	rst 38h			;9470	ff 	. 
	rst 38h			;9471	ff 	. 
	rst 38h			;9472	ff 	. 
	rst 38h			;9473	ff 	. 
	rst 38h			;9474	ff 	. 
	rst 38h			;9475	ff 	. 
	rst 38h			;9476	ff 	. 
	rst 38h			;9477	ff 	. 
	rst 38h			;9478	ff 	. 
	rst 38h			;9479	ff 	. 
	rst 38h			;947a	ff 	. 
	rst 38h			;947b	ff 	. 
	rst 38h			;947c	ff 	. 
	rst 38h			;947d	ff 	. 
	rst 38h			;947e	ff 	. 
	rst 38h			;947f	ff 	. 
	rst 38h			;9480	ff 	. 
	rst 38h			;9481	ff 	. 
	rst 38h			;9482	ff 	. 
	rst 38h			;9483	ff 	. 
	rst 38h			;9484	ff 	. 
	rst 38h			;9485	ff 	. 
	rst 38h			;9486	ff 	. 
	rst 38h			;9487	ff 	. 
	rst 38h			;9488	ff 	. 
	rst 38h			;9489	ff 	. 
	rst 38h			;948a	ff 	. 
	rst 38h			;948b	ff 	. 
	rst 38h			;948c	ff 	. 
	rst 38h			;948d	ff 	. 
	rst 38h			;948e	ff 	. 
	rst 38h			;948f	ff 	. 
	rst 38h			;9490	ff 	. 
	rst 38h			;9491	ff 	. 
	rst 38h			;9492	ff 	. 
	rst 38h			;9493	ff 	. 
	rst 38h			;9494	ff 	. 
	rst 38h			;9495	ff 	. 
	rst 38h			;9496	ff 	. 
	rst 38h			;9497	ff 	. 
	rst 38h			;9498	ff 	. 
	rst 38h			;9499	ff 	. 
	rst 38h			;949a	ff 	. 
	rst 38h			;949b	ff 	. 
	rst 38h			;949c	ff 	. 
	rst 38h			;949d	ff 	. 
	rst 38h			;949e	ff 	. 
	rst 38h			;949f	ff 	. 
	rst 38h			;94a0	ff 	. 
	rst 38h			;94a1	ff 	. 
	rst 38h			;94a2	ff 	. 
	rst 38h			;94a3	ff 	. 
	rst 38h			;94a4	ff 	. 
	rst 38h			;94a5	ff 	. 
	rst 38h			;94a6	ff 	. 
	rst 38h			;94a7	ff 	. 
	rst 38h			;94a8	ff 	. 
	rst 38h			;94a9	ff 	. 
	rst 38h			;94aa	ff 	. 
	rst 38h			;94ab	ff 	. 
	rst 38h			;94ac	ff 	. 
	rst 38h			;94ad	ff 	. 
	rst 38h			;94ae	ff 	. 
	rst 38h			;94af	ff 	. 
	rst 38h			;94b0	ff 	. 
	rst 38h			;94b1	ff 	. 
	rst 38h			;94b2	ff 	. 
	rst 38h			;94b3	ff 	. 
	rst 38h			;94b4	ff 	. 
	rst 38h			;94b5	ff 	. 
	rst 38h			;94b6	ff 	. 
	rst 38h			;94b7	ff 	. 
	rst 38h			;94b8	ff 	. 
	rst 38h			;94b9	ff 	. 
	rst 38h			;94ba	ff 	. 
	rst 38h			;94bb	ff 	. 
	rst 38h			;94bc	ff 	. 
	rst 38h			;94bd	ff 	. 
	rst 38h			;94be	ff 	. 
	rst 38h			;94bf	ff 	. 
	rst 38h			;94c0	ff 	. 
	rst 38h			;94c1	ff 	. 
	rst 38h			;94c2	ff 	. 
	rst 38h			;94c3	ff 	. 
	rst 38h			;94c4	ff 	. 
	rst 38h			;94c5	ff 	. 
	rst 38h			;94c6	ff 	. 
	rst 38h			;94c7	ff 	. 
	rst 38h			;94c8	ff 	. 
	rst 38h			;94c9	ff 	. 
	rst 38h			;94ca	ff 	. 
	rst 38h			;94cb	ff 	. 
	rst 38h			;94cc	ff 	. 
	rst 38h			;94cd	ff 	. 
	rst 38h			;94ce	ff 	. 
	rst 38h			;94cf	ff 	. 
	rst 38h			;94d0	ff 	. 
	rst 38h			;94d1	ff 	. 
	rst 38h			;94d2	ff 	. 
	rst 38h			;94d3	ff 	. 
	rst 38h			;94d4	ff 	. 
	rst 38h			;94d5	ff 	. 
	rst 38h			;94d6	ff 	. 
	rst 38h			;94d7	ff 	. 
	rst 38h			;94d8	ff 	. 
	rst 38h			;94d9	ff 	. 
	rst 38h			;94da	ff 	. 
	rst 38h			;94db	ff 	. 
	rst 38h			;94dc	ff 	. 
	rst 38h			;94dd	ff 	. 
	rst 38h			;94de	ff 	. 
	rst 38h			;94df	ff 	. 
	rst 38h			;94e0	ff 	. 
	rst 38h			;94e1	ff 	. 
	rst 38h			;94e2	ff 	. 
	rst 38h			;94e3	ff 	. 
	rst 38h			;94e4	ff 	. 
	rst 38h			;94e5	ff 	. 
	rst 38h			;94e6	ff 	. 
	rst 38h			;94e7	ff 	. 
	rst 38h			;94e8	ff 	. 
	rst 38h			;94e9	ff 	. 
	rst 38h			;94ea	ff 	. 
	rst 38h			;94eb	ff 	. 
	rst 38h			;94ec	ff 	. 
	rst 38h			;94ed	ff 	. 
	rst 38h			;94ee	ff 	. 
	rst 38h			;94ef	ff 	. 
	rst 38h			;94f0	ff 	. 
	rst 38h			;94f1	ff 	. 
	rst 38h			;94f2	ff 	. 
	rst 38h			;94f3	ff 	. 
	rst 38h			;94f4	ff 	. 
	rst 38h			;94f5	ff 	. 
	rst 38h			;94f6	ff 	. 
	rst 38h			;94f7	ff 	. 
	rst 38h			;94f8	ff 	. 
	rst 38h			;94f9	ff 	. 
	rst 38h			;94fa	ff 	. 
	rst 38h			;94fb	ff 	. 
	rst 38h			;94fc	ff 	. 
	rst 38h			;94fd	ff 	. 
	rst 38h			;94fe	ff 	. 
	rst 38h			;94ff	ff 	. 
l9500h:
	rst 38h			;9500	ff 	. 
	rst 38h			;9501	ff 	. 
	rst 38h			;9502	ff 	. 
	rst 38h			;9503	ff 	. 
	rst 38h			;9504	ff 	. 
	rst 38h			;9505	ff 	. 
	rst 38h			;9506	ff 	. 
	rst 38h			;9507	ff 	. 
	rst 38h			;9508	ff 	. 
	rst 38h			;9509	ff 	. 
	rst 38h			;950a	ff 	. 
	rst 38h			;950b	ff 	. 
	rst 38h			;950c	ff 	. 
	rst 38h			;950d	ff 	. 
	rst 38h			;950e	ff 	. 
	rst 38h			;950f	ff 	. 
	rst 38h			;9510	ff 	. 
	rst 38h			;9511	ff 	. 
	rst 38h			;9512	ff 	. 
	rst 38h			;9513	ff 	. 
	rst 38h			;9514	ff 	. 
	rst 38h			;9515	ff 	. 
	rst 38h			;9516	ff 	. 
	rst 38h			;9517	ff 	. 
	rst 38h			;9518	ff 	. 
	rst 38h			;9519	ff 	. 
	rst 38h			;951a	ff 	. 
	rst 38h			;951b	ff 	. 
	rst 38h			;951c	ff 	. 
	rst 38h			;951d	ff 	. 
	rst 38h			;951e	ff 	. 
	rst 38h			;951f	ff 	. 
	rst 38h			;9520	ff 	. 
	rst 38h			;9521	ff 	. 
	rst 38h			;9522	ff 	. 
	rst 38h			;9523	ff 	. 
	rst 38h			;9524	ff 	. 
	rst 38h			;9525	ff 	. 
	rst 38h			;9526	ff 	. 
	rst 38h			;9527	ff 	. 
	rst 38h			;9528	ff 	. 
	rst 38h			;9529	ff 	. 
	rst 38h			;952a	ff 	. 
	rst 38h			;952b	ff 	. 
	rst 38h			;952c	ff 	. 
	rst 38h			;952d	ff 	. 
	rst 38h			;952e	ff 	. 
	rst 38h			;952f	ff 	. 
	rst 38h			;9530	ff 	. 
	rst 38h			;9531	ff 	. 
	rst 38h			;9532	ff 	. 
	rst 38h			;9533	ff 	. 
	rst 38h			;9534	ff 	. 
	rst 38h			;9535	ff 	. 
	rst 38h			;9536	ff 	. 
	rst 38h			;9537	ff 	. 
	rst 38h			;9538	ff 	. 
	rst 38h			;9539	ff 	. 
	rst 38h			;953a	ff 	. 
	rst 38h			;953b	ff 	. 
	rst 38h			;953c	ff 	. 
	rst 38h			;953d	ff 	. 
	rst 38h			;953e	ff 	. 
	rst 38h			;953f	ff 	. 
	rst 38h			;9540	ff 	. 
	rst 38h			;9541	ff 	. 
	rst 38h			;9542	ff 	. 
	rst 38h			;9543	ff 	. 
	rst 38h			;9544	ff 	. 
	rst 38h			;9545	ff 	. 
	rst 38h			;9546	ff 	. 
	rst 38h			;9547	ff 	. 
	rst 38h			;9548	ff 	. 
	rst 38h			;9549	ff 	. 
	rst 38h			;954a	ff 	. 
	rst 38h			;954b	ff 	. 
	rst 38h			;954c	ff 	. 
	rst 38h			;954d	ff 	. 
	rst 38h			;954e	ff 	. 
	rst 38h			;954f	ff 	. 
	rst 38h			;9550	ff 	. 
	rst 38h			;9551	ff 	. 
	rst 38h			;9552	ff 	. 
	rst 38h			;9553	ff 	. 
	rst 38h			;9554	ff 	. 
	rst 38h			;9555	ff 	. 
	rst 38h			;9556	ff 	. 
	rst 38h			;9557	ff 	. 
	rst 38h			;9558	ff 	. 
	rst 38h			;9559	ff 	. 
	rst 38h			;955a	ff 	. 
	rst 38h			;955b	ff 	. 
	rst 38h			;955c	ff 	. 
	rst 38h			;955d	ff 	. 
	rst 38h			;955e	ff 	. 
	rst 38h			;955f	ff 	. 
	rst 38h			;9560	ff 	. 
	rst 38h			;9561	ff 	. 
	rst 38h			;9562	ff 	. 
	rst 38h			;9563	ff 	. 
	rst 38h			;9564	ff 	. 
	rst 38h			;9565	ff 	. 
	rst 38h			;9566	ff 	. 
	rst 38h			;9567	ff 	. 
	rst 38h			;9568	ff 	. 
	rst 38h			;9569	ff 	. 
	rst 38h			;956a	ff 	. 
	rst 38h			;956b	ff 	. 
	rst 38h			;956c	ff 	. 
	rst 38h			;956d	ff 	. 
	rst 38h			;956e	ff 	. 
	rst 38h			;956f	ff 	. 
	rst 38h			;9570	ff 	. 
	rst 38h			;9571	ff 	. 
	rst 38h			;9572	ff 	. 
	rst 38h			;9573	ff 	. 
	rst 38h			;9574	ff 	. 
	rst 38h			;9575	ff 	. 
	rst 38h			;9576	ff 	. 
	rst 38h			;9577	ff 	. 
	rst 38h			;9578	ff 	. 
	rst 38h			;9579	ff 	. 
	rst 38h			;957a	ff 	. 
	rst 38h			;957b	ff 	. 
	rst 38h			;957c	ff 	. 
	rst 38h			;957d	ff 	. 
	rst 38h			;957e	ff 	. 
	rst 38h			;957f	ff 	. 
	rst 38h			;9580	ff 	. 
	rst 38h			;9581	ff 	. 
	rst 38h			;9582	ff 	. 
	rst 38h			;9583	ff 	. 
	rst 38h			;9584	ff 	. 
	rst 38h			;9585	ff 	. 
	rst 38h			;9586	ff 	. 
	rst 38h			;9587	ff 	. 
	rst 38h			;9588	ff 	. 
	rst 38h			;9589	ff 	. 
	rst 38h			;958a	ff 	. 
	rst 38h			;958b	ff 	. 
	rst 38h			;958c	ff 	. 
	rst 38h			;958d	ff 	. 
	rst 38h			;958e	ff 	. 
	rst 38h			;958f	ff 	. 
	rst 38h			;9590	ff 	. 
	rst 38h			;9591	ff 	. 
	rst 38h			;9592	ff 	. 
	rst 38h			;9593	ff 	. 
	rst 38h			;9594	ff 	. 
	rst 38h			;9595	ff 	. 
	rst 38h			;9596	ff 	. 
	rst 38h			;9597	ff 	. 
	rst 38h			;9598	ff 	. 
	rst 38h			;9599	ff 	. 
	rst 38h			;959a	ff 	. 
	rst 38h			;959b	ff 	. 
	rst 38h			;959c	ff 	. 
	rst 38h			;959d	ff 	. 
	rst 38h			;959e	ff 	. 
	rst 38h			;959f	ff 	. 
	rst 38h			;95a0	ff 	. 
	rst 38h			;95a1	ff 	. 
	rst 38h			;95a2	ff 	. 
	rst 38h			;95a3	ff 	. 
	rst 38h			;95a4	ff 	. 
	rst 38h			;95a5	ff 	. 
	rst 38h			;95a6	ff 	. 
	rst 38h			;95a7	ff 	. 
	rst 38h			;95a8	ff 	. 
	rst 38h			;95a9	ff 	. 
	rst 38h			;95aa	ff 	. 
	rst 38h			;95ab	ff 	. 
	rst 38h			;95ac	ff 	. 
	rst 38h			;95ad	ff 	. 
	rst 38h			;95ae	ff 	. 
	rst 38h			;95af	ff 	. 
	rst 38h			;95b0	ff 	. 
	rst 38h			;95b1	ff 	. 
	rst 38h			;95b2	ff 	. 
	rst 38h			;95b3	ff 	. 
	rst 38h			;95b4	ff 	. 
	rst 38h			;95b5	ff 	. 
	rst 38h			;95b6	ff 	. 
	rst 38h			;95b7	ff 	. 
	rst 38h			;95b8	ff 	. 
	rst 38h			;95b9	ff 	. 
	rst 38h			;95ba	ff 	. 
	rst 38h			;95bb	ff 	. 
	rst 38h			;95bc	ff 	. 
	rst 38h			;95bd	ff 	. 
	rst 38h			;95be	ff 	. 
	rst 38h			;95bf	ff 	. 
	rst 38h			;95c0	ff 	. 
	rst 38h			;95c1	ff 	. 
	rst 38h			;95c2	ff 	. 
	rst 38h			;95c3	ff 	. 
	rst 38h			;95c4	ff 	. 
	rst 38h			;95c5	ff 	. 
	rst 38h			;95c6	ff 	. 
	rst 38h			;95c7	ff 	. 
	rst 38h			;95c8	ff 	. 
	rst 38h			;95c9	ff 	. 
	rst 38h			;95ca	ff 	. 
	rst 38h			;95cb	ff 	. 
	rst 38h			;95cc	ff 	. 
	rst 38h			;95cd	ff 	. 
	rst 38h			;95ce	ff 	. 
	rst 38h			;95cf	ff 	. 
	rst 38h			;95d0	ff 	. 
	rst 38h			;95d1	ff 	. 
	rst 38h			;95d2	ff 	. 
	rst 38h			;95d3	ff 	. 
	rst 38h			;95d4	ff 	. 
	rst 38h			;95d5	ff 	. 
	rst 38h			;95d6	ff 	. 
	rst 38h			;95d7	ff 	. 
	rst 38h			;95d8	ff 	. 
	rst 38h			;95d9	ff 	. 
	rst 38h			;95da	ff 	. 
	rst 38h			;95db	ff 	. 
	rst 38h			;95dc	ff 	. 
	rst 38h			;95dd	ff 	. 
	rst 38h			;95de	ff 	. 
	rst 38h			;95df	ff 	. 
	rst 38h			;95e0	ff 	. 
	rst 38h			;95e1	ff 	. 
	rst 38h			;95e2	ff 	. 
	rst 38h			;95e3	ff 	. 
	rst 38h			;95e4	ff 	. 
	rst 38h			;95e5	ff 	. 
	rst 38h			;95e6	ff 	. 
	rst 38h			;95e7	ff 	. 
	rst 38h			;95e8	ff 	. 
	rst 38h			;95e9	ff 	. 
	rst 38h			;95ea	ff 	. 
	rst 38h			;95eb	ff 	. 
	rst 38h			;95ec	ff 	. 
	rst 38h			;95ed	ff 	. 
	rst 38h			;95ee	ff 	. 
	rst 38h			;95ef	ff 	. 
	rst 38h			;95f0	ff 	. 
	rst 38h			;95f1	ff 	. 
	rst 38h			;95f2	ff 	. 
	rst 38h			;95f3	ff 	. 
	rst 38h			;95f4	ff 	. 
	rst 38h			;95f5	ff 	. 
	rst 38h			;95f6	ff 	. 
	rst 38h			;95f7	ff 	. 
	rst 38h			;95f8	ff 	. 
	rst 38h			;95f9	ff 	. 
	rst 38h			;95fa	ff 	. 
	rst 38h			;95fb	ff 	. 
	rst 38h			;95fc	ff 	. 
	rst 38h			;95fd	ff 	. 
	rst 38h			;95fe	ff 	. 
	rst 38h			;95ff	ff 	. 
	rst 38h			;9600	ff 	. 
	rst 38h			;9601	ff 	. 
	rst 38h			;9602	ff 	. 
	rst 38h			;9603	ff 	. 
	rst 38h			;9604	ff 	. 
	rst 38h			;9605	ff 	. 
	rst 38h			;9606	ff 	. 
	rst 38h			;9607	ff 	. 
	rst 38h			;9608	ff 	. 
	rst 38h			;9609	ff 	. 
	rst 38h			;960a	ff 	. 
	rst 38h			;960b	ff 	. 
	rst 38h			;960c	ff 	. 
	rst 38h			;960d	ff 	. 
	rst 38h			;960e	ff 	. 
	rst 38h			;960f	ff 	. 
	rst 38h			;9610	ff 	. 
	rst 38h			;9611	ff 	. 
	rst 38h			;9612	ff 	. 
	rst 38h			;9613	ff 	. 
	rst 38h			;9614	ff 	. 
	rst 38h			;9615	ff 	. 
	rst 38h			;9616	ff 	. 
	rst 38h			;9617	ff 	. 
	rst 38h			;9618	ff 	. 
	rst 38h			;9619	ff 	. 
	rst 38h			;961a	ff 	. 
	rst 38h			;961b	ff 	. 
	rst 38h			;961c	ff 	. 
	rst 38h			;961d	ff 	. 
	rst 38h			;961e	ff 	. 
	rst 38h			;961f	ff 	. 
	rst 38h			;9620	ff 	. 
	rst 38h			;9621	ff 	. 
	rst 38h			;9622	ff 	. 
	rst 38h			;9623	ff 	. 
	rst 38h			;9624	ff 	. 
	rst 38h			;9625	ff 	. 
	rst 38h			;9626	ff 	. 
	rst 38h			;9627	ff 	. 
	rst 38h			;9628	ff 	. 
	rst 38h			;9629	ff 	. 
	rst 38h			;962a	ff 	. 
	rst 38h			;962b	ff 	. 
	rst 38h			;962c	ff 	. 
	rst 38h			;962d	ff 	. 
	rst 38h			;962e	ff 	. 
	rst 38h			;962f	ff 	. 
	rst 38h			;9630	ff 	. 
	rst 38h			;9631	ff 	. 
	rst 38h			;9632	ff 	. 
	rst 38h			;9633	ff 	. 
	rst 38h			;9634	ff 	. 
	rst 38h			;9635	ff 	. 
	rst 38h			;9636	ff 	. 
	rst 38h			;9637	ff 	. 
	rst 38h			;9638	ff 	. 
	rst 38h			;9639	ff 	. 
	rst 38h			;963a	ff 	. 
	rst 38h			;963b	ff 	. 
	rst 38h			;963c	ff 	. 
	rst 38h			;963d	ff 	. 
	rst 38h			;963e	ff 	. 
	rst 38h			;963f	ff 	. 
	rst 38h			;9640	ff 	. 
	rst 38h			;9641	ff 	. 
	rst 38h			;9642	ff 	. 
	rst 38h			;9643	ff 	. 
	rst 38h			;9644	ff 	. 
	rst 38h			;9645	ff 	. 
	rst 38h			;9646	ff 	. 
	rst 38h			;9647	ff 	. 
	rst 38h			;9648	ff 	. 
	rst 38h			;9649	ff 	. 
	rst 38h			;964a	ff 	. 
	rst 38h			;964b	ff 	. 
	rst 38h			;964c	ff 	. 
	rst 38h			;964d	ff 	. 
	rst 38h			;964e	ff 	. 
	rst 38h			;964f	ff 	. 
	rst 38h			;9650	ff 	. 
	rst 38h			;9651	ff 	. 
	rst 38h			;9652	ff 	. 
	rst 38h			;9653	ff 	. 
	rst 38h			;9654	ff 	. 
	rst 38h			;9655	ff 	. 
	rst 38h			;9656	ff 	. 
	rst 38h			;9657	ff 	. 
	rst 38h			;9658	ff 	. 
	rst 38h			;9659	ff 	. 
	rst 38h			;965a	ff 	. 
	rst 38h			;965b	ff 	. 
	rst 38h			;965c	ff 	. 
	rst 38h			;965d	ff 	. 
	rst 38h			;965e	ff 	. 
	rst 38h			;965f	ff 	. 
	rst 38h			;9660	ff 	. 
	rst 38h			;9661	ff 	. 
	rst 38h			;9662	ff 	. 
	rst 38h			;9663	ff 	. 
	rst 38h			;9664	ff 	. 
	rst 38h			;9665	ff 	. 
	rst 38h			;9666	ff 	. 
	rst 38h			;9667	ff 	. 
	rst 38h			;9668	ff 	. 
	rst 38h			;9669	ff 	. 
	rst 38h			;966a	ff 	. 
	rst 38h			;966b	ff 	. 
	rst 38h			;966c	ff 	. 
	rst 38h			;966d	ff 	. 
	rst 38h			;966e	ff 	. 
	rst 38h			;966f	ff 	. 
	rst 38h			;9670	ff 	. 
	rst 38h			;9671	ff 	. 
	rst 38h			;9672	ff 	. 
	rst 38h			;9673	ff 	. 
	rst 38h			;9674	ff 	. 
	rst 38h			;9675	ff 	. 
	rst 38h			;9676	ff 	. 
	rst 38h			;9677	ff 	. 
	rst 38h			;9678	ff 	. 
	rst 38h			;9679	ff 	. 
	rst 38h			;967a	ff 	. 
	rst 38h			;967b	ff 	. 
	rst 38h			;967c	ff 	. 
	rst 38h			;967d	ff 	. 
	rst 38h			;967e	ff 	. 
	rst 38h			;967f	ff 	. 
	rst 38h			;9680	ff 	. 
	rst 38h			;9681	ff 	. 
	rst 38h			;9682	ff 	. 
	rst 38h			;9683	ff 	. 
	rst 38h			;9684	ff 	. 
	rst 38h			;9685	ff 	. 
	rst 38h			;9686	ff 	. 
	rst 38h			;9687	ff 	. 
	rst 38h			;9688	ff 	. 
	rst 38h			;9689	ff 	. 
	rst 38h			;968a	ff 	. 
	rst 38h			;968b	ff 	. 
	rst 38h			;968c	ff 	. 
	rst 38h			;968d	ff 	. 
	rst 38h			;968e	ff 	. 
	rst 38h			;968f	ff 	. 
	rst 38h			;9690	ff 	. 
	rst 38h			;9691	ff 	. 
	rst 38h			;9692	ff 	. 
	rst 38h			;9693	ff 	. 
	rst 38h			;9694	ff 	. 
	rst 38h			;9695	ff 	. 
	rst 38h			;9696	ff 	. 
	rst 38h			;9697	ff 	. 
	rst 38h			;9698	ff 	. 
	rst 38h			;9699	ff 	. 
	rst 38h			;969a	ff 	. 
	rst 38h			;969b	ff 	. 
	rst 38h			;969c	ff 	. 
	rst 38h			;969d	ff 	. 
	rst 38h			;969e	ff 	. 
	rst 38h			;969f	ff 	. 
	rst 38h			;96a0	ff 	. 
	rst 38h			;96a1	ff 	. 
	rst 38h			;96a2	ff 	. 
	rst 38h			;96a3	ff 	. 
	rst 38h			;96a4	ff 	. 
	rst 38h			;96a5	ff 	. 
	rst 38h			;96a6	ff 	. 
	rst 38h			;96a7	ff 	. 
	rst 38h			;96a8	ff 	. 
	rst 38h			;96a9	ff 	. 
	rst 38h			;96aa	ff 	. 
	rst 38h			;96ab	ff 	. 
	rst 38h			;96ac	ff 	. 
	rst 38h			;96ad	ff 	. 
	rst 38h			;96ae	ff 	. 
	rst 38h			;96af	ff 	. 
	rst 38h			;96b0	ff 	. 
	rst 38h			;96b1	ff 	. 
	rst 38h			;96b2	ff 	. 
	rst 38h			;96b3	ff 	. 
	rst 38h			;96b4	ff 	. 
	rst 38h			;96b5	ff 	. 
	rst 38h			;96b6	ff 	. 
	rst 38h			;96b7	ff 	. 
	rst 38h			;96b8	ff 	. 
	rst 38h			;96b9	ff 	. 
	rst 38h			;96ba	ff 	. 
	rst 38h			;96bb	ff 	. 
	rst 38h			;96bc	ff 	. 
	rst 38h			;96bd	ff 	. 
	rst 38h			;96be	ff 	. 
	rst 38h			;96bf	ff 	. 
	rst 38h			;96c0	ff 	. 
	rst 38h			;96c1	ff 	. 
	rst 38h			;96c2	ff 	. 
	rst 38h			;96c3	ff 	. 
	rst 38h			;96c4	ff 	. 
	rst 38h			;96c5	ff 	. 
	rst 38h			;96c6	ff 	. 
	rst 38h			;96c7	ff 	. 
	rst 38h			;96c8	ff 	. 
	rst 38h			;96c9	ff 	. 
	rst 38h			;96ca	ff 	. 
	rst 38h			;96cb	ff 	. 
	rst 38h			;96cc	ff 	. 
	rst 38h			;96cd	ff 	. 
	rst 38h			;96ce	ff 	. 
	rst 38h			;96cf	ff 	. 
	rst 38h			;96d0	ff 	. 
	rst 38h			;96d1	ff 	. 
	rst 38h			;96d2	ff 	. 
	rst 38h			;96d3	ff 	. 
	rst 38h			;96d4	ff 	. 
	rst 38h			;96d5	ff 	. 
	rst 38h			;96d6	ff 	. 
	rst 38h			;96d7	ff 	. 
	rst 38h			;96d8	ff 	. 
	rst 38h			;96d9	ff 	. 
	rst 38h			;96da	ff 	. 
	rst 38h			;96db	ff 	. 
	rst 38h			;96dc	ff 	. 
	rst 38h			;96dd	ff 	. 
	rst 38h			;96de	ff 	. 
	rst 38h			;96df	ff 	. 
	rst 38h			;96e0	ff 	. 
	rst 38h			;96e1	ff 	. 
	rst 38h			;96e2	ff 	. 
	rst 38h			;96e3	ff 	. 
	rst 38h			;96e4	ff 	. 
	rst 38h			;96e5	ff 	. 
	rst 38h			;96e6	ff 	. 
	rst 38h			;96e7	ff 	. 
	rst 38h			;96e8	ff 	. 
	rst 38h			;96e9	ff 	. 
	rst 38h			;96ea	ff 	. 
	rst 38h			;96eb	ff 	. 
	rst 38h			;96ec	ff 	. 
	rst 38h			;96ed	ff 	. 
	rst 38h			;96ee	ff 	. 
	rst 38h			;96ef	ff 	. 
	rst 38h			;96f0	ff 	. 
	rst 38h			;96f1	ff 	. 
	rst 38h			;96f2	ff 	. 
	rst 38h			;96f3	ff 	. 
	rst 38h			;96f4	ff 	. 
	rst 38h			;96f5	ff 	. 
	rst 38h			;96f6	ff 	. 
	rst 38h			;96f7	ff 	. 
	rst 38h			;96f8	ff 	. 
	rst 38h			;96f9	ff 	. 
	rst 38h			;96fa	ff 	. 
	rst 38h			;96fb	ff 	. 
	rst 38h			;96fc	ff 	. 
	rst 38h			;96fd	ff 	. 
	rst 38h			;96fe	ff 	. 
	rst 38h			;96ff	ff 	. 
	rst 38h			;9700	ff 	. 
	rst 38h			;9701	ff 	. 
	rst 38h			;9702	ff 	. 
	rst 38h			;9703	ff 	. 
	rst 38h			;9704	ff 	. 
	rst 38h			;9705	ff 	. 
	rst 38h			;9706	ff 	. 
	rst 38h			;9707	ff 	. 
	rst 38h			;9708	ff 	. 
	rst 38h			;9709	ff 	. 
	rst 38h			;970a	ff 	. 
	rst 38h			;970b	ff 	. 
	rst 38h			;970c	ff 	. 
	rst 38h			;970d	ff 	. 
	rst 38h			;970e	ff 	. 
	rst 38h			;970f	ff 	. 
	rst 38h			;9710	ff 	. 
	rst 38h			;9711	ff 	. 
	rst 38h			;9712	ff 	. 
	rst 38h			;9713	ff 	. 
	rst 38h			;9714	ff 	. 
	rst 38h			;9715	ff 	. 
	rst 38h			;9716	ff 	. 
	rst 38h			;9717	ff 	. 
	rst 38h			;9718	ff 	. 
	rst 38h			;9719	ff 	. 
	rst 38h			;971a	ff 	. 
	rst 38h			;971b	ff 	. 
	rst 38h			;971c	ff 	. 
	rst 38h			;971d	ff 	. 
	rst 38h			;971e	ff 	. 
	rst 38h			;971f	ff 	. 
	rst 38h			;9720	ff 	. 
	rst 38h			;9721	ff 	. 
	rst 38h			;9722	ff 	. 
	rst 38h			;9723	ff 	. 
	rst 38h			;9724	ff 	. 
	rst 38h			;9725	ff 	. 
	rst 38h			;9726	ff 	. 
	rst 38h			;9727	ff 	. 
	rst 38h			;9728	ff 	. 
	rst 38h			;9729	ff 	. 
	rst 38h			;972a	ff 	. 
	rst 38h			;972b	ff 	. 
	rst 38h			;972c	ff 	. 
	rst 38h			;972d	ff 	. 
	rst 38h			;972e	ff 	. 
	rst 38h			;972f	ff 	. 
	rst 38h			;9730	ff 	. 
	rst 38h			;9731	ff 	. 
	rst 38h			;9732	ff 	. 
	rst 38h			;9733	ff 	. 
	rst 38h			;9734	ff 	. 
	rst 38h			;9735	ff 	. 
	rst 38h			;9736	ff 	. 
	rst 38h			;9737	ff 	. 
	rst 38h			;9738	ff 	. 
	rst 38h			;9739	ff 	. 
	rst 38h			;973a	ff 	. 
	rst 38h			;973b	ff 	. 
	rst 38h			;973c	ff 	. 
	rst 38h			;973d	ff 	. 
	rst 38h			;973e	ff 	. 
	rst 38h			;973f	ff 	. 
	rst 38h			;9740	ff 	. 
	rst 38h			;9741	ff 	. 
	rst 38h			;9742	ff 	. 
	rst 38h			;9743	ff 	. 
	rst 38h			;9744	ff 	. 
	rst 38h			;9745	ff 	. 
	rst 38h			;9746	ff 	. 
	rst 38h			;9747	ff 	. 
	rst 38h			;9748	ff 	. 
	rst 38h			;9749	ff 	. 
	rst 38h			;974a	ff 	. 
	rst 38h			;974b	ff 	. 
	rst 38h			;974c	ff 	. 
	rst 38h			;974d	ff 	. 
	rst 38h			;974e	ff 	. 
	rst 38h			;974f	ff 	. 
	rst 38h			;9750	ff 	. 
	rst 38h			;9751	ff 	. 
	rst 38h			;9752	ff 	. 
	rst 38h			;9753	ff 	. 
	rst 38h			;9754	ff 	. 
	rst 38h			;9755	ff 	. 
	rst 38h			;9756	ff 	. 
	rst 38h			;9757	ff 	. 
	rst 38h			;9758	ff 	. 
	rst 38h			;9759	ff 	. 
	rst 38h			;975a	ff 	. 
	rst 38h			;975b	ff 	. 
	rst 38h			;975c	ff 	. 
	rst 38h			;975d	ff 	. 
	rst 38h			;975e	ff 	. 
	rst 38h			;975f	ff 	. 
	rst 38h			;9760	ff 	. 
	rst 38h			;9761	ff 	. 
	rst 38h			;9762	ff 	. 
	rst 38h			;9763	ff 	. 
	rst 38h			;9764	ff 	. 
	rst 38h			;9765	ff 	. 
	rst 38h			;9766	ff 	. 
	rst 38h			;9767	ff 	. 
	rst 38h			;9768	ff 	. 
	rst 38h			;9769	ff 	. 
	rst 38h			;976a	ff 	. 
	rst 38h			;976b	ff 	. 
	rst 38h			;976c	ff 	. 
	rst 38h			;976d	ff 	. 
	rst 38h			;976e	ff 	. 
	rst 38h			;976f	ff 	. 
	rst 38h			;9770	ff 	. 
	rst 38h			;9771	ff 	. 
	rst 38h			;9772	ff 	. 
	rst 38h			;9773	ff 	. 
	rst 38h			;9774	ff 	. 
	rst 38h			;9775	ff 	. 
	rst 38h			;9776	ff 	. 
	rst 38h			;9777	ff 	. 
	rst 38h			;9778	ff 	. 
	rst 38h			;9779	ff 	. 
	rst 38h			;977a	ff 	. 
	rst 38h			;977b	ff 	. 
	rst 38h			;977c	ff 	. 
	rst 38h			;977d	ff 	. 
	rst 38h			;977e	ff 	. 
	rst 38h			;977f	ff 	. 
	rst 38h			;9780	ff 	. 
	rst 38h			;9781	ff 	. 
	rst 38h			;9782	ff 	. 
	rst 38h			;9783	ff 	. 
	rst 38h			;9784	ff 	. 
	rst 38h			;9785	ff 	. 
	rst 38h			;9786	ff 	. 
	rst 38h			;9787	ff 	. 
	rst 38h			;9788	ff 	. 
	rst 38h			;9789	ff 	. 
	rst 38h			;978a	ff 	. 
	rst 38h			;978b	ff 	. 
	rst 38h			;978c	ff 	. 
	rst 38h			;978d	ff 	. 
	rst 38h			;978e	ff 	. 
	rst 38h			;978f	ff 	. 
	rst 38h			;9790	ff 	. 
	rst 38h			;9791	ff 	. 
	rst 38h			;9792	ff 	. 
	rst 38h			;9793	ff 	. 
	rst 38h			;9794	ff 	. 
	rst 38h			;9795	ff 	. 
	rst 38h			;9796	ff 	. 
	rst 38h			;9797	ff 	. 
	rst 38h			;9798	ff 	. 
	rst 38h			;9799	ff 	. 
	rst 38h			;979a	ff 	. 
	rst 38h			;979b	ff 	. 
	rst 38h			;979c	ff 	. 
	rst 38h			;979d	ff 	. 
	rst 38h			;979e	ff 	. 
	rst 38h			;979f	ff 	. 
	rst 38h			;97a0	ff 	. 
	rst 38h			;97a1	ff 	. 
	rst 38h			;97a2	ff 	. 
	rst 38h			;97a3	ff 	. 
	rst 38h			;97a4	ff 	. 
	rst 38h			;97a5	ff 	. 
	rst 38h			;97a6	ff 	. 
	rst 38h			;97a7	ff 	. 
	rst 38h			;97a8	ff 	. 
	rst 38h			;97a9	ff 	. 
	rst 38h			;97aa	ff 	. 
	rst 38h			;97ab	ff 	. 
	rst 38h			;97ac	ff 	. 
	rst 38h			;97ad	ff 	. 
	rst 38h			;97ae	ff 	. 
	rst 38h			;97af	ff 	. 
	rst 38h			;97b0	ff 	. 
	rst 38h			;97b1	ff 	. 
	rst 38h			;97b2	ff 	. 
	rst 38h			;97b3	ff 	. 
	rst 38h			;97b4	ff 	. 
	rst 38h			;97b5	ff 	. 
	rst 38h			;97b6	ff 	. 
	rst 38h			;97b7	ff 	. 
	rst 38h			;97b8	ff 	. 
	rst 38h			;97b9	ff 	. 
	rst 38h			;97ba	ff 	. 
	rst 38h			;97bb	ff 	. 
	rst 38h			;97bc	ff 	. 
	rst 38h			;97bd	ff 	. 
	rst 38h			;97be	ff 	. 
	rst 38h			;97bf	ff 	. 
	rst 38h			;97c0	ff 	. 
	rst 38h			;97c1	ff 	. 
	rst 38h			;97c2	ff 	. 
	rst 38h			;97c3	ff 	. 
	rst 38h			;97c4	ff 	. 
	rst 38h			;97c5	ff 	. 
	rst 38h			;97c6	ff 	. 
	rst 38h			;97c7	ff 	. 
	rst 38h			;97c8	ff 	. 
	rst 38h			;97c9	ff 	. 
	rst 38h			;97ca	ff 	. 
	rst 38h			;97cb	ff 	. 
	rst 38h			;97cc	ff 	. 
	rst 38h			;97cd	ff 	. 
	rst 38h			;97ce	ff 	. 
	rst 38h			;97cf	ff 	. 
	rst 38h			;97d0	ff 	. 
	rst 38h			;97d1	ff 	. 
	rst 38h			;97d2	ff 	. 
	rst 38h			;97d3	ff 	. 
	rst 38h			;97d4	ff 	. 
	rst 38h			;97d5	ff 	. 
	rst 38h			;97d6	ff 	. 
	rst 38h			;97d7	ff 	. 
	rst 38h			;97d8	ff 	. 
	rst 38h			;97d9	ff 	. 
	rst 38h			;97da	ff 	. 
	rst 38h			;97db	ff 	. 
	rst 38h			;97dc	ff 	. 
	rst 38h			;97dd	ff 	. 
	rst 38h			;97de	ff 	. 
	rst 38h			;97df	ff 	. 
	rst 38h			;97e0	ff 	. 
	rst 38h			;97e1	ff 	. 
	rst 38h			;97e2	ff 	. 
	rst 38h			;97e3	ff 	. 
	rst 38h			;97e4	ff 	. 
	rst 38h			;97e5	ff 	. 
	rst 38h			;97e6	ff 	. 
	rst 38h			;97e7	ff 	. 
	rst 38h			;97e8	ff 	. 
	rst 38h			;97e9	ff 	. 
	rst 38h			;97ea	ff 	. 
	rst 38h			;97eb	ff 	. 
	rst 38h			;97ec	ff 	. 
	rst 38h			;97ed	ff 	. 
	rst 38h			;97ee	ff 	. 
	rst 38h			;97ef	ff 	. 
	rst 38h			;97f0	ff 	. 
	rst 38h			;97f1	ff 	. 
	rst 38h			;97f2	ff 	. 
	rst 38h			;97f3	ff 	. 
	rst 38h			;97f4	ff 	. 
	rst 38h			;97f5	ff 	. 
	rst 38h			;97f6	ff 	. 
	rst 38h			;97f7	ff 	. 
	rst 38h			;97f8	ff 	. 
	rst 38h			;97f9	ff 	. 
	rst 38h			;97fa	ff 	. 
	rst 38h			;97fb	ff 	. 
	rst 38h			;97fc	ff 	. 
	rst 38h			;97fd	ff 	. 
	rst 38h			;97fe	ff 	. 
	rst 38h			;97ff	ff 	. 
	rst 38h			;9800	ff 	. 
	rst 38h			;9801	ff 	. 
	rst 38h			;9802	ff 	. 
	rst 38h			;9803	ff 	. 
	rst 38h			;9804	ff 	. 
	rst 38h			;9805	ff 	. 
	rst 38h			;9806	ff 	. 
	rst 38h			;9807	ff 	. 
	rst 38h			;9808	ff 	. 
	rst 38h			;9809	ff 	. 
	rst 38h			;980a	ff 	. 
	rst 38h			;980b	ff 	. 
	rst 38h			;980c	ff 	. 
	rst 38h			;980d	ff 	. 
	rst 38h			;980e	ff 	. 
	rst 38h			;980f	ff 	. 
	rst 38h			;9810	ff 	. 
	rst 38h			;9811	ff 	. 
	rst 38h			;9812	ff 	. 
	rst 38h			;9813	ff 	. 
	rst 38h			;9814	ff 	. 
	rst 38h			;9815	ff 	. 
	rst 38h			;9816	ff 	. 
	rst 38h			;9817	ff 	. 
	rst 38h			;9818	ff 	. 
	rst 38h			;9819	ff 	. 
	rst 38h			;981a	ff 	. 
	rst 38h			;981b	ff 	. 
	rst 38h			;981c	ff 	. 
	rst 38h			;981d	ff 	. 
	rst 38h			;981e	ff 	. 
	rst 38h			;981f	ff 	. 
	rst 38h			;9820	ff 	. 
	rst 38h			;9821	ff 	. 
	rst 38h			;9822	ff 	. 
	rst 38h			;9823	ff 	. 
	rst 38h			;9824	ff 	. 
	rst 38h			;9825	ff 	. 
	rst 38h			;9826	ff 	. 
	rst 38h			;9827	ff 	. 
	rst 38h			;9828	ff 	. 
	rst 38h			;9829	ff 	. 
	rst 38h			;982a	ff 	. 
	rst 38h			;982b	ff 	. 
	rst 38h			;982c	ff 	. 
	rst 38h			;982d	ff 	. 
	rst 38h			;982e	ff 	. 
	rst 38h			;982f	ff 	. 
	rst 38h			;9830	ff 	. 
	rst 38h			;9831	ff 	. 
	rst 38h			;9832	ff 	. 
	rst 38h			;9833	ff 	. 
	rst 38h			;9834	ff 	. 
	rst 38h			;9835	ff 	. 
	rst 38h			;9836	ff 	. 
	rst 38h			;9837	ff 	. 
	rst 38h			;9838	ff 	. 
	rst 38h			;9839	ff 	. 
	rst 38h			;983a	ff 	. 
	rst 38h			;983b	ff 	. 
	rst 38h			;983c	ff 	. 
	rst 38h			;983d	ff 	. 
	rst 38h			;983e	ff 	. 
	rst 38h			;983f	ff 	. 
	rst 38h			;9840	ff 	. 
	rst 38h			;9841	ff 	. 
	rst 38h			;9842	ff 	. 
	rst 38h			;9843	ff 	. 
	rst 38h			;9844	ff 	. 
	rst 38h			;9845	ff 	. 
	rst 38h			;9846	ff 	. 
	rst 38h			;9847	ff 	. 
	rst 38h			;9848	ff 	. 
	rst 38h			;9849	ff 	. 
	rst 38h			;984a	ff 	. 
	rst 38h			;984b	ff 	. 
	rst 38h			;984c	ff 	. 
	rst 38h			;984d	ff 	. 
	rst 38h			;984e	ff 	. 
	rst 38h			;984f	ff 	. 
	rst 38h			;9850	ff 	. 
	rst 38h			;9851	ff 	. 
	rst 38h			;9852	ff 	. 
	rst 38h			;9853	ff 	. 
	rst 38h			;9854	ff 	. 
	rst 38h			;9855	ff 	. 
	rst 38h			;9856	ff 	. 
	rst 38h			;9857	ff 	. 
	rst 38h			;9858	ff 	. 
	rst 38h			;9859	ff 	. 
	rst 38h			;985a	ff 	. 
	rst 38h			;985b	ff 	. 
	rst 38h			;985c	ff 	. 
	rst 38h			;985d	ff 	. 
	rst 38h			;985e	ff 	. 
	rst 38h			;985f	ff 	. 
	rst 38h			;9860	ff 	. 
	rst 38h			;9861	ff 	. 
	rst 38h			;9862	ff 	. 
	rst 38h			;9863	ff 	. 
	rst 38h			;9864	ff 	. 
	rst 38h			;9865	ff 	. 
	rst 38h			;9866	ff 	. 
	rst 38h			;9867	ff 	. 
	rst 38h			;9868	ff 	. 
	rst 38h			;9869	ff 	. 
	rst 38h			;986a	ff 	. 
	rst 38h			;986b	ff 	. 
	rst 38h			;986c	ff 	. 
	rst 38h			;986d	ff 	. 
	rst 38h			;986e	ff 	. 
	rst 38h			;986f	ff 	. 
	rst 38h			;9870	ff 	. 
	rst 38h			;9871	ff 	. 
	rst 38h			;9872	ff 	. 
	rst 38h			;9873	ff 	. 
	rst 38h			;9874	ff 	. 
	rst 38h			;9875	ff 	. 
	rst 38h			;9876	ff 	. 
	rst 38h			;9877	ff 	. 
	rst 38h			;9878	ff 	. 
	rst 38h			;9879	ff 	. 
	rst 38h			;987a	ff 	. 
	rst 38h			;987b	ff 	. 
	rst 38h			;987c	ff 	. 
	rst 38h			;987d	ff 	. 
	rst 38h			;987e	ff 	. 
	rst 38h			;987f	ff 	. 
	rst 38h			;9880	ff 	. 
	rst 38h			;9881	ff 	. 
	rst 38h			;9882	ff 	. 
	rst 38h			;9883	ff 	. 
	rst 38h			;9884	ff 	. 
	rst 38h			;9885	ff 	. 
	rst 38h			;9886	ff 	. 
	rst 38h			;9887	ff 	. 
	rst 38h			;9888	ff 	. 
	rst 38h			;9889	ff 	. 
	rst 38h			;988a	ff 	. 
	rst 38h			;988b	ff 	. 
	rst 38h			;988c	ff 	. 
	rst 38h			;988d	ff 	. 
	rst 38h			;988e	ff 	. 
	rst 38h			;988f	ff 	. 
	rst 38h			;9890	ff 	. 
	rst 38h			;9891	ff 	. 
	rst 38h			;9892	ff 	. 
	rst 38h			;9893	ff 	. 
	rst 38h			;9894	ff 	. 
	rst 38h			;9895	ff 	. 
	rst 38h			;9896	ff 	. 
	rst 38h			;9897	ff 	. 
	rst 38h			;9898	ff 	. 
	rst 38h			;9899	ff 	. 
	rst 38h			;989a	ff 	. 
	rst 38h			;989b	ff 	. 
	rst 38h			;989c	ff 	. 
	rst 38h			;989d	ff 	. 
	rst 38h			;989e	ff 	. 
	rst 38h			;989f	ff 	. 
	rst 38h			;98a0	ff 	. 
	rst 38h			;98a1	ff 	. 
	rst 38h			;98a2	ff 	. 
	rst 38h			;98a3	ff 	. 
	rst 38h			;98a4	ff 	. 
	rst 38h			;98a5	ff 	. 
	rst 38h			;98a6	ff 	. 
	rst 38h			;98a7	ff 	. 
	rst 38h			;98a8	ff 	. 
	rst 38h			;98a9	ff 	. 
	rst 38h			;98aa	ff 	. 
	rst 38h			;98ab	ff 	. 
	rst 38h			;98ac	ff 	. 
	rst 38h			;98ad	ff 	. 
	rst 38h			;98ae	ff 	. 
	rst 38h			;98af	ff 	. 
	rst 38h			;98b0	ff 	. 
	rst 38h			;98b1	ff 	. 
	rst 38h			;98b2	ff 	. 
	rst 38h			;98b3	ff 	. 
	rst 38h			;98b4	ff 	. 
	rst 38h			;98b5	ff 	. 
	rst 38h			;98b6	ff 	. 
	rst 38h			;98b7	ff 	. 
	rst 38h			;98b8	ff 	. 
	rst 38h			;98b9	ff 	. 
	rst 38h			;98ba	ff 	. 
	rst 38h			;98bb	ff 	. 
	rst 38h			;98bc	ff 	. 
	rst 38h			;98bd	ff 	. 
	rst 38h			;98be	ff 	. 
	rst 38h			;98bf	ff 	. 
	rst 38h			;98c0	ff 	. 
	rst 38h			;98c1	ff 	. 
	rst 38h			;98c2	ff 	. 
	rst 38h			;98c3	ff 	. 
	rst 38h			;98c4	ff 	. 
	rst 38h			;98c5	ff 	. 
	rst 38h			;98c6	ff 	. 
	rst 38h			;98c7	ff 	. 
	rst 38h			;98c8	ff 	. 
	rst 38h			;98c9	ff 	. 
	rst 38h			;98ca	ff 	. 
	rst 38h			;98cb	ff 	. 
	rst 38h			;98cc	ff 	. 
	rst 38h			;98cd	ff 	. 
	rst 38h			;98ce	ff 	. 
	rst 38h			;98cf	ff 	. 
	rst 38h			;98d0	ff 	. 
	rst 38h			;98d1	ff 	. 
	rst 38h			;98d2	ff 	. 
	rst 38h			;98d3	ff 	. 
	rst 38h			;98d4	ff 	. 
	rst 38h			;98d5	ff 	. 
	rst 38h			;98d6	ff 	. 
	rst 38h			;98d7	ff 	. 
	rst 38h			;98d8	ff 	. 
	rst 38h			;98d9	ff 	. 
	rst 38h			;98da	ff 	. 
	rst 38h			;98db	ff 	. 
	rst 38h			;98dc	ff 	. 
	rst 38h			;98dd	ff 	. 
	rst 38h			;98de	ff 	. 
	rst 38h			;98df	ff 	. 
	rst 38h			;98e0	ff 	. 
	rst 38h			;98e1	ff 	. 
	rst 38h			;98e2	ff 	. 
	rst 38h			;98e3	ff 	. 
	rst 38h			;98e4	ff 	. 
	rst 38h			;98e5	ff 	. 
	rst 38h			;98e6	ff 	. 
	rst 38h			;98e7	ff 	. 
	rst 38h			;98e8	ff 	. 
	rst 38h			;98e9	ff 	. 
	rst 38h			;98ea	ff 	. 
	rst 38h			;98eb	ff 	. 
	rst 38h			;98ec	ff 	. 
	rst 38h			;98ed	ff 	. 
	rst 38h			;98ee	ff 	. 
	rst 38h			;98ef	ff 	. 
	rst 38h			;98f0	ff 	. 
	rst 38h			;98f1	ff 	. 
	rst 38h			;98f2	ff 	. 
	rst 38h			;98f3	ff 	. 
	rst 38h			;98f4	ff 	. 
	rst 38h			;98f5	ff 	. 
	rst 38h			;98f6	ff 	. 
	rst 38h			;98f7	ff 	. 
	rst 38h			;98f8	ff 	. 
	rst 38h			;98f9	ff 	. 
	rst 38h			;98fa	ff 	. 
	rst 38h			;98fb	ff 	. 
	rst 38h			;98fc	ff 	. 
	rst 38h			;98fd	ff 	. 
	rst 38h			;98fe	ff 	. 
	rst 38h			;98ff	ff 	. 
	rst 38h			;9900	ff 	. 
	rst 38h			;9901	ff 	. 
	rst 38h			;9902	ff 	. 
	rst 38h			;9903	ff 	. 
	rst 38h			;9904	ff 	. 
	rst 38h			;9905	ff 	. 
	rst 38h			;9906	ff 	. 
	rst 38h			;9907	ff 	. 
	rst 38h			;9908	ff 	. 
	rst 38h			;9909	ff 	. 
	rst 38h			;990a	ff 	. 
	rst 38h			;990b	ff 	. 
	rst 38h			;990c	ff 	. 
	rst 38h			;990d	ff 	. 
	rst 38h			;990e	ff 	. 
	rst 38h			;990f	ff 	. 
	rst 38h			;9910	ff 	. 
	rst 38h			;9911	ff 	. 
	rst 38h			;9912	ff 	. 
	rst 38h			;9913	ff 	. 
	rst 38h			;9914	ff 	. 
	rst 38h			;9915	ff 	. 
	rst 38h			;9916	ff 	. 
	rst 38h			;9917	ff 	. 
	rst 38h			;9918	ff 	. 
	rst 38h			;9919	ff 	. 
	rst 38h			;991a	ff 	. 
	rst 38h			;991b	ff 	. 
	rst 38h			;991c	ff 	. 
	rst 38h			;991d	ff 	. 
	rst 38h			;991e	ff 	. 
	rst 38h			;991f	ff 	. 
	rst 38h			;9920	ff 	. 
	rst 38h			;9921	ff 	. 
	rst 38h			;9922	ff 	. 
	rst 38h			;9923	ff 	. 
	rst 38h			;9924	ff 	. 
	rst 38h			;9925	ff 	. 
	rst 38h			;9926	ff 	. 
	rst 38h			;9927	ff 	. 
	rst 38h			;9928	ff 	. 
	rst 38h			;9929	ff 	. 
	rst 38h			;992a	ff 	. 
	rst 38h			;992b	ff 	. 
	rst 38h			;992c	ff 	. 
	rst 38h			;992d	ff 	. 
	rst 38h			;992e	ff 	. 
	rst 38h			;992f	ff 	. 
	rst 38h			;9930	ff 	. 
	rst 38h			;9931	ff 	. 
	rst 38h			;9932	ff 	. 
	rst 38h			;9933	ff 	. 
	rst 38h			;9934	ff 	. 
	rst 38h			;9935	ff 	. 
	rst 38h			;9936	ff 	. 
	rst 38h			;9937	ff 	. 
	rst 38h			;9938	ff 	. 
	rst 38h			;9939	ff 	. 
	rst 38h			;993a	ff 	. 
	rst 38h			;993b	ff 	. 
	rst 38h			;993c	ff 	. 
	rst 38h			;993d	ff 	. 
	rst 38h			;993e	ff 	. 
	rst 38h			;993f	ff 	. 
	rst 38h			;9940	ff 	. 
	rst 38h			;9941	ff 	. 
	rst 38h			;9942	ff 	. 
	rst 38h			;9943	ff 	. 
	rst 38h			;9944	ff 	. 
	rst 38h			;9945	ff 	. 
	rst 38h			;9946	ff 	. 
	rst 38h			;9947	ff 	. 
	rst 38h			;9948	ff 	. 
	rst 38h			;9949	ff 	. 
	rst 38h			;994a	ff 	. 
	rst 38h			;994b	ff 	. 
	rst 38h			;994c	ff 	. 
	rst 38h			;994d	ff 	. 
	rst 38h			;994e	ff 	. 
	rst 38h			;994f	ff 	. 
	rst 38h			;9950	ff 	. 
	rst 38h			;9951	ff 	. 
	rst 38h			;9952	ff 	. 
	rst 38h			;9953	ff 	. 
	rst 38h			;9954	ff 	. 
	rst 38h			;9955	ff 	. 
	rst 38h			;9956	ff 	. 
	rst 38h			;9957	ff 	. 
	rst 38h			;9958	ff 	. 
	rst 38h			;9959	ff 	. 
	rst 38h			;995a	ff 	. 
	rst 38h			;995b	ff 	. 
	rst 38h			;995c	ff 	. 
	rst 38h			;995d	ff 	. 
	rst 38h			;995e	ff 	. 
	rst 38h			;995f	ff 	. 
	rst 38h			;9960	ff 	. 
	rst 38h			;9961	ff 	. 
	rst 38h			;9962	ff 	. 
	rst 38h			;9963	ff 	. 
	rst 38h			;9964	ff 	. 
	rst 38h			;9965	ff 	. 
	rst 38h			;9966	ff 	. 
	rst 38h			;9967	ff 	. 
	rst 38h			;9968	ff 	. 
	rst 38h			;9969	ff 	. 
	rst 38h			;996a	ff 	. 
	rst 38h			;996b	ff 	. 
	rst 38h			;996c	ff 	. 
	rst 38h			;996d	ff 	. 
	rst 38h			;996e	ff 	. 
	rst 38h			;996f	ff 	. 
	rst 38h			;9970	ff 	. 
	rst 38h			;9971	ff 	. 
	rst 38h			;9972	ff 	. 
	rst 38h			;9973	ff 	. 
	rst 38h			;9974	ff 	. 
	rst 38h			;9975	ff 	. 
	rst 38h			;9976	ff 	. 
	rst 38h			;9977	ff 	. 
	rst 38h			;9978	ff 	. 
	rst 38h			;9979	ff 	. 
	rst 38h			;997a	ff 	. 
	rst 38h			;997b	ff 	. 
	rst 38h			;997c	ff 	. 
	rst 38h			;997d	ff 	. 
	rst 38h			;997e	ff 	. 
	rst 38h			;997f	ff 	. 
	rst 38h			;9980	ff 	. 
	rst 38h			;9981	ff 	. 
	rst 38h			;9982	ff 	. 
	rst 38h			;9983	ff 	. 
	rst 38h			;9984	ff 	. 
	rst 38h			;9985	ff 	. 
	rst 38h			;9986	ff 	. 
	rst 38h			;9987	ff 	. 
	rst 38h			;9988	ff 	. 
	rst 38h			;9989	ff 	. 
	rst 38h			;998a	ff 	. 
	rst 38h			;998b	ff 	. 
	rst 38h			;998c	ff 	. 
	rst 38h			;998d	ff 	. 
	rst 38h			;998e	ff 	. 
	rst 38h			;998f	ff 	. 
	rst 38h			;9990	ff 	. 
	rst 38h			;9991	ff 	. 
	rst 38h			;9992	ff 	. 
	rst 38h			;9993	ff 	. 
	rst 38h			;9994	ff 	. 
	rst 38h			;9995	ff 	. 
	rst 38h			;9996	ff 	. 
	rst 38h			;9997	ff 	. 
	rst 38h			;9998	ff 	. 
	rst 38h			;9999	ff 	. 
	rst 38h			;999a	ff 	. 
	rst 38h			;999b	ff 	. 
	rst 38h			;999c	ff 	. 
	rst 38h			;999d	ff 	. 
	rst 38h			;999e	ff 	. 
	rst 38h			;999f	ff 	. 
	rst 38h			;99a0	ff 	. 
	rst 38h			;99a1	ff 	. 
	rst 38h			;99a2	ff 	. 
	rst 38h			;99a3	ff 	. 
	rst 38h			;99a4	ff 	. 
	rst 38h			;99a5	ff 	. 
	rst 38h			;99a6	ff 	. 
	rst 38h			;99a7	ff 	. 
	rst 38h			;99a8	ff 	. 
	rst 38h			;99a9	ff 	. 
	rst 38h			;99aa	ff 	. 
	rst 38h			;99ab	ff 	. 
	rst 38h			;99ac	ff 	. 
	rst 38h			;99ad	ff 	. 
	rst 38h			;99ae	ff 	. 
	rst 38h			;99af	ff 	. 
	rst 38h			;99b0	ff 	. 
	rst 38h			;99b1	ff 	. 
	rst 38h			;99b2	ff 	. 
	rst 38h			;99b3	ff 	. 
	rst 38h			;99b4	ff 	. 
	rst 38h			;99b5	ff 	. 
	rst 38h			;99b6	ff 	. 
	rst 38h			;99b7	ff 	. 
	rst 38h			;99b8	ff 	. 
	rst 38h			;99b9	ff 	. 
	rst 38h			;99ba	ff 	. 
	rst 38h			;99bb	ff 	. 
	rst 38h			;99bc	ff 	. 
	rst 38h			;99bd	ff 	. 
	rst 38h			;99be	ff 	. 
	rst 38h			;99bf	ff 	. 
	rst 38h			;99c0	ff 	. 
	rst 38h			;99c1	ff 	. 
	rst 38h			;99c2	ff 	. 
	rst 38h			;99c3	ff 	. 
	rst 38h			;99c4	ff 	. 
	rst 38h			;99c5	ff 	. 
	rst 38h			;99c6	ff 	. 
	rst 38h			;99c7	ff 	. 
	rst 38h			;99c8	ff 	. 
	rst 38h			;99c9	ff 	. 
	rst 38h			;99ca	ff 	. 
	rst 38h			;99cb	ff 	. 
	rst 38h			;99cc	ff 	. 
	rst 38h			;99cd	ff 	. 
	rst 38h			;99ce	ff 	. 
	rst 38h			;99cf	ff 	. 
	rst 38h			;99d0	ff 	. 
	rst 38h			;99d1	ff 	. 
	rst 38h			;99d2	ff 	. 
	rst 38h			;99d3	ff 	. 
	rst 38h			;99d4	ff 	. 
	rst 38h			;99d5	ff 	. 
	rst 38h			;99d6	ff 	. 
	rst 38h			;99d7	ff 	. 
	rst 38h			;99d8	ff 	. 
	rst 38h			;99d9	ff 	. 
	rst 38h			;99da	ff 	. 
	rst 38h			;99db	ff 	. 
	rst 38h			;99dc	ff 	. 
	rst 38h			;99dd	ff 	. 
	rst 38h			;99de	ff 	. 
	rst 38h			;99df	ff 	. 
	rst 38h			;99e0	ff 	. 
	rst 38h			;99e1	ff 	. 
	rst 38h			;99e2	ff 	. 
	rst 38h			;99e3	ff 	. 
	rst 38h			;99e4	ff 	. 
	rst 38h			;99e5	ff 	. 
	rst 38h			;99e6	ff 	. 
	rst 38h			;99e7	ff 	. 
	rst 38h			;99e8	ff 	. 
	rst 38h			;99e9	ff 	. 
	rst 38h			;99ea	ff 	. 
	rst 38h			;99eb	ff 	. 
	rst 38h			;99ec	ff 	. 
	rst 38h			;99ed	ff 	. 
	rst 38h			;99ee	ff 	. 
	rst 38h			;99ef	ff 	. 
	rst 38h			;99f0	ff 	. 
	rst 38h			;99f1	ff 	. 
	rst 38h			;99f2	ff 	. 
	rst 38h			;99f3	ff 	. 
	rst 38h			;99f4	ff 	. 
	rst 38h			;99f5	ff 	. 
	rst 38h			;99f6	ff 	. 
	rst 38h			;99f7	ff 	. 
	rst 38h			;99f8	ff 	. 
	rst 38h			;99f9	ff 	. 
	rst 38h			;99fa	ff 	. 
	rst 38h			;99fb	ff 	. 
	rst 38h			;99fc	ff 	. 
	rst 38h			;99fd	ff 	. 
	rst 38h			;99fe	ff 	. 
	rst 38h			;99ff	ff 	. 
	rst 38h			;9a00	ff 	. 
	rst 38h			;9a01	ff 	. 
	rst 38h			;9a02	ff 	. 
	rst 38h			;9a03	ff 	. 
	rst 38h			;9a04	ff 	. 
	rst 38h			;9a05	ff 	. 
	rst 38h			;9a06	ff 	. 
	rst 38h			;9a07	ff 	. 
	rst 38h			;9a08	ff 	. 
	rst 38h			;9a09	ff 	. 
	rst 38h			;9a0a	ff 	. 
	rst 38h			;9a0b	ff 	. 
	rst 38h			;9a0c	ff 	. 
	rst 38h			;9a0d	ff 	. 
	rst 38h			;9a0e	ff 	. 
	rst 38h			;9a0f	ff 	. 
	rst 38h			;9a10	ff 	. 
	rst 38h			;9a11	ff 	. 
	rst 38h			;9a12	ff 	. 
	rst 38h			;9a13	ff 	. 
	rst 38h			;9a14	ff 	. 
	rst 38h			;9a15	ff 	. 
	rst 38h			;9a16	ff 	. 
	rst 38h			;9a17	ff 	. 
	rst 38h			;9a18	ff 	. 
	rst 38h			;9a19	ff 	. 
	rst 38h			;9a1a	ff 	. 
	rst 38h			;9a1b	ff 	. 
	rst 38h			;9a1c	ff 	. 
	rst 38h			;9a1d	ff 	. 
	rst 38h			;9a1e	ff 	. 
	rst 38h			;9a1f	ff 	. 
	rst 38h			;9a20	ff 	. 
	rst 38h			;9a21	ff 	. 
	rst 38h			;9a22	ff 	. 
	rst 38h			;9a23	ff 	. 
	rst 38h			;9a24	ff 	. 
	rst 38h			;9a25	ff 	. 
	rst 38h			;9a26	ff 	. 
	rst 38h			;9a27	ff 	. 
	rst 38h			;9a28	ff 	. 
	rst 38h			;9a29	ff 	. 
	rst 38h			;9a2a	ff 	. 
	rst 38h			;9a2b	ff 	. 
	rst 38h			;9a2c	ff 	. 
	rst 38h			;9a2d	ff 	. 
	rst 38h			;9a2e	ff 	. 
	rst 38h			;9a2f	ff 	. 
	rst 38h			;9a30	ff 	. 
	rst 38h			;9a31	ff 	. 
	rst 38h			;9a32	ff 	. 
	rst 38h			;9a33	ff 	. 
	rst 38h			;9a34	ff 	. 
	rst 38h			;9a35	ff 	. 
	rst 38h			;9a36	ff 	. 
	rst 38h			;9a37	ff 	. 
	rst 38h			;9a38	ff 	. 
	rst 38h			;9a39	ff 	. 
	rst 38h			;9a3a	ff 	. 
	rst 38h			;9a3b	ff 	. 
	rst 38h			;9a3c	ff 	. 
	rst 38h			;9a3d	ff 	. 
	rst 38h			;9a3e	ff 	. 
	rst 38h			;9a3f	ff 	. 
	rst 38h			;9a40	ff 	. 
	rst 38h			;9a41	ff 	. 
	rst 38h			;9a42	ff 	. 
	rst 38h			;9a43	ff 	. 
	rst 38h			;9a44	ff 	. 
	rst 38h			;9a45	ff 	. 
	rst 38h			;9a46	ff 	. 
	rst 38h			;9a47	ff 	. 
	rst 38h			;9a48	ff 	. 
	rst 38h			;9a49	ff 	. 
	rst 38h			;9a4a	ff 	. 
	rst 38h			;9a4b	ff 	. 
	rst 38h			;9a4c	ff 	. 
	rst 38h			;9a4d	ff 	. 
	rst 38h			;9a4e	ff 	. 
	rst 38h			;9a4f	ff 	. 
	rst 38h			;9a50	ff 	. 
	rst 38h			;9a51	ff 	. 
	rst 38h			;9a52	ff 	. 
	rst 38h			;9a53	ff 	. 
	rst 38h			;9a54	ff 	. 
	rst 38h			;9a55	ff 	. 
	rst 38h			;9a56	ff 	. 
	rst 38h			;9a57	ff 	. 
	rst 38h			;9a58	ff 	. 
	rst 38h			;9a59	ff 	. 
	rst 38h			;9a5a	ff 	. 
	rst 38h			;9a5b	ff 	. 
	rst 38h			;9a5c	ff 	. 
	rst 38h			;9a5d	ff 	. 
	rst 38h			;9a5e	ff 	. 
	rst 38h			;9a5f	ff 	. 
	rst 38h			;9a60	ff 	. 
	rst 38h			;9a61	ff 	. 
	rst 38h			;9a62	ff 	. 
	rst 38h			;9a63	ff 	. 
	rst 38h			;9a64	ff 	. 
	rst 38h			;9a65	ff 	. 
	rst 38h			;9a66	ff 	. 
	rst 38h			;9a67	ff 	. 
	rst 38h			;9a68	ff 	. 
	rst 38h			;9a69	ff 	. 
	rst 38h			;9a6a	ff 	. 
	rst 38h			;9a6b	ff 	. 
	rst 38h			;9a6c	ff 	. 
	rst 38h			;9a6d	ff 	. 
	rst 38h			;9a6e	ff 	. 
	rst 38h			;9a6f	ff 	. 
	rst 38h			;9a70	ff 	. 
	rst 38h			;9a71	ff 	. 
	rst 38h			;9a72	ff 	. 
	rst 38h			;9a73	ff 	. 
	rst 38h			;9a74	ff 	. 
	rst 38h			;9a75	ff 	. 
	rst 38h			;9a76	ff 	. 
	rst 38h			;9a77	ff 	. 
	rst 38h			;9a78	ff 	. 
	rst 38h			;9a79	ff 	. 
	rst 38h			;9a7a	ff 	. 
	rst 38h			;9a7b	ff 	. 
	rst 38h			;9a7c	ff 	. 
	rst 38h			;9a7d	ff 	. 
	rst 38h			;9a7e	ff 	. 
	rst 38h			;9a7f	ff 	. 
	rst 38h			;9a80	ff 	. 
	rst 38h			;9a81	ff 	. 
	rst 38h			;9a82	ff 	. 
	rst 38h			;9a83	ff 	. 
	rst 38h			;9a84	ff 	. 
	rst 38h			;9a85	ff 	. 
	rst 38h			;9a86	ff 	. 
	rst 38h			;9a87	ff 	. 
	rst 38h			;9a88	ff 	. 
	rst 38h			;9a89	ff 	. 
	rst 38h			;9a8a	ff 	. 
	rst 38h			;9a8b	ff 	. 
	rst 38h			;9a8c	ff 	. 
	rst 38h			;9a8d	ff 	. 
	rst 38h			;9a8e	ff 	. 
	rst 38h			;9a8f	ff 	. 
	rst 38h			;9a90	ff 	. 
	rst 38h			;9a91	ff 	. 
	rst 38h			;9a92	ff 	. 
	rst 38h			;9a93	ff 	. 
	rst 38h			;9a94	ff 	. 
	rst 38h			;9a95	ff 	. 
	rst 38h			;9a96	ff 	. 
	rst 38h			;9a97	ff 	. 
	rst 38h			;9a98	ff 	. 
	rst 38h			;9a99	ff 	. 
	rst 38h			;9a9a	ff 	. 
	rst 38h			;9a9b	ff 	. 
	rst 38h			;9a9c	ff 	. 
	rst 38h			;9a9d	ff 	. 
	rst 38h			;9a9e	ff 	. 
	rst 38h			;9a9f	ff 	. 
	rst 38h			;9aa0	ff 	. 
	rst 38h			;9aa1	ff 	. 
	rst 38h			;9aa2	ff 	. 
	rst 38h			;9aa3	ff 	. 
	rst 38h			;9aa4	ff 	. 
	rst 38h			;9aa5	ff 	. 
	rst 38h			;9aa6	ff 	. 
	rst 38h			;9aa7	ff 	. 
	rst 38h			;9aa8	ff 	. 
	rst 38h			;9aa9	ff 	. 
	rst 38h			;9aaa	ff 	. 
	rst 38h			;9aab	ff 	. 
	rst 38h			;9aac	ff 	. 
	rst 38h			;9aad	ff 	. 
	rst 38h			;9aae	ff 	. 
	rst 38h			;9aaf	ff 	. 
	rst 38h			;9ab0	ff 	. 
	rst 38h			;9ab1	ff 	. 
	rst 38h			;9ab2	ff 	. 
	rst 38h			;9ab3	ff 	. 
	rst 38h			;9ab4	ff 	. 
	rst 38h			;9ab5	ff 	. 
	rst 38h			;9ab6	ff 	. 
	rst 38h			;9ab7	ff 	. 
	rst 38h			;9ab8	ff 	. 
	rst 38h			;9ab9	ff 	. 
	rst 38h			;9aba	ff 	. 
	rst 38h			;9abb	ff 	. 
	rst 38h			;9abc	ff 	. 
	rst 38h			;9abd	ff 	. 
	rst 38h			;9abe	ff 	. 
	rst 38h			;9abf	ff 	. 
	rst 38h			;9ac0	ff 	. 
	rst 38h			;9ac1	ff 	. 
	rst 38h			;9ac2	ff 	. 
	rst 38h			;9ac3	ff 	. 
	rst 38h			;9ac4	ff 	. 
	rst 38h			;9ac5	ff 	. 
	rst 38h			;9ac6	ff 	. 
	rst 38h			;9ac7	ff 	. 
	rst 38h			;9ac8	ff 	. 
	rst 38h			;9ac9	ff 	. 
	rst 38h			;9aca	ff 	. 
	rst 38h			;9acb	ff 	. 
	rst 38h			;9acc	ff 	. 
	rst 38h			;9acd	ff 	. 
	rst 38h			;9ace	ff 	. 
	rst 38h			;9acf	ff 	. 
	rst 38h			;9ad0	ff 	. 
	rst 38h			;9ad1	ff 	. 
	rst 38h			;9ad2	ff 	. 
	rst 38h			;9ad3	ff 	. 
	rst 38h			;9ad4	ff 	. 
	rst 38h			;9ad5	ff 	. 
	rst 38h			;9ad6	ff 	. 
	rst 38h			;9ad7	ff 	. 
	rst 38h			;9ad8	ff 	. 
	rst 38h			;9ad9	ff 	. 
	rst 38h			;9ada	ff 	. 
	rst 38h			;9adb	ff 	. 
	rst 38h			;9adc	ff 	. 
	rst 38h			;9add	ff 	. 
	rst 38h			;9ade	ff 	. 
	rst 38h			;9adf	ff 	. 
	rst 38h			;9ae0	ff 	. 
	rst 38h			;9ae1	ff 	. 
	rst 38h			;9ae2	ff 	. 
	rst 38h			;9ae3	ff 	. 
	rst 38h			;9ae4	ff 	. 
	rst 38h			;9ae5	ff 	. 
	rst 38h			;9ae6	ff 	. 
	rst 38h			;9ae7	ff 	. 
	rst 38h			;9ae8	ff 	. 
	rst 38h			;9ae9	ff 	. 
	rst 38h			;9aea	ff 	. 
	rst 38h			;9aeb	ff 	. 
	rst 38h			;9aec	ff 	. 
	rst 38h			;9aed	ff 	. 
	rst 38h			;9aee	ff 	. 
	rst 38h			;9aef	ff 	. 
	rst 38h			;9af0	ff 	. 
	rst 38h			;9af1	ff 	. 
	rst 38h			;9af2	ff 	. 
	rst 38h			;9af3	ff 	. 
	rst 38h			;9af4	ff 	. 
	rst 38h			;9af5	ff 	. 
	rst 38h			;9af6	ff 	. 
	rst 38h			;9af7	ff 	. 
	rst 38h			;9af8	ff 	. 
	rst 38h			;9af9	ff 	. 
	rst 38h			;9afa	ff 	. 
	rst 38h			;9afb	ff 	. 
	rst 38h			;9afc	ff 	. 
	rst 38h			;9afd	ff 	. 
	rst 38h			;9afe	ff 	. 
	rst 38h			;9aff	ff 	. 
	rst 38h			;9b00	ff 	. 
	rst 38h			;9b01	ff 	. 
	rst 38h			;9b02	ff 	. 
	rst 38h			;9b03	ff 	. 
	rst 38h			;9b04	ff 	. 
	rst 38h			;9b05	ff 	. 
	rst 38h			;9b06	ff 	. 
	rst 38h			;9b07	ff 	. 
	rst 38h			;9b08	ff 	. 
	rst 38h			;9b09	ff 	. 
	rst 38h			;9b0a	ff 	. 
	rst 38h			;9b0b	ff 	. 
	rst 38h			;9b0c	ff 	. 
	rst 38h			;9b0d	ff 	. 
	rst 38h			;9b0e	ff 	. 
	rst 38h			;9b0f	ff 	. 
	rst 38h			;9b10	ff 	. 
	rst 38h			;9b11	ff 	. 
	rst 38h			;9b12	ff 	. 
	rst 38h			;9b13	ff 	. 
	rst 38h			;9b14	ff 	. 
	rst 38h			;9b15	ff 	. 
	rst 38h			;9b16	ff 	. 
	rst 38h			;9b17	ff 	. 
	rst 38h			;9b18	ff 	. 
	rst 38h			;9b19	ff 	. 
	rst 38h			;9b1a	ff 	. 
	rst 38h			;9b1b	ff 	. 
	rst 38h			;9b1c	ff 	. 
	rst 38h			;9b1d	ff 	. 
	rst 38h			;9b1e	ff 	. 
	rst 38h			;9b1f	ff 	. 
	rst 38h			;9b20	ff 	. 
	rst 38h			;9b21	ff 	. 
	rst 38h			;9b22	ff 	. 
	rst 38h			;9b23	ff 	. 
	rst 38h			;9b24	ff 	. 
	rst 38h			;9b25	ff 	. 
	rst 38h			;9b26	ff 	. 
	rst 38h			;9b27	ff 	. 
	rst 38h			;9b28	ff 	. 
	rst 38h			;9b29	ff 	. 
	rst 38h			;9b2a	ff 	. 
	rst 38h			;9b2b	ff 	. 
	rst 38h			;9b2c	ff 	. 
	rst 38h			;9b2d	ff 	. 
	rst 38h			;9b2e	ff 	. 
	rst 38h			;9b2f	ff 	. 
	rst 38h			;9b30	ff 	. 
	rst 38h			;9b31	ff 	. 
	rst 38h			;9b32	ff 	. 
	rst 38h			;9b33	ff 	. 
	rst 38h			;9b34	ff 	. 
	rst 38h			;9b35	ff 	. 
	rst 38h			;9b36	ff 	. 
	rst 38h			;9b37	ff 	. 
	rst 38h			;9b38	ff 	. 
	rst 38h			;9b39	ff 	. 
	rst 38h			;9b3a	ff 	. 
	rst 38h			;9b3b	ff 	. 
	rst 38h			;9b3c	ff 	. 
	rst 38h			;9b3d	ff 	. 
	rst 38h			;9b3e	ff 	. 
	rst 38h			;9b3f	ff 	. 
	rst 38h			;9b40	ff 	. 
	rst 38h			;9b41	ff 	. 
	rst 38h			;9b42	ff 	. 
	rst 38h			;9b43	ff 	. 
	rst 38h			;9b44	ff 	. 
	rst 38h			;9b45	ff 	. 
	rst 38h			;9b46	ff 	. 
	rst 38h			;9b47	ff 	. 
	rst 38h			;9b48	ff 	. 
	rst 38h			;9b49	ff 	. 
	rst 38h			;9b4a	ff 	. 
	rst 38h			;9b4b	ff 	. 
	rst 38h			;9b4c	ff 	. 
	rst 38h			;9b4d	ff 	. 
	rst 38h			;9b4e	ff 	. 
	rst 38h			;9b4f	ff 	. 
	rst 38h			;9b50	ff 	. 
	rst 38h			;9b51	ff 	. 
	rst 38h			;9b52	ff 	. 
	rst 38h			;9b53	ff 	. 
	rst 38h			;9b54	ff 	. 
	rst 38h			;9b55	ff 	. 
	rst 38h			;9b56	ff 	. 
	rst 38h			;9b57	ff 	. 
	rst 38h			;9b58	ff 	. 
	rst 38h			;9b59	ff 	. 
	rst 38h			;9b5a	ff 	. 
	rst 38h			;9b5b	ff 	. 
	rst 38h			;9b5c	ff 	. 
	rst 38h			;9b5d	ff 	. 
	rst 38h			;9b5e	ff 	. 
	rst 38h			;9b5f	ff 	. 
	rst 38h			;9b60	ff 	. 
	rst 38h			;9b61	ff 	. 
	rst 38h			;9b62	ff 	. 
	rst 38h			;9b63	ff 	. 
	rst 38h			;9b64	ff 	. 
	rst 38h			;9b65	ff 	. 
	rst 38h			;9b66	ff 	. 
	rst 38h			;9b67	ff 	. 
	rst 38h			;9b68	ff 	. 
	rst 38h			;9b69	ff 	. 
	rst 38h			;9b6a	ff 	. 
	rst 38h			;9b6b	ff 	. 
	rst 38h			;9b6c	ff 	. 
	rst 38h			;9b6d	ff 	. 
	rst 38h			;9b6e	ff 	. 
	rst 38h			;9b6f	ff 	. 
	rst 38h			;9b70	ff 	. 
	rst 38h			;9b71	ff 	. 
	rst 38h			;9b72	ff 	. 
	rst 38h			;9b73	ff 	. 
	rst 38h			;9b74	ff 	. 
	rst 38h			;9b75	ff 	. 
	rst 38h			;9b76	ff 	. 
	rst 38h			;9b77	ff 	. 
	rst 38h			;9b78	ff 	. 
	rst 38h			;9b79	ff 	. 
	rst 38h			;9b7a	ff 	. 
	rst 38h			;9b7b	ff 	. 
	rst 38h			;9b7c	ff 	. 
	rst 38h			;9b7d	ff 	. 
	rst 38h			;9b7e	ff 	. 
	rst 38h			;9b7f	ff 	. 
	rst 38h			;9b80	ff 	. 
	rst 38h			;9b81	ff 	. 
	rst 38h			;9b82	ff 	. 
	rst 38h			;9b83	ff 	. 
	rst 38h			;9b84	ff 	. 
	rst 38h			;9b85	ff 	. 
	rst 38h			;9b86	ff 	. 
	rst 38h			;9b87	ff 	. 
	rst 38h			;9b88	ff 	. 
	rst 38h			;9b89	ff 	. 
	rst 38h			;9b8a	ff 	. 
	rst 38h			;9b8b	ff 	. 
	rst 38h			;9b8c	ff 	. 
	rst 38h			;9b8d	ff 	. 
	rst 38h			;9b8e	ff 	. 
	rst 38h			;9b8f	ff 	. 
	rst 38h			;9b90	ff 	. 
	rst 38h			;9b91	ff 	. 
	rst 38h			;9b92	ff 	. 
	rst 38h			;9b93	ff 	. 
	rst 38h			;9b94	ff 	. 
l9b95h:
	rst 38h			;9b95	ff 	. 
	rst 38h			;9b96	ff 	. 
	rst 38h			;9b97	ff 	. 
	rst 38h			;9b98	ff 	. 
	rst 38h			;9b99	ff 	. 
	rst 38h			;9b9a	ff 	. 
	rst 38h			;9b9b	ff 	. 
	rst 38h			;9b9c	ff 	. 
	rst 38h			;9b9d	ff 	. 
	rst 38h			;9b9e	ff 	. 
	rst 38h			;9b9f	ff 	. 
	rst 38h			;9ba0	ff 	. 
	rst 38h			;9ba1	ff 	. 
	rst 38h			;9ba2	ff 	. 
	rst 38h			;9ba3	ff 	. 
	rst 38h			;9ba4	ff 	. 
	rst 38h			;9ba5	ff 	. 
	rst 38h			;9ba6	ff 	. 
	rst 38h			;9ba7	ff 	. 
	rst 38h			;9ba8	ff 	. 
	rst 38h			;9ba9	ff 	. 
	rst 38h			;9baa	ff 	. 
	rst 38h			;9bab	ff 	. 
	rst 38h			;9bac	ff 	. 
	rst 38h			;9bad	ff 	. 
	rst 38h			;9bae	ff 	. 
	rst 38h			;9baf	ff 	. 
	rst 38h			;9bb0	ff 	. 
	rst 38h			;9bb1	ff 	. 
	rst 38h			;9bb2	ff 	. 
	rst 38h			;9bb3	ff 	. 
	rst 38h			;9bb4	ff 	. 
	rst 38h			;9bb5	ff 	. 
	rst 38h			;9bb6	ff 	. 
	rst 38h			;9bb7	ff 	. 
	rst 38h			;9bb8	ff 	. 
	rst 38h			;9bb9	ff 	. 
	rst 38h			;9bba	ff 	. 
	rst 38h			;9bbb	ff 	. 
	rst 38h			;9bbc	ff 	. 
	rst 38h			;9bbd	ff 	. 
	rst 38h			;9bbe	ff 	. 
	rst 38h			;9bbf	ff 	. 
	rst 38h			;9bc0	ff 	. 
	rst 38h			;9bc1	ff 	. 
	rst 38h			;9bc2	ff 	. 
	rst 38h			;9bc3	ff 	. 
	rst 38h			;9bc4	ff 	. 
	rst 38h			;9bc5	ff 	. 
	rst 38h			;9bc6	ff 	. 
	rst 38h			;9bc7	ff 	. 
	rst 38h			;9bc8	ff 	. 
	rst 38h			;9bc9	ff 	. 
	rst 38h			;9bca	ff 	. 
	rst 38h			;9bcb	ff 	. 
	rst 38h			;9bcc	ff 	. 
	rst 38h			;9bcd	ff 	. 
	rst 38h			;9bce	ff 	. 
	rst 38h			;9bcf	ff 	. 
	rst 38h			;9bd0	ff 	. 
	rst 38h			;9bd1	ff 	. 
	rst 38h			;9bd2	ff 	. 
	rst 38h			;9bd3	ff 	. 
	rst 38h			;9bd4	ff 	. 
	rst 38h			;9bd5	ff 	. 
	rst 38h			;9bd6	ff 	. 
	rst 38h			;9bd7	ff 	. 
	rst 38h			;9bd8	ff 	. 
	rst 38h			;9bd9	ff 	. 
	rst 38h			;9bda	ff 	. 
	rst 38h			;9bdb	ff 	. 
	rst 38h			;9bdc	ff 	. 
	rst 38h			;9bdd	ff 	. 
	rst 38h			;9bde	ff 	. 
	rst 38h			;9bdf	ff 	. 
	rst 38h			;9be0	ff 	. 
	rst 38h			;9be1	ff 	. 
	rst 38h			;9be2	ff 	. 
	rst 38h			;9be3	ff 	. 
	rst 38h			;9be4	ff 	. 
	rst 38h			;9be5	ff 	. 
	rst 38h			;9be6	ff 	. 
	rst 38h			;9be7	ff 	. 
	rst 38h			;9be8	ff 	. 
	rst 38h			;9be9	ff 	. 
	rst 38h			;9bea	ff 	. 
	rst 38h			;9beb	ff 	. 
	rst 38h			;9bec	ff 	. 
	rst 38h			;9bed	ff 	. 
	rst 38h			;9bee	ff 	. 
	rst 38h			;9bef	ff 	. 
	rst 38h			;9bf0	ff 	. 
	rst 38h			;9bf1	ff 	. 
	rst 38h			;9bf2	ff 	. 
	rst 38h			;9bf3	ff 	. 
	rst 38h			;9bf4	ff 	. 
	rst 38h			;9bf5	ff 	. 
	rst 38h			;9bf6	ff 	. 
	rst 38h			;9bf7	ff 	. 
	rst 38h			;9bf8	ff 	. 
	rst 38h			;9bf9	ff 	. 
	rst 38h			;9bfa	ff 	. 
	rst 38h			;9bfb	ff 	. 
	rst 38h			;9bfc	ff 	. 
	rst 38h			;9bfd	ff 	. 
	rst 38h			;9bfe	ff 	. 
	rst 38h			;9bff	ff 	. 
	rst 38h			;9c00	ff 	. 
	rst 38h			;9c01	ff 	. 
	rst 38h			;9c02	ff 	. 
	rst 38h			;9c03	ff 	. 
	rst 38h			;9c04	ff 	. 
	rst 38h			;9c05	ff 	. 
	rst 38h			;9c06	ff 	. 
	rst 38h			;9c07	ff 	. 
	rst 38h			;9c08	ff 	. 
	rst 38h			;9c09	ff 	. 
	rst 38h			;9c0a	ff 	. 
	rst 38h			;9c0b	ff 	. 
	rst 38h			;9c0c	ff 	. 
	rst 38h			;9c0d	ff 	. 
	rst 38h			;9c0e	ff 	. 
	rst 38h			;9c0f	ff 	. 
	rst 38h			;9c10	ff 	. 
	rst 38h			;9c11	ff 	. 
	rst 38h			;9c12	ff 	. 
	rst 38h			;9c13	ff 	. 
	rst 38h			;9c14	ff 	. 
	rst 38h			;9c15	ff 	. 
	rst 38h			;9c16	ff 	. 
	rst 38h			;9c17	ff 	. 
	rst 38h			;9c18	ff 	. 
	rst 38h			;9c19	ff 	. 
	rst 38h			;9c1a	ff 	. 
	rst 38h			;9c1b	ff 	. 
	rst 38h			;9c1c	ff 	. 
	rst 38h			;9c1d	ff 	. 
	rst 38h			;9c1e	ff 	. 
	rst 38h			;9c1f	ff 	. 
	rst 38h			;9c20	ff 	. 
	rst 38h			;9c21	ff 	. 
	rst 38h			;9c22	ff 	. 
	rst 38h			;9c23	ff 	. 
	rst 38h			;9c24	ff 	. 
	rst 38h			;9c25	ff 	. 
	rst 38h			;9c26	ff 	. 
	rst 38h			;9c27	ff 	. 
	rst 38h			;9c28	ff 	. 
	rst 38h			;9c29	ff 	. 
	rst 38h			;9c2a	ff 	. 
	rst 38h			;9c2b	ff 	. 
	rst 38h			;9c2c	ff 	. 
	rst 38h			;9c2d	ff 	. 
	rst 38h			;9c2e	ff 	. 
	rst 38h			;9c2f	ff 	. 
	rst 38h			;9c30	ff 	. 
	rst 38h			;9c31	ff 	. 
	rst 38h			;9c32	ff 	. 
	rst 38h			;9c33	ff 	. 
	rst 38h			;9c34	ff 	. 
	rst 38h			;9c35	ff 	. 
	rst 38h			;9c36	ff 	. 
	rst 38h			;9c37	ff 	. 
	rst 38h			;9c38	ff 	. 
	rst 38h			;9c39	ff 	. 
	rst 38h			;9c3a	ff 	. 
	rst 38h			;9c3b	ff 	. 
	rst 38h			;9c3c	ff 	. 
	rst 38h			;9c3d	ff 	. 
	rst 38h			;9c3e	ff 	. 
	rst 38h			;9c3f	ff 	. 
	rst 38h			;9c40	ff 	. 
	rst 38h			;9c41	ff 	. 
	rst 38h			;9c42	ff 	. 
	rst 38h			;9c43	ff 	. 
	rst 38h			;9c44	ff 	. 
	rst 38h			;9c45	ff 	. 
	rst 38h			;9c46	ff 	. 
	rst 38h			;9c47	ff 	. 
	rst 38h			;9c48	ff 	. 
	rst 38h			;9c49	ff 	. 
	rst 38h			;9c4a	ff 	. 
	rst 38h			;9c4b	ff 	. 
	rst 38h			;9c4c	ff 	. 
	rst 38h			;9c4d	ff 	. 
	rst 38h			;9c4e	ff 	. 
	rst 38h			;9c4f	ff 	. 
	rst 38h			;9c50	ff 	. 
	rst 38h			;9c51	ff 	. 
	rst 38h			;9c52	ff 	. 
	rst 38h			;9c53	ff 	. 
	rst 38h			;9c54	ff 	. 
	rst 38h			;9c55	ff 	. 
	rst 38h			;9c56	ff 	. 
	rst 38h			;9c57	ff 	. 
	rst 38h			;9c58	ff 	. 
	rst 38h			;9c59	ff 	. 
	rst 38h			;9c5a	ff 	. 
	rst 38h			;9c5b	ff 	. 
	rst 38h			;9c5c	ff 	. 
	rst 38h			;9c5d	ff 	. 
	rst 38h			;9c5e	ff 	. 
	rst 38h			;9c5f	ff 	. 
	rst 38h			;9c60	ff 	. 
	rst 38h			;9c61	ff 	. 
	rst 38h			;9c62	ff 	. 
	rst 38h			;9c63	ff 	. 
	rst 38h			;9c64	ff 	. 
	rst 38h			;9c65	ff 	. 
	rst 38h			;9c66	ff 	. 
	rst 38h			;9c67	ff 	. 
	rst 38h			;9c68	ff 	. 
	rst 38h			;9c69	ff 	. 
	rst 38h			;9c6a	ff 	. 
	rst 38h			;9c6b	ff 	. 
	rst 38h			;9c6c	ff 	. 
	rst 38h			;9c6d	ff 	. 
	rst 38h			;9c6e	ff 	. 
	rst 38h			;9c6f	ff 	. 
	rst 38h			;9c70	ff 	. 
	rst 38h			;9c71	ff 	. 
	rst 38h			;9c72	ff 	. 
	rst 38h			;9c73	ff 	. 
	rst 38h			;9c74	ff 	. 
	rst 38h			;9c75	ff 	. 
	rst 38h			;9c76	ff 	. 
	rst 38h			;9c77	ff 	. 
	rst 38h			;9c78	ff 	. 
	rst 38h			;9c79	ff 	. 
	rst 38h			;9c7a	ff 	. 
	rst 38h			;9c7b	ff 	. 
	rst 38h			;9c7c	ff 	. 
	rst 38h			;9c7d	ff 	. 
	rst 38h			;9c7e	ff 	. 
	rst 38h			;9c7f	ff 	. 
	rst 38h			;9c80	ff 	. 
	rst 38h			;9c81	ff 	. 
	rst 38h			;9c82	ff 	. 
	rst 38h			;9c83	ff 	. 
	rst 38h			;9c84	ff 	. 
	rst 38h			;9c85	ff 	. 
	rst 38h			;9c86	ff 	. 
	rst 38h			;9c87	ff 	. 
	rst 38h			;9c88	ff 	. 
	rst 38h			;9c89	ff 	. 
	rst 38h			;9c8a	ff 	. 
	rst 38h			;9c8b	ff 	. 
	rst 38h			;9c8c	ff 	. 
	rst 38h			;9c8d	ff 	. 
	rst 38h			;9c8e	ff 	. 
	rst 38h			;9c8f	ff 	. 
	rst 38h			;9c90	ff 	. 
	rst 38h			;9c91	ff 	. 
	rst 38h			;9c92	ff 	. 
	rst 38h			;9c93	ff 	. 
	rst 38h			;9c94	ff 	. 
	rst 38h			;9c95	ff 	. 
	rst 38h			;9c96	ff 	. 
	rst 38h			;9c97	ff 	. 
	rst 38h			;9c98	ff 	. 
	rst 38h			;9c99	ff 	. 
	rst 38h			;9c9a	ff 	. 
	rst 38h			;9c9b	ff 	. 
	rst 38h			;9c9c	ff 	. 
	rst 38h			;9c9d	ff 	. 
	rst 38h			;9c9e	ff 	. 
	rst 38h			;9c9f	ff 	. 
	rst 38h			;9ca0	ff 	. 
	rst 38h			;9ca1	ff 	. 
	rst 38h			;9ca2	ff 	. 
	rst 38h			;9ca3	ff 	. 
	rst 38h			;9ca4	ff 	. 
	rst 38h			;9ca5	ff 	. 
	rst 38h			;9ca6	ff 	. 
	rst 38h			;9ca7	ff 	. 
	rst 38h			;9ca8	ff 	. 
	rst 38h			;9ca9	ff 	. 
	rst 38h			;9caa	ff 	. 
	rst 38h			;9cab	ff 	. 
	rst 38h			;9cac	ff 	. 
	rst 38h			;9cad	ff 	. 
	rst 38h			;9cae	ff 	. 
	rst 38h			;9caf	ff 	. 
	rst 38h			;9cb0	ff 	. 
	rst 38h			;9cb1	ff 	. 
	rst 38h			;9cb2	ff 	. 
	rst 38h			;9cb3	ff 	. 
	rst 38h			;9cb4	ff 	. 
	rst 38h			;9cb5	ff 	. 
	rst 38h			;9cb6	ff 	. 
	rst 38h			;9cb7	ff 	. 
	rst 38h			;9cb8	ff 	. 
	rst 38h			;9cb9	ff 	. 
	rst 38h			;9cba	ff 	. 
	rst 38h			;9cbb	ff 	. 
	rst 38h			;9cbc	ff 	. 
	rst 38h			;9cbd	ff 	. 
	rst 38h			;9cbe	ff 	. 
	rst 38h			;9cbf	ff 	. 
	rst 38h			;9cc0	ff 	. 
	rst 38h			;9cc1	ff 	. 
	rst 38h			;9cc2	ff 	. 
	rst 38h			;9cc3	ff 	. 
	rst 38h			;9cc4	ff 	. 
	rst 38h			;9cc5	ff 	. 
	rst 38h			;9cc6	ff 	. 
	rst 38h			;9cc7	ff 	. 
	rst 38h			;9cc8	ff 	. 
	rst 38h			;9cc9	ff 	. 
	rst 38h			;9cca	ff 	. 
	rst 38h			;9ccb	ff 	. 
	rst 38h			;9ccc	ff 	. 
	rst 38h			;9ccd	ff 	. 
	rst 38h			;9cce	ff 	. 
	rst 38h			;9ccf	ff 	. 
	rst 38h			;9cd0	ff 	. 
	rst 38h			;9cd1	ff 	. 
	rst 38h			;9cd2	ff 	. 
	rst 38h			;9cd3	ff 	. 
	rst 38h			;9cd4	ff 	. 
	rst 38h			;9cd5	ff 	. 
	rst 38h			;9cd6	ff 	. 
	rst 38h			;9cd7	ff 	. 
	rst 38h			;9cd8	ff 	. 
	rst 38h			;9cd9	ff 	. 
	rst 38h			;9cda	ff 	. 
	rst 38h			;9cdb	ff 	. 
	rst 38h			;9cdc	ff 	. 
	rst 38h			;9cdd	ff 	. 
	rst 38h			;9cde	ff 	. 
	rst 38h			;9cdf	ff 	. 
	rst 38h			;9ce0	ff 	. 
	rst 38h			;9ce1	ff 	. 
	rst 38h			;9ce2	ff 	. 
	rst 38h			;9ce3	ff 	. 
	rst 38h			;9ce4	ff 	. 
	rst 38h			;9ce5	ff 	. 
	rst 38h			;9ce6	ff 	. 
	rst 38h			;9ce7	ff 	. 
	rst 38h			;9ce8	ff 	. 
	rst 38h			;9ce9	ff 	. 
	rst 38h			;9cea	ff 	. 
	rst 38h			;9ceb	ff 	. 
	rst 38h			;9cec	ff 	. 
	rst 38h			;9ced	ff 	. 
	rst 38h			;9cee	ff 	. 
	rst 38h			;9cef	ff 	. 
	rst 38h			;9cf0	ff 	. 
	rst 38h			;9cf1	ff 	. 
	rst 38h			;9cf2	ff 	. 
	rst 38h			;9cf3	ff 	. 
	rst 38h			;9cf4	ff 	. 
	rst 38h			;9cf5	ff 	. 
	rst 38h			;9cf6	ff 	. 
	rst 38h			;9cf7	ff 	. 
	rst 38h			;9cf8	ff 	. 
	rst 38h			;9cf9	ff 	. 
	rst 38h			;9cfa	ff 	. 
	rst 38h			;9cfb	ff 	. 
	rst 38h			;9cfc	ff 	. 
	rst 38h			;9cfd	ff 	. 
	rst 38h			;9cfe	ff 	. 
	rst 38h			;9cff	ff 	. 
	rst 38h			;9d00	ff 	. 
	rst 38h			;9d01	ff 	. 
	rst 38h			;9d02	ff 	. 
	rst 38h			;9d03	ff 	. 
	rst 38h			;9d04	ff 	. 
	rst 38h			;9d05	ff 	. 
	rst 38h			;9d06	ff 	. 
	rst 38h			;9d07	ff 	. 
	rst 38h			;9d08	ff 	. 
	rst 38h			;9d09	ff 	. 
	rst 38h			;9d0a	ff 	. 
	rst 38h			;9d0b	ff 	. 
	rst 38h			;9d0c	ff 	. 
	rst 38h			;9d0d	ff 	. 
	rst 38h			;9d0e	ff 	. 
	rst 38h			;9d0f	ff 	. 
	rst 38h			;9d10	ff 	. 
	rst 38h			;9d11	ff 	. 
	rst 38h			;9d12	ff 	. 
	rst 38h			;9d13	ff 	. 
	rst 38h			;9d14	ff 	. 
	rst 38h			;9d15	ff 	. 
	rst 38h			;9d16	ff 	. 
	rst 38h			;9d17	ff 	. 
	rst 38h			;9d18	ff 	. 
	rst 38h			;9d19	ff 	. 
	rst 38h			;9d1a	ff 	. 
	rst 38h			;9d1b	ff 	. 
	rst 38h			;9d1c	ff 	. 
	rst 38h			;9d1d	ff 	. 
	rst 38h			;9d1e	ff 	. 
	rst 38h			;9d1f	ff 	. 
	rst 38h			;9d20	ff 	. 
	rst 38h			;9d21	ff 	. 
	rst 38h			;9d22	ff 	. 
	rst 38h			;9d23	ff 	. 
	rst 38h			;9d24	ff 	. 
	rst 38h			;9d25	ff 	. 
	rst 38h			;9d26	ff 	. 
	rst 38h			;9d27	ff 	. 
	rst 38h			;9d28	ff 	. 
	rst 38h			;9d29	ff 	. 
	rst 38h			;9d2a	ff 	. 
	rst 38h			;9d2b	ff 	. 
	rst 38h			;9d2c	ff 	. 
	rst 38h			;9d2d	ff 	. 
	rst 38h			;9d2e	ff 	. 
	rst 38h			;9d2f	ff 	. 
	rst 38h			;9d30	ff 	. 
	rst 38h			;9d31	ff 	. 
	rst 38h			;9d32	ff 	. 
	rst 38h			;9d33	ff 	. 
	rst 38h			;9d34	ff 	. 
	rst 38h			;9d35	ff 	. 
	rst 38h			;9d36	ff 	. 
	rst 38h			;9d37	ff 	. 
	rst 38h			;9d38	ff 	. 
	rst 38h			;9d39	ff 	. 
	rst 38h			;9d3a	ff 	. 
	rst 38h			;9d3b	ff 	. 
	rst 38h			;9d3c	ff 	. 
	rst 38h			;9d3d	ff 	. 
	rst 38h			;9d3e	ff 	. 
	rst 38h			;9d3f	ff 	. 
	rst 38h			;9d40	ff 	. 
	rst 38h			;9d41	ff 	. 
	rst 38h			;9d42	ff 	. 
	rst 38h			;9d43	ff 	. 
	rst 38h			;9d44	ff 	. 
	rst 38h			;9d45	ff 	. 
	rst 38h			;9d46	ff 	. 
	rst 38h			;9d47	ff 	. 
	rst 38h			;9d48	ff 	. 
	rst 38h			;9d49	ff 	. 
	rst 38h			;9d4a	ff 	. 
	rst 38h			;9d4b	ff 	. 
	rst 38h			;9d4c	ff 	. 
	rst 38h			;9d4d	ff 	. 
	rst 38h			;9d4e	ff 	. 
	rst 38h			;9d4f	ff 	. 
	rst 38h			;9d50	ff 	. 
	rst 38h			;9d51	ff 	. 
	rst 38h			;9d52	ff 	. 
	rst 38h			;9d53	ff 	. 
	rst 38h			;9d54	ff 	. 
	rst 38h			;9d55	ff 	. 
	rst 38h			;9d56	ff 	. 
	rst 38h			;9d57	ff 	. 
	rst 38h			;9d58	ff 	. 
	rst 38h			;9d59	ff 	. 
	rst 38h			;9d5a	ff 	. 
	rst 38h			;9d5b	ff 	. 
	rst 38h			;9d5c	ff 	. 
	rst 38h			;9d5d	ff 	. 
	rst 38h			;9d5e	ff 	. 
	rst 38h			;9d5f	ff 	. 
	rst 38h			;9d60	ff 	. 
	rst 38h			;9d61	ff 	. 
	rst 38h			;9d62	ff 	. 
	rst 38h			;9d63	ff 	. 
	rst 38h			;9d64	ff 	. 
	rst 38h			;9d65	ff 	. 
	rst 38h			;9d66	ff 	. 
	rst 38h			;9d67	ff 	. 
	rst 38h			;9d68	ff 	. 
	rst 38h			;9d69	ff 	. 
	rst 38h			;9d6a	ff 	. 
	rst 38h			;9d6b	ff 	. 
	rst 38h			;9d6c	ff 	. 
	rst 38h			;9d6d	ff 	. 
	rst 38h			;9d6e	ff 	. 
	rst 38h			;9d6f	ff 	. 
	rst 38h			;9d70	ff 	. 
	rst 38h			;9d71	ff 	. 
	rst 38h			;9d72	ff 	. 
	rst 38h			;9d73	ff 	. 
	rst 38h			;9d74	ff 	. 
	rst 38h			;9d75	ff 	. 
	rst 38h			;9d76	ff 	. 
	rst 38h			;9d77	ff 	. 
	rst 38h			;9d78	ff 	. 
	rst 38h			;9d79	ff 	. 
	rst 38h			;9d7a	ff 	. 
	rst 38h			;9d7b	ff 	. 
	rst 38h			;9d7c	ff 	. 
	rst 38h			;9d7d	ff 	. 
	rst 38h			;9d7e	ff 	. 
	rst 38h			;9d7f	ff 	. 
	rst 38h			;9d80	ff 	. 
	rst 38h			;9d81	ff 	. 
	rst 38h			;9d82	ff 	. 
	rst 38h			;9d83	ff 	. 
	rst 38h			;9d84	ff 	. 
	rst 38h			;9d85	ff 	. 
	rst 38h			;9d86	ff 	. 
	rst 38h			;9d87	ff 	. 
	rst 38h			;9d88	ff 	. 
	rst 38h			;9d89	ff 	. 
	rst 38h			;9d8a	ff 	. 
	rst 38h			;9d8b	ff 	. 
	rst 38h			;9d8c	ff 	. 
	rst 38h			;9d8d	ff 	. 
	rst 38h			;9d8e	ff 	. 
	rst 38h			;9d8f	ff 	. 
	rst 38h			;9d90	ff 	. 
	rst 38h			;9d91	ff 	. 
	rst 38h			;9d92	ff 	. 
	rst 38h			;9d93	ff 	. 
	rst 38h			;9d94	ff 	. 
	rst 38h			;9d95	ff 	. 
	rst 38h			;9d96	ff 	. 
	rst 38h			;9d97	ff 	. 
	rst 38h			;9d98	ff 	. 
	rst 38h			;9d99	ff 	. 
	rst 38h			;9d9a	ff 	. 
	rst 38h			;9d9b	ff 	. 
	rst 38h			;9d9c	ff 	. 
	rst 38h			;9d9d	ff 	. 
	rst 38h			;9d9e	ff 	. 
	rst 38h			;9d9f	ff 	. 
	rst 38h			;9da0	ff 	. 
	rst 38h			;9da1	ff 	. 
	rst 38h			;9da2	ff 	. 
	rst 38h			;9da3	ff 	. 
	rst 38h			;9da4	ff 	. 
	rst 38h			;9da5	ff 	. 
	rst 38h			;9da6	ff 	. 
	rst 38h			;9da7	ff 	. 
	rst 38h			;9da8	ff 	. 
	rst 38h			;9da9	ff 	. 
	rst 38h			;9daa	ff 	. 
	rst 38h			;9dab	ff 	. 
	rst 38h			;9dac	ff 	. 
	rst 38h			;9dad	ff 	. 
	rst 38h			;9dae	ff 	. 
	rst 38h			;9daf	ff 	. 
	rst 38h			;9db0	ff 	. 
	rst 38h			;9db1	ff 	. 
	rst 38h			;9db2	ff 	. 
	rst 38h			;9db3	ff 	. 
	rst 38h			;9db4	ff 	. 
	rst 38h			;9db5	ff 	. 
	rst 38h			;9db6	ff 	. 
	rst 38h			;9db7	ff 	. 
	rst 38h			;9db8	ff 	. 
	rst 38h			;9db9	ff 	. 
	rst 38h			;9dba	ff 	. 
	rst 38h			;9dbb	ff 	. 
	rst 38h			;9dbc	ff 	. 
	rst 38h			;9dbd	ff 	. 
	rst 38h			;9dbe	ff 	. 
	rst 38h			;9dbf	ff 	. 
	rst 38h			;9dc0	ff 	. 
	rst 38h			;9dc1	ff 	. 
	rst 38h			;9dc2	ff 	. 
	rst 38h			;9dc3	ff 	. 
	rst 38h			;9dc4	ff 	. 
	rst 38h			;9dc5	ff 	. 
	rst 38h			;9dc6	ff 	. 
	rst 38h			;9dc7	ff 	. 
	rst 38h			;9dc8	ff 	. 
	rst 38h			;9dc9	ff 	. 
	rst 38h			;9dca	ff 	. 
	rst 38h			;9dcb	ff 	. 
	rst 38h			;9dcc	ff 	. 
	rst 38h			;9dcd	ff 	. 
	rst 38h			;9dce	ff 	. 
	rst 38h			;9dcf	ff 	. 
	rst 38h			;9dd0	ff 	. 
	rst 38h			;9dd1	ff 	. 
	rst 38h			;9dd2	ff 	. 
	rst 38h			;9dd3	ff 	. 
	rst 38h			;9dd4	ff 	. 
	rst 38h			;9dd5	ff 	. 
	rst 38h			;9dd6	ff 	. 
	rst 38h			;9dd7	ff 	. 
	rst 38h			;9dd8	ff 	. 
	rst 38h			;9dd9	ff 	. 
	rst 38h			;9dda	ff 	. 
	rst 38h			;9ddb	ff 	. 
	rst 38h			;9ddc	ff 	. 
	rst 38h			;9ddd	ff 	. 
	rst 38h			;9dde	ff 	. 
	rst 38h			;9ddf	ff 	. 
	rst 38h			;9de0	ff 	. 
	rst 38h			;9de1	ff 	. 
	rst 38h			;9de2	ff 	. 
	rst 38h			;9de3	ff 	. 
	rst 38h			;9de4	ff 	. 
	rst 38h			;9de5	ff 	. 
	rst 38h			;9de6	ff 	. 
	rst 38h			;9de7	ff 	. 
	rst 38h			;9de8	ff 	. 
	rst 38h			;9de9	ff 	. 
	rst 38h			;9dea	ff 	. 
	rst 38h			;9deb	ff 	. 
	rst 38h			;9dec	ff 	. 
	rst 38h			;9ded	ff 	. 
	rst 38h			;9dee	ff 	. 
	rst 38h			;9def	ff 	. 
	rst 38h			;9df0	ff 	. 
	rst 38h			;9df1	ff 	. 
	rst 38h			;9df2	ff 	. 
	rst 38h			;9df3	ff 	. 
	rst 38h			;9df4	ff 	. 
	rst 38h			;9df5	ff 	. 
	rst 38h			;9df6	ff 	. 
	rst 38h			;9df7	ff 	. 
	rst 38h			;9df8	ff 	. 
	rst 38h			;9df9	ff 	. 
	rst 38h			;9dfa	ff 	. 
	rst 38h			;9dfb	ff 	. 
	rst 38h			;9dfc	ff 	. 
	rst 38h			;9dfd	ff 	. 
	rst 38h			;9dfe	ff 	. 
	rst 38h			;9dff	ff 	. 
	rst 38h			;9e00	ff 	. 
	rst 38h			;9e01	ff 	. 
	rst 38h			;9e02	ff 	. 
	rst 38h			;9e03	ff 	. 
	rst 38h			;9e04	ff 	. 
	rst 38h			;9e05	ff 	. 
	rst 38h			;9e06	ff 	. 
	rst 38h			;9e07	ff 	. 
	rst 38h			;9e08	ff 	. 
	rst 38h			;9e09	ff 	. 
	rst 38h			;9e0a	ff 	. 
	rst 38h			;9e0b	ff 	. 
	rst 38h			;9e0c	ff 	. 
	rst 38h			;9e0d	ff 	. 
	rst 38h			;9e0e	ff 	. 
	rst 38h			;9e0f	ff 	. 
	rst 38h			;9e10	ff 	. 
	rst 38h			;9e11	ff 	. 
	rst 38h			;9e12	ff 	. 
	rst 38h			;9e13	ff 	. 
	rst 38h			;9e14	ff 	. 
	rst 38h			;9e15	ff 	. 
	rst 38h			;9e16	ff 	. 
	rst 38h			;9e17	ff 	. 
	rst 38h			;9e18	ff 	. 
	rst 38h			;9e19	ff 	. 
	rst 38h			;9e1a	ff 	. 
	rst 38h			;9e1b	ff 	. 
	rst 38h			;9e1c	ff 	. 
	rst 38h			;9e1d	ff 	. 
	rst 38h			;9e1e	ff 	. 
	rst 38h			;9e1f	ff 	. 
	rst 38h			;9e20	ff 	. 
	rst 38h			;9e21	ff 	. 
	rst 38h			;9e22	ff 	. 
	rst 38h			;9e23	ff 	. 
	rst 38h			;9e24	ff 	. 
	rst 38h			;9e25	ff 	. 
	rst 38h			;9e26	ff 	. 
	rst 38h			;9e27	ff 	. 
	rst 38h			;9e28	ff 	. 
	rst 38h			;9e29	ff 	. 
	rst 38h			;9e2a	ff 	. 
	rst 38h			;9e2b	ff 	. 
	rst 38h			;9e2c	ff 	. 
	rst 38h			;9e2d	ff 	. 
	rst 38h			;9e2e	ff 	. 
	rst 38h			;9e2f	ff 	. 
	rst 38h			;9e30	ff 	. 
	rst 38h			;9e31	ff 	. 
	rst 38h			;9e32	ff 	. 
	rst 38h			;9e33	ff 	. 
	rst 38h			;9e34	ff 	. 
	rst 38h			;9e35	ff 	. 
	rst 38h			;9e36	ff 	. 
	rst 38h			;9e37	ff 	. 
	rst 38h			;9e38	ff 	. 
	rst 38h			;9e39	ff 	. 
	rst 38h			;9e3a	ff 	. 
	rst 38h			;9e3b	ff 	. 
	rst 38h			;9e3c	ff 	. 
	rst 38h			;9e3d	ff 	. 
	rst 38h			;9e3e	ff 	. 
	rst 38h			;9e3f	ff 	. 
	rst 38h			;9e40	ff 	. 
	rst 38h			;9e41	ff 	. 
	rst 38h			;9e42	ff 	. 
	rst 38h			;9e43	ff 	. 
	rst 38h			;9e44	ff 	. 
	rst 38h			;9e45	ff 	. 
	rst 38h			;9e46	ff 	. 
	rst 38h			;9e47	ff 	. 
	rst 38h			;9e48	ff 	. 
	rst 38h			;9e49	ff 	. 
	rst 38h			;9e4a	ff 	. 
	rst 38h			;9e4b	ff 	. 
	rst 38h			;9e4c	ff 	. 
	rst 38h			;9e4d	ff 	. 
	rst 38h			;9e4e	ff 	. 
	rst 38h			;9e4f	ff 	. 
	rst 38h			;9e50	ff 	. 
	rst 38h			;9e51	ff 	. 
	rst 38h			;9e52	ff 	. 
	rst 38h			;9e53	ff 	. 
	rst 38h			;9e54	ff 	. 
	rst 38h			;9e55	ff 	. 
	rst 38h			;9e56	ff 	. 
	rst 38h			;9e57	ff 	. 
	rst 38h			;9e58	ff 	. 
	rst 38h			;9e59	ff 	. 
	rst 38h			;9e5a	ff 	. 
	rst 38h			;9e5b	ff 	. 
	rst 38h			;9e5c	ff 	. 
	rst 38h			;9e5d	ff 	. 
	rst 38h			;9e5e	ff 	. 
	rst 38h			;9e5f	ff 	. 
	rst 38h			;9e60	ff 	. 
	rst 38h			;9e61	ff 	. 
	rst 38h			;9e62	ff 	. 
	rst 38h			;9e63	ff 	. 
	rst 38h			;9e64	ff 	. 
	rst 38h			;9e65	ff 	. 
	rst 38h			;9e66	ff 	. 
	rst 38h			;9e67	ff 	. 
	rst 38h			;9e68	ff 	. 
	rst 38h			;9e69	ff 	. 
	rst 38h			;9e6a	ff 	. 
	rst 38h			;9e6b	ff 	. 
	rst 38h			;9e6c	ff 	. 
	rst 38h			;9e6d	ff 	. 
	rst 38h			;9e6e	ff 	. 
	rst 38h			;9e6f	ff 	. 
	rst 38h			;9e70	ff 	. 
	rst 38h			;9e71	ff 	. 
	rst 38h			;9e72	ff 	. 
	rst 38h			;9e73	ff 	. 
	rst 38h			;9e74	ff 	. 
	rst 38h			;9e75	ff 	. 
	rst 38h			;9e76	ff 	. 
	rst 38h			;9e77	ff 	. 
	rst 38h			;9e78	ff 	. 
	rst 38h			;9e79	ff 	. 
	rst 38h			;9e7a	ff 	. 
	rst 38h			;9e7b	ff 	. 
	rst 38h			;9e7c	ff 	. 
	rst 38h			;9e7d	ff 	. 
	rst 38h			;9e7e	ff 	. 
	rst 38h			;9e7f	ff 	. 
	rst 38h			;9e80	ff 	. 
	rst 38h			;9e81	ff 	. 
	rst 38h			;9e82	ff 	. 
	rst 38h			;9e83	ff 	. 
	rst 38h			;9e84	ff 	. 
	rst 38h			;9e85	ff 	. 
	rst 38h			;9e86	ff 	. 
	rst 38h			;9e87	ff 	. 
	rst 38h			;9e88	ff 	. 
	rst 38h			;9e89	ff 	. 
	rst 38h			;9e8a	ff 	. 
	rst 38h			;9e8b	ff 	. 
	rst 38h			;9e8c	ff 	. 
	rst 38h			;9e8d	ff 	. 
	rst 38h			;9e8e	ff 	. 
	rst 38h			;9e8f	ff 	. 
	rst 38h			;9e90	ff 	. 
	rst 38h			;9e91	ff 	. 
	rst 38h			;9e92	ff 	. 
	rst 38h			;9e93	ff 	. 
	rst 38h			;9e94	ff 	. 
	rst 38h			;9e95	ff 	. 
	rst 38h			;9e96	ff 	. 
	rst 38h			;9e97	ff 	. 
	rst 38h			;9e98	ff 	. 
	rst 38h			;9e99	ff 	. 
	rst 38h			;9e9a	ff 	. 
	rst 38h			;9e9b	ff 	. 
	rst 38h			;9e9c	ff 	. 
	rst 38h			;9e9d	ff 	. 
	rst 38h			;9e9e	ff 	. 
	rst 38h			;9e9f	ff 	. 
	rst 38h			;9ea0	ff 	. 
	rst 38h			;9ea1	ff 	. 
	rst 38h			;9ea2	ff 	. 
	rst 38h			;9ea3	ff 	. 
	rst 38h			;9ea4	ff 	. 
	rst 38h			;9ea5	ff 	. 
	rst 38h			;9ea6	ff 	. 
	rst 38h			;9ea7	ff 	. 
	rst 38h			;9ea8	ff 	. 
	rst 38h			;9ea9	ff 	. 
	rst 38h			;9eaa	ff 	. 
	rst 38h			;9eab	ff 	. 
	rst 38h			;9eac	ff 	. 
	rst 38h			;9ead	ff 	. 
	rst 38h			;9eae	ff 	. 
	rst 38h			;9eaf	ff 	. 
	rst 38h			;9eb0	ff 	. 
	rst 38h			;9eb1	ff 	. 
	rst 38h			;9eb2	ff 	. 
	rst 38h			;9eb3	ff 	. 
	rst 38h			;9eb4	ff 	. 
	rst 38h			;9eb5	ff 	. 
	rst 38h			;9eb6	ff 	. 
	rst 38h			;9eb7	ff 	. 
	rst 38h			;9eb8	ff 	. 
	rst 38h			;9eb9	ff 	. 
	rst 38h			;9eba	ff 	. 
	rst 38h			;9ebb	ff 	. 
	rst 38h			;9ebc	ff 	. 
	rst 38h			;9ebd	ff 	. 
	rst 38h			;9ebe	ff 	. 
	rst 38h			;9ebf	ff 	. 
	rst 38h			;9ec0	ff 	. 
	rst 38h			;9ec1	ff 	. 
	rst 38h			;9ec2	ff 	. 
	rst 38h			;9ec3	ff 	. 
	rst 38h			;9ec4	ff 	. 
	rst 38h			;9ec5	ff 	. 
	rst 38h			;9ec6	ff 	. 
	rst 38h			;9ec7	ff 	. 
	rst 38h			;9ec8	ff 	. 
	rst 38h			;9ec9	ff 	. 
	rst 38h			;9eca	ff 	. 
	rst 38h			;9ecb	ff 	. 
	rst 38h			;9ecc	ff 	. 
	rst 38h			;9ecd	ff 	. 
	rst 38h			;9ece	ff 	. 
	rst 38h			;9ecf	ff 	. 
	rst 38h			;9ed0	ff 	. 
	rst 38h			;9ed1	ff 	. 
	rst 38h			;9ed2	ff 	. 
	rst 38h			;9ed3	ff 	. 
	rst 38h			;9ed4	ff 	. 
	rst 38h			;9ed5	ff 	. 
	rst 38h			;9ed6	ff 	. 
	rst 38h			;9ed7	ff 	. 
	rst 38h			;9ed8	ff 	. 
	rst 38h			;9ed9	ff 	. 
	rst 38h			;9eda	ff 	. 
	rst 38h			;9edb	ff 	. 
	rst 38h			;9edc	ff 	. 
	rst 38h			;9edd	ff 	. 
	rst 38h			;9ede	ff 	. 
	rst 38h			;9edf	ff 	. 
	rst 38h			;9ee0	ff 	. 
	rst 38h			;9ee1	ff 	. 
	rst 38h			;9ee2	ff 	. 
	rst 38h			;9ee3	ff 	. 
	rst 38h			;9ee4	ff 	. 
	rst 38h			;9ee5	ff 	. 
	rst 38h			;9ee6	ff 	. 
	rst 38h			;9ee7	ff 	. 
	rst 38h			;9ee8	ff 	. 
	rst 38h			;9ee9	ff 	. 
	rst 38h			;9eea	ff 	. 
	rst 38h			;9eeb	ff 	. 
	rst 38h			;9eec	ff 	. 
	rst 38h			;9eed	ff 	. 
	rst 38h			;9eee	ff 	. 
	rst 38h			;9eef	ff 	. 
	rst 38h			;9ef0	ff 	. 
	rst 38h			;9ef1	ff 	. 
	rst 38h			;9ef2	ff 	. 
	rst 38h			;9ef3	ff 	. 
	rst 38h			;9ef4	ff 	. 
	rst 38h			;9ef5	ff 	. 
	rst 38h			;9ef6	ff 	. 
	rst 38h			;9ef7	ff 	. 
	rst 38h			;9ef8	ff 	. 
	rst 38h			;9ef9	ff 	. 
	rst 38h			;9efa	ff 	. 
	rst 38h			;9efb	ff 	. 
	rst 38h			;9efc	ff 	. 
	rst 38h			;9efd	ff 	. 
	rst 38h			;9efe	ff 	. 
	rst 38h			;9eff	ff 	. 
	rst 38h			;9f00	ff 	. 
	rst 38h			;9f01	ff 	. 
	rst 38h			;9f02	ff 	. 
	rst 38h			;9f03	ff 	. 
	rst 38h			;9f04	ff 	. 
	rst 38h			;9f05	ff 	. 
	rst 38h			;9f06	ff 	. 
	rst 38h			;9f07	ff 	. 
	rst 38h			;9f08	ff 	. 
	rst 38h			;9f09	ff 	. 
	rst 38h			;9f0a	ff 	. 
	rst 38h			;9f0b	ff 	. 
	rst 38h			;9f0c	ff 	. 
	rst 38h			;9f0d	ff 	. 
	rst 38h			;9f0e	ff 	. 
	rst 38h			;9f0f	ff 	. 
	rst 38h			;9f10	ff 	. 
	rst 38h			;9f11	ff 	. 
	rst 38h			;9f12	ff 	. 
	rst 38h			;9f13	ff 	. 
	rst 38h			;9f14	ff 	. 
	rst 38h			;9f15	ff 	. 
	rst 38h			;9f16	ff 	. 
	rst 38h			;9f17	ff 	. 
	rst 38h			;9f18	ff 	. 
	rst 38h			;9f19	ff 	. 
	rst 38h			;9f1a	ff 	. 
	rst 38h			;9f1b	ff 	. 
	rst 38h			;9f1c	ff 	. 
	rst 38h			;9f1d	ff 	. 
	rst 38h			;9f1e	ff 	. 
	rst 38h			;9f1f	ff 	. 
	rst 38h			;9f20	ff 	. 
	rst 38h			;9f21	ff 	. 
	rst 38h			;9f22	ff 	. 
	rst 38h			;9f23	ff 	. 
	rst 38h			;9f24	ff 	. 
	rst 38h			;9f25	ff 	. 
	rst 38h			;9f26	ff 	. 
	rst 38h			;9f27	ff 	. 
	rst 38h			;9f28	ff 	. 
	rst 38h			;9f29	ff 	. 
	rst 38h			;9f2a	ff 	. 
	rst 38h			;9f2b	ff 	. 
	rst 38h			;9f2c	ff 	. 
	rst 38h			;9f2d	ff 	. 
	rst 38h			;9f2e	ff 	. 
	rst 38h			;9f2f	ff 	. 
	rst 38h			;9f30	ff 	. 
	rst 38h			;9f31	ff 	. 
	rst 38h			;9f32	ff 	. 
	rst 38h			;9f33	ff 	. 
	rst 38h			;9f34	ff 	. 
	rst 38h			;9f35	ff 	. 
	rst 38h			;9f36	ff 	. 
	rst 38h			;9f37	ff 	. 
	rst 38h			;9f38	ff 	. 
	rst 38h			;9f39	ff 	. 
	rst 38h			;9f3a	ff 	. 
	rst 38h			;9f3b	ff 	. 
	rst 38h			;9f3c	ff 	. 
	rst 38h			;9f3d	ff 	. 
	rst 38h			;9f3e	ff 	. 
	rst 38h			;9f3f	ff 	. 
	rst 38h			;9f40	ff 	. 
	rst 38h			;9f41	ff 	. 
	rst 38h			;9f42	ff 	. 
	rst 38h			;9f43	ff 	. 
	rst 38h			;9f44	ff 	. 
	rst 38h			;9f45	ff 	. 
	rst 38h			;9f46	ff 	. 
	rst 38h			;9f47	ff 	. 
	rst 38h			;9f48	ff 	. 
	rst 38h			;9f49	ff 	. 
	rst 38h			;9f4a	ff 	. 
	rst 38h			;9f4b	ff 	. 
	rst 38h			;9f4c	ff 	. 
	rst 38h			;9f4d	ff 	. 
	rst 38h			;9f4e	ff 	. 
	rst 38h			;9f4f	ff 	. 
	rst 38h			;9f50	ff 	. 
	rst 38h			;9f51	ff 	. 
	rst 38h			;9f52	ff 	. 
	rst 38h			;9f53	ff 	. 
	rst 38h			;9f54	ff 	. 
	rst 38h			;9f55	ff 	. 
	rst 38h			;9f56	ff 	. 
	rst 38h			;9f57	ff 	. 
	rst 38h			;9f58	ff 	. 
	rst 38h			;9f59	ff 	. 
	rst 38h			;9f5a	ff 	. 
	rst 38h			;9f5b	ff 	. 
	rst 38h			;9f5c	ff 	. 
	rst 38h			;9f5d	ff 	. 
	rst 38h			;9f5e	ff 	. 
	rst 38h			;9f5f	ff 	. 
	rst 38h			;9f60	ff 	. 
	rst 38h			;9f61	ff 	. 
	rst 38h			;9f62	ff 	. 
	rst 38h			;9f63	ff 	. 
	rst 38h			;9f64	ff 	. 
	rst 38h			;9f65	ff 	. 
	rst 38h			;9f66	ff 	. 
	rst 38h			;9f67	ff 	. 
	rst 38h			;9f68	ff 	. 
	rst 38h			;9f69	ff 	. 
	rst 38h			;9f6a	ff 	. 
	rst 38h			;9f6b	ff 	. 
	rst 38h			;9f6c	ff 	. 
	rst 38h			;9f6d	ff 	. 
	rst 38h			;9f6e	ff 	. 
	rst 38h			;9f6f	ff 	. 
	rst 38h			;9f70	ff 	. 
	rst 38h			;9f71	ff 	. 
	rst 38h			;9f72	ff 	. 
	rst 38h			;9f73	ff 	. 
	rst 38h			;9f74	ff 	. 
	rst 38h			;9f75	ff 	. 
	rst 38h			;9f76	ff 	. 
	rst 38h			;9f77	ff 	. 
	rst 38h			;9f78	ff 	. 
	rst 38h			;9f79	ff 	. 
	rst 38h			;9f7a	ff 	. 
	rst 38h			;9f7b	ff 	. 
	rst 38h			;9f7c	ff 	. 
	rst 38h			;9f7d	ff 	. 
	rst 38h			;9f7e	ff 	. 
	rst 38h			;9f7f	ff 	. 
	rst 38h			;9f80	ff 	. 
	rst 38h			;9f81	ff 	. 
	rst 38h			;9f82	ff 	. 
	rst 38h			;9f83	ff 	. 
	rst 38h			;9f84	ff 	. 
	rst 38h			;9f85	ff 	. 
	rst 38h			;9f86	ff 	. 
	rst 38h			;9f87	ff 	. 
	rst 38h			;9f88	ff 	. 
	rst 38h			;9f89	ff 	. 
	rst 38h			;9f8a	ff 	. 
	rst 38h			;9f8b	ff 	. 
	rst 38h			;9f8c	ff 	. 
	rst 38h			;9f8d	ff 	. 
	rst 38h			;9f8e	ff 	. 
	rst 38h			;9f8f	ff 	. 
	rst 38h			;9f90	ff 	. 
	rst 38h			;9f91	ff 	. 
	rst 38h			;9f92	ff 	. 
	rst 38h			;9f93	ff 	. 
	rst 38h			;9f94	ff 	. 
	rst 38h			;9f95	ff 	. 
	rst 38h			;9f96	ff 	. 
	rst 38h			;9f97	ff 	. 
	rst 38h			;9f98	ff 	. 
	rst 38h			;9f99	ff 	. 
	rst 38h			;9f9a	ff 	. 
	rst 38h			;9f9b	ff 	. 
	rst 38h			;9f9c	ff 	. 
	rst 38h			;9f9d	ff 	. 
	rst 38h			;9f9e	ff 	. 
	rst 38h			;9f9f	ff 	. 
	rst 38h			;9fa0	ff 	. 
	rst 38h			;9fa1	ff 	. 
	rst 38h			;9fa2	ff 	. 
	rst 38h			;9fa3	ff 	. 
	rst 38h			;9fa4	ff 	. 
	rst 38h			;9fa5	ff 	. 
	rst 38h			;9fa6	ff 	. 
	rst 38h			;9fa7	ff 	. 
	rst 38h			;9fa8	ff 	. 
	rst 38h			;9fa9	ff 	. 
	rst 38h			;9faa	ff 	. 
	rst 38h			;9fab	ff 	. 
	rst 38h			;9fac	ff 	. 
	rst 38h			;9fad	ff 	. 
	rst 38h			;9fae	ff 	. 
	rst 38h			;9faf	ff 	. 
	rst 38h			;9fb0	ff 	. 
	rst 38h			;9fb1	ff 	. 
	rst 38h			;9fb2	ff 	. 
	rst 38h			;9fb3	ff 	. 
	rst 38h			;9fb4	ff 	. 
	rst 38h			;9fb5	ff 	. 
	rst 38h			;9fb6	ff 	. 
	rst 38h			;9fb7	ff 	. 
	rst 38h			;9fb8	ff 	. 
	rst 38h			;9fb9	ff 	. 
	rst 38h			;9fba	ff 	. 
	rst 38h			;9fbb	ff 	. 
	rst 38h			;9fbc	ff 	. 
	rst 38h			;9fbd	ff 	. 
	rst 38h			;9fbe	ff 	. 
	rst 38h			;9fbf	ff 	. 
	rst 38h			;9fc0	ff 	. 
	rst 38h			;9fc1	ff 	. 
	rst 38h			;9fc2	ff 	. 
	rst 38h			;9fc3	ff 	. 
	rst 38h			;9fc4	ff 	. 
	rst 38h			;9fc5	ff 	. 
	rst 38h			;9fc6	ff 	. 
	rst 38h			;9fc7	ff 	. 
	rst 38h			;9fc8	ff 	. 
	rst 38h			;9fc9	ff 	. 
	rst 38h			;9fca	ff 	. 
	rst 38h			;9fcb	ff 	. 
	rst 38h			;9fcc	ff 	. 
	rst 38h			;9fcd	ff 	. 
	rst 38h			;9fce	ff 	. 
	rst 38h			;9fcf	ff 	. 
	rst 38h			;9fd0	ff 	. 
	rst 38h			;9fd1	ff 	. 
	rst 38h			;9fd2	ff 	. 
	rst 38h			;9fd3	ff 	. 
	rst 38h			;9fd4	ff 	. 
	rst 38h			;9fd5	ff 	. 
	rst 38h			;9fd6	ff 	. 
	rst 38h			;9fd7	ff 	. 
	rst 38h			;9fd8	ff 	. 
	rst 38h			;9fd9	ff 	. 
	rst 38h			;9fda	ff 	. 
	rst 38h			;9fdb	ff 	. 
	rst 38h			;9fdc	ff 	. 
	rst 38h			;9fdd	ff 	. 
	rst 38h			;9fde	ff 	. 
	rst 38h			;9fdf	ff 	. 
	rst 38h			;9fe0	ff 	. 
	rst 38h			;9fe1	ff 	. 
	rst 38h			;9fe2	ff 	. 
	rst 38h			;9fe3	ff 	. 
	rst 38h			;9fe4	ff 	. 
	rst 38h			;9fe5	ff 	. 
	rst 38h			;9fe6	ff 	. 
	rst 38h			;9fe7	ff 	. 
	rst 38h			;9fe8	ff 	. 
	rst 38h			;9fe9	ff 	. 
	rst 38h			;9fea	ff 	. 
	rst 38h			;9feb	ff 	. 
	rst 38h			;9fec	ff 	. 
	rst 38h			;9fed	ff 	. 
	rst 38h			;9fee	ff 	. 
	rst 38h			;9fef	ff 	. 
	rst 38h			;9ff0	ff 	. 
	rst 38h			;9ff1	ff 	. 
	rst 38h			;9ff2	ff 	. 
	rst 38h			;9ff3	ff 	. 
	rst 38h			;9ff4	ff 	. 
	rst 38h			;9ff5	ff 	. 
	rst 38h			;9ff6	ff 	. 
	rst 38h			;9ff7	ff 	. 
	rst 38h			;9ff8	ff 	. 
	rst 38h			;9ff9	ff 	. 
	rst 38h			;9ffa	ff 	. 
	rst 38h			;9ffb	ff 	. 
	rst 38h			;9ffc	ff 	. 
	rst 38h			;9ffd	ff 	. 
	rst 38h			;9ffe	ff 	. 
	rst 38h			;9fff	ff 	. 
