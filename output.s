	.file	"fonction_tout.c"
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"test"
	.align 8
.LC2:
	.string	"Le nombre de caract\303\250res maximum pour la ligne est : %d\n"
.LC3:
	.string	"\nContour \303\240 gauche:"
.LC4:
	.string	"%s"
.LC5:
	.string	"\nContour au milieu:"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1104, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1080(%rbp)
	movl	$0, -1088(%rbp)
	jmp	.L2
.L3:
	movl	-1088(%rbp), %eax
	cltq
	movzbl	-1089(%rbp), %edx
	movb	%dl, -1072(%rbp,%rax)
	addl	$1, -1088(%rbp)
.L2:
	movq	-1080(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -1089(%rbp)
	cmpb	$-1, -1089(%rbp)
	jne	.L3
	movl	-1088(%rbp), %eax
	subl	$1, %eax
	cltq
	movzbl	-1072(%rbp,%rax), %eax
	cmpb	$110, %al
	je	.L4
	movl	-1088(%rbp), %eax
	cltq
	movb	$10, -1072(%rbp,%rax)
	movl	-1088(%rbp), %eax
	addl	$1, %eax
	cltq
	movb	$0, -1072(%rbp,%rax)
	jmp	.L5
.L4:
	movl	-1088(%rbp), %eax
	cltq
	movb	$0, -1072(%rbp,%rax)
.L5:
	movl	$12, -1084(%rbp)
	movl	-1084(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-1084(%rbp), %edx
	leaq	-1008(%rbp), %rcx
	leaq	-1072(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	contour
	leaq	-1008(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-1084(%rbp), %edx
	leaq	-1008(%rbp), %rcx
	leaq	-1072(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	contour_milieu
	leaq	-1008(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	-1084(%rbp), %edx
	leaq	-1008(%rbp), %rcx
	leaq	-1072(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	contour_droite
	leaq	-1008(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-1080(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC6:
	.string	"Le nombre maximale de ligne est trop petit par rapport \303\240 la taille des mots!"
	.text
	.globl	contour
	.type	contour, @function
contour:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	movl	%edx, -164(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -132(%rbp)
	jmp	.L9
.L10:
	movq	-160(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -160(%rbp)
	addl	$1, -132(%rbp)
.L9:
	movl	-164(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -132(%rbp)
	jle	.L10
	movq	-160(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -160(%rbp)
	movl	$0, -128(%rbp)
	jmp	.L11
.L24:
	movl	-128(%rbp), %eax
	cmpl	-164(%rbp), %eax
	jne	.L12
	movq	-152(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L13
	addq	$1, -152(%rbp)
.L13:
	movq	-160(%rbp), %rax
	movb	$42, (%rax)
	movl	$0, -128(%rbp)
	addq	$1, -160(%rbp)
	movq	-160(%rbp), %rax
	movb	$10, (%rax)
	jmp	.L14
.L12:
	movq	-160(%rbp), %rax
	subq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L15
	movq	-160(%rbp), %rax
	movb	$42, (%rax)
	movl	$0, -128(%rbp)
	jmp	.L14
.L15:
	movq	-152(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	jne	.L16
	movq	-160(%rbp), %rax
	movb	$32, (%rax)
	addq	$1, -152(%rbp)
	addl	$1, -128(%rbp)
	jmp	.L14
.L16:
	movq	-152(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L17
	movl	$0, -124(%rbp)
	jmp	.L18
.L19:
	movq	-160(%rbp), %rax
	movb	$32, (%rax)
	addq	$1, -160(%rbp)
	addl	$1, -124(%rbp)
.L18:
	movl	-164(%rbp), %eax
	subl	-128(%rbp), %eax
	cmpl	%eax, -124(%rbp)
	jl	.L19
	movq	-160(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -160(%rbp)
	movq	-160(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -152(%rbp)
	movl	$0, -128(%rbp)
	jmp	.L14
.L17:
	leaq	-136(%rbp), %rdx
	leaq	-112(%rbp), %rcx
	movq	-152(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	lire_mot
	movl	-164(%rbp), %eax
	subl	-128(%rbp), %eax
	movl	%eax, %edx
	movl	-136(%rbp), %eax
	cmpl	%eax, %edx
	jl	.L20
	movl	-136(%rbp), %edx
	leaq	-112(%rbp), %rcx
	movq	-160(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	ecrire_mot
	movl	-136(%rbp), %eax
	cltq
	subq	$1, %rax
	addq	%rax, -160(%rbp)
	movl	-136(%rbp), %eax
	cltq
	addq	%rax, -152(%rbp)
	movl	-136(%rbp), %eax
	addl	%eax, -128(%rbp)
	jmp	.L14
.L20:
	cmpl	$0, -128(%rbp)
	jne	.L21
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L21:
	movl	$0, -120(%rbp)
	jmp	.L22
.L23:
	movq	-160(%rbp), %rax
	movb	$32, (%rax)
	addq	$1, -160(%rbp)
	addl	$1, -120(%rbp)
.L22:
	movl	-164(%rbp), %eax
	subl	-128(%rbp), %eax
	cmpl	%eax, -120(%rbp)
	jl	.L23
	movq	-160(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -160(%rbp)
	movq	-160(%rbp), %rax
	movb	$10, (%rax)
.L14:
	addq	$1, -160(%rbp)
.L11:
	movq	-152(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L24
	movl	$0, -116(%rbp)
	jmp	.L25
.L26:
	movq	-160(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -160(%rbp)
	addl	$1, -116(%rbp)
.L25:
	movl	-164(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -116(%rbp)
	jle	.L26
	movq	-160(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -160(%rbp)
	movq	-160(%rbp), %rax
	movb	$0, (%rax)
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L27
	call	__stack_chk_fail@PLT
.L27:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	contour, .-contour
	.globl	contour_milieu
	.type	contour_milieu, @function
contour_milieu:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$304, %rsp
	movq	%rdi, -280(%rbp)
	movq	%rsi, -288(%rbp)
	movl	%edx, -292(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -264(%rbp)
	jmp	.L29
.L30:
	movq	-288(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -288(%rbp)
	addl	$1, -264(%rbp)
.L29:
	movl	-292(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -264(%rbp)
	jle	.L30
	movq	-288(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -288(%rbp)
	movl	$0, -260(%rbp)
	movl	$0, -256(%rbp)
	jmp	.L31
.L50:
	movl	-256(%rbp), %eax
	cmpl	-292(%rbp), %eax
	jne	.L32
	movq	-280(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L33
	addq	$1, -280(%rbp)
.L33:
	movl	-260(%rbp), %edx
	leaq	-112(%rbp), %rcx
	movq	-288(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	ecrire_mot
	movl	-260(%rbp), %eax
	cltq
	addq	%rax, -288(%rbp)
	movq	-288(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -288(%rbp)
	movq	-288(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -288(%rbp)
	movl	$0, -260(%rbp)
	movl	$0, -256(%rbp)
	jmp	.L31
.L32:
	movq	-288(%rbp), %rax
	subq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L35
	movq	-288(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -288(%rbp)
	movl	$0, -256(%rbp)
	movl	$0, -260(%rbp)
	jmp	.L31
.L35:
	movq	-280(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	jne	.L36
	movl	-260(%rbp), %eax
	cltq
	movb	$32, -112(%rbp,%rax)
	addl	$1, -260(%rbp)
	addl	$1, -256(%rbp)
	addq	$1, -280(%rbp)
	jmp	.L31
.L36:
	movq	-280(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L37
	movl	-260(%rbp), %eax
	subl	$1, %eax
	cltq
	movzbl	-112(%rbp,%rax), %eax
	cmpb	$32, %al
	jne	.L38
	subl	$1, -260(%rbp)
	subl	$1, -256(%rbp)
.L38:
	movl	-292(%rbp), %eax
	subl	-256(%rbp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$31, %eax
	addl	%eax, %edx
	andl	$1, %edx
	subl	%eax, %edx
	movl	%edx, -228(%rbp)
	movl	$0, -252(%rbp)
	jmp	.L39
.L40:
	movq	-288(%rbp), %rax
	movb	$32, (%rax)
	addq	$1, -288(%rbp)
	addl	$1, -252(%rbp)
.L39:
	movl	-292(%rbp), %eax
	subl	-256(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -252(%rbp)
	jl	.L40
	movl	-260(%rbp), %edx
	leaq	-112(%rbp), %rcx
	movq	-288(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	ecrire_mot
	movl	-260(%rbp), %eax
	cltq
	addq	%rax, -288(%rbp)
	movl	$0, -248(%rbp)
	jmp	.L41
.L42:
	movq	-288(%rbp), %rax
	movb	$32, (%rax)
	addq	$1, -288(%rbp)
	addl	$1, -248(%rbp)
.L41:
	movl	-292(%rbp), %eax
	subl	-256(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %edx
	movl	-228(%rbp), %eax
	addl	%edx, %eax
	cmpl	%eax, -248(%rbp)
	jl	.L42
	movq	-288(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -288(%rbp)
	movq	-288(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -288(%rbp)
	addq	$1, -280(%rbp)
	jmp	.L31
.L37:
	leaq	-268(%rbp), %rdx
	leaq	-224(%rbp), %rcx
	movq	-280(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	lire_mot
	movl	-292(%rbp), %eax
	subl	-256(%rbp), %eax
	movl	%eax, %edx
	movl	-268(%rbp), %eax
	cmpl	%eax, %edx
	jl	.L43
	movl	-268(%rbp), %edx
	movl	-260(%rbp), %eax
	cltq
	leaq	-112(%rbp), %rcx
	addq	%rax, %rcx
	leaq	-224(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	ecrire_mot
	movl	-268(%rbp), %eax
	addl	%eax, -260(%rbp)
	movl	-268(%rbp), %eax
	addl	%eax, -256(%rbp)
	movl	-268(%rbp), %eax
	cltq
	addq	%rax, -280(%rbp)
	jmp	.L31
.L43:
	cmpl	$0, -256(%rbp)
	jne	.L44
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L44:
	movl	-260(%rbp), %eax
	subl	$1, %eax
	cltq
	movzbl	-112(%rbp,%rax), %eax
	cmpb	$32, %al
	jne	.L45
	subl	$1, -260(%rbp)
	subl	$1, -256(%rbp)
.L45:
	movl	-292(%rbp), %eax
	subl	-256(%rbp), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$31, %eax
	addl	%eax, %edx
	andl	$1, %edx
	subl	%eax, %edx
	movl	%edx, -232(%rbp)
	movl	$0, -244(%rbp)
	jmp	.L46
.L47:
	movq	-288(%rbp), %rax
	movb	$32, (%rax)
	addq	$1, -288(%rbp)
	addl	$1, -244(%rbp)
.L46:
	movl	-292(%rbp), %eax
	subl	-256(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -244(%rbp)
	jl	.L47
	movl	-260(%rbp), %edx
	leaq	-112(%rbp), %rcx
	movq	-288(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	ecrire_mot
	movl	-260(%rbp), %eax
	cltq
	addq	%rax, -288(%rbp)
	movl	$0, -240(%rbp)
	jmp	.L48
.L49:
	movq	-288(%rbp), %rax
	movb	$32, (%rax)
	addq	$1, -288(%rbp)
	addl	$1, -240(%rbp)
.L48:
	movl	-292(%rbp), %eax
	subl	-256(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, %edx
	movl	-232(%rbp), %eax
	addl	%edx, %eax
	cmpl	%eax, -240(%rbp)
	jl	.L49
	movq	-288(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -288(%rbp)
	movq	-288(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -288(%rbp)
.L31:
	movq	-280(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L50
	movl	$0, -236(%rbp)
	jmp	.L51
.L52:
	movq	-288(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -288(%rbp)
	addl	$1, -236(%rbp)
.L51:
	movl	-292(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -236(%rbp)
	jle	.L52
	movq	-288(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -288(%rbp)
	movq	-288(%rbp), %rax
	movb	$0, (%rax)
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L53
	call	__stack_chk_fail@PLT
.L53:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	contour_milieu, .-contour_milieu
	.globl	contour_droite
	.type	contour_droite, @function
contour_droite:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$288, %rsp
	movq	%rdi, -264(%rbp)
	movq	%rsi, -272(%rbp)
	movl	%edx, -276(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -248(%rbp)
	jmp	.L55
.L56:
	movq	-272(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -272(%rbp)
	addl	$1, -248(%rbp)
.L55:
	movl	-276(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -248(%rbp)
	jle	.L56
	movq	-272(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -272(%rbp)
	movl	$0, -244(%rbp)
	movl	$0, -240(%rbp)
	jmp	.L57
.L73:
	movl	-240(%rbp), %eax
	cmpl	-276(%rbp), %eax
	jne	.L58
	movq	-264(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L59
	addq	$1, -264(%rbp)
.L59:
	movl	-244(%rbp), %eax
	subl	$1, %eax
	cltq
	movzbl	-112(%rbp,%rax), %eax
	cmpb	$32, %al
	jne	.L60
	subl	$1, -244(%rbp)
	subl	$1, -240(%rbp)
	movq	-272(%rbp), %rax
	movb	$32, (%rax)
	addq	$1, -272(%rbp)
.L60:
	movl	-244(%rbp), %edx
	leaq	-112(%rbp), %rcx
	movq	-272(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	ecrire_mot
	movl	-244(%rbp), %eax
	cltq
	addq	%rax, -272(%rbp)
	movq	-272(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -272(%rbp)
	movq	-272(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -272(%rbp)
	movl	$0, -244(%rbp)
	movl	$0, -240(%rbp)
	jmp	.L57
.L58:
	movq	-272(%rbp), %rax
	subq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L62
	movq	-272(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -272(%rbp)
	movl	$0, -240(%rbp)
	movl	$0, -244(%rbp)
	jmp	.L57
.L62:
	movq	-264(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	jne	.L63
	movl	-244(%rbp), %eax
	cltq
	movb	$32, -112(%rbp,%rax)
	addl	$1, -244(%rbp)
	addl	$1, -240(%rbp)
	addq	$1, -264(%rbp)
	jmp	.L57
.L63:
	movq	-264(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	jne	.L64
	movl	-244(%rbp), %eax
	subl	$1, %eax
	cltq
	movzbl	-112(%rbp,%rax), %eax
	cmpb	$32, %al
	jne	.L65
	subl	$1, -244(%rbp)
	subl	$1, -240(%rbp)
.L65:
	movl	$0, -236(%rbp)
	jmp	.L66
.L67:
	movq	-272(%rbp), %rax
	movb	$32, (%rax)
	addq	$1, -272(%rbp)
	addl	$1, -236(%rbp)
.L66:
	movl	-276(%rbp), %eax
	subl	-240(%rbp), %eax
	cmpl	%eax, -236(%rbp)
	jl	.L67
	movl	-244(%rbp), %edx
	leaq	-112(%rbp), %rcx
	movq	-272(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	ecrire_mot
	movl	-244(%rbp), %eax
	cltq
	addq	%rax, -272(%rbp)
	movq	-272(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -272(%rbp)
	movq	-272(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -272(%rbp)
	addq	$1, -264(%rbp)
	jmp	.L57
.L64:
	leaq	-252(%rbp), %rdx
	leaq	-224(%rbp), %rcx
	movq	-264(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	lire_mot
	movl	-276(%rbp), %eax
	subl	-240(%rbp), %eax
	movl	%eax, %edx
	movl	-252(%rbp), %eax
	cmpl	%eax, %edx
	jl	.L68
	movl	-252(%rbp), %edx
	movl	-244(%rbp), %eax
	cltq
	leaq	-112(%rbp), %rcx
	addq	%rax, %rcx
	leaq	-224(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	ecrire_mot
	movl	-252(%rbp), %eax
	addl	%eax, -244(%rbp)
	movl	-252(%rbp), %eax
	addl	%eax, -240(%rbp)
	movl	-252(%rbp), %eax
	cltq
	addq	%rax, -264(%rbp)
	jmp	.L57
.L68:
	cmpl	$0, -240(%rbp)
	jne	.L69
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %edi
	call	exit@PLT
.L69:
	movl	-244(%rbp), %eax
	subl	$1, %eax
	cltq
	movzbl	-112(%rbp,%rax), %eax
	cmpb	$32, %al
	jne	.L70
	subl	$1, -244(%rbp)
	subl	$1, -240(%rbp)
.L70:
	movl	$0, -232(%rbp)
	jmp	.L71
.L72:
	movq	-272(%rbp), %rax
	movb	$32, (%rax)
	addq	$1, -272(%rbp)
	addl	$1, -232(%rbp)
.L71:
	movl	-276(%rbp), %eax
	subl	-240(%rbp), %eax
	cmpl	%eax, -232(%rbp)
	jl	.L72
	movl	-244(%rbp), %edx
	leaq	-112(%rbp), %rcx
	movq	-272(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	ecrire_mot
	movl	-244(%rbp), %eax
	cltq
	addq	%rax, -272(%rbp)
	movq	-272(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -272(%rbp)
	movq	-272(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -272(%rbp)
.L57:
	movq	-264(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L73
	movl	$0, -228(%rbp)
	jmp	.L74
.L75:
	movq	-272(%rbp), %rax
	movb	$42, (%rax)
	addq	$1, -272(%rbp)
	addl	$1, -228(%rbp)
.L74:
	movl	-276(%rbp), %eax
	addl	$1, %eax
	cmpl	%eax, -228(%rbp)
	jle	.L75
	movq	-272(%rbp), %rax
	movb	$10, (%rax)
	addq	$1, -272(%rbp)
	movq	-272(%rbp), %rax
	movb	$0, (%rax)
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L76
	call	__stack_chk_fail@PLT
.L76:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	contour_droite, .-contour_droite
	.globl	lire_mot
	.type	lire_mot, @function
lire_mot:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L78
.L80:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %ecx
	movq	-24(%rbp), %rdx
	movl	%ecx, (%rdx)
	movslq	%eax, %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addq	$1, -8(%rbp)
.L78:
	cmpq	$0, -8(%rbp)
	je	.L81
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$32, %al
	je	.L81
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$10, %al
	je	.L81
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L80
.L81:
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	lire_mot, .-lire_mot
	.globl	ecrire_mot
	.type	ecrire_mot, @function
ecrire_mot:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L83
.L84:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movq	-24(%rbp), %rax
	movb	%dl, (%rax)
	addq	$1, -24(%rbp)
	addl	$1, -4(%rbp)
.L83:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L84
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	ecrire_mot, .-ecrire_mot
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
