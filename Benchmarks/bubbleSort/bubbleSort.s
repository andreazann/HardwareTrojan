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
	.file	"bubbleSort.c"
	.text
	.align	2
	.global	swap
	.syntax unified
	.arm
	.fpu vfp
	.type	swap, %function
swap:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0]
	ldr	r2, [r1]
	str	r2, [r0]
	str	r3, [r1]
	bx	lr
	.size	swap, .-swap
	.align	2
	.global	bubbleSort
	.syntax unified
	.arm
	.fpu vfp
	.type	bubbleSort, %function
bubbleSort:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	lr, r1, #1
	cmp	lr, #0
	ldrle	pc, [sp], #4
	sub	r1, r1, #-1073741823
	add	ip, r0, r1, lsl #2
.L4:
	mov	r3, r0
.L6:
	ldr	r2, [r3]
	ldr	r1, [r3, #4]
	cmp	r2, r1
	stmgt	r3, {r1, r2}
	add	r3, r3, #4
	cmp	ip, r3
	bne	.L6
	subs	lr, lr, #1
	sub	ip, ip, #4
	bne	.L4
	ldr	pc, [sp], #4
	.size	bubbleSort, .-bubbleSort
	.align	2
	.global	fill_array
	.syntax unified
	.arm
	.fpu vfp
	.type	fill_array, %function
fill_array:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r1, #0
	push	{r4, r5, r6, lr}
	bne	.L14
	sub	r5, r0, #4
	add	r4, r0, #16
.L15:
	bl	rand
	str	r0, [r5, #4]!
	cmp	r5, r4
	bne	.L15
	mov	r0, #0
	pop	{r4, r5, r6, pc}
.L14:
	mov	lr, #0
	mov	ip, #1
	mov	r1, #2
	mov	r2, #3
	mov	r3, #4
	str	lr, [r0]
	str	ip, [r0, #4]
	str	r1, [r0, #8]
	str	r2, [r0, #12]
	str	r3, [r0, #16]
	mov	r0, #0
	pop	{r4, r5, r6, pc}
	.size	fill_array, .-fill_array
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #20
	bl	malloc
	mov	r6, r0
	sub	r4, r0, #4
	add	r5, r0, #16
.L21:
	bl	rand
	str	r0, [r4, #4]!
	cmp	r4, r5
	bne	.L21
	mov	r0, r6
	mov	r1, #5
	bl	bubbleSort
	mov	r0, #0
	pop	{r4, r5, r6, pc}
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
