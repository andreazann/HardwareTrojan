	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"patricia_test.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Usage: %s <TCP stream>\012\000"
	.align	2
.LC1:
	.ascii	"r\000"
	.align	2
.LC2:
	.ascii	"File %s doesn't seem to exist\012\000"
	.align	2
.LC3:
	.ascii	"Allocating p-trie node\000"
	.align	2
.LC4:
	.ascii	"Allocating p-trie mask data\000"
	.align	2
.LC5:
	.ascii	"Allocating p-trie mask's node data\000"
	.align	2
.LC6:
	.ascii	"%f %d\000"
	.align	2
.LC7:
	.ascii	"%f %08x: \000"
	.align	2
.LC8:
	.ascii	"Found.\000"
	.align	2
.LC9:
	.ascii	"Failed on pat_insert\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 184
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #196
	str	r0, [fp, #-192]
	str	r1, [fp, #-196]
	mvn	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-192]
	cmp	r3, #1
	bgt	.L2
	ldr	r3, [fp, #-196]
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, .L14
	bl	printf
	mvn	r0, #0
	bl	exit
.L2:
	ldr	r3, [fp, #-196]
	add	r3, r3, #4
	ldr	r3, [r3]
	ldr	r1, .L14+4
	mov	r0, r3
	bl	fopen
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L3
	ldr	r3, [fp, #-196]
	add	r3, r3, #4
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, .L14+8
	bl	printf
	mov	r0, #0
	bl	exit
.L3:
	mov	r0, #20
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L4
	ldr	r0, .L14+12
	bl	perror
	mov	r0, #0
	bl	exit
.L4:
	mov	r1, #20
	ldr	r0, [fp, #-28]
	bl	bzero
	mov	r0, #8
	bl	malloc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L5
	ldr	r0, .L14+16
	bl	perror
	mov	r0, #0
	bl	exit
.L5:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	mov	r1, #8
	mov	r0, r3
	bl	bzero
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-32]
	mov	r0, #16
	bl	malloc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L6
	ldr	r0, .L14+20
	bl	perror
	mov	r0, #0
	bl	exit
.L6:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	mov	r1, #1
	mov	r0, r3
	bl	bzero
	ldr	r3, [fp, #-28]
	mov	r2, #1
	strb	r2, [r3, #8]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-28]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-28]
	str	r2, [r3, #12]
	b	.L7
.L13:
	sub	r3, fp, #184
	sub	r2, fp, #188
	sub	r0, fp, #164
	ldr	r1, .L14+24
	bl	__isoc99_sscanf
	mov	r0, #20
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L8
	ldr	r0, .L14+12
	bl	perror
	mov	r0, #0
	bl	exit
.L8:
	mov	r1, #20
	ldr	r0, [fp, #-16]
	bl	bzero
	mov	r0, #8
	bl	malloc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L9
	ldr	r0, .L14+16
	bl	perror
	mov	r0, #0
	bl	exit
.L9:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	mov	r1, #8
	mov	r0, r3
	bl	bzero
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-32]
	mov	r0, #16
	bl	malloc
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L10
	ldr	r0, .L14+20
	bl	perror
	mov	r0, #0
	bl	exit
.L10:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	mov	r1, #1
	mov	r0, r3
	bl	bzero
	ldr	r2, [fp, #-184]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r4, [r3, #4]
	ldr	r0, [fp, #-20]
	bl	htonl
	mov	r3, r0
	str	r3, [r4]
	ldr	r3, [fp, #-184]
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	pat_search
	str	r0, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3]
	ldr	r3, [fp, #-184]
	cmp	r2, r3
	bne	.L11
	vldr.32	s15, [fp, #-188]
	vcvt.f64.f32	d7, s15
	ldr	r3, [fp, #-184]
	str	r3, [sp]
	vmov	r2, r3, d7
	ldr	r0, .L14+28
	bl	printf
	ldr	r0, .L14+32
	bl	puts
	b	.L12
.L11:
	ldr	r1, [fp, #-28]
	ldr	r0, [fp, #-16]
	bl	pat_insert
	str	r0, [fp, #-16]
.L12:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L7
	ldr	r3, .L14+36
	ldr	r3, [r3]
	mov	r2, #21
	mov	r1, #1
	ldr	r0, .L14+40
	bl	fwrite
	mov	r0, #0
	bl	exit
.L7:
	sub	r3, fp, #164
	ldr	r2, [fp, #-24]
	mov	r1, #128
	mov	r0, r3
	bl	fgets
	mov	r3, r0
	cmp	r3, #0
	bne	.L13
	mov	r0, #1
	bl	exit
.L15:
	.align	2
.L14:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	stderr
	.word	.LC9
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
