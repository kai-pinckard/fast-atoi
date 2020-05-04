	.file	"converter.c"
	.text
	.p2align 4,,15
	.globl	convert_all
	.type	convert_all, @function
convert_all:
.LFB35:
	.cfi_startproc
	testl	%edi, %edi
	je	.L10
	leal	-1(%rdi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	8(%rsi,%rax,8), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	.p2align 4,,10
	.p2align 3
.L3:
	movq	(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	addq	$8, %rbx
	addq	$4, %rbp
	call	strtol@PLT
	movl	%eax, -4(%rbp)
	cmpq	%rbx, %r12
	jne	.L3
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE35:
	.size	convert_all, .-convert_all
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"%ld %d %d %d %d = %d %d %d %d |= %d\n"
	.text
	.p2align 4,,15
	.globl	printdigits
	.type	printdigits, @function
printdigits:
.LFB36:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	.LC0(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	11493248(%rdi), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	11493160(%rdi), %rbx
	.p2align 4,,10
	.p2align 3
.L15:
	movq	(%rbx), %rax
	movq	%r12, %rsi
	movl	$1, %edi
	addq	$8, %rbx
	movsbl	8(%rax), %edx
	movsbl	(%rax), %ecx
	pushq	%rdx
	.cfi_def_cfa_offset 40
	movsbl	7(%rax), %edx
	pushq	%rdx
	.cfi_def_cfa_offset 48
	movsbl	6(%rax), %edx
	pushq	%rdx
	.cfi_def_cfa_offset 56
	movsbl	5(%rax), %edx
	pushq	%rdx
	.cfi_def_cfa_offset 64
	movsbl	4(%rax), %edx
	pushq	%rdx
	.cfi_def_cfa_offset 72
	movsbl	3(%rax), %edx
	pushq	%rdx
	.cfi_def_cfa_offset 80
	movsbl	2(%rax), %r9d
	movl	$8, %edx
	movsbl	1(%rax), %r8d
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$48, %rsp
	.cfi_def_cfa_offset 32
	cmpq	%rbx, %rbp
	jne	.L15
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE36:
	.size	printdigits, .-printdigits
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"%d\n"
	.text
	.p2align 4,,15
	.globl	naive_convert
	.type	naive_convert, @function
naive_convert:
.LFB37:
	.cfi_startproc
	testl	%edi, %edi
	je	.L28
	leal	-1(%rdi), %eax
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	leaq	8(%rsi,%rax,8), %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	$-858993459, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rsi, %rbx
	.p2align 4,,10
	.p2align 3
.L20:
	movq	(%rbx), %r14
	movq	%r14, %rdi
	call	strlen@PLT
	xorl	%ecx, %ecx
	xorl	%edi, %edi
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L21:
	movsbl	(%r14,%rsi), %edx
	addl	$1, %ecx
	addl	%edi, %edx
	leal	(%rdx,%rdx,4), %edx
	leal	-480(%rdx,%rdx), %edi
.L22:
	movl	%ecx, %esi
	cmpq	%rax, %rsi
	jb	.L21
	movl	%edi, %eax
	leaq	.LC1(%rip), %rsi
	addq	$8, %rbx
	addq	$4, %rbp
	mull	%r12d
	movl	$1, %edi
	xorl	%eax, %eax
	shrl	$3, %edx
	movl	%edx, -4(%rbp)
	call	__printf_chk@PLT
	cmpq	%rbx, %r13
	jne	.L20
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L28:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
	.cfi_endproc
.LFE37:
	.size	naive_convert, .-naive_convert
	.p2align 4,,15
	.globl	convertv1
	.type	convertv1, @function
convertv1:
.LFB38:
	.cfi_startproc
	testl	%edi, %edi
	je	.L44
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leal	-1(%rdi), %r9d
	movq	%rdx, %r10
	xorl	%r8d, %r8d
	addq	$1, %r9
	movl	$-858993459, %r11d
	.p2align 4,,10
	.p2align 3
.L35:
	movq	(%rsi,%r8,8), %rbx
	movsbl	(%rbx), %ecx
	testb	%cl, %cl
	je	.L36
	xorl	%edi, %edi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L34:
	addl	%edx, %ecx
	leal	(%rcx,%rcx,4), %eax
	leal	-480(%rax,%rax), %edx
	leal	1(%rdi), %eax
	movsbl	(%rbx,%rax), %ecx
	movq	%rax, %rdi
	testb	%cl, %cl
	jne	.L34
	movl	%edx, %eax
	mull	%r11d
	shrl	$3, %edx
.L33:
	movl	%edx, (%r10,%r8,4)
	addq	$1, %r8
	cmpq	%r9, %r8
	jne	.L35
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L33
.L44:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE38:
	.size	convertv1, .-convertv1
	.p2align 4,,15
	.globl	convertv2
	.type	convertv2, @function
convertv2:
.LFB39:
	.cfi_startproc
	movq	%rdx, %r10
	testl	%edi, %edi
	je	.L58
	leal	-1(%rdi), %r9d
	xorl	%r8d, %r8d
	movl	$-858993459, %r11d
	addq	$1, %r9
	.p2align 4,,10
	.p2align 3
.L51:
	movq	(%rsi,%r8,8), %rdi
	xorl	%edx, %edx
	movsbl	(%rdi), %ecx
	testb	%cl, %cl
	je	.L49
	.p2align 4,,10
	.p2align 3
.L50:
	addl	%edx, %ecx
	addq	$1, %rdi
	leal	(%rcx,%rcx,4), %eax
	movsbl	(%rdi), %ecx
	leal	-480(%rax,%rax), %edx
	testb	%cl, %cl
	jne	.L50
	movl	%edx, %eax
	mull	%r11d
	shrl	$3, %edx
.L49:
	movl	%edx, (%r10,%r8,4)
	addq	$1, %r8
	cmpq	%r8, %r9
	jne	.L51
.L58:
	ret
	.cfi_endproc
.LFE39:
	.size	convertv2, .-convertv2
	.p2align 4,,15
	.globl	convertv3
	.type	convertv3, @function
convertv3:
.LFB40:
	.cfi_startproc
	testl	%edi, %edi
	je	.L73
	leal	-1(%rdi), %r9d
	xorl	%ecx, %ecx
	addq	$1, %r9
	.p2align 4,,10
	.p2align 3
.L62:
	movq	(%rsi,%rcx,8), %rax
	movsbl	(%rax), %edi
	leal	-240(%rdi,%rdi,4), %r8d
	movsbl	1(%rax), %edi
	leal	-48(%rdi,%r8,2), %edi
	leal	(%rdi,%rdi,4), %r8d
	movsbl	2(%rax), %edi
	leal	-48(%rdi,%r8,2), %edi
	movsbl	3(%rax), %r8d
	testb	%r8b, %r8b
	je	.L61
	movsbl	4(%rax), %eax
	leal	(%rdi,%rdi,4), %edi
	leal	-48(%r8,%rdi,2), %edi
	testb	%al, %al
	je	.L61
	leal	(%rdi,%rdi,4), %edi
	leal	-48(%rax,%rdi,2), %edi
.L61:
	movl	%edi, (%rdx,%rcx,4)
	addq	$1, %rcx
	cmpq	%rcx, %r9
	jne	.L62
.L73:
	ret
	.cfi_endproc
.LFE40:
	.size	convertv3, .-convertv3
	.p2align 4,,15
	.globl	convertv4
	.type	convertv4, @function
convertv4:
.LFB41:
	.cfi_startproc
	testl	%edi, %edi
	je	.L88
	leal	-1(%rdi), %r9d
	xorl	%ecx, %ecx
	addq	$1, %r9
	.p2align 4,,10
	.p2align 3
.L77:
	movq	(%rsi,%rcx,8), %rax
	movsbl	(%rax), %edi
	leal	-240(%rdi,%rdi,4), %r8d
	movsbl	1(%rax), %edi
	leal	-48(%rdi,%r8,2), %edi
	leal	(%rdi,%rdi,4), %r8d
	movsbl	2(%rax), %edi
	leal	-48(%rdi,%r8,2), %edi
	movsbl	3(%rax), %r8d
	testb	%r8b, %r8b
	je	.L76
	movsbl	4(%rax), %eax
	leal	(%rdi,%rdi,4), %edi
	leal	-48(%r8,%rdi,2), %edi
	testb	%al, %al
	jne	.L89
.L76:
	movl	%edi, (%rdx,%rcx,4)
	addq	$1, %rcx
	cmpq	%rcx, %r9
	jne	.L77
.L88:
	ret
	.p2align 4,,10
	.p2align 3
.L89:
	leal	(%rdi,%rdi,4), %edi
	leal	-48(%rax,%rdi,2), %edi
	jmp	.L76
	.cfi_endproc
.LFE41:
	.size	convertv4, .-convertv4
	.p2align 4,,15
	.globl	convertv5
	.type	convertv5, @function
convertv5:
.LFB42:
	.cfi_startproc
	leal	-1(%rdi), %r8d
	movq	(%rsi,%r8,8), %rax
	movsbl	(%rax), %ecx
	leal	-240(%rcx,%rcx,4), %edi
	movsbl	1(%rax), %ecx
	leal	-48(%rcx,%rdi,2), %ecx
	leal	(%rcx,%rcx,4), %edi
	movsbl	2(%rax), %ecx
	leal	-48(%rcx,%rdi,2), %ecx
	movsbl	3(%rax), %edi
	testb	%dil, %dil
	je	.L91
	movsbl	4(%rax), %eax
	leal	(%rcx,%rcx,4), %ecx
	leal	-48(%rdi,%rcx,2), %ecx
	testb	%al, %al
	jne	.L112
.L91:
	movq	(%rsi), %rax
	movl	%ecx, (%rdx,%r8,4)
	testq	%rax, %rax
	je	.L111
	.p2align 4,,10
	.p2align 3
.L94:
	movsbl	(%rax), %ecx
	leal	-240(%rcx,%rcx,4), %edi
	movsbl	1(%rax), %ecx
	leal	-48(%rcx,%rdi,2), %ecx
	leal	(%rcx,%rcx,4), %edi
	movsbl	2(%rax), %ecx
	leal	-48(%rcx,%rdi,2), %ecx
	movsbl	3(%rax), %edi
	testb	%dil, %dil
	je	.L93
	movsbl	4(%rax), %eax
	leal	(%rcx,%rcx,4), %ecx
	leal	-48(%rdi,%rcx,2), %ecx
	testb	%al, %al
	jne	.L113
.L93:
	addq	$8, %rsi
	movq	(%rsi), %rax
	movl	%ecx, (%rdx)
	addq	$4, %rdx
	testq	%rax, %rax
	jne	.L94
.L111:
	ret
	.p2align 4,,10
	.p2align 3
.L113:
	leal	(%rcx,%rcx,4), %ecx
	leal	-48(%rax,%rcx,2), %ecx
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L112:
	leal	(%rcx,%rcx,4), %ecx
	leal	-48(%rax,%rcx,2), %ecx
	jmp	.L91
	.cfi_endproc
.LFE42:
	.size	convertv5, .-convertv5
	.p2align 4,,15
	.globl	convertv6
	.type	convertv6, @function
convertv6:
.LFB43:
	.cfi_startproc
	testl	%edi, %edi
	je	.L126
	leal	-1(%rdi), %r9d
	xorl	%ecx, %ecx
	addq	$1, %r9
	.p2align 4,,10
	.p2align 3
.L118:
	movq	(%rsi,%rcx,8), %rax
	movsbl	(%rax), %edi
	leal	(%rdi,%rdi,4), %r8d
	movsbl	1(%rax), %edi
	leal	(%rdi,%r8,2), %edi
	leal	(%rdi,%rdi,4), %r8d
	movsbl	2(%rax), %edi
	leal	-5328(%rdi,%r8,2), %r8d
	movsbl	3(%rax), %edi
	testb	%dil, %dil
	je	.L116
	leal	(%r8,%r8,4), %r8d
	addl	%r8d, %r8d
	leal	-48(%r8,%rdi), %edi
	movl	%edi, (%rdx,%rcx,4)
	movsbl	4(%rax), %eax
	testb	%al, %al
	jne	.L127
.L117:
	addq	$1, %rcx
	cmpq	%rcx, %r9
	jne	.L118
.L126:
	ret
	.p2align 4,,10
	.p2align 3
.L116:
	movl	%r8d, (%rdx,%rcx,4)
	jmp	.L117
	.p2align 4,,10
	.p2align 3
.L127:
	leal	-48(%r8,%rax), %eax
	movl	%eax, (%rdx,%rcx,4)
	jmp	.L117
	.cfi_endproc
.LFE43:
	.size	convertv6, .-convertv6
	.p2align 4,,15
	.globl	convertv7
	.type	convertv7, @function
convertv7:
.LFB44:
	.cfi_startproc
	testl	%edi, %edi
	je	.L138
	leal	-1(%rdi), %r9d
	xorl	%ecx, %ecx
	addq	$1, %r9
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L139:
	leal	(%rdi,%rdi,4), %edi
	leal	-53328(%rax,%rdi,2), %edi
.L131:
	movl	%edi, (%rdx,%rcx,4)
	addq	$1, %rcx
	cmpq	%rcx, %r9
	je	.L138
.L133:
	movq	(%rsi,%rcx,8), %rax
	movsbl	(%rax), %edi
	leal	(%rdi,%rdi,4), %r8d
	movsbl	1(%rax), %edi
	leal	(%rdi,%r8,2), %edi
	leal	(%rdi,%rdi,4), %r8d
	movsbl	2(%rax), %edi
	leal	(%rdi,%r8,2), %edi
	movsbl	4(%rax), %r8d
	movsbl	3(%rax), %eax
	testb	%r8b, %r8b
	je	.L139
	testb	%al, %al
	jne	.L132
	subl	$5328, %edi
	movl	%edi, (%rdx,%rcx,4)
	addq	$1, %rcx
	cmpq	%rcx, %r9
	jne	.L133
.L138:
	ret
	.p2align 4,,10
	.p2align 3
.L132:
	leal	(%rdi,%rdi,4), %edi
	leal	(%rax,%rdi,2), %eax
	leal	(%rax,%rax,4), %eax
	leal	-533328(%r8,%rax,2), %edi
	jmp	.L131
	.cfi_endproc
.LFE44:
	.size	convertv7, .-convertv7
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
