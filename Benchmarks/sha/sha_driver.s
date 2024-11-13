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
	.file	"sha_driver.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu vfp
	.type	sha_transform, %function
sha_transform:
	@ args = 0, pretend = 0, frame = 336
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #340
	mov	r7, r0
	add	ip, r0, #28
	add	r5, r0, #92
	add	r4, sp, #16
.L2:
	ldr	r0, [ip]	@ unaligned
	ldr	r1, [ip, #4]	@ unaligned
	ldr	r2, [ip, #8]	@ unaligned
	ldr	r3, [ip, #12]	@ unaligned
	mov	lr, r4
	add	ip, ip, #16
	cmp	ip, r5
	stmia	lr!, {r0, r1, r2, r3}
	mov	r4, lr
	bne	.L2
	ldr	r3, [sp, #68]
	ldr	r2, [sp, #72]
	ldr	ip, [sp, #76]
	ldr	r6, [sp, #16]
	ldr	r5, [sp, #20]
	add	r0, sp, #16
	mov	r4, #16
.L3:
	eor	r2, r2, r5
	ldr	r1, [r0, #40]
	ldr	r5, [r0, #16]
	ldr	r9, [r0, #32]
	ldr	r8, [r0, #36]
	ldr	lr, [r0, #8]
	eor	r3, r3, r6
	eor	r1, r1, r5
	ldr	r6, [r0, #12]
	add	r4, r4, #3
	eor	r3, r3, r9
	eor	r2, r2, r8
	eor	r1, r1, ip
	eor	ip, r1, lr
	eor	r3, r3, lr
	eor	r2, r2, r6
	cmp	r4, #79
	str	ip, [r0, #72]
	str	r3, [r0, #64]
	str	r2, [r0, #68]
	add	r0, r0, #12
	bne	.L3
	add	lr, sp, #328
	add	ip, sp, #264
	add	r4, sp, #332
.L4:
	mov	r2, ip
	ldr	r1, [ip, #4]!
	ldr	r3, [r2, #36]
	ldr	r0, [r2, #56]
	ldr	r2, [r2, #12]
	eor	r3, r3, r0
	eor	r3, r3, r2
	eor	r3, r3, r1
	str	r3, [lr, #4]!
	cmp	r4, lr
	bne	.L4
	ldr	r1, [r7, #12]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	ldr	fp, [r7]
	mov	ip, r1
	str	r1, [sp, #8]
	ldr	r1, [r7, #16]
	str	r2, [sp, #4]
	mov	lr, r1
	str	r1, [sp, #12]
	mov	r8, r2
	str	r3, [sp]
	mov	r0, fp
	mov	r1, r3
	add	r2, sp, #12
	add	r6, sp, #92
	ldr	r5, .L18
	b	.L5
.L9:
	mov	ip, r8
	mov	r0, r3
	mov	r8, r4
.L5:
	ldr	r3, [r2, #4]!
	eor	r4, r8, ip
	and	r4, r4, r1
	add	r3, r3, r5
	eor	r4, r4, ip
	add	r3, r3, r0, ror #27
	add	r3, r3, r4
	cmp	r6, r2
	add	r3, r3, lr
	ror	r4, r1, #2
	mov	lr, ip
	mov	r1, r0
	bne	.L9
	add	r5, sp, #96
	add	r9, sp, #176
	ldr	lr, .L18+4
	b	.L6
.L10:
	mov	r8, r4
	mov	r3, r2
	mov	r4, r6
.L6:
	eor	r2, r0, r4
	ldr	r6, [r5], #4
	eor	r1, r2, r8
	add	r2, lr, r3, ror #27
	add	r2, r1, r2
	add	r2, r2, r6
	cmp	r9, r5
	ror	r6, r0, #2
	add	r2, r2, ip
	mov	r0, r3
	mov	ip, r8
	bne	.L10
	add	r10, sp, #256
	ldr	r9, .L18+8
	b	.L7
.L11:
	mov	r4, r6
	mov	r2, r1
	mov	r6, r0
.L7:
	orr	r1, r6, r4
	ldr	ip, [r5], #4
	and	lr, r1, r3
	add	r0, r9, r2, ror #27
	and	r1, r6, r4
	add	r0, r0, ip
	orr	r1, lr, r1
	add	r1, r1, r0
	cmp	r5, r10
	ror	r0, r3, #2
	add	r1, r1, r8
	mov	r3, r2
	mov	r8, r4
	bne	.L11
	mov	ip, r1
	add	r9, sp, #336
	ldr	r8, .L18+12
	b	.L8
.L12:
	mov	r6, r0
	mov	ip, r3
	mov	r0, r10
.L8:
	eor	r3, r2, r0
	eor	r1, r3, r6
	ldr	lr, [r5], #4
	add	r3, r8, ip, ror #27
	add	r3, r1, r3
	add	r3, r3, lr
	cmp	r5, r9
	ror	r10, r2, #2
	add	r3, r3, r4
	mov	r2, ip
	mov	r4, r6
	bne	.L12
	ldr	r2, [sp]
	add	r3, fp, r3
	add	ip, r2, ip
	ldr	r2, [sp, #4]
	stm	r7, {r3, ip}
	add	r10, r2, r10
	ldr	r2, [sp, #8]
	str	r10, [r7, #8]
	add	r0, r2, r0
	ldr	r2, [sp, #12]
	str	r0, [r7, #12]
	add	r6, r2, r6
	str	r6, [r7, #16]
	add	sp, sp, #340
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L19:
	.align	2
.L18:
	.word	1518500249
	.word	1859775393
	.word	-1894007588
	.word	-899497514
	.size	sha_transform, .-sha_transform
	.align	2
	.global	sha_init
	.syntax unified
	.arm
	.fpu vfp
	.type	sha_init, %function
sha_init:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	ldr	r4, .L22
	ldr	lr, .L22+4
	ldr	ip, .L22+8
	ldr	r1, .L22+12
	ldr	r2, .L22+16
	stm	r0, {r4, lr}
	str	ip, [r0, #8]
	str	r1, [r0, #12]
	str	r2, [r0, #16]
	str	r3, [r0, #20]
	str	r3, [r0, #24]
	pop	{r4, pc}
.L23:
	.align	2
.L22:
	.word	1732584193
	.word	-271733879
	.word	-1732584194
	.word	271733878
	.word	-1009589776
	.size	sha_init, .-sha_init
	.align	2
	.global	sha_update
	.syntax unified
	.arm
	.fpu vfp
	.type	sha_update, %function
sha_update:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, r2
	add	r2, r3, r2, lsl #3
	cmp	r3, r2
	ldr	r3, [r0, #24]
	str	r2, [r0, #20]
	addhi	r3, r3, #1
	add	r3, r3, r6, lsr #29
	cmp	r6, #63
	mov	r4, r0
	mov	r7, r1
	add	r8, r0, #28
	str	r3, [r0, #24]
	movle	r2, r6
	ble	.L28
	mov	r9, r6
	mov	r5, r1
.L30:
	add	r2, r5, #64
	mov	r3, r8
.L29:
	ldr	lr, [r5]	@ unaligned
	ldr	ip, [r5, #4]	@ unaligned
	ldr	r0, [r5, #8]	@ unaligned
	ldr	r1, [r5, #12]	@ unaligned
	add	r5, r5, #16
	cmp	r5, r2
	str	lr, [r3]	@ unaligned
	str	ip, [r3, #4]	@ unaligned
	str	r0, [r3, #8]	@ unaligned
	str	r1, [r3, #12]	@ unaligned
	add	r3, r3, #16
	bne	.L29
	ldrb	r2, [r4, #28]	@ zero_extendqisi2
	ldrb	r3, [r4, #31]	@ zero_extendqisi2
	ldrb	r10, [r4, #29]	@ zero_extendqisi2
	ldrb	lr, [r4, #30]	@ zero_extendqisi2
	ldrb	ip, [r4, #32]	@ zero_extendqisi2
	ldrb	r0, [r4, #35]	@ zero_extendqisi2
	ldrb	r1, [r4, #33]	@ zero_extendqisi2
	strb	r2, [r4, #31]
	strb	r3, [r4, #28]
	ldrb	r2, [r4, #34]	@ zero_extendqisi2
	ldrb	r3, [r4, #36]	@ zero_extendqisi2
	strb	r10, [r4, #30]
	strb	lr, [r4, #29]
	ldrb	r10, [r4, #39]	@ zero_extendqisi2
	ldrb	lr, [r4, #37]	@ zero_extendqisi2
	strb	ip, [r4, #35]
	strb	r0, [r4, #32]
	ldrb	ip, [r4, #38]	@ zero_extendqisi2
	ldrb	r0, [r4, #40]	@ zero_extendqisi2
	strb	r1, [r4, #34]
	strb	r2, [r4, #33]
	ldrb	r1, [r4, #43]	@ zero_extendqisi2
	ldrb	r2, [r4, #41]	@ zero_extendqisi2
	strb	r3, [r4, #39]
	ldrb	r3, [r4, #42]	@ zero_extendqisi2
	strb	r10, [r4, #36]
	strb	lr, [r4, #38]
	strb	ip, [r4, #37]
	strb	r0, [r4, #43]
	strb	r1, [r4, #40]
	strb	r3, [r4, #41]
	strb	r2, [r4, #42]
	ldrb	r2, [r4, #44]	@ zero_extendqisi2
	ldrb	r3, [r4, #47]	@ zero_extendqisi2
	ldrb	r10, [r4, #45]	@ zero_extendqisi2
	ldrb	lr, [r4, #46]	@ zero_extendqisi2
	ldrb	ip, [r4, #48]	@ zero_extendqisi2
	ldrb	r0, [r4, #51]	@ zero_extendqisi2
	ldrb	r1, [r4, #49]	@ zero_extendqisi2
	strb	r2, [r4, #47]
	strb	r3, [r4, #44]
	ldrb	r2, [r4, #50]	@ zero_extendqisi2
	ldrb	r3, [r4, #52]	@ zero_extendqisi2
	strb	r10, [r4, #46]
	strb	lr, [r4, #45]
	ldrb	r10, [r4, #55]	@ zero_extendqisi2
	ldrb	lr, [r4, #53]	@ zero_extendqisi2
	strb	ip, [r4, #51]
	strb	r0, [r4, #48]
	ldrb	ip, [r4, #54]	@ zero_extendqisi2
	ldrb	r0, [r4, #56]	@ zero_extendqisi2
	strb	r1, [r4, #50]
	strb	r2, [r4, #49]
	ldrb	r1, [r4, #59]	@ zero_extendqisi2
	ldrb	r2, [r4, #57]	@ zero_extendqisi2
	strb	r3, [r4, #55]
	ldrb	r3, [r4, #58]	@ zero_extendqisi2
	strb	r10, [r4, #52]
	strb	lr, [r4, #54]
	strb	ip, [r4, #53]
	strb	r0, [r4, #59]
	strb	r1, [r4, #56]
	strb	r3, [r4, #57]
	strb	r2, [r4, #58]
	ldrb	r2, [r4, #60]	@ zero_extendqisi2
	ldrb	r3, [r4, #63]	@ zero_extendqisi2
	ldrb	r10, [r4, #61]	@ zero_extendqisi2
	ldrb	lr, [r4, #62]	@ zero_extendqisi2
	ldrb	ip, [r4, #64]	@ zero_extendqisi2
	ldrb	r0, [r4, #67]	@ zero_extendqisi2
	ldrb	r1, [r4, #65]	@ zero_extendqisi2
	strb	r2, [r4, #63]
	strb	r3, [r4, #60]
	ldrb	r2, [r4, #66]	@ zero_extendqisi2
	ldrb	r3, [r4, #68]	@ zero_extendqisi2
	strb	r10, [r4, #62]
	strb	lr, [r4, #61]
	ldrb	r10, [r4, #71]	@ zero_extendqisi2
	ldrb	lr, [r4, #69]	@ zero_extendqisi2
	strb	ip, [r4, #67]
	strb	r0, [r4, #64]
	ldrb	ip, [r4, #70]	@ zero_extendqisi2
	ldrb	r0, [r4, #72]	@ zero_extendqisi2
	strb	r1, [r4, #66]
	strb	r2, [r4, #65]
	ldrb	r1, [r4, #75]	@ zero_extendqisi2
	ldrb	r2, [r4, #73]	@ zero_extendqisi2
	strb	r3, [r4, #71]
	ldrb	r3, [r4, #74]	@ zero_extendqisi2
	strb	r10, [r4, #68]
	strb	lr, [r4, #70]
	strb	ip, [r4, #69]
	strb	r0, [r4, #75]
	strb	r1, [r4, #72]
	strb	r3, [r4, #73]
	strb	r2, [r4, #74]
	ldrb	r2, [r4, #76]	@ zero_extendqisi2
	ldrb	r3, [r4, #79]	@ zero_extendqisi2
	ldrb	r10, [r4, #77]	@ zero_extendqisi2
	ldrb	lr, [r4, #78]	@ zero_extendqisi2
	ldrb	ip, [r4, #80]	@ zero_extendqisi2
	ldrb	r0, [r4, #83]	@ zero_extendqisi2
	ldrb	r1, [r4, #81]	@ zero_extendqisi2
	strb	r2, [r4, #79]
	strb	r3, [r4, #76]
	ldrb	r2, [r4, #82]	@ zero_extendqisi2
	ldrb	r3, [r4, #84]	@ zero_extendqisi2
	strb	r10, [r4, #78]
	strb	lr, [r4, #77]
	ldrb	r10, [r4, #87]	@ zero_extendqisi2
	ldrb	lr, [r4, #85]	@ zero_extendqisi2
	strb	ip, [r4, #83]
	strb	r0, [r4, #80]
	ldrb	ip, [r4, #86]	@ zero_extendqisi2
	ldrb	r0, [r4, #88]	@ zero_extendqisi2
	strb	r1, [r4, #82]
	strb	r2, [r4, #81]
	ldrb	r1, [r4, #91]	@ zero_extendqisi2
	ldrb	r2, [r4, #89]	@ zero_extendqisi2
	strb	r3, [r4, #87]
	ldrb	r3, [r4, #90]	@ zero_extendqisi2
	strb	r0, [r4, #91]
	sub	r9, r9, #64
	strb	r10, [r4, #84]
	strb	lr, [r4, #86]
	strb	ip, [r4, #85]
	strb	r1, [r4, #88]
	strb	r2, [r4, #90]
	strb	r3, [r4, #89]
	mov	r0, r4
	bl	sha_transform
	cmp	r9, #63
	bgt	.L30
	sub	r6, r6, #64
	bic	r3, r6, #63
	add	r3, r3, #64
	add	r7, r7, r3
	and	r2, r6, #63
.L28:
	mov	r1, r7
	mov	r0, r8
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	memcpy
	.size	sha_update, .-sha_update
	.align	2
	.global	sha_final
	.syntax unified
	.arm
	.fpu vfp
	.type	sha_final, %function
sha_final:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	add	r5, r0, #28
	ldr	r6, [r0, #20]
	mvn	r2, #127
	ldr	r7, [r0, #24]
	lsr	r3, r6, #3
	and	r3, r3, #63
	add	r1, r3, #1
	cmp	r1, #56
	mov	r4, r0
	strb	r2, [r5, r3]
	ble	.L35
	rsb	r2, r1, #64
	add	r0, r5, r1
	mov	r1, #0
	bl	memset
	ldrb	r3, [r4, #28]	@ zero_extendqisi2
	ldrb	ip, [r4, #31]	@ zero_extendqisi2
	ldrb	r0, [r4, #29]	@ zero_extendqisi2
	ldrb	r1, [r4, #30]	@ zero_extendqisi2
	ldrb	r2, [r4, #32]	@ zero_extendqisi2
	strb	r3, [r4, #31]
	ldrb	r3, [r4, #35]	@ zero_extendqisi2
	strb	ip, [r4, #28]
	strb	r0, [r4, #30]
	ldrb	ip, [r4, #33]	@ zero_extendqisi2
	ldrb	r0, [r4, #34]	@ zero_extendqisi2
	strb	r1, [r4, #29]
	strb	r2, [r4, #35]
	ldrb	r1, [r4, #36]	@ zero_extendqisi2
	ldrb	r2, [r4, #39]	@ zero_extendqisi2
	strb	r3, [r4, #32]
	ldrb	r3, [r4, #37]	@ zero_extendqisi2
	strb	ip, [r4, #34]
	strb	r0, [r4, #33]
	ldrb	ip, [r4, #38]	@ zero_extendqisi2
	ldrb	r0, [r4, #40]	@ zero_extendqisi2
	strb	r1, [r4, #39]
	strb	r2, [r4, #36]
	ldrb	r1, [r4, #43]	@ zero_extendqisi2
	ldrb	r2, [r4, #41]	@ zero_extendqisi2
	strb	r3, [r4, #38]
	ldrb	r3, [r4, #42]	@ zero_extendqisi2
	strb	ip, [r4, #37]
	strb	r0, [r4, #43]
	strb	r1, [r4, #40]
	strb	r2, [r4, #42]
	strb	r3, [r4, #41]
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	ldrb	ip, [r4, #47]	@ zero_extendqisi2
	ldrb	r0, [r4, #45]	@ zero_extendqisi2
	ldrb	r1, [r4, #46]	@ zero_extendqisi2
	ldrb	r2, [r4, #48]	@ zero_extendqisi2
	strb	r3, [r4, #47]
	ldrb	r3, [r4, #51]	@ zero_extendqisi2
	strb	ip, [r4, #44]
	strb	r0, [r4, #46]
	ldrb	ip, [r4, #49]	@ zero_extendqisi2
	ldrb	r0, [r4, #50]	@ zero_extendqisi2
	strb	r1, [r4, #45]
	strb	r2, [r4, #51]
	ldrb	r1, [r4, #52]	@ zero_extendqisi2
	ldrb	r2, [r4, #55]	@ zero_extendqisi2
	strb	r3, [r4, #48]
	ldrb	r3, [r4, #53]	@ zero_extendqisi2
	strb	ip, [r4, #50]
	strb	r0, [r4, #49]
	ldrb	ip, [r4, #54]	@ zero_extendqisi2
	ldrb	r0, [r4, #56]	@ zero_extendqisi2
	strb	r1, [r4, #55]
	strb	r2, [r4, #52]
	ldrb	r1, [r4, #59]	@ zero_extendqisi2
	ldrb	r2, [r4, #57]	@ zero_extendqisi2
	strb	r3, [r4, #54]
	ldrb	r3, [r4, #58]	@ zero_extendqisi2
	strb	ip, [r4, #53]
	strb	r0, [r4, #59]
	strb	r1, [r4, #56]
	strb	r2, [r4, #58]
	strb	r3, [r4, #57]
	ldrb	r3, [r4, #60]	@ zero_extendqisi2
	ldrb	ip, [r4, #63]	@ zero_extendqisi2
	ldrb	r0, [r4, #61]	@ zero_extendqisi2
	ldrb	r1, [r4, #62]	@ zero_extendqisi2
	ldrb	r2, [r4, #64]	@ zero_extendqisi2
	strb	r3, [r4, #63]
	ldrb	r3, [r4, #67]	@ zero_extendqisi2
	strb	ip, [r4, #60]
	strb	r0, [r4, #62]
	ldrb	ip, [r4, #65]	@ zero_extendqisi2
	ldrb	r0, [r4, #66]	@ zero_extendqisi2
	strb	r1, [r4, #61]
	strb	r2, [r4, #67]
	ldrb	r1, [r4, #68]	@ zero_extendqisi2
	ldrb	r2, [r4, #71]	@ zero_extendqisi2
	strb	r3, [r4, #64]
	ldrb	r3, [r4, #69]	@ zero_extendqisi2
	strb	ip, [r4, #66]
	strb	r0, [r4, #65]
	ldrb	ip, [r4, #70]	@ zero_extendqisi2
	ldrb	r0, [r4, #72]	@ zero_extendqisi2
	strb	r1, [r4, #71]
	strb	r2, [r4, #68]
	ldrb	r1, [r4, #75]	@ zero_extendqisi2
	ldrb	r2, [r4, #73]	@ zero_extendqisi2
	strb	r3, [r4, #70]
	ldrb	r3, [r4, #74]	@ zero_extendqisi2
	strb	ip, [r4, #69]
	strb	r0, [r4, #75]
	strb	r1, [r4, #72]
	strb	r2, [r4, #74]
	strb	r3, [r4, #73]
	ldrb	r3, [r4, #76]	@ zero_extendqisi2
	ldrb	ip, [r4, #79]	@ zero_extendqisi2
	ldrb	r0, [r4, #77]	@ zero_extendqisi2
	ldrb	r1, [r4, #78]	@ zero_extendqisi2
	ldrb	r2, [r4, #80]	@ zero_extendqisi2
	strb	r3, [r4, #79]
	ldrb	r3, [r4, #83]	@ zero_extendqisi2
	strb	ip, [r4, #76]
	strb	r0, [r4, #78]
	ldrb	ip, [r4, #81]	@ zero_extendqisi2
	ldrb	r0, [r4, #82]	@ zero_extendqisi2
	strb	r1, [r4, #77]
	strb	r2, [r4, #83]
	ldrb	r1, [r4, #84]	@ zero_extendqisi2
	ldrb	r2, [r4, #87]	@ zero_extendqisi2
	strb	r3, [r4, #80]
	ldrb	r3, [r4, #85]	@ zero_extendqisi2
	strb	ip, [r4, #82]
	strb	r0, [r4, #81]
	ldrb	ip, [r4, #86]	@ zero_extendqisi2
	ldrb	r0, [r4, #88]	@ zero_extendqisi2
	strb	r1, [r4, #87]
	strb	r2, [r4, #84]
	ldrb	r1, [r4, #91]	@ zero_extendqisi2
	ldrb	r2, [r4, #89]	@ zero_extendqisi2
	strb	r3, [r4, #86]
	ldrb	r3, [r4, #90]	@ zero_extendqisi2
	strb	r0, [r4, #91]
	strb	r1, [r4, #88]
	strb	r2, [r4, #90]
	mov	r0, r4
	strb	ip, [r4, #85]
	strb	r3, [r4, #89]
	bl	sha_transform
	mov	r0, r5
	mov	r2, #56
	mov	r1, #0
	bl	memset
.L36:
	ldrb	r2, [r4, #28]	@ zero_extendqisi2
	ldrb	r3, [r4, #31]	@ zero_extendqisi2
	ldrb	r5, [r4, #29]	@ zero_extendqisi2
	ldrb	lr, [r4, #30]	@ zero_extendqisi2
	ldrb	ip, [r4, #32]	@ zero_extendqisi2
	ldrb	r0, [r4, #35]	@ zero_extendqisi2
	ldrb	r1, [r4, #33]	@ zero_extendqisi2
	strb	r2, [r4, #31]
	strb	r3, [r4, #28]
	ldrb	r2, [r4, #34]	@ zero_extendqisi2
	ldrb	r3, [r4, #36]	@ zero_extendqisi2
	strb	r5, [r4, #30]
	strb	lr, [r4, #29]
	ldrb	r5, [r4, #39]	@ zero_extendqisi2
	ldrb	lr, [r4, #37]	@ zero_extendqisi2
	strb	ip, [r4, #35]
	strb	r0, [r4, #32]
	ldrb	ip, [r4, #38]	@ zero_extendqisi2
	ldrb	r0, [r4, #40]	@ zero_extendqisi2
	strb	r1, [r4, #34]
	strb	r2, [r4, #33]
	ldrb	r1, [r4, #43]	@ zero_extendqisi2
	ldrb	r2, [r4, #41]	@ zero_extendqisi2
	strb	r3, [r4, #39]
	ldrb	r3, [r4, #42]	@ zero_extendqisi2
	strb	r5, [r4, #36]
	strb	lr, [r4, #38]
	strb	ip, [r4, #37]
	strb	r0, [r4, #43]
	strb	r1, [r4, #40]
	strb	r3, [r4, #41]
	strb	r2, [r4, #42]
	ldrb	r2, [r4, #44]	@ zero_extendqisi2
	ldrb	r3, [r4, #47]	@ zero_extendqisi2
	ldrb	r5, [r4, #45]	@ zero_extendqisi2
	ldrb	lr, [r4, #46]	@ zero_extendqisi2
	ldrb	ip, [r4, #48]	@ zero_extendqisi2
	ldrb	r0, [r4, #51]	@ zero_extendqisi2
	ldrb	r1, [r4, #49]	@ zero_extendqisi2
	strb	r2, [r4, #47]
	strb	r3, [r4, #44]
	ldrb	r2, [r4, #50]	@ zero_extendqisi2
	ldrb	r3, [r4, #52]	@ zero_extendqisi2
	strb	r5, [r4, #46]
	strb	lr, [r4, #45]
	ldrb	r5, [r4, #55]	@ zero_extendqisi2
	ldrb	lr, [r4, #53]	@ zero_extendqisi2
	strb	ip, [r4, #51]
	strb	r0, [r4, #48]
	ldrb	ip, [r4, #54]	@ zero_extendqisi2
	ldrb	r0, [r4, #56]	@ zero_extendqisi2
	strb	r1, [r4, #50]
	strb	r2, [r4, #49]
	ldrb	r1, [r4, #59]	@ zero_extendqisi2
	ldrb	r2, [r4, #57]	@ zero_extendqisi2
	strb	r3, [r4, #55]
	ldrb	r3, [r4, #58]	@ zero_extendqisi2
	strb	r5, [r4, #52]
	strb	lr, [r4, #54]
	strb	ip, [r4, #53]
	strb	r0, [r4, #59]
	strb	r1, [r4, #56]
	strb	r3, [r4, #57]
	strb	r2, [r4, #58]
	ldrb	r2, [r4, #60]	@ zero_extendqisi2
	ldrb	r3, [r4, #63]	@ zero_extendqisi2
	ldrb	r5, [r4, #61]	@ zero_extendqisi2
	ldrb	lr, [r4, #62]	@ zero_extendqisi2
	ldrb	ip, [r4, #64]	@ zero_extendqisi2
	ldrb	r0, [r4, #67]	@ zero_extendqisi2
	ldrb	r1, [r4, #65]	@ zero_extendqisi2
	strb	r2, [r4, #63]
	strb	r3, [r4, #60]
	ldrb	r2, [r4, #66]	@ zero_extendqisi2
	ldrb	r3, [r4, #68]	@ zero_extendqisi2
	strb	r5, [r4, #62]
	strb	lr, [r4, #61]
	ldrb	r5, [r4, #71]	@ zero_extendqisi2
	ldrb	lr, [r4, #69]	@ zero_extendqisi2
	strb	ip, [r4, #67]
	strb	r0, [r4, #64]
	ldrb	ip, [r4, #70]	@ zero_extendqisi2
	ldrb	r0, [r4, #72]	@ zero_extendqisi2
	strb	r1, [r4, #66]
	strb	r2, [r4, #65]
	ldrb	r1, [r4, #75]	@ zero_extendqisi2
	ldrb	r2, [r4, #73]	@ zero_extendqisi2
	strb	r3, [r4, #71]
	ldrb	r3, [r4, #74]	@ zero_extendqisi2
	strb	r5, [r4, #68]
	strb	lr, [r4, #70]
	strb	ip, [r4, #69]
	strb	r0, [r4, #75]
	strb	r1, [r4, #72]
	strb	r2, [r4, #74]
	strb	r3, [r4, #73]
	ldrb	r8, [r4, #76]	@ zero_extendqisi2
	ldrb	r0, [r4, #80]	@ zero_extendqisi2
	ldrb	r5, [r4, #79]	@ zero_extendqisi2
	ldrb	lr, [r4, #77]	@ zero_extendqisi2
	ldrb	ip, [r4, #78]	@ zero_extendqisi2
	ldrb	r1, [r4, #83]	@ zero_extendqisi2
	ldrb	r2, [r4, #81]	@ zero_extendqisi2
	ldrb	r3, [r4, #82]	@ zero_extendqisi2
	strb	r0, [r4, #83]
	str	r7, [r4, #84]
	str	r6, [r4, #88]
	strb	r8, [r4, #79]
	strb	r5, [r4, #76]
	strb	lr, [r4, #78]
	strb	ip, [r4, #77]
	strb	r1, [r4, #80]
	strb	r2, [r4, #82]
	strb	r3, [r4, #81]
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, lr}
	b	sha_transform
.L35:
	add	r0, r5, r1
	rsb	r2, r1, #56
	mov	r1, #0
	bl	memset
	b	.L36
	.size	sha_final, .-sha_final
	.align	2
	.global	sha_stream
	.syntax unified
	.arm
	.fpu vfp
	.type	sha_stream, %function
sha_stream:
	@ args = 0, pretend = 0, frame = 8192
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	sub	sp, sp, #8192
	ldr	r5, .L51
	ldr	lr, .L51+4
	ldr	ip, .L51+8
	ldr	r0, .L51+12
	ldr	r2, .L51+16
	sub	sp, sp, #4
	mov	r10, r1
	add	r7, r4, #28
	mov	r9, #8192
	mov	r3, #0
	stm	r4, {r5, lr}
	str	ip, [r4, #8]
	str	r0, [r4, #12]
	str	r2, [r4, #16]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
.L39:
	mov	r2, r9
	mov	r3, r10
	mov	r1, #1
	mov	r0, sp
	bl	fread
	cmp	r0, #0
	mov	r2, r0
	ble	.L50
	ldr	r3, [r4, #20]
	add	r1, r3, r0, lsl #3
	cmp	r3, r1
	ldr	r3, [r4, #24]
	str	r1, [r4, #20]
	addhi	r3, r3, #1
	add	r3, r3, r0, lsr #29
	cmp	r0, #63
	str	r3, [r4, #24]
	movle	r1, sp
	ble	.L43
	sub	r8, r0, #64
	bic	r6, r8, #63
	add	r6, r6, #64
	add	r6, sp, r6
	mov	ip, sp
.L45:
	add	r5, ip, #64
	mov	fp, r7
.L44:
	mov	lr, ip
	add	fp, fp, #16
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, ip, #16
	cmp	lr, r5
	str	r0, [fp, #-16]	@ unaligned
	str	r1, [fp, #-12]	@ unaligned
	str	r2, [fp, #-8]	@ unaligned
	str	r3, [fp, #-4]	@ unaligned
	bne	.L44
	ldrb	r0, [r4, #28]	@ zero_extendqisi2
	ldrb	r1, [r4, #31]	@ zero_extendqisi2
	ldrb	r2, [r4, #29]	@ zero_extendqisi2
	ldrb	r3, [r4, #30]	@ zero_extendqisi2
	ldrb	lr, [r4, #32]	@ zero_extendqisi2
	ldrb	ip, [r4, #35]	@ zero_extendqisi2
	strb	r0, [r4, #31]
	strb	r1, [r4, #28]
	ldrb	r0, [r4, #33]	@ zero_extendqisi2
	ldrb	r1, [r4, #34]	@ zero_extendqisi2
	strb	r2, [r4, #30]
	strb	r3, [r4, #29]
	ldrb	r2, [r4, #36]	@ zero_extendqisi2
	ldrb	r3, [r4, #39]	@ zero_extendqisi2
	strb	lr, [r4, #35]
	strb	ip, [r4, #32]
	ldrb	lr, [r4, #37]	@ zero_extendqisi2
	ldrb	ip, [r4, #38]	@ zero_extendqisi2
	strb	r0, [r4, #34]
	strb	r1, [r4, #33]
	ldrb	r0, [r4, #40]	@ zero_extendqisi2
	ldrb	r1, [r4, #43]	@ zero_extendqisi2
	strb	r2, [r4, #39]
	strb	r3, [r4, #36]
	ldrb	r2, [r4, #41]	@ zero_extendqisi2
	ldrb	r3, [r4, #42]	@ zero_extendqisi2
	strb	lr, [r4, #38]
	strb	ip, [r4, #37]
	strb	r1, [r4, #40]
	strb	r2, [r4, #42]
	strb	r3, [r4, #41]
	strb	r0, [r4, #43]
	ldrb	r0, [r4, #44]	@ zero_extendqisi2
	ldrb	r1, [r4, #47]	@ zero_extendqisi2
	ldrb	r2, [r4, #45]	@ zero_extendqisi2
	ldrb	r3, [r4, #46]	@ zero_extendqisi2
	ldrb	lr, [r4, #48]	@ zero_extendqisi2
	ldrb	ip, [r4, #51]	@ zero_extendqisi2
	strb	r0, [r4, #47]
	strb	r1, [r4, #44]
	ldrb	r0, [r4, #49]	@ zero_extendqisi2
	ldrb	r1, [r4, #50]	@ zero_extendqisi2
	strb	r2, [r4, #46]
	strb	r3, [r4, #45]
	ldrb	r2, [r4, #52]	@ zero_extendqisi2
	ldrb	r3, [r4, #55]	@ zero_extendqisi2
	strb	lr, [r4, #51]
	strb	ip, [r4, #48]
	ldrb	lr, [r4, #53]	@ zero_extendqisi2
	ldrb	ip, [r4, #54]	@ zero_extendqisi2
	strb	r0, [r4, #50]
	strb	r1, [r4, #49]
	ldrb	r0, [r4, #56]	@ zero_extendqisi2
	ldrb	r1, [r4, #59]	@ zero_extendqisi2
	strb	r2, [r4, #55]
	strb	r3, [r4, #52]
	ldrb	r2, [r4, #57]	@ zero_extendqisi2
	ldrb	r3, [r4, #58]	@ zero_extendqisi2
	strb	lr, [r4, #54]
	strb	ip, [r4, #53]
	strb	r1, [r4, #56]
	strb	r2, [r4, #58]
	strb	r3, [r4, #57]
	strb	r0, [r4, #59]
	ldrb	r0, [r4, #60]	@ zero_extendqisi2
	ldrb	r1, [r4, #63]	@ zero_extendqisi2
	ldrb	r2, [r4, #61]	@ zero_extendqisi2
	ldrb	r3, [r4, #62]	@ zero_extendqisi2
	ldrb	lr, [r4, #64]	@ zero_extendqisi2
	ldrb	ip, [r4, #67]	@ zero_extendqisi2
	strb	r0, [r4, #63]
	strb	r1, [r4, #60]
	ldrb	r0, [r4, #65]	@ zero_extendqisi2
	ldrb	r1, [r4, #66]	@ zero_extendqisi2
	strb	r2, [r4, #62]
	strb	r3, [r4, #61]
	ldrb	r2, [r4, #68]	@ zero_extendqisi2
	ldrb	r3, [r4, #71]	@ zero_extendqisi2
	strb	lr, [r4, #67]
	strb	ip, [r4, #64]
	ldrb	lr, [r4, #69]	@ zero_extendqisi2
	ldrb	ip, [r4, #70]	@ zero_extendqisi2
	strb	r0, [r4, #66]
	strb	r1, [r4, #65]
	ldrb	r0, [r4, #72]	@ zero_extendqisi2
	ldrb	r1, [r4, #75]	@ zero_extendqisi2
	strb	r2, [r4, #71]
	strb	r3, [r4, #68]
	ldrb	r2, [r4, #73]	@ zero_extendqisi2
	ldrb	r3, [r4, #74]	@ zero_extendqisi2
	strb	lr, [r4, #70]
	strb	ip, [r4, #69]
	strb	r1, [r4, #72]
	strb	r2, [r4, #74]
	strb	r3, [r4, #73]
	strb	r0, [r4, #75]
	ldrb	r0, [r4, #76]	@ zero_extendqisi2
	ldrb	r1, [r4, #79]	@ zero_extendqisi2
	ldrb	r2, [r4, #77]	@ zero_extendqisi2
	ldrb	r3, [r4, #78]	@ zero_extendqisi2
	ldrb	lr, [r4, #80]	@ zero_extendqisi2
	ldrb	ip, [r4, #83]	@ zero_extendqisi2
	strb	r0, [r4, #79]
	strb	r1, [r4, #76]
	ldrb	r0, [r4, #81]	@ zero_extendqisi2
	ldrb	r1, [r4, #82]	@ zero_extendqisi2
	strb	r2, [r4, #78]
	strb	r3, [r4, #77]
	ldrb	r2, [r4, #84]	@ zero_extendqisi2
	ldrb	r3, [r4, #87]	@ zero_extendqisi2
	strb	lr, [r4, #83]
	strb	ip, [r4, #80]
	ldrb	lr, [r4, #85]	@ zero_extendqisi2
	ldrb	ip, [r4, #86]	@ zero_extendqisi2
	strb	r0, [r4, #82]
	strb	r1, [r4, #81]
	ldrb	r0, [r4, #88]	@ zero_extendqisi2
	ldrb	r1, [r4, #91]	@ zero_extendqisi2
	strb	r2, [r4, #87]
	strb	r3, [r4, #84]
	ldrb	r2, [r4, #89]	@ zero_extendqisi2
	ldrb	r3, [r4, #90]	@ zero_extendqisi2
	strb	ip, [r4, #85]
	strb	r0, [r4, #91]
	strb	lr, [r4, #86]
	strb	r1, [r4, #88]
	strb	r2, [r4, #90]
	strb	r3, [r4, #89]
	mov	r0, r4
	bl	sha_transform
	cmp	r6, r5
	mov	ip, r5
	bne	.L45
	and	r2, r8, #63
	mov	r1, r6
.L43:
	mov	r0, r7
	bl	memcpy
	b	.L39
.L50:
	mov	r0, r4
	bl	sha_final
	add	sp, sp, #8192
	add	sp, sp, #4
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L52:
	.align	2
.L51:
	.word	1732584193
	.word	-271733879
	.word	-1732584194
	.word	271733878
	.word	-1009589776
	.size	sha_stream, .-sha_stream
	.align	2
	.global	sha_print
	.syntax unified
	.arm
	.fpu vfp
	.type	sha_print, %function
sha_print:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldm	ip, {r1, r2, r3}
	ldr	lr, [ip, #16]
	ldr	ip, [ip, #12]
	ldr	r0, .L55
	stm	sp, {ip, lr}
	bl	printf
	add	sp, sp, #12
	@ sp needed
	ldr	pc, [sp], #4
.L56:
	.align	2
.L55:
	.word	.LC0
	.size	sha_print, .-sha_print
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, r1
	sub	sp, sp, #100
	ldr	r0, .L62
	ldr	r1, .L62+4
	bl	fopen
	subs	r4, r0, #0
	beq	.L61
	add	r0, sp, #4
	mov	r1, r4
	bl	sha_stream
	add	r0, sp, #4
	bl	sha_print
	mov	r0, r4
	bl	fclose
.L59:
	mov	r0, #0
	add	sp, sp, #100
	@ sp needed
	pop	{r4, r5, pc}
.L61:
	ldr	r1, [r5]
	ldr	r0, .L62+8
	bl	printf
	b	.L59
.L63:
	.align	2
.L62:
	.word	.LC2
	.word	.LC1
	.word	.LC3
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"%08lx %08lx %08lx %08lx %08lx\012\000"
	.space	1
.LC1:
	.ascii	"rb\000"
	.space	1
.LC2:
	.ascii	"input_small.asc\000"
.LC3:
	.ascii	"error opening %s for reading\012\000"
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
