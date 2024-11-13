	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"susan.c"
	.text
	.align	2
	.global	usage
	.syntax unified
	.arm
	.fpu vfp
	.type	usage, %function
usage:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r0, .L3
	bl	puts
	ldr	r0, .L3+4
	bl	puts
	ldr	r0, .L3+8
	bl	puts
	ldr	r0, .L3+12
	bl	puts
	ldr	r0, .L3+16
	bl	puts
	ldr	r0, .L3+20
	bl	puts
	ldr	r0, .L3+24
	bl	puts
	ldr	r0, .L3+28
	bl	puts
	ldr	r0, .L3+32
	bl	puts
	ldr	r0, .L3+36
	bl	puts
	ldr	r0, .L3+40
	bl	puts
	ldr	r0, .L3+44
	bl	puts
	ldr	r0, .L3+48
	bl	puts
	mov	r0, #0
	bl	exit
.L4:
	.align	2
.L3:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	.LC11
	.word	.LC12
	.size	usage, .-usage
	.align	2
	.global	getint
	.syntax unified
	.arm
	.fpu vfp
	.type	getint, %function
getint:
	@ args = 0, pretend = 0, frame = 10000
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #9984
	sub	sp, sp, #16
	mov	r5, r0
	ldr	r6, .L16
	bl	_IO_getc
	mov	r4, sp
	b	.L10
.L6:
	cmn	r0, #1
	beq	.L15
	sub	r3, r0, #48
	cmp	r3, #9
	bls	.L9
.L7:
	mov	r0, r5
	bl	_IO_getc
.L10:
	cmp	r0, #35
	bne	.L6
	mov	r2, r5
	mov	r1, r6
	mov	r0, r4
	bl	fgets
	b	.L7
.L9:
	mov	r4, #0
.L11:
	add	r4, r4, r4, lsl #2
	mov	r0, r5
	add	r4, r3, r4, lsl #1
	bl	_IO_getc
	sub	r3, r0, #48
	cmp	r3, #9
	bls	.L11
	mov	r0, r4
	add	sp, sp, #9984
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, pc}
.L15:
	ldr	r3, .L16+4
	ldr	r2, .L16+8
	ldr	r1, .L16+12
	ldr	r0, [r3]
	bl	fprintf
	mov	r0, #0
	bl	exit
.L17:
	.align	2
.L16:
	.word	9000
	.word	stderr
	.word	.LC13
	.word	.LC14
	.size	getint, .-getint
	.align	2
	.global	get_image
	.syntax unified
	.arm
	.fpu vfp
	.type	get_image, %function
get_image:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, r1
	ldr	r1, .L26
	mov	r7, r2
	mov	r6, r3
	mov	r9, r0
	bl	fopen
	subs	r4, r0, #0
	beq	.L23
	bl	fgetc
	mov	r5, r0
	mov	r0, r4
	bl	fgetc
	uxtb	r5, r5
	uxtb	r0, r0
	cmp	r0, #53
	cmpeq	r5, #80
	bne	.L24
	mov	r0, r4
	bl	getint
	str	r0, [r7]
	mov	r0, r4
	bl	getint
	str	r0, [r6]
	mov	r0, r4
	bl	getint
	ldr	r3, [r7]
	ldr	r0, [r6]
	mul	r0, r0, r3
	bl	malloc
	ldr	r2, [r7]
	ldr	ip, [r6]
	mov	r3, r4
	mov	r1, #1
	mul	r2, ip, r2
	str	r0, [r8]
	bl	fread
	subs	r5, r0, #0
	beq	.L25
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	fclose
.L24:
	ldr	r3, .L26+4
	mov	r2, r9
	ldr	r1, .L26+8
	ldr	r0, [r3]
	bl	fprintf
	mov	r0, #0
	bl	exit
.L23:
	ldr	r3, .L26+4
	mov	r2, r9
	ldr	r1, .L26+12
	ldr	r0, [r3]
	bl	fprintf
	mov	r0, r4
	bl	exit
.L25:
	ldr	r3, .L26+4
	mov	r2, r9
	ldr	r1, .L26+16
	ldr	r0, [r3]
	bl	fprintf
	mov	r0, r5
	bl	exit
.L27:
	.align	2
.L26:
	.word	.LC15
	.word	stderr
	.word	.LC17
	.word	.LC16
	.word	.LC18
	.size	get_image, .-get_image
	.align	2
	.global	put_image
	.syntax unified
	.arm
	.fpu vfp
	.type	put_image, %function
put_image:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, r1
	ldr	r1, .L34
	mov	r5, r2
	mov	r6, r3
	mov	r8, r0
	bl	fopen
	subs	r4, r0, #0
	beq	.L32
	mov	r3, r4
	mov	r2, #3
	mov	r1, #1
	ldr	r0, .L34+4
	bl	fwrite
	mov	r3, r6
	mov	r2, r5
	ldr	r1, .L34+8
	mov	r0, r4
	bl	fprintf
	mov	r3, r4
	mov	r2, #4
	mov	r1, #1
	ldr	r0, .L34+12
	bl	fwrite
	mov	r3, r4
	mul	r1, r6, r5
	mov	r0, r7
	mov	r2, #1
	bl	fwrite
	cmp	r0, #1
	bne	.L33
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, lr}
	b	fclose
.L32:
	ldr	r3, .L34+16
	mov	r2, r8
	ldr	r1, .L34+20
	ldr	r0, [r3]
	bl	fprintf
	mov	r0, r4
	bl	exit
.L33:
	ldr	r3, .L34+16
	mov	r2, r8
	ldr	r1, .L34+24
	ldr	r0, [r3]
	bl	fprintf
	mov	r0, #0
	bl	exit
.L35:
	.align	2
.L34:
	.word	.LC19
	.word	.LC21
	.word	.LC22
	.word	.LC23
	.word	stderr
	.word	.LC20
	.word	.LC24
	.size	put_image, .-put_image
	.global	__aeabi_idiv
	.align	2
	.global	int_to_uchar
	.syntax unified
	.arm
	.fpu vfp
	.type	int_to_uchar, %function
int_to_uchar:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	ldr	ip, [r0]
	ble	.L47
	push	{r4, r5, r6, r7, r8, lr}
	add	r2, r0, r2, lsl #2
	mov	r7, r0
	mov	r6, r0
	mov	r5, ip
.L38:
	ldr	r3, [r6], #4
	cmp	ip, r3
	movlt	ip, r3
	cmp	r5, r3
	movge	r5, r3
	cmp	r2, r6
	bne	.L38
	sub	r4, ip, r5
	sub	r8, r1, #1
.L40:
	ldr	r0, [r7], #4
	mov	r1, r4
	sub	r0, r0, r5
	rsb	r0, r0, r0, lsl #8
	bl	__aeabi_idiv
	cmp	r6, r7
	strb	r0, [r8, #1]!
	bne	.L40
	mov	r0, #0
	pop	{r4, r5, r6, r7, r8, pc}
.L47:
	mov	r0, #0
	bx	lr
	.size	int_to_uchar, .-int_to_uchar
	.align	2
	.global	setup_brightness_lut
	.syntax unified
	.arm
	.fpu vfp
	.type	setup_brightness_lut, %function
setup_brightness_lut:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r0
	vpush.64	{d8, d9}
	mov	r0, #516
	mov	r4, r2
	vmov	s18, r1	@ int
	bl	malloc
	cmp	r4, #6
	vldr.64	d8, .L60
	ldr	r6, .L60+8
	vcvt.f32.s32	s18, s18
	mvn	r4, #255
	add	r3, r0, #256
	add	r3, r3, #2
	str	r3, [r5]
	beq	.L56
.L54:
	vmov	s15, r4	@ int
	vcvt.f32.s32	s15, s15
	vdiv.f32	s0, s15, s18
	vnmul.f32	s0, s0, s0
	vcvt.f64.f32	d0, s0
	bl	exp
	ldr	r2, [r5]
	vmul.f64	d0, d0, d8
	vcvt.f32.f64	s0, d0
	vcvt.u32.f32	s15, s0
	vmov	r3, s15	@ int
	strb	r3, [r2, r4]
	add	r4, r4, #1
	cmp	r4, r6
	bne	.L54
.L52:
	vldm	sp!, {d8-d9}
	pop	{r4, r5, r6, pc}
.L56:
	vmov	s15, r4	@ int
	vcvt.f32.s32	s15, s15
	vdiv.f32	s0, s15, s18
	vmul.f32	s0, s0, s0
	vmul.f32	s15, s0, s0
	vnmul.f32	s0, s15, s0
	vcvt.f64.f32	d0, s0
	bl	exp
	ldr	r2, [r5]
	vmul.f64	d0, d0, d8
	vcvt.f32.f64	s0, d0
	vcvt.u32.f32	s15, s0
	vmov	r3, s15	@ int
	strb	r3, [r2, r4]
	add	r4, r4, #1
	cmp	r4, r6
	bne	.L56
	b	.L52
.L61:
	.align	3
.L60:
	.word	0
	.word	1079574528
	.word	257
	.size	setup_brightness_lut, .-setup_brightness_lut
	.align	2
	.global	susan_principle
	.syntax unified
	.arm
	.fpu vfp
	.type	susan_principle, %function
susan_principle:
	@ args = 8, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #76
	mov	r6, r1
	ldr	r5, [sp, #116]
	ldr	r1, [sp, #112]
	str	r2, [sp, #24]
	mov	r4, r0
	mul	r1, r5, r1
	mov	r0, r6
	str	r3, [sp, #28]
	lsl	r2, r1, #2
	mov	r1, #0
	bl	memset
	cmp	r5, #6
	ble	.L63
	ldr	r3, [sp, #112]
	cmp	r3, #6
	ble	.L63
	lsl	r2, r3, #1
	mov	r0, r3
	add	r3, r2, r3
	mov	r1, r3
	str	r3, [sp, #60]
	ldr	r3, [sp, #112]
	sub	r2, r2, #2
	sub	ip, r5, #3
	lsl	r3, r3, #2
	str	r3, [sp, #56]
	add	r3, r3, r0
	mov	r0, r3
	str	r3, [sp, #20]
	ldr	r3, [sp, #112]
	add	r1, r6, r1, lsl #2
	add	r3, r3, #1
	add	r10, r4, r3
	add	r3, r4, #2
	str	r3, [sp, #40]
	mov	r3, #3
	str	r3, [sp, #44]
	ldr	r3, [sp, #112]
	str	r2, [sp, #68]
	sub	r3, r3, #3
	add	r2, r0, #2
	str	ip, [sp, #52]
	str	r1, [sp, #36]
	str	r2, [sp, #64]
	str	r3, [sp, #32]
.L65:
	ldr	r3, [sp, #112]
	ldr	r2, [sp, #112]
	add	r3, r10, r3
	add	r6, r3, r2
	str	r3, [sp, #48]
	add	r5, r6, r2
	mov	r7, r3
	ldr	r2, [sp, #60]
	ldr	r3, [sp, #40]
	add	r2, r2, r3
	str	r2, [sp, #8]
	ldr	r2, [sp, #68]
	mov	r9, r3
	add	r2, r2, r3
	str	r2, [sp, #16]
	ldr	r2, [sp, #20]
	mov	ip, r9
	add	r8, r3, r2
	ldr	r2, [sp, #64]
	mov	r3, #3
	add	r2, r2, r10
	str	r2, [sp, #12]
	str	r3, [sp, #4]
.L67:
	ldr	r2, [sp, #8]
	ldrb	lr, [ip]	@ zero_extendqisi2
	ldr	r1, [sp, #24]
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	ldrb	r0, [ip, #1]!	@ zero_extendqisi2
	ldrb	fp, [r10]	@ zero_extendqisi2
	add	r3, r1, r3
	sub	lr, r3, lr
	sub	r0, r3, r0
	ldrb	r1, [ip, #1]	@ zero_extendqisi2
	str	r2, [sp, #8]
	ldrb	lr, [lr]	@ zero_extendqisi2
	ldrb	r2, [r10, #1]!	@ zero_extendqisi2
	ldrb	r4, [r0]	@ zero_extendqisi2
	sub	r1, r3, r1
	add	lr, lr, #100
	ldrb	r9, [r1]	@ zero_extendqisi2
	sub	fp, r3, fp
	add	r1, r4, lr
	ldrb	r4, [r10, #1]	@ zero_extendqisi2
	ldrb	r0, [fp]	@ zero_extendqisi2
	sub	r2, r3, r2
	sub	r4, r3, r4
	add	lr, r9, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	ldr	r9, [sp, #16]
	ldrb	r4, [r4]	@ zero_extendqisi2
	add	r0, r0, lr
	ldrb	lr, [r10, #2]	@ zero_extendqisi2
	add	r0, r2, r0
	ldrb	fp, [r7]	@ zero_extendqisi2
	sub	lr, r3, lr
	ldrb	r2, [r10, #3]	@ zero_extendqisi2
	add	r0, r4, r0
	ldrb	r4, [r9], #1	@ zero_extendqisi2
	ldrb	r1, [r7, #1]!	@ zero_extendqisi2
	ldrb	lr, [lr]	@ zero_extendqisi2
	sub	fp, r3, fp
	sub	r4, r3, r4
	sub	r2, r3, r2
	str	r9, [sp, #16]
	ldrb	r2, [r2]	@ zero_extendqisi2
	ldrb	r9, [r4]	@ zero_extendqisi2
	add	r0, lr, r0
	ldrb	r4, [fp]	@ zero_extendqisi2
	ldrb	lr, [r7, #1]	@ zero_extendqisi2
	ldrb	fp, [r7, #2]	@ zero_extendqisi2
	sub	r1, r3, r1
	sub	lr, r3, lr
	sub	fp, r3, fp
	add	r0, r2, r0
	add	r0, r9, r0
	ldrb	lr, [lr]	@ zero_extendqisi2
	add	r4, r4, r0
	ldrb	r1, [r1]	@ zero_extendqisi2
	ldrb	r2, [r7, #3]	@ zero_extendqisi2
	ldrb	fp, [fp]	@ zero_extendqisi2
	ldrb	r0, [r6, #-1]	@ zero_extendqisi2
	add	r1, r1, r4
	ldrb	r9, [r7, #4]	@ zero_extendqisi2
	sub	r0, r3, r0
	add	r1, lr, r1
	ldrb	r4, [r0]	@ zero_extendqisi2
	ldrb	lr, [r6]	@ zero_extendqisi2
	ldrb	r0, [r6, #1]!	@ zero_extendqisi2
	sub	r2, r3, r2
	sub	r9, r3, r9
	ldrb	r2, [r2]	@ zero_extendqisi2
	add	r1, fp, r1
	ldrb	fp, [r6, #2]	@ zero_extendqisi2
	ldrb	r9, [r9]	@ zero_extendqisi2
	sub	r0, r3, r0
	sub	fp, r3, fp
	add	r1, r2, r1
	sub	lr, r3, lr
	ldrb	r2, [r0]	@ zero_extendqisi2
	add	r1, r9, r1
	ldrb	r0, [r6, #3]	@ zero_extendqisi2
	add	r1, r4, r1
	ldrb	r4, [fp]	@ zero_extendqisi2
	ldrb	fp, [r6, #4]	@ zero_extendqisi2
	ldrb	lr, [lr]	@ zero_extendqisi2
	ldrb	r9, [r5, #-1]	@ zero_extendqisi2
	sub	r0, r3, r0
	sub	fp, r3, fp
	add	r1, lr, r1
	sub	r9, r3, r9
	ldrb	lr, [r0]	@ zero_extendqisi2
	add	r2, r2, r1
	ldrb	r0, [r5]	@ zero_extendqisi2
	ldrb	fp, [fp]	@ zero_extendqisi2
	ldrb	r1, [r5, #1]!	@ zero_extendqisi2
	add	r4, r4, r2
	ldrb	r2, [r9]	@ zero_extendqisi2
	add	lr, lr, r4
	add	fp, fp, lr
	add	r2, r2, fp
	ldrb	fp, [r5, #1]	@ zero_extendqisi2
	sub	r0, r3, r0
	sub	r1, r3, r1
	ldrb	r0, [r0]	@ zero_extendqisi2
	sub	fp, r3, fp
	ldrb	r1, [r1]	@ zero_extendqisi2
	ldrb	fp, [fp]	@ zero_extendqisi2
	add	r2, r0, r2
	ldrb	r0, [r5, #2]	@ zero_extendqisi2
	ldrb	r9, [r8, #-1]	@ zero_extendqisi2
	add	r1, r1, r2
	ldrb	r2, [r5, #3]	@ zero_extendqisi2
	add	r1, fp, r1
	ldrb	fp, [r5, #4]	@ zero_extendqisi2
	sub	r0, r3, r0
	ldrb	r4, [r8]	@ zero_extendqisi2
	sub	r9, r3, r9
	sub	r2, r3, r2
	ldrb	lr, [r8, #1]!	@ zero_extendqisi2
	ldrb	r0, [r0]	@ zero_extendqisi2
	sub	fp, r3, fp
	ldrb	r9, [r9]	@ zero_extendqisi2
	ldrb	r2, [r2]	@ zero_extendqisi2
	sub	r4, r3, r4
	ldrb	fp, [fp]	@ zero_extendqisi2
	add	r0, r0, r1
	sub	lr, r3, lr
	ldrb	r4, [r4]	@ zero_extendqisi2
	ldrb	r1, [r8, #1]	@ zero_extendqisi2
	add	r2, r2, r0
	ldrb	lr, [lr]	@ zero_extendqisi2
	add	r2, fp, r2
	add	r2, r9, r2
	sub	r1, r3, r1
	add	r2, r4, r2
	ldr	r4, [sp, #20]
	add	r2, lr, r2
	ldr	lr, [sp, #12]
	ldrb	r0, [r1]	@ zero_extendqisi2
	ldrb	r1, [r8, #2]	@ zero_extendqisi2
	ldrb	fp, [r10, r4]	@ zero_extendqisi2
	ldrb	r4, [lr]	@ zero_extendqisi2
	sub	r1, r3, r1
	ldrb	r9, [lr, #1]!	@ zero_extendqisi2
	sub	fp, r3, fp
	ldrb	r1, [r1]	@ zero_extendqisi2
	sub	r4, r3, r4
	ldrb	fp, [fp]	@ zero_extendqisi2
	sub	r3, r3, r9
	ldrb	r4, [r4]	@ zero_extendqisi2
	add	r2, r0, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r2, r1, r2
	add	r2, fp, r2
	add	r2, r4, r2
	add	r2, r3, r2
	ldr	r3, [sp, #28]
	str	lr, [sp, #12]
	cmp	r2, r3
	suble	r2, r3, r2
	ldrle	r1, [sp, #4]
	ldrle	r3, [sp, #36]
	strle	r2, [r3, r1, lsl #2]
	ldr	r3, [sp, #4]
	ldr	r2, [sp, #32]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [sp, #4]
	bne	.L67
	ldr	r3, [sp, #44]
	ldr	r2, [sp, #52]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [sp, #44]
	ldr	r2, [sp, #112]
	ldr	r3, [sp, #40]
	ldr	r10, [sp, #48]
	add	r3, r3, r2
	str	r3, [sp, #40]
	ldr	r2, [sp, #56]
	ldr	r3, [sp, #36]
	add	r3, r3, r2
	str	r3, [sp, #36]
	bne	.L65
.L63:
	add	sp, sp, #76
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	susan_principle, .-susan_principle
	.align	2
	.global	susan_principle_small
	.syntax unified
	.arm
	.fpu vfp
	.type	susan_principle_small, %function
susan_principle_small:
	@ args = 8, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	mov	r5, r1
	ldr	r4, [sp, #76]
	ldr	r3, [sp, #72]
	str	r2, [sp, #4]
	mov	fp, r0
	mul	r3, r4, r3
	mov	r0, r1
	mov	r1, #0
	lsl	r2, r3, #2
	bl	memset
	cmp	r4, #2
	ble	.L72
	ldr	r3, [sp, #72]
	cmp	r3, #2
	ble	.L72
	mov	r2, r3
	lsl	r3, r3, #2
	str	r3, [sp, #24]
	add	r3, r5, r3
	str	r3, [sp, #8]
	mov	r3, #1
	str	r3, [sp, #12]
	ldr	r9, .L80
	ldr	r3, [sp, #72]
	add	fp, fp, r2
	sub	r3, r3, #2
	sub	r2, r4, #1
	str	r2, [sp, #20]
	str	r3, [sp, #28]
.L74:
	ldr	r3, [sp, #72]
	ldr	r8, [sp, #8]
	add	r3, r3, fp
	str	r3, [sp, #16]
	mov	lr, r3
	ldr	r3, [sp, #72]
	mov	r7, fp
	sub	ip, fp, r3
	ldr	r3, [sp, #28]
	add	r10, r3, fp
.L76:
	ldrb	r2, [ip]	@ zero_extendqisi2
	ldrb	r3, [fp, #1]!	@ zero_extendqisi2
	ldrb	r1, [ip, #1]!	@ zero_extendqisi2
	ldr	r0, [sp, #4]
	ldrb	r5, [r7], #1	@ zero_extendqisi2
	add	r3, r0, r3
	sub	r2, r3, r2
	ldrb	r6, [ip, #1]	@ zero_extendqisi2
	sub	r1, r3, r1
	ldrb	r2, [r2]	@ zero_extendqisi2
	ldrb	r0, [r1]	@ zero_extendqisi2
	sub	r6, r3, r6
	sub	r5, r3, r5
	ldrb	r4, [lr]	@ zero_extendqisi2
	ldrb	r6, [r6]	@ zero_extendqisi2
	ldrb	r1, [lr, #1]!	@ zero_extendqisi2
	add	r2, r2, #100
	ldrb	r5, [r5]	@ zero_extendqisi2
	add	r2, r0, r2
	ldrb	r0, [r7, #1]	@ zero_extendqisi2
	add	r2, r6, r2
	add	r2, r5, r2
	sub	r0, r3, r0
	ldrb	r5, [lr, #1]	@ zero_extendqisi2
	sub	r4, r3, r4
	sub	r1, r3, r1
	ldrb	r0, [r0]	@ zero_extendqisi2
	ldrb	r4, [r4]	@ zero_extendqisi2
	sub	r3, r3, r5
	ldrb	r1, [r1]	@ zero_extendqisi2
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r2, r0, r2
	add	r4, r4, r2
	add	r1, r1, r4
	add	r1, r3, r1
	cmp	r1, r9
	sub	r1, r9, r1
	strle	r1, [r8, #4]
	cmp	r10, fp
	add	r8, r8, #4
	bne	.L76
	ldr	r3, [sp, #12]
	ldr	r2, [sp, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [sp, #12]
	ldr	r2, [sp, #24]
	ldr	r3, [sp, #8]
	ldr	fp, [sp, #16]
	add	r3, r3, r2
	str	r3, [sp, #8]
	bne	.L74
.L72:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L81:
	.align	2
.L80:
	.word	730
	.size	susan_principle_small, .-susan_principle_small
	.align	2
	.global	median
	.syntax unified
	.arm
	.fpu vfp
	.type	median, %function
median:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r1, r1, #1
	push	{r4, r5, r6, r7, r8, lr}
	mul	r1, r3, r1
	add	ip, r3, r1
	add	r3, r3, ip
	add	r3, r3, r2
	add	ip, r2, ip
	add	r2, r1, r2
	add	r8, r0, r2
	add	r1, r0, ip
	add	ip, r0, r3
	ldrb	r5, [r0, r3]	@ zero_extendqisi2
	ldrb	r4, [ip, #-1]	@ zero_extendqisi2
	ldrb	r7, [ip, #1]	@ zero_extendqisi2
	ldrb	lr, [r1, #-1]	@ zero_extendqisi2
	ldrb	ip, [r0, r2]	@ zero_extendqisi2
	ldrb	r1, [r1, #1]	@ zero_extendqisi2
	ldrb	r6, [r8, #-1]	@ zero_extendqisi2
	ldrb	r0, [r8, #1]	@ zero_extendqisi2
	mov	r2, #7
.L83:
	cmp	ip, r6
	movlt	r3, r6
	movge	r3, ip
	movlt	r6, ip
	cmp	r2, #1
	beq	.L93
	cmp	r3, r0
	movle	ip, r3
	movgt	ip, r0
	movle	r3, r0
	cmp	r2, #2
	beq	.L95
	cmp	r3, lr
	movle	r0, r3
	movgt	r0, lr
	movle	r3, lr
	cmp	r2, #3
	beq	.L97
	cmp	r3, r1
	movle	lr, r3
	movgt	lr, r1
	movle	r3, r1
	cmp	r2, #4
	beq	.L99
	cmp	r3, r4
	movle	r1, r3
	movgt	r1, r4
	movle	r3, r4
	cmp	r2, #5
	beq	.L101
	cmp	r3, r5
	movle	r4, r3
	movgt	r4, r5
	movle	r3, r5
	cmp	r2, #7
	bne	.L107
	cmp	r7, r3
	movlt	r5, r7
	movlt	r7, r3
	blt	.L86
.L107:
	mov	r5, r3
.L86:
	subs	r2, r2, #1
	bne	.L83
	add	r1, r1, lr
	asr	r0, r1, #1
	uxtb	r0, r0
	pop	{r4, r5, r6, r7, r8, pc}
.L93:
	mov	ip, r3
	b	.L86
.L101:
	mov	r4, r3
	b	.L86
.L99:
	mov	r1, r3
	b	.L86
.L97:
	mov	lr, r3
	b	.L86
.L95:
	mov	r0, r3
	b	.L86
	.size	median, .-median
	.align	2
	.global	enlarge
	.syntax unified
	.arm
	.fpu vfp
	.type	enlarge, %function
enlarge:
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, r3
	ldr	fp, [sp, #40]
	ldr	r3, [r3]
	mov	r9, r0
	cmp	r3, #0
	mov	r4, r1
	mov	r7, r2
	lsl	r5, fp, #1
	movgt	r6, #0
	ble	.L113
.L112:
	ldr	r2, [r7]
	add	r3, r6, fp
	add	r0, r2, r5
	ldr	r1, [r9]
	mla	r0, r3, r0, fp
	mla	r1, r6, r2, r1
	add	r0, r4, r0
	bl	memcpy
	ldr	r3, [r8]
	add	r6, r6, #1
	cmp	r3, r6
	bgt	.L112
.L113:
	cmp	fp, #0
	movgt	r6, #0
	subgt	r10, fp, #1
	ble	.L111
.L114:
	ldr	r2, [r7]
	sub	r0, r10, r6
	add	r3, r2, r5
	ldr	r1, [r9]
	mla	r0, r3, r0, fp
	mla	r1, r6, r2, r1
	add	r0, r4, r0
	bl	memcpy
	ldr	r1, [r8]
	ldr	r2, [r7]
	add	r0, fp, r1
	add	r3, r2, r5
	add	r0, r0, r6
	sub	r1, r1, r6
	mla	r0, r3, r0, fp
	sub	r1, r1, #1
	ldr	r3, [r9]
	add	r6, r6, #1
	add	r0, r4, r0
	mla	r1, r2, r1, r3
	bl	memcpy
	cmp	fp, r6
	bne	.L114
	ldr	r3, [r8]
	mov	r0, #0
	add	r3, r3, r5
.L115:
	cmp	r3, #0
	movgt	r1, #0
	ble	.L118
.L116:
	ldr	r2, [r7]
	add	r2, r5, r2
	mla	r2, r1, r2, r6
	add	r3, r4, r2
	sub	r2, r2, #1
	ldrb	r3, [r3, r0]	@ zero_extendqisi2
	sub	r2, r2, r0
	strb	r3, [r4, r2]
	ldr	r2, [r7]
	add	r3, r2, r5
	mla	r3, r1, r3, r2
	add	r1, r1, #1
	add	r3, r3, r6
	sub	r2, r3, #1
	sub	r2, r2, r0
	add	r3, r4, r3
	ldrb	r2, [r4, r2]	@ zero_extendqisi2
	strb	r2, [r3, r0]
	ldr	r3, [r8]
	add	r3, r3, r5
	cmp	r3, r1
	bgt	.L116
.L118:
	add	r0, r0, #1
	cmp	r6, r0
	bne	.L115
.L111:
	ldr	r3, [r7]
	add	r3, r3, r5
	str	r3, [r7]
	ldr	r3, [r8]
	add	r5, r3, r5
	str	r5, [r8]
	str	r4, [r9]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, pc}
	.size	enlarge, .-enlarge
	.align	2
	.global	susan_smoothing
	.syntax unified
	.arm
	.fpu vfp
	.type	susan_smoothing, %function
susan_smoothing:
	@ args = 4, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	vpush.64	{d8, d9}
	vcvt.f32.f64	s16, d0
	cmp	r0, #0
	mov	r4, r1
	vldreq.64	d6, .L164
	sub	sp, sp, #76
	str	r3, [sp, #60]
	movne	r3, #1
	vcvteq.f64.f32	d7, s16
	str	r0, [sp, #44]
	str	r1, [sp, #68]
	str	r2, [sp, #64]
	ldr	r5, [sp, #128]
	vmuleq.f64	d7, d7, d6
	vcvteq.s32.f64	s14, d7
	vldr.32	s15, .L164+8
	vcmpe.f32	s16, s15
	vmoveq	r3, s14	@ int
	addeq	r3, r3, #1
	vmrs	APSR_nzcv, FPSCR
	str	r3, [sp, #20]
	bgt	.L161
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #64]
	lsl	r6, r3, #1
	cmp	r6, r2
	ldr	r3, [sp, #60]
	bge	.L128
	cmp	r6, r3
	bge	.L128
	add	r2, r6, r2
	add	r3, r6, r3
	mul	r0, r3, r2
	bl	malloc
	ldr	r3, [sp, #20]
	add	r2, sp, #64
	str	r3, [sp]
	add	r3, sp, #60
	mov	r1, r0
	add	r0, sp, #68
	bl	enlarge
	ldr	r3, [sp, #44]
	cmp	r3, #0
	beq	.L130
	ldr	r3, [sp, #60]
	cmp	r3, #2
	ble	.L123
	ldr	lr, [sp, #64]
	mov	r7, r4
	mov	ip, lr
	mov	r2, #1
	str	r2, [sp, #16]
	str	r5, [sp, #128]
.L132:
	cmp	ip, #2
	ble	.L148
	ldr	r3, [sp, #16]
	add	r6, r7, #1
	sub	r3, r3, #1
	str	r3, [sp, #52]
	mov	r4, #1
	b	.L149
.L163:
	mov	r2, r4
	mov	r3, ip
	ldr	r1, [sp, #16]
	bl	median
	add	r4, r4, #1
	mov	r7, r6
.L159:
	strb	r0, [r6, #-1]
	ldr	ip, [sp, #64]
	add	r6, r6, #1
	sub	r3, ip, #1
	cmp	r3, r4
	ble	.L162
.L149:
	ldr	r2, [sp, #16]
	ldr	r0, [sp, #68]
	ldr	lr, [sp, #52]
	mla	r2, ip, r2, r0
	sub	r3, r4, #1
	mla	r3, lr, ip, r3
	ldrb	r2, [r2, r4]	@ zero_extendqisi2
	sub	r5, ip, #2
	ldr	r10, [sp, #128]
	mov	lr, r2
	str	r2, [sp, #20]
	add	r2, r0, r3
	ldrb	r3, [r0, r3]	@ zero_extendqisi2
	add	r1, r2, #2
	mov	r7, r3
	str	r3, [sp, #24]
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	mov	r8, r3
	str	r3, [sp, #28]
	ldrb	r3, [r2, #2]	@ zero_extendqisi2
	add	r2, r1, r5
	mov	r9, r3
	str	r3, [sp, #32]
	add	r3, r10, lr
	ldrb	lr, [r1, r5]	@ zero_extendqisi2
	sub	r1, r3, r8
	add	r8, r2, #2
	mov	r10, lr
	str	lr, [sp, #36]
	sub	lr, r3, r7
	ldrb	r7, [r2, #1]	@ zero_extendqisi2
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	ldrb	lr, [lr]	@ zero_extendqisi2
	mov	fp, r7
	str	r7, [sp, #40]
	str	r2, [sp, #44]
	sub	r7, r3, r9
	mov	r9, r2
	add	r2, r8, r5
	str	lr, [sp, #8]
	sub	lr, r3, r10
	ldrb	r10, [r2, #1]	@ zero_extendqisi2
	ldrb	r2, [r2, #2]	@ zero_extendqisi2
	ldrb	r8, [r8, r5]	@ zero_extendqisi2
	str	r10, [sp, #12]
	sub	r5, r3, fp
	ldrb	r10, [lr]	@ zero_extendqisi2
	ldrb	r1, [r1]	@ zero_extendqisi2
	sub	lr, r3, r9
	ldrb	r7, [r7]	@ zero_extendqisi2
	mov	fp, r2
	ldr	r2, [sp, #8]
	ldrb	r9, [r5]	@ zero_extendqisi2
	str	r8, [sp, #48]
	sub	r5, r3, r8
	ldrb	r8, [lr]	@ zero_extendqisi2
	ldr	lr, [sp, #12]
	add	r2, r2, r1
	sub	lr, r3, lr
	add	r2, r7, r2
	ldrb	r5, [r5]	@ zero_extendqisi2
	add	r2, r10, r2
	sub	r3, r3, fp
	add	r2, r9, r2
	ldrb	lr, [lr]	@ zero_extendqisi2
	add	r2, r8, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r2, r5, r2
	add	r2, lr, r2
	add	r2, r3, r2
	subs	r2, r2, #100
	beq	.L163
	ldrh	r0, [sp, #28]
	ldr	ip, [sp, #8]
	add	r4, r4, #1
	smulbb	r0, r0, r1
	mov	r1, r2
	ldr	r2, [sp, #24]
	mla	r0, r2, ip, r0
	ldr	r2, [sp, #32]
	mla	r0, r2, r7, r0
	ldr	r2, [sp, #36]
	mov	r7, r6
	mla	r0, r2, r10, r0
	ldr	r2, [sp, #40]
	mla	r0, r2, r9, r0
	ldr	r2, [sp, #44]
	mla	r0, r2, r8, r0
	ldr	r2, [sp, #48]
	mla	r5, r2, r5, r0
	ldr	r2, [sp, #12]
	mvn	r0, #99
	mla	lr, r2, lr, r5
	ldr	r2, [sp, #20]
	mla	r3, fp, r3, lr
	mla	r0, r0, r2, r3
	bl	__aeabi_idiv
	b	.L159
.L162:
	ldr	r3, [sp, #60]
.L148:
	ldr	r2, [sp, #16]
	add	r2, r2, #1
	mov	r1, r2
	str	r2, [sp, #16]
	sub	r2, r3, #1
	cmp	r2, r1
	bgt	.L132
.L123:
	add	sp, sp, #76
	@ sp needed
	vldm	sp!, {d8-d9}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L165:
	.align	3
.L164:
	.word	0
	.word	1073217536
	.word	1097859072
.L130:
	add	r3, r6, #1
	ldr	r7, [sp, #20]
	ldr	r2, [sp, #64]
	rsb	r1, r7, #0
	mul	r0, r3, r3
	mov	r6, r1
	str	r1, [sp, #40]
	sub	r10, r2, r3
	bl	malloc
	cmp	r7, r6
	vnmul.f32	s16, s16, s16
	str	r0, [sp, #48]
	blt	.L134
	vldr.64	d9, .L166
	ldr	r7, [sp, #40]
	ldr	r8, [sp, #20]
	mov	r9, r0
.L136:
	mul	fp, r7, r7
	ldr	r6, [sp, #40]
.L135:
	mla	r3, r6, r6, fp
	add	r6, r6, #1
	vmov	s15, r3	@ int
	vcvt.f32.s32	s15, s15
	vdiv.f32	s0, s15, s16
	vcvt.f64.f32	d0, s0
	bl	exp
	cmp	r8, r6
	vmul.f64	d0, d0, d9
	vcvt.s32.f64	s15, d0
	vmov	r3, s15	@ int
	strb	r3, [r9], #1
	bge	.L135
	add	r7, r7, #1
	cmp	r8, r7
	bge	.L136
.L134:
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #60]
	sub	r2, r2, r3
	cmp	r3, r2
	bge	.L123
	add	r1, r3, #1
	add	r6, r3, r1
	ldr	r0, [sp, #64]
	str	r1, [sp, #8]
	add	r1, r10, r6
	str	r1, [sp, #12]
	mov	r1, r3
	sub	r3, r0, r3
	str	r0, [sp, #28]
	str	r1, [sp, #32]
	str	r6, [sp, #56]
.L137:
	ldr	r1, [sp, #20]
	cmp	r1, r3
	bge	.L144
	add	r3, r4, #1
	str	r3, [sp, #24]
	ldr	r6, [sp, #56]
	ldr	r3, [sp, #32]
	str	r1, [sp, #16]
	sub	r3, r3, r1
	str	r3, [sp, #52]
.L143:
	ldr	lr, [sp, #32]
	ldr	ip, [sp, #28]
	ldr	r3, [sp, #68]
	ldr	r0, [sp, #40]
	str	r3, [sp, #36]
	mov	r2, r3
	mla	r3, ip, lr, r3
	ldr	lr, [sp, #16]
	cmp	r1, r0
	sub	r9, lr, r1
	ldr	r1, [sp, #52]
	ldrb	r8, [r3, lr]	@ zero_extendqisi2
	mla	r9, r1, ip, r9
	blt	.L151
	ldr	r4, [sp, #44]
	sub	r9, r9, #1
	ldr	r10, [sp, #48]
	mov	fp, r0
	add	r9, r2, r9
	mov	r0, r4
.L139:
	add	r7, r6, r9
	mov	r1, r9
	mov	lr, r10
.L140:
	ldrb	r2, [r1, #1]!	@ zero_extendqisi2
	ldrb	ip, [lr], #1	@ zero_extendqisi2
	sub	r3, r8, r2
	cmp	r7, r1
	ldrb	r3, [r5, r3]	@ zero_extendqisi2
	smulbb	r3, r3, ip
	add	r4, r4, r3
	mla	r0, r3, r2, r0
	bne	.L140
	ldr	r3, [sp, #8]
	add	fp, fp, #1
	cmp	fp, r3
	ldr	r3, [sp, #12]
	add	r10, r10, r6
	add	r9, r9, r3
	bne	.L139
	sub	r4, r4, #9984
	subs	r1, r4, #16
	bne	.L138
	ldr	r3, [sp, #28]
	ldr	r0, [sp, #36]
	ldr	r2, [sp, #16]
	ldr	r1, [sp, #32]
	bl	median
	ldr	r3, [sp, #24]
	mov	r4, r3
	strb	r0, [r3, #-1]
.L142:
	ldr	r3, [sp, #64]
	ldr	r2, [sp, #16]
	ldr	r1, [sp, #20]
	add	r2, r2, #1
	str	r3, [sp, #28]
	sub	r3, r3, r1
	str	r2, [sp, #16]
	cmp	r3, r2
	ldr	r2, [sp, #24]
	add	r2, r2, #1
	str	r2, [sp, #24]
	bgt	.L143
	ldr	r2, [sp, #60]
	sub	r2, r2, r1
.L144:
	ldr	r1, [sp, #32]
	add	r1, r1, #1
	cmp	r2, r1
	str	r1, [sp, #32]
	bgt	.L137
	add	sp, sp, #76
	@ sp needed
	vldm	sp!, {d8-d9}
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L151:
	ldr	r0, [sp, #44]
	ldr	r1, .L166+8
.L138:
	ldr	r3, .L166+8
	mla	r0, r3, r8, r0
	bl	__aeabi_idiv
	ldr	r3, [sp, #24]
	mov	r4, r3
	strb	r0, [r3, #-1]
	b	.L142
.L161:
	vcvt.f64.f32	d7, s16
	ldr	r0, .L166+12
	vmov	r2, r3, d7
	bl	printf
	ldr	r0, .L166+16
	bl	puts
	ldr	r0, .L166+20
	bl	puts
	mov	r0, #0
	bl	exit
.L128:
	ldr	r1, [sp, #20]
	ldr	r0, .L166+24
	bl	printf
	mov	r0, #0
	bl	exit
.L167:
	.align	3
.L166:
	.word	0
	.word	1079574528
	.word	-10000
	.word	.LC25
	.word	.LC26
	.word	.LC27
	.word	.LC28
	.size	susan_smoothing, .-susan_smoothing
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #28
	add	r3, sp, #20
	add	r2, sp, #16
	add	r1, sp, #8
	ldr	r0, .L170+8
	bl	get_image
	add	r0, sp, #12
	mov	r2, #2
	mov	r1, #20
	bl	setup_brightness_lut
	ldr	r0, [sp, #12]
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #16]
	ldr	r1, [sp, #8]
	str	r0, [sp]
	vldr.64	d0, .L170
	mov	r0, #0
	bl	susan_smoothing
	ldr	r3, [sp, #20]
	ldr	r2, [sp, #16]
	ldr	r1, [sp, #8]
	ldr	r0, .L170+12
	bl	put_image
	mov	r0, #0
	add	sp, sp, #28
	@ sp needed
	ldr	pc, [sp], #4
.L171:
	.align	3
.L170:
	.word	0
	.word	1074790400
	.word	.LC29
	.word	.LC30
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Usage: susan <in.pgm> <out.pgm> [options]\012\000"
	.space	1
.LC1:
	.ascii	"-s : Smoothing mode (default)\000"
	.space	2
.LC2:
	.ascii	"-e : Edges mode\000"
.LC3:
	.ascii	"-c : Corners mode\012\000"
	.space	1
.LC4:
	.ascii	"See source code for more information about setting "
	.ascii	"the thresholds\000"
	.space	2
.LC5:
	.ascii	"-t <thresh> : Brightness threshold, all modes (defa"
	.ascii	"ult=20)\000"
	.space	1
.LC6:
	.ascii	"-d <thresh> : Distance threshold, smoothing mode, ("
	.ascii	"default=4) (use next option instead for flat 3x3 ma"
	.ascii	"sk)\000"
	.space	2
.LC7:
	.ascii	"-3 : Use flat 3x3 mask, edges or smoothing mode\000"
.LC8:
	.ascii	"-n : No post-processing on the binary edge map (run"
	.ascii	"s much faster); edges mode\000"
	.space	2
.LC9:
	.ascii	"-q : Use faster (and usually stabler) corner mode; "
	.ascii	"edge-like corner suppression not carried out; corne"
	.ascii	"rs mode\000"
	.space	2
.LC10:
	.ascii	"-b : Mark corners/edges with single black points in"
	.ascii	"stead of black with white border; corners or edges "
	.ascii	"mode\000"
	.space	1
.LC11:
	.ascii	"-p : Output initial enhancement image only; corners"
	.ascii	" or edges mode (default is edges mode)\000"
	.space	2
.LC12:
	.ascii	"\012SUSAN Version 2l (C) 1995-1997 Stephen Smith, D"
	.ascii	"RA UK. steve@fmrib.ox.ac.uk\000"
.LC13:
	.ascii	"is\000"
	.space	1
.LC14:
	.ascii	"Image %s not binary PGM.\012\000"
	.space	2
.LC15:
	.ascii	"r\000"
	.space	2
.LC16:
	.ascii	"Can't input image %s.\012\000"
	.space	1
.LC17:
	.ascii	"Image %s does not have binary PGM header.\012\000"
	.space	1
.LC18:
	.ascii	"Image %s is wrong size.\012\000"
	.space	3
.LC19:
	.ascii	"w\000"
	.space	2
.LC20:
	.ascii	"Can't output image%s.\012\000"
	.space	1
.LC21:
	.ascii	"P5\012\000"
.LC22:
	.ascii	"%d %d\012\000"
	.space	1
.LC23:
	.ascii	"255\012\000"
	.space	3
.LC24:
	.ascii	"Can't write image %s.\012\000"
	.space	1
.LC25:
	.ascii	"Distance_thresh (%f) too big for integer arithmetic"
	.ascii	".\012\000"
	.space	2
.LC26:
	.ascii	"Either reduce it to <=15 or recompile with variable"
	.ascii	" \"total\"\000"
.LC27:
	.ascii	"as a float: see top \"defines\" section.\000"
	.space	1
.LC28:
	.ascii	"Mask size (1.5*distance_thresh+1=%d) too big for im"
	.ascii	"age (%dx%d).\012\000"
	.space	3
.LC29:
	.ascii	"input_small.pgm\000"
.LC30:
	.ascii	"output_small\000"
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
