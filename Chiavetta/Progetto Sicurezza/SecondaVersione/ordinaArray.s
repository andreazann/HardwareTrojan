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
	.file	"ordinaArray.c"
	.text
	.align	2
	.global	swap
	.syntax unified
	.arm
	.fpu vfp
	.type	swap, %function
swap:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	swap, .-swap
	.align	2
	.global	bubbleSort
	.syntax unified
	.arm
	.fpu vfp
	.type	bubbleSort, %function
bubbleSort:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L3
.L7:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L4
.L6:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	ble	.L5
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r0, r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	mov	r1, r3
	bl	swap
.L5:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	sub	r2, r3, #1
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bgt	.L6
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L3:
	ldr	r3, [fp, #-20]
	sub	r2, r3, #1
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L7
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	bubbleSort, .-bubbleSort
	.section	.rodata
	.align	2
.LC0:
	.ascii	"r\000"
	.align	2
.LC1:
	.ascii	"file does not exists %s\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 288
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24
	sub	sp, sp, #292
	str	r0, [fp, #-312]
	str	r1, [fp, #-316]
	mov	r3, sp
	mov	r8, r3
	ldr	r3, [fp, #-316]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-36]
	ldr	r1, .L14
	ldr	r0, [fp, #-36]
	bl	fopen
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L9
	ldr	r1, [fp, #-36]
	ldr	r0, .L14+4
	bl	printf
	mov	r3, #0
	b	.L10
.L9:
	sub	r3, fp, #308
	ldr	r2, [fp, #-40]
	mov	r1, #255
	mov	r0, r3
	bl	fgets
	sub	r3, fp, #308
	mov	r0, r3
	bl	atoi
	str	r0, [fp, #-44]
	ldr	r1, [fp, #-44]
	sub	r3, r1, #1
	str	r3, [fp, #-48]
	mov	r3, r1
	mov	r2, r3
	mov	r3, #0
	lsl	r7, r3, #5
	orr	r7, r7, r2, lsr #27
	lsl	r6, r2, #5
	mov	r3, r1
	mov	r2, r3
	mov	r3, #0
	lsl	r5, r3, #5
	orr	r5, r5, r2, lsr #27
	lsl	r4, r2, #5
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, #3
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	mov	r3, sp
	add	r3, r3, #3
	lsr	r3, r3, #2
	lsl	r3, r3, #2
	str	r3, [fp, #-52]
	sub	r3, fp, #308
	ldr	r2, [fp, #-40]
	mov	r1, #255
	mov	r0, r3
	bl	fgets
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L11
.L12:
	sub	r3, fp, #308
	mov	r0, r3
	bl	atoi
	mov	r1, r0
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-32]
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L11:
	sub	r3, fp, #308
	ldr	r2, [fp, #-40]
	mov	r1, #255
	mov	r0, r3
	bl	fgets
	mov	r3, r0
	cmp	r3, #0
	bne	.L12
	ldr	r3, [fp, #-52]
	ldr	r1, [fp, #-44]
	mov	r0, r3
	bl	bubbleSort
	mov	r3, #0
.L10:
	mov	sp, r8
	mov	r0, r3
	sub	sp, fp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, fp, pc}
.L15:
	.align	2
.L14:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
