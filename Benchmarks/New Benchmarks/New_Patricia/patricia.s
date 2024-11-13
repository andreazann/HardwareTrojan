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
	.file	"patricia.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu vfp
	.type	bit, %function
bit:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #31
	mov	r2, #1
	lsl	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-12]
	and	r3, r3, r2
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	bit, .-bit
	.align	2
	.syntax unified
	.arm
	.fpu vfp
	.type	pat_count, %function
pat_count:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L4
	mov	r3, #0
	b	.L5
.L4:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r1, r3
	mov	r0, r2
	bl	pat_count
	mov	r2, r0
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r1, r3
	mov	r0, r2
	bl	pat_count
	mov	r2, r0
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
.L5:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	pat_count, .-pat_count
	.align	2
	.syntax unified
	.arm
	.fpu vfp
	.type	insertR, %function
insertR:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L7
	ldr	r3, [fp, #-8]
	ldrb	r2, [r3, #9]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	cmp	r2, r3
	bhi	.L8
.L7:
	ldr	r3, [fp, #-16]
	uxtb	r2, r3
	ldr	r3, [fp, #-12]
	strb	r2, [r3, #9]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L9
	ldr	r3, [fp, #-8]
	b	.L10
.L9:
	ldr	r3, [fp, #-12]
.L10:
	ldr	r2, [fp, #-12]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L11
	ldr	r3, [fp, #-12]
	b	.L12
.L11:
	ldr	r3, [fp, #-8]
.L12:
	ldr	r2, [fp, #-12]
	str	r3, [r2, #16]
	ldr	r3, [fp, #-12]
	b	.L13
.L8:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L14
	ldr	r3, [fp, #-8]
	ldr	r0, [r3, #16]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	bl	insertR
	mov	r2, r0
	ldr	r3, [fp, #-8]
	str	r2, [r3, #16]
	b	.L15
.L14:
	ldr	r3, [fp, #-8]
	ldr	r0, [r3, #12]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	bl	insertR
	mov	r2, r0
	ldr	r3, [fp, #-8]
	str	r2, [r3, #12]
.L15:
	ldr	r3, [fp, #-8]
.L13:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	insertR, .-insertR
	.align	2
	.global	pat_insert
	.syntax unified
	.arm
	.fpu vfp
	.type	pat_insert, %function
pat_insert:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L17
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L17
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L18
.L17:
	mov	r3, #0
	b	.L19
.L18:
	ldr	r3, [fp, #-40]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	and	r2, r2, r3
	ldr	r3, [fp, #-40]
	str	r2, [r3]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-16]
.L22:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L20
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	b	.L21
.L20:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
.L21:
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L22
	ldr	r3, [fp, #-40]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L23
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L24
.L26:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #4]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L25
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [fp, #-40]
	ldr	r2, [r2, #4]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	free
	ldr	r0, [fp, #-40]
	bl	free
	mov	r3, #0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-16]
	b	.L19
.L25:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L24:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L26
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	add	r3, r3, #1
	lsl	r3, r3, #3
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-20]
	b	.L27
.L30:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #4]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	bls	.L28
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	add	r3, r2, r3
	mov	r2, #8
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	bcopy
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	b	.L29
.L28:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	mov	r2, #8
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	bcopy
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	mvn	r2, #0
	str	r2, [r3]
	mov	r3, #1
	str	r3, [fp, #-28]
.L29:
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	str	r3, [fp, #-20]
.L27:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L30
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L31
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	mov	r2, #8
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	bcopy
.L31:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	free
	ldr	r0, [fp, #-40]
	bl	free
	mov	r3, #0
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	add	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [fp, #-16]
	strb	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	free
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	b	.L19
.L23:
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L32
.L34:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L32:
	ldr	r3, [fp, #-24]
	cmp	r3, #31
	bgt	.L33
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, [fp, #-24]
	bl	bit
	mov	r4, r0
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, [fp, #-24]
	bl	bit
	mov	r3, r0
	cmp	r4, r3
	beq	.L34
.L33:
	ldr	r3, [fp, #-44]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L35
	ldr	r3, [fp, #-44]
	ldr	r0, [r3, #16]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-40]
	bl	insertR
	mov	r2, r0
	ldr	r3, [fp, #-44]
	str	r2, [r3, #16]
	b	.L36
.L35:
	ldr	r3, [fp, #-44]
	ldr	r0, [r3, #12]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-40]
	bl	insertR
	mov	r2, r0
	ldr	r3, [fp, #-44]
	str	r2, [r3, #12]
.L36:
	ldr	r3, [fp, #-40]
.L19:
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
	.size	pat_insert, .-pat_insert
	.align	2
	.global	pat_remove
	.syntax unified
	.arm
	.fpu vfp
	.type	pat_remove, %function
pat_remove:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L38
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L38
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L39
.L38:
	mov	r3, #0
	b	.L40
.L39:
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-28]
.L43:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L41
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	b	.L42
.L41:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
.L42:
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L43
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L44
	mov	r3, #0
	b	.L40
.L44:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L45
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L46
	mov	r3, #0
	b	.L40
.L46:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L47
	mov	r3, #0
	b	.L40
.L47:
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-32]
.L50:
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L48
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #16]
	b	.L49
.L48:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
.L49:
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L50
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L51
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #16]
	b	.L52
.L51:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #12]
.L52:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L53
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L54
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	b	.L55
.L54:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #16]
.L55:
	ldr	r2, [fp, #-28]
	str	r3, [r2, #16]
	b	.L56
.L53:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L57
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	b	.L58
.L57:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #16]
.L58:
	ldr	r2, [fp, #-28]
	str	r3, [r2, #12]
.L56:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L59
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	free
.L59:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	free
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L60
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldrb	r2, [r3, #8]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	strb	r2, [r3, #8]
.L60:
	ldr	r0, [fp, #-8]
	bl	free
	mov	r3, #1
	b	.L40
.L45:
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L61
.L64:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #4]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L69
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L61:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L64
	b	.L63
.L69:
	nop
.L63:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L65
	mov	r3, #0
	b	.L40
.L65:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	sub	r3, r3, #1
	lsl	r3, r3, #3
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
	b	.L66
.L68:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r1, [r3, #4]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L67
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	add	r0, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r3, #8
	str	r2, [fp, #-20]
	mov	r2, #8
	mov	r1, r3
	bl	bcopy
.L67:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L66:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bgt	.L68
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #8]	@ zero_extendqisi2
	sub	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, [fp, #-16]
	strb	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	free
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #4]
	mov	r3, #1
.L40:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	pat_remove, .-pat_remove
	.align	2
	.global	pat_search
	.syntax unified
	.arm
	.fpu vfp
	.type	pat_search, %function
pat_search:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L71
	mov	r3, #0
	b	.L72
.L71:
	ldr	r3, [fp, #-12]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	ldr	r1, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, r1
	cmp	r2, r3
	bne	.L73
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
.L73:
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	bit
	mov	r3, r0
	cmp	r3, #0
	beq	.L74
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #16]
	b	.L75
.L74:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
.L75:
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #9]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bgt	.L71
	ldr	r3, [fp, #-12]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	ldr	r1, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, r1
	cmp	r2, r3
	bne	.L76
	ldr	r3, [fp, #-12]
	b	.L72
.L76:
	ldr	r3, [fp, #-8]
.L72:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
	.size	pat_search, .-pat_search
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
