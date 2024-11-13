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
	.file	"matrixMul.c"
	.text
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
	beq	.L2
	mov	r1, #0
	mov	r2, #1
	mov	r3, #2
	stm	r0, {r1, r2, r3}
	bx	lr
.L2:
	push	{r4, lr}
	mov	r4, r0
	bl	rand
	str	r0, [r4]
	bl	rand
	str	r0, [r4, #4]
	bl	rand
	str	r0, [r4, #8]
	pop	{r4, pc}
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
	@ link register save eliminated.
	mov	r0, #0
	bx	lr
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
