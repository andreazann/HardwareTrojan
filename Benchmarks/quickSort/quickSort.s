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
	.file	"quickSort.c"
	.text
	.align	2
	.global	print_array
	.syntax unified
	.arm
	.fpu vfp
	.type	print_array, %function
print_array:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, r0
	ldr	r0, .L6
	bl	printf
	ldr	r6, .L6+4
	sub	r4, r7, #4
	add	r5, r7, #12
.L2:
	ldr	r1, [r4, #4]!
	mov	r0, r6
	bl	printf
	cmp	r5, r4
	bne	.L2
	ldr	r1, [r7, #16]
	ldr	r0, .L6+8
	pop	{r4, r5, r6, r7, r8, lr}
	b	printf
.L7:
	.align	2
.L6:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	print_array, .-print_array
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
	.global	quicksort
	.syntax unified
	.arm
	.fpu vfp
	.type	quicksort, %function
quicksort:
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, r0
	sub	sp, sp, #60
	mov	r6, r1
	str	r2, [sp, #24]
.L17:
	ldr	r1, [sp, #24]
	ldr	r2, [r10, r6, lsl #2]
	mov	r0, r1
	mov	r1, r6
.L10:
	cmp	r1, r0
	bgt	.L14
	ldr	ip, [r10, r1, lsl #2]
	lsl	r3, r1, #2
	cmp	r2, ip
	add	r4, r10, r3
	ble	.L15
	add	r3, r3, #4
	add	r3, r10, r3
.L11:
	mov	r4, r3
	ldr	ip, [r3], #4
	add	r1, r1, #1
	cmp	r2, ip
	bgt	.L11
.L15:
	ldr	lr, [r10, r0, lsl #2]
	lsl	r3, r0, #2
	cmp	lr, r2
	add	r5, r10, r3
	ble	.L12
	sub	r3, r3, #4
	add	r3, r10, r3
.L13:
	mov	r5, r3
	ldr	lr, [r3], #-4
	sub	r0, r0, #1
	cmp	r2, lr
	blt	.L13
.L12:
	cmp	r1, r0
	ble	.L129
.L14:
	cmp	r6, r0
	str	r1, [sp, #32]
	str	r0, [sp, #4]
	blt	.L26
.L27:
	ldr	r3, [sp, #32]
	ldr	r2, [sp, #24]
	mov	r6, r3
	cmp	r2, r3
	bgt	.L17
	add	sp, sp, #60
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L24:
	ldr	lr, [r10, r1, lsl #2]
	lsl	r3, r1, #2
	cmp	r2, lr
	add	r5, r10, r3
	bge	.L21
	sub	r3, r3, #4
	add	r3, r10, r3
.L22:
	mov	r5, r3
	ldr	lr, [r3], #-4
	sub	r1, r1, #1
	cmp	r2, lr
	blt	.L22
.L21:
	cmp	r1, r0
	bge	.L130
.L23:
	cmp	r6, r1
	str	r1, [sp, #8]
	str	r0, [sp, #36]
	blt	.L35
.L36:
	ldr	r3, [sp, #36]
	ldr	r2, [sp, #4]
	mov	r6, r3
	cmp	r2, r3
	ble	.L27
.L26:
	ldr	r2, [r10, r6, lsl #2]
	ldr	r1, [sp, #4]
	mov	r0, r6
.L19:
	cmp	r0, r1
	bgt	.L23
	ldr	ip, [r10, r0, lsl #2]
	lsl	r3, r0, #2
	cmp	r2, ip
	add	r4, r10, r3
	ble	.L24
	add	r3, r3, #4
	add	r3, r10, r3
.L20:
	mov	r4, r3
	ldr	ip, [r3], #4
	add	r0, r0, #1
	cmp	r2, ip
	bgt	.L20
	b	.L24
.L129:
	str	lr, [r4]
	add	r1, r1, #1
	sub	r0, r0, #1
	str	ip, [r5]
	b	.L10
.L33:
	ldr	lr, [r10, r0, lsl #2]
	lsl	r3, r0, #2
	cmp	r2, lr
	add	r5, r10, r3
	bge	.L30
	sub	r3, r3, #4
	add	r3, r10, r3
.L31:
	mov	r5, r3
	ldr	lr, [r3], #-4
	sub	r0, r0, #1
	cmp	r2, lr
	blt	.L31
.L30:
	cmp	r0, r1
	bge	.L131
.L32:
	cmp	r6, r0
	str	r1, [sp, #40]
	str	r0, [sp, #12]
	blt	.L44
.L45:
	ldr	r3, [sp, #40]
	ldr	r2, [sp, #8]
	mov	r6, r3
	cmp	r3, r2
	bge	.L36
.L35:
	ldr	r1, [sp, #8]
	ldr	r2, [r10, r6, lsl #2]
	mov	r0, r1
	mov	r1, r6
.L28:
	cmp	r1, r0
	bgt	.L32
	ldr	ip, [r10, r1, lsl #2]
	lsl	r3, r1, #2
	cmp	r2, ip
	add	r4, r10, r3
	ble	.L33
	add	r3, r3, #4
	add	r3, r10, r3
.L29:
	mov	r4, r3
	ldr	ip, [r3], #4
	add	r1, r1, #1
	cmp	r2, ip
	bgt	.L29
	b	.L33
.L130:
	str	lr, [r4]
	add	r0, r0, #1
	sub	r1, r1, #1
	str	ip, [r5]
	b	.L19
.L131:
	str	lr, [r4]
	add	r1, r1, #1
	sub	r0, r0, #1
	str	ip, [r5]
	b	.L28
.L42:
	ldr	lr, [r10, r0, lsl #2]
	lsl	r3, r0, #2
	cmp	r2, lr
	add	r5, r10, r3
	bge	.L39
	sub	r3, r3, #4
	add	r3, r10, r3
.L40:
	mov	r5, r3
	ldr	lr, [r3], #-4
	sub	r0, r0, #1
	cmp	r2, lr
	blt	.L40
.L39:
	cmp	r0, r1
	bge	.L132
.L41:
	cmp	r6, r0
	str	r1, [sp, #44]
	str	r0, [sp, #16]
	blt	.L53
.L54:
	ldr	r3, [sp, #44]
	ldr	r2, [sp, #12]
	mov	r6, r3
	cmp	r3, r2
	bge	.L45
.L44:
	ldr	r1, [sp, #12]
	ldr	r2, [r10, r6, lsl #2]
	mov	r0, r1
	mov	r1, r6
.L37:
	cmp	r1, r0
	bgt	.L41
	ldr	ip, [r10, r1, lsl #2]
	lsl	r3, r1, #2
	cmp	r2, ip
	add	r4, r10, r3
	ble	.L42
	add	r3, r3, #4
	add	r3, r10, r3
.L38:
	mov	r4, r3
	ldr	ip, [r3], #4
	add	r1, r1, #1
	cmp	r2, ip
	bgt	.L38
	b	.L42
.L132:
	str	lr, [r4]
	add	r1, r1, #1
	sub	r0, r0, #1
	str	ip, [r5]
	b	.L37
.L51:
	ldr	lr, [r10, r0, lsl #2]
	lsl	r3, r0, #2
	cmp	r2, lr
	add	r5, r10, r3
	bge	.L48
	sub	r3, r3, #4
	add	r3, r10, r3
.L49:
	mov	r5, r3
	ldr	lr, [r3], #-4
	sub	r0, r0, #1
	cmp	r2, lr
	blt	.L49
.L48:
	cmp	r1, r0
	ble	.L133
.L50:
	cmp	r6, r0
	str	r1, [sp, #48]
	str	r0, [sp, #20]
	blt	.L62
.L63:
	ldr	r3, [sp, #48]
	ldr	r2, [sp, #16]
	mov	r6, r3
	cmp	r3, r2
	bge	.L54
.L53:
	ldr	r1, [sp, #16]
	ldr	r2, [r10, r6, lsl #2]
	mov	r0, r1
	mov	r1, r6
.L46:
	cmp	r1, r0
	bgt	.L50
	ldr	ip, [r10, r1, lsl #2]
	lsl	r3, r1, #2
	cmp	r2, ip
	add	r4, r10, r3
	ble	.L51
	add	r3, r3, #4
	add	r3, r10, r3
.L47:
	mov	r4, r3
	ldr	ip, [r3], #4
	add	r1, r1, #1
	cmp	r2, ip
	bgt	.L47
	b	.L51
.L60:
	ldr	r0, [r10, r9, lsl #2]
	lsl	r3, r9, #2
	cmp	r1, r0
	add	lr, r10, r3
	bge	.L57
	sub	r3, r3, #4
	add	r3, r10, r3
.L58:
	mov	lr, r3
	ldr	r0, [r3], #-4
	sub	r9, r9, #1
	cmp	r1, r0
	blt	.L58
.L57:
	cmp	r9, r2
	bge	.L134
.L59:
	cmp	r6, r9
	str	r2, [sp, #52]
	blt	.L124
.L72:
	ldr	r3, [sp, #52]
	ldr	r2, [sp, #20]
	mov	r6, r3
	cmp	r2, r3
	ble	.L63
.L62:
	ldr	r1, [r10, r6, lsl #2]
	ldr	r9, [sp, #20]
	mov	r2, r6
.L55:
	cmp	r2, r9
	bgt	.L59
	ldr	ip, [r10, r2, lsl #2]
	lsl	r3, r2, #2
	cmp	r1, ip
	add	r4, r10, r3
	ble	.L60
	add	r3, r3, #4
	add	r3, r10, r3
.L56:
	mov	r4, r3
	ldr	ip, [r3], #4
	add	r2, r2, #1
	cmp	r1, ip
	bgt	.L56
	b	.L60
.L134:
	str	r0, [r4]
	add	r2, r2, #1
	sub	r9, r9, #1
	str	ip, [lr]
	b	.L55
.L133:
	str	lr, [r4]
	add	r1, r1, #1
	sub	r0, r0, #1
	str	ip, [r5]
	b	.L46
.L124:
	mov	r1, r6
	str	r9, [sp, #28]
.L71:
	ldr	r0, [r10, r1, lsl #2]
	ldr	r7, [sp, #28]
	mov	r8, r1
.L64:
	cmp	r8, r7
	bgt	.L68
	ldr	ip, [r10, r8, lsl #2]
	lsl	r3, r8, #2
	cmp	ip, r0
	add	r4, r10, r3
	bge	.L69
	add	r3, r3, #4
	add	r3, r10, r3
.L65:
	mov	r4, r3
	ldr	ip, [r3], #4
	add	r8, r8, #1
	cmp	r0, ip
	bgt	.L65
.L69:
	ldr	r2, [r10, r7, lsl #2]
	lsl	r3, r7, #2
	cmp	r0, r2
	add	lr, r10, r3
	bge	.L66
	sub	r3, r3, #4
	add	r3, r10, r3
.L67:
	mov	lr, r3
	ldr	r2, [r3], #-4
	sub	r7, r7, #1
	cmp	r0, r2
	blt	.L67
.L66:
	cmp	r8, r7
	ble	.L135
.L68:
	cmp	r1, r7
	blt	.L80
.L81:
	ldr	r3, [sp, #28]
	mov	r1, r8
	cmp	r8, r3
	blt	.L71
	b	.L72
.L78:
	ldr	lr, [r10, r5, lsl #2]
	lsl	r3, r5, #2
	cmp	lr, r2
	add	r4, r10, r3
	ble	.L75
	sub	r3, r3, #4
	add	r3, r10, r3
.L76:
	mov	r4, r3
	ldr	lr, [r3], #-4
	sub	r5, r5, #1
	cmp	r2, lr
	blt	.L76
.L75:
	cmp	r5, r6
	bge	.L136
.L77:
	cmp	r1, r5
	blt	.L89
.L90:
	cmp	r6, r7
	mov	r1, r6
	bge	.L81
.L80:
	ldr	r2, [r10, r1, lsl #2]
	mov	r5, r7
	mov	r6, r1
.L73:
	cmp	r6, r5
	bgt	.L77
	ldr	r0, [r10, r6, lsl #2]
	lsl	r3, r6, #2
	cmp	r2, r0
	add	ip, r10, r3
	ble	.L78
	add	r3, r3, #4
	add	r3, r10, r3
.L74:
	mov	ip, r3
	ldr	r0, [r3], #4
	add	r6, r6, #1
	cmp	r2, r0
	bgt	.L74
	b	.L78
.L87:
	ldr	r0, [r10, r2, lsl #2]
	lsl	r3, r2, #2
	cmp	ip, r0
	add	r9, r10, r3
	bge	.L84
	sub	r3, r3, #4
	add	r3, r10, r3
.L85:
	mov	r9, r3
	ldr	r0, [r3], #-4
	sub	r2, r2, #1
	cmp	ip, r0
	blt	.L85
.L84:
	cmp	r4, r2
	ble	.L137
.L86:
	cmp	r1, r2
	blt	.L138
.L88:
	cmp	r5, r4
	mov	r1, r4
	ble	.L90
.L89:
	ldr	ip, [r10, r1, lsl #2]
	mov	r2, r5
	mov	r4, r1
.L82:
	cmp	r4, r2
	bgt	.L86
	ldr	lr, [r10, r4, lsl #2]
	lsl	r3, r4, #2
	cmp	ip, lr
	add	fp, r10, r3
	ble	.L87
	add	r3, r3, #4
	add	r3, r10, r3
.L83:
	mov	fp, r3
	ldr	lr, [r3], #4
	add	r4, r4, #1
	cmp	ip, lr
	bgt	.L83
	b	.L87
.L137:
	str	r0, [fp]
	add	r4, r4, #1
	sub	r2, r2, #1
	str	lr, [r9]
	b	.L82
.L136:
	str	lr, [ip]
	add	r6, r6, #1
	sub	r5, r5, #1
	str	r0, [r4]
	b	.L73
.L138:
	mov	r0, r10
	bl	quicksort
	b	.L88
.L135:
	str	r2, [r4]
	add	r8, r8, #1
	sub	r7, r7, #1
	str	ip, [lr]
	b	.L64
	.size	quicksort, .-quicksort
	.align	2
	.global	benchmark_quicksort
	.syntax unified
	.arm
	.fpu vfp
	.type	benchmark_quicksort, %function
benchmark_quicksort:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r1, #0
	mov	r5, r0
.L147:
	ldr	ip, [r5, r1, lsl #2]
	mov	r4, r1
	mov	r2, #4
.L140:
	ldr	lr, [r5, r4, lsl #2]
	lsl	r3, r4, #2
	cmp	ip, lr
	add	r7, r5, r3
	ble	.L145
	add	r3, r3, #4
	add	r3, r5, r3
.L141:
	mov	r7, r3
	ldr	lr, [r3], #4
	add	r4, r4, #1
	cmp	ip, lr
	bgt	.L141
.L145:
	ldr	r0, [r5, r2, lsl #2]
	lsl	r3, r2, #2
	cmp	ip, r0
	add	r6, r5, r3
	bge	.L142
	sub	r3, r3, #4
	add	r3, r5, r3
.L143:
	mov	r6, r3
	ldr	r0, [r3], #-4
	sub	r2, r2, #1
	cmp	ip, r0
	blt	.L143
.L142:
	cmp	r4, r2
	ble	.L153
	cmp	r1, r2
	blt	.L154
.L146:
	cmp	r4, #3
	mov	r1, r4
	ble	.L147
	pop	{r4, r5, r6, r7, r8, pc}
.L153:
	add	r4, r4, #1
	sub	r2, r2, #1
	cmp	r4, r2
	str	r0, [r7]
	str	lr, [r6]
	ble	.L140
	cmp	r1, r2
	bge	.L146
.L154:
	mov	r0, r5
	bl	quicksort
	b	.L146
	.size	benchmark_quicksort, .-benchmark_quicksort
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
	bne	.L156
	sub	r5, r0, #4
	add	r4, r0, #16
.L157:
	bl	rand
	str	r0, [r5, #4]!
	cmp	r5, r4
	bne	.L157
	mov	r0, #0
	pop	{r4, r5, r6, pc}
.L156:
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
.L163:
	bl	rand
	str	r0, [r4, #4]!
	cmp	r4, r5
	bne	.L163
	mov	r2, #4
	mov	r1, #0
	mov	r0, r6
	bl	quicksort
	mov	r0, r6
	bl	free
	mov	r0, #0
	pop	{r4, r5, r6, pc}
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\012 [\000"
.LC1:
	.ascii	"%d, \000"
	.space	3
.LC2:
	.ascii	"%d]\000"
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
