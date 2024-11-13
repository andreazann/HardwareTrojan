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
	.file	"dijkstra_small.c"
	.global	qHead
	.bss
	.align	2
	.type	qHead, %object
	.size	qHead, 4
qHead:
	.space	4
	.comm	AdjMatrix,40000,4
	.global	g_qCount
	.align	2
	.type	g_qCount, %object
	.size	g_qCount, 4
g_qCount:
	.space	4
	.comm	rgnNodes,800,4
	.comm	ch,4,4
	.comm	iPrev,4,4
	.comm	iNode,4,4
	.comm	i,4,4
	.comm	iCost,4,4
	.comm	iDist,4,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	" %d\000"
	.text
	.align	2
	.global	print_path
	.syntax unified
	.arm
	.fpu vfp
	.type	print_path, %function
print_path:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r2, .L3
	cmp	r3, r2
	beq	.L2
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	mov	r1, r3
	ldr	r0, [fp, #-8]
	bl	print_path
.L2:
	ldr	r1, [fp, #-12]
	ldr	r0, .L3+4
	bl	printf
	ldr	r3, .L3+8
	ldr	r3, [r3]
	mov	r0, r3
	bl	fflush
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L4:
	.align	2
.L3:
	.word	9999
	.word	.LC0
	.word	stdout
	.size	print_path, .-print_path
	.section	.rodata
	.align	2
.LC1:
	.ascii	"Out of memory.\012\000"
	.text
	.align	2
	.global	enqueue
	.syntax unified
	.arm
	.fpu vfp
	.type	enqueue, %function
enqueue:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r0, #16
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-12]
	ldr	r3, .L11
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L6
	ldr	r3, .L11+4
	ldr	r3, [r3]
	mov	r2, #15
	mov	r1, #1
	ldr	r0, .L11+8
	bl	fwrite
	mov	r0, #1
	bl	exit
.L6:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L9
	ldr	r2, .L11
	ldr	r3, [fp, #-12]
	str	r3, [r2]
	b	.L8
.L10:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-8]
.L9:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L10
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
.L8:
	ldr	r3, .L11+12
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L11+12
	str	r3, [r2]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L12:
	.align	2
.L11:
	.word	qHead
	.word	stderr
	.word	.LC1
	.word	g_qCount
	.size	enqueue, .-enqueue
	.align	2
	.global	dequeue
	.syntax unified
	.arm
	.fpu vfp
	.type	dequeue, %function
dequeue:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, .L16
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L16
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L15
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	str	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	str	r2, [r3]
	ldr	r3, .L16
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	ldr	r2, .L16
	str	r3, [r2]
	ldr	r0, [fp, #-8]
	bl	free
	ldr	r3, .L16+4
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, .L16+4
	str	r3, [r2]
.L15:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L17:
	.align	2
.L16:
	.word	qHead
	.word	g_qCount
	.size	dequeue, .-dequeue
	.align	2
	.global	qcount
	.syntax unified
	.arm
	.fpu vfp
	.type	qcount, %function
qcount:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L20
	ldr	r3, [r3]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L21:
	.align	2
.L20:
	.word	g_qCount
	.size	qcount, .-qcount
	.section	.rodata
	.align	2
.LC2:
	.ascii	"Shortest path is 0 in cost. Just stay where you are"
	.ascii	".\000"
	.align	2
.LC3:
	.ascii	"Shortest path is %d in cost. \000"
	.align	2
.LC4:
	.ascii	"Path is: \000"
	.text
	.align	2
	.global	dijkstra
	.syntax unified
	.arm
	.fpu vfp
	.type	dijkstra, %function
dijkstra:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, .L33
	mov	r2, #0
	str	r2, [r3]
	b	.L23
.L24:
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r2, .L33+4
	ldr	r1, .L33+8
	str	r1, [r2, r3, lsl #3]
	ldr	r3, .L33
	ldr	r3, [r3]
	ldr	r2, .L33+4
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, .L33+8
	str	r2, [r3, #4]
	ldr	r3, .L33
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L33
	str	r3, [r2]
.L23:
	ldr	r3, .L33
	ldr	r3, [r3]
	cmp	r3, #99
	ble	.L24
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bne	.L25
	ldr	r0, .L33+12
	bl	puts
	b	.L26
.L25:
	ldr	r2, .L33+4
	ldr	r3, [fp, #-8]
	mov	r1, #0
	str	r1, [r2, r3, lsl #3]
	ldr	r2, .L33+4
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, .L33+8
	str	r2, [r3, #4]
	ldr	r2, .L33+8
	mov	r1, #0
	ldr	r0, [fp, #-8]
	bl	enqueue
	b	.L27
.L32:
	ldr	r2, .L33+16
	ldr	r1, .L33+20
	ldr	r0, .L33+24
	bl	dequeue
	ldr	r3, .L33+28
	mov	r2, #0
	str	r2, [r3]
	b	.L28
.L31:
	ldr	r3, .L33+24
	ldr	r2, [r3]
	ldr	r3, .L33+28
	ldr	r3, [r3]
	ldr	r1, .L33+32
	mov	r0, #100
	mul	r2, r0, r2
	add	r3, r2, r3
	ldr	r3, [r1, r3, lsl #2]
	ldr	r2, .L33+36
	str	r3, [r2]
	ldr	r3, .L33+36
	ldr	r3, [r3]
	ldr	r2, .L33+8
	cmp	r3, r2
	beq	.L29
	ldr	r3, .L33+28
	ldr	r3, [r3]
	ldr	r2, .L33+4
	ldr	r3, [r2, r3, lsl #3]
	ldr	r2, .L33+8
	cmp	r3, r2
	beq	.L30
	ldr	r3, .L33+28
	ldr	r3, [r3]
	ldr	r2, .L33+4
	ldr	r2, [r2, r3, lsl #3]
	ldr	r3, .L33+36
	ldr	r1, [r3]
	ldr	r3, .L33+20
	ldr	r3, [r3]
	add	r3, r1, r3
	cmp	r2, r3
	ble	.L29
.L30:
	ldr	r3, .L33+28
	ldr	r3, [r3]
	ldr	r2, .L33+20
	ldr	r1, [r2]
	ldr	r2, .L33+36
	ldr	r2, [r2]
	add	r2, r1, r2
	ldr	r1, .L33+4
	str	r2, [r1, r3, lsl #3]
	ldr	r3, .L33+28
	ldr	r3, [r3]
	ldr	r2, .L33+24
	ldr	r2, [r2]
	ldr	r1, .L33+4
	lsl	r3, r3, #3
	add	r3, r1, r3
	str	r2, [r3, #4]
	ldr	r3, .L33+28
	ldr	r0, [r3]
	ldr	r3, .L33+20
	ldr	r2, [r3]
	ldr	r3, .L33+36
	ldr	r3, [r3]
	add	r1, r2, r3
	ldr	r3, .L33+24
	ldr	r3, [r3]
	mov	r2, r3
	bl	enqueue
.L29:
	ldr	r3, .L33+28
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L33+28
	str	r3, [r2]
.L28:
	ldr	r3, .L33+28
	ldr	r3, [r3]
	cmp	r3, #99
	ble	.L31
.L27:
	bl	qcount
	mov	r3, r0
	cmp	r3, #0
	bgt	.L32
	ldr	r2, .L33+4
	ldr	r3, [fp, #-12]
	ldr	r3, [r2, r3, lsl #3]
	mov	r1, r3
	ldr	r0, .L33+40
	bl	printf
	ldr	r0, .L33+44
	bl	printf
	ldr	r1, [fp, #-12]
	ldr	r0, .L33+4
	bl	print_path
	mov	r0, #10
	bl	putchar
.L26:
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L34:
	.align	2
.L33:
	.word	ch
	.word	rgnNodes
	.word	9999
	.word	.LC2
	.word	iPrev
	.word	iDist
	.word	iNode
	.word	i
	.word	AdjMatrix
	.word	iCost
	.word	.LC3
	.word	.LC4
	.size	dijkstra, .-dijkstra
	.section	.rodata
	.align	2
.LC5:
	.ascii	"r\000"
	.align	2
.LC6:
	.ascii	"input.dat\000"
	.align	2
.LC7:
	.ascii	"%d\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r1, .L42
	ldr	r0, .L42+4
	bl	fopen
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L36
.L39:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L37
.L38:
	sub	r3, fp, #20
	mov	r2, r3
	ldr	r1, .L42+8
	ldr	r0, [fp, #-16]
	bl	__isoc99_fscanf
	ldr	r2, [fp, #-20]
	ldr	r0, .L42+12
	ldr	r3, [fp, #-8]
	mov	r1, #100
	mul	r1, r1, r3
	ldr	r3, [fp, #-12]
	add	r3, r1, r3
	str	r2, [r0, r3, lsl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L37:
	ldr	r3, [fp, #-12]
	cmp	r3, #99
	ble	.L38
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L36:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L39
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #50
	str	r3, [fp, #-12]
	b	.L40
.L41:
	ldr	r3, [fp, #-12]
	ldr	r2, .L42+16
	smull	r1, r2, r2, r3
	asr	r1, r2, #5
	asr	r2, r3, #31
	sub	r2, r1, r2
	mov	r1, #100
	mul	r2, r1, r2
	sub	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	dijkstra
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L40:
	ldr	r3, [fp, #-8]
	cmp	r3, #19
	ble	.L41
	mov	r0, #0
	bl	exit
.L43:
	.align	2
.L42:
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.word	AdjMatrix
	.word	1374389535
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
