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
	.file	"fibonacci.c"
	.text
	.align	2
	.global	fib
	.syntax unified
	.arm
	.fpu vfp
	.type	fib, %function
fib:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	lsl	r3, r0, #2
	add	r3, r3, #18
	bic	r3, r3, #7
	push	{fp, lr}
	mov	r1, #0
	add	fp, sp, #4
	mov	r2, #1
	sub	sp, sp, r3
	cmp	r0, #1
	mov	lr, sp
	stm	sp, {r1, r2}
	ble	.L6
	cmp	r0, #3
	ble	.L7
	mov	ip, #3
	mov	r3, #2
.L4:
	add	r1, r1, r2
	add	r2, r2, r1
	str	r1, [lr, r3, lsl #2]
	str	r2, [lr, ip, lsl #2]
	add	ip, ip, #2
	cmp	r0, ip
	add	r3, r3, #2
	bgt	.L4
.L3:
	add	r1, lr, r3, lsl #2
	sub	r1, r1, #4
.L5:
	ldmda	r1, {r2, ip}
	add	r3, r3, #1
	cmp	r3, r0
	add	r2, r2, ip
	str	r2, [r1, #4]!
	ble	.L5
.L6:
	ldr	r0, [lr, r0, lsl #2]
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L7:
	mov	r3, #2
	b	.L3
	.size	fib, .-fib
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	mov	ip, #1
	mov	r4, #0
	add	fp, sp, #12
	sub	sp, sp, #176
	mov	lr, sp
	mov	r1, sp
	mov	r2, r4
	mov	r3, ip
	mov	r0, #2
	stm	sp, {r4, ip}
.L14:
	add	r2, r2, r3
	add	r0, r0, #2
	add	r3, r3, r2
	cmp	r0, #40
	str	r3, [r1, #12]
	str	r2, [r1, #8]
	add	r1, r1, #8
	bne	.L14
	add	r0, lr, #160
	add	r1, lr, #152
	add	ip, lr, #164
.L15:
	mov	r3, r1
	ldr	r2, [r1, #4]
	ldr	r3, [r3]
	add	r1, r1, #4
	add	r3, r2, r3
	str	r3, [r0], #4
	cmp	r0, ip
	bne	.L15
	ldr	r1, [lr, #160]
	ldr	r0, .L19
	bl	printf
	mov	r0, #0
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, pc}
.L20:
	.align	2
.L19:
	.word	.LC0
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%d\012\000"
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
