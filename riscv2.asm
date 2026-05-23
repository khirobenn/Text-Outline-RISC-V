.data

choix1: .asciz "1. Contour à gauche.\n"
choix2: .asciz "2. Contour au milieu.\n"
choix3: .asciz "3. Contour à droite.\n"
fleche: .asciz "--> " 

demande_nb_max: .asciz "\nVeuillez entrer le nombre de caractères maximum pour une ligne : "

erreur_message: .asciz "\nLe nombre de caractères maximum est trop petit par rapport au mots du fichier"

chaine:	.asciz "khio lea\nmain3 hhh\n"
buff:	.space 100

.text
main:
	# On affiche à l'utilisateur le menu pour qu'il choisis le type de contour qu'il veut
	ori a7, zero, 4
	la a0, choix1
	ecall
	la a0, choix2
	ecall
	la a0, choix3
	ecall
	la a0, fleche
	ecall
	
	ori a7, zero, 5
	ecall
	or s0, zero, a0 # On stocke le choix de l'utilisateur dans s0
	
	# On demande le nombre maximum de caractères pour une ligne
	
	ori a7, zero, 4
	la a0, demande_nb_max
	ecall
	
	ori a7, zero, 5
	ecall
	# On met le nombre de caractères maximum dans a2 car a2 sera le troisième paramétre des fonctions contour
	or a2, zero, a0
	
	#####
	ori a7, zero, 11
	ori a0, zero, '\n'
	ecall
		
	#####
	
	# On prépare les paramétres des fonctions contour
	# on a déjà dans a2 ce qu'on veut, il reste a0 = chaine et a1 = buff
	la a0, chaine
	la a1, buff 
	# parfait!!
	
	
# On saute vers les tests pour savoir laquelle choisir
	ori s1, zero, 1
	bne s0, s1, test_choix2
	call contour
	beq a0, zero, erreur
	j fin
	
test_choix2:
	ori s1, zero, 2
	bne s0, s1, test_choix3
	call contour_milieu
	beq a0, zero, erreur
	j fin
	
test_choix3:
	ori s1, zero, 2
	bne s0, s1, fin_sans_affichage
	call contour_milieu
	beq a0, zero, erreur

fin:	
	ori a7, zero, 4
	la a0, buff
	ecall
	j fin_sans_affichage
	
erreur:
	ori a7, zero, 4
	la a0, erreur_message
	ecall
fin_sans_affichage:
	ori a7, zero, 10
	ecall
# ------------ Fin du main ----------------------


# Tout ce qui est en bas à partir d'ici est une conversion du code C dans le fichier "" grâce
# au site web https://godbolt.org/ et en choisissant le type d'assembleur RISC-V (32 bits) gcc (trunk)
        
lire_mot:
        addi    sp,sp,-32
        sw      ra,28(sp)
        sw      s0,24(sp)
        addi    s0,sp,32
        sw      a0,-20(s0)
        sw      a1,-24(s0)
        sw      a2,-28(s0)
        lw      a5,-28(s0)
        sw      zero,0(a5)
        j       .L2
.L4:
        lw      a5,-28(s0)
        lw      a5,0(a5)
        addi    a3,a5,1
        lw      a4,-28(s0)
        sw      a3,0(a4)
        mv      a4,a5
        lw      a5,-24(s0)
        add     a5,a5,a4
        lw      a4,-20(s0)
        lbu     a4,0(a4)
        sb      a4,0(a5)
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L2:
        lw      a5,-20(s0)
        beq     a5,zero,.L5
        lw      a5,-20(s0)
        lbu     a4,0(a5)
        li      a5,32
        beq     a4,a5,.L5
        lw      a5,-20(s0)
        lbu     a4,0(a5)
        li      a5,10
        beq     a4,a5,.L5
        lw      a5,-20(s0)
        lbu     a5,0(a5)
        bne     a5,zero,.L4
.L5:
        nop
        lw      ra,28(sp)
        lw      s0,24(sp)
        addi    sp,sp,32
        jr      ra
ecrire_mot:
        addi    sp,sp,-48
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0)
        sw      a1,-40(s0)
        sw      a2,-44(s0)
        sw      zero,-20(s0)
        j       .L7
.L8:
        lw      a5,-20(s0)
        lw      a4,-40(s0)
        add     a5,a4,a5
        lbu     a4,0(a5)
        lw      a5,-36(s0)
        sb      a4,0(a5)
        lw      a5,-36(s0)
        addi    a5,a5,1
        sw      a5,-36(s0)
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L7:
        lw      a4,-20(s0)
        lw      a5,-44(s0)
        blt     a4,a5,.L8
        nop
        nop
        lw      ra,44(sp)
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra
contour:
        addi    sp,sp,-160
        sw      ra,156(sp)
        sw      s0,152(sp)
        addi    s0,sp,160
        sw      a0,-148(s0)
        sw      a1,-152(s0)
        sw      a2,-156(s0)
        sw      zero,-20(s0)
        j       .L10
.L11:
        lw      a5,-152(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-152(s0)
        addi    a5,a5,1
        sw      a5,-152(s0)
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L10:
        lw      a5,-156(s0)
        addi    a5,a5,1
        lw      a4,-20(s0)
        ble     a4,a5,.L11
        lw      a5,-152(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-152(s0)
        addi    a5,a5,1
        sw      a5,-152(s0)
        sw      zero,-24(s0)
        j       .L12
.L26:
        lw      a4,-24(s0)
        lw      a5,-156(s0)
        bne     a4,a5,.L13
        lw      a5,-148(s0)
        lbu     a4,0(a5)
        li      a5,10
        bne     a4,a5,.L14
        lw      a5,-148(s0)
        addi    a5,a5,1
        sw      a5,-148(s0)
.L14:
        lw      a5,-152(s0)
        li      a4,42
        sb      a4,0(a5)
        sw      zero,-24(s0)
        lw      a5,-152(s0)
        addi    a5,a5,1
        sw      a5,-152(s0)
        lw      a5,-152(s0)
        li      a4,10
        sb      a4,0(a5)
        j       .L15
.L13:
        lw      a5,-152(s0)
        addi    a5,a5,-1
        lbu     a4,0(a5)
        li      a5,10
        bne     a4,a5,.L16
        lw      a5,-152(s0)
        li      a4,42
        sb      a4,0(a5)
        sw      zero,-24(s0)
        j       .L15
.L16:
        lw      a5,-148(s0)
        lbu     a4,0(a5)
        li      a5,32
        bne     a4,a5,.L17
        lw      a5,-152(s0)
        li      a4,32
        sb      a4,0(a5)
        lw      a5,-148(s0)
        addi    a5,a5,1
        sw      a5,-148(s0)
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
        j       .L15
.L17:
        lw      a5,-148(s0)
        lbu     a4,0(a5)
        li      a5,10
        bne     a4,a5,.L18
        sw      zero,-28(s0)
        j       .L19
.L20:
        lw      a5,-152(s0)
        li      a4,32
        sb      a4,0(a5)
        lw      a5,-152(s0)
        addi    a5,a5,1
        sw      a5,-152(s0)
        lw      a5,-28(s0)
        addi    a5,a5,1
        sw      a5,-28(s0)
.L19:
        lw      a4,-156(s0)
        lw      a5,-24(s0)
        sub     a5,a4,a5
        lw      a4,-28(s0)
        blt     a4,a5,.L20
        lw      a5,-152(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-152(s0)
        addi    a5,a5,1
        sw      a5,-152(s0)
        lw      a5,-152(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-148(s0)
        addi    a5,a5,1
        sw      a5,-148(s0)
        sw      zero,-24(s0)
        j       .L15
.L18:
        addi    a4,s0,-140
        addi    a5,s0,-136
        mv      a2,a4
        mv      a1,a5
        lw      a0,-148(s0)
        call    lire_mot
        lw      a4,-156(s0)
        lw      a5,-24(s0)
        sub     a4,a4,a5
        lw      a5,-140(s0)
        blt     a4,a5,.L21
        lw      a4,-140(s0)
        addi    a5,s0,-136
        mv      a2,a4
        mv      a1,a5
        lw      a0,-152(s0)
        call    ecrire_mot
        lw      a5,-140(s0)
        addi    a5,a5,-1
        lw      a4,-152(s0)
        add     a5,a4,a5
        sw      a5,-152(s0)
        lw      a5,-140(s0)
        mv      a4,a5
        lw      a5,-148(s0)
        add     a5,a5,a4
        sw      a5,-148(s0)
        lw      a5,-140(s0)
        lw      a4,-24(s0)
        add     a5,a4,a5
        sw      a5,-24(s0)
        j       .L15
.L21:
        lw      a5,-24(s0)
        bne     a5,zero,.L22
        li      a5,0
        j       .L29
.L22:
        sw      zero,-32(s0)
        j       .L24
.L25:
        lw      a5,-152(s0)
        li      a4,32
        sb      a4,0(a5)
        lw      a5,-152(s0)
        addi    a5,a5,1
        sw      a5,-152(s0)
        lw      a5,-32(s0)
        addi    a5,a5,1
        sw      a5,-32(s0)
.L24:
        lw      a4,-156(s0)
        lw      a5,-24(s0)
        sub     a5,a4,a5
        lw      a4,-32(s0)
        blt     a4,a5,.L25
        lw      a5,-152(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-152(s0)
        addi    a5,a5,1
        sw      a5,-152(s0)
        lw      a5,-152(s0)
        li      a4,10
        sb      a4,0(a5)
.L15:
        lw      a5,-152(s0)
        addi    a5,a5,1
        sw      a5,-152(s0)
.L12:
        lw      a5,-148(s0)
        lbu     a5,0(a5)
        bne     a5,zero,.L26
        sw      zero,-36(s0)
        j       .L27
.L28:
        lw      a5,-152(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-152(s0)
        addi    a5,a5,1
        sw      a5,-152(s0)
        lw      a5,-36(s0)
        addi    a5,a5,1
        sw      a5,-36(s0)
.L27:
        lw      a5,-156(s0)
        addi    a5,a5,1
        lw      a4,-36(s0)
        ble     a4,a5,.L28
        lw      a5,-152(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-152(s0)
        addi    a5,a5,1
        sw      a5,-152(s0)
        lw      a5,-152(s0)
        sb      zero,0(a5)
        li      a5,1
.L29:
        mv      a0,a5
        lw      ra,156(sp)
        lw      s0,152(sp)
        addi    sp,sp,160
        jr      ra
contour_milieu:
        addi    sp,sp,-288
        sw      ra,284(sp)
        sw      s0,280(sp)
        addi    s0,sp,288
        sw      a0,-276(s0)
        sw      a1,-280(s0)
        sw      a2,-284(s0)
        sw      zero,-20(s0)
        j       .L31
.L32:
        lw      a5,-280(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L31:
        lw      a5,-284(s0)
        addi    a5,a5,1
        lw      a4,-20(s0)
        ble     a4,a5,.L32
        lw      a5,-280(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        sw      zero,-24(s0)
        sw      zero,-28(s0)
        j       .L33
.L52:
        lw      a4,-28(s0)
        lw      a5,-284(s0)
        bne     a4,a5,.L34
        lw      a5,-276(s0)
        lbu     a4,0(a5)
        li      a5,10
        bne     a4,a5,.L35
        lw      a5,-276(s0)
        addi    a5,a5,1
        sw      a5,-276(s0)
.L35:
        addi    a5,s0,-256
        lw      a2,-24(s0)
        mv      a1,a5
        lw      a0,-280(s0)
        call    ecrire_mot
        lw      a5,-24(s0)
        lw      a4,-280(s0)
        add     a5,a4,a5
        sw      a5,-280(s0)
        lw      a5,-280(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        lw      a5,-280(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        sw      zero,-24(s0)
        sw      zero,-28(s0)
        j       .L33
.L34:
        lw      a5,-280(s0)
        addi    a5,a5,-1
        lbu     a4,0(a5)
        li      a5,10
        bne     a4,a5,.L36
        lw      a5,-280(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        sw      zero,-28(s0)
        sw      zero,-24(s0)
        j       .L33
.L36:
        lw      a5,-276(s0)
        lbu     a4,0(a5)
        li      a5,32
        bne     a4,a5,.L37
        lw      a5,-24(s0)
        addi    a4,s0,-16
        add     a5,a4,a5
        li      a4,32
        sb      a4,-240(a5)
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
        lw      a5,-28(s0)
        addi    a5,a5,1
        sw      a5,-28(s0)
        lw      a5,-276(s0)
        addi    a5,a5,1
        sw      a5,-276(s0)
        j       .L33
.L37:
        lw      a5,-276(s0)
        lbu     a4,0(a5)
        li      a5,10
        bne     a4,a5,.L38
        lw      a5,-24(s0)
        addi    a5,a5,-1
        addi    a4,s0,-16
        add     a5,a4,a5
        lbu     a4,-240(a5)
        li      a5,32
        bne     a4,a5,.L39
        lw      a5,-24(s0)
        addi    a5,a5,-1
        sw      a5,-24(s0)
        lw      a5,-28(s0)
        addi    a5,a5,-1
        sw      a5,-28(s0)
.L39:
        lw      a4,-284(s0)
        lw      a5,-28(s0)
        sub     a4,a4,a5
        srai    a5,a4,31
        srli    a5,a5,31
        add     a4,a4,a5
        andi    a4,a4,1
        sub     a5,a4,a5
        sw      a5,-56(s0)
        sw      zero,-32(s0)
        j       .L40
.L41:
        lw      a5,-280(s0)
        li      a4,32
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        lw      a5,-32(s0)
        addi    a5,a5,1
        sw      a5,-32(s0)
.L40:
        lw      a4,-284(s0)
        lw      a5,-28(s0)
        sub     a5,a4,a5
        srli    a4,a5,31
        add     a5,a4,a5
        srai    a5,a5,1
        mv      a4,a5
        lw      a5,-32(s0)
        blt     a5,a4,.L41
        addi    a5,s0,-256
        lw      a2,-24(s0)
        mv      a1,a5
        lw      a0,-280(s0)
        call    ecrire_mot
        lw      a5,-24(s0)
        lw      a4,-280(s0)
        add     a5,a4,a5
        sw      a5,-280(s0)
        sw      zero,-36(s0)
        j       .L42
.L43:
        lw      a5,-280(s0)
        li      a4,32
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        lw      a5,-36(s0)
        addi    a5,a5,1
        sw      a5,-36(s0)
.L42:
        lw      a4,-284(s0)
        lw      a5,-28(s0)
        sub     a5,a4,a5
        srli    a4,a5,31
        add     a5,a4,a5
        srai    a5,a5,1
        mv      a4,a5
        lw      a5,-56(s0)
        add     a5,a4,a5
        lw      a4,-36(s0)
        blt     a4,a5,.L43
        lw      a5,-280(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        lw      a5,-280(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        lw      a5,-276(s0)
        addi    a5,a5,1
        sw      a5,-276(s0)
        j       .L33
.L38:
        addi    a4,s0,-260
        addi    a5,s0,-156
        mv      a2,a4
        mv      a1,a5
        lw      a0,-276(s0)
        call    lire_mot
        lw      a4,-284(s0)
        lw      a5,-28(s0)
        sub     a4,a4,a5
        lw      a5,-260(s0)
        blt     a4,a5,.L44
        lw      a5,-24(s0)
        addi    a4,s0,-256
        add     a5,a4,a5
        lw      a3,-260(s0)
        addi    a4,s0,-156
        mv      a2,a3
        mv      a1,a4
        mv      a0,a5
        call    ecrire_mot
        lw      a5,-260(s0)
        lw      a4,-24(s0)
        add     a5,a4,a5
        sw      a5,-24(s0)
        lw      a5,-260(s0)
        lw      a4,-28(s0)
        add     a5,a4,a5
        sw      a5,-28(s0)
        lw      a5,-260(s0)
        mv      a4,a5
        lw      a5,-276(s0)
        add     a5,a5,a4
        sw      a5,-276(s0)
        j       .L33
.L44:
        lw      a5,-28(s0)
        bne     a5,zero,.L45
        li      a5,0
        j       .L55
.L45:
        lw      a5,-24(s0)
        addi    a5,a5,-1
        addi    a4,s0,-16
        add     a5,a4,a5
        lbu     a4,-240(a5)
        li      a5,32
        bne     a4,a5,.L47
        lw      a5,-24(s0)
        addi    a5,a5,-1
        sw      a5,-24(s0)
        lw      a5,-28(s0)
        addi    a5,a5,-1
        sw      a5,-28(s0)
.L47:
        lw      a4,-284(s0)
        lw      a5,-28(s0)
        sub     a4,a4,a5
        srai    a5,a4,31
        srli    a5,a5,31
        add     a4,a4,a5
        andi    a4,a4,1
        sub     a5,a4,a5
        sw      a5,-52(s0)
        sw      zero,-40(s0)
        j       .L48
.L49:
        lw      a5,-280(s0)
        li      a4,32
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        lw      a5,-40(s0)
        addi    a5,a5,1
        sw      a5,-40(s0)
.L48:
        lw      a4,-284(s0)
        lw      a5,-28(s0)
        sub     a5,a4,a5
        srli    a4,a5,31
        add     a5,a4,a5
        srai    a5,a5,1
        mv      a4,a5
        lw      a5,-40(s0)
        blt     a5,a4,.L49
        addi    a5,s0,-256
        lw      a2,-24(s0)
        mv      a1,a5
        lw      a0,-280(s0)
        call    ecrire_mot
        lw      a5,-24(s0)
        lw      a4,-280(s0)
        add     a5,a4,a5
        sw      a5,-280(s0)
        sw      zero,-44(s0)
        j       .L50
.L51:
        lw      a5,-280(s0)
        li      a4,32
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        lw      a5,-44(s0)
        addi    a5,a5,1
        sw      a5,-44(s0)
.L50:
        lw      a4,-284(s0)
        lw      a5,-28(s0)
        sub     a5,a4,a5
        srli    a4,a5,31
        add     a5,a4,a5
        srai    a5,a5,1
        mv      a4,a5
        lw      a5,-52(s0)
        add     a5,a4,a5
        lw      a4,-44(s0)
        blt     a4,a5,.L51
        lw      a5,-280(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        lw      a5,-280(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
.L33:
        lw      a5,-276(s0)
        lbu     a5,0(a5)
        bne     a5,zero,.L52
        sw      zero,-48(s0)
        j       .L53
.L54:
        lw      a5,-280(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        lw      a5,-48(s0)
        addi    a5,a5,1
        sw      a5,-48(s0)
.L53:
        lw      a5,-284(s0)
        addi    a5,a5,1
        lw      a4,-48(s0)
        ble     a4,a5,.L54
        lw      a5,-280(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-280(s0)
        addi    a5,a5,1
        sw      a5,-280(s0)
        lw      a5,-280(s0)
        sb      zero,0(a5)
        li      a5,1
.L55:
        mv      a0,a5
        lw      ra,284(sp)
        lw      s0,280(sp)
        addi    sp,sp,288
        jr      ra
contour_droite:
        addi    sp,sp,-272
        sw      ra,268(sp)
        sw      s0,264(sp)
        addi    s0,sp,272
        sw      a0,-260(s0)
        sw      a1,-264(s0)
        sw      a2,-268(s0)
        sw      zero,-20(s0)
        j       .L57
.L58:
        lw      a5,-264(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        lw      a5,-20(s0)
        addi    a5,a5,1
        sw      a5,-20(s0)
.L57:
        lw      a5,-268(s0)
        addi    a5,a5,1
        lw      a4,-20(s0)
        ble     a4,a5,.L58
        lw      a5,-264(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        sw      zero,-24(s0)
        sw      zero,-28(s0)
        j       .L59
.L75:
        lw      a4,-28(s0)
        lw      a5,-268(s0)
        bne     a4,a5,.L60
        lw      a5,-260(s0)
        lbu     a4,0(a5)
        li      a5,10
        bne     a4,a5,.L61
        lw      a5,-260(s0)
        addi    a5,a5,1
        sw      a5,-260(s0)
.L61:
        lw      a5,-24(s0)
        addi    a5,a5,-1
        addi    a4,s0,-16
        add     a5,a4,a5
        lbu     a4,-224(a5)
        li      a5,32
        bne     a4,a5,.L62
        lw      a5,-24(s0)
        addi    a5,a5,-1
        sw      a5,-24(s0)
        lw      a5,-28(s0)
        addi    a5,a5,-1
        sw      a5,-28(s0)
        lw      a5,-264(s0)
        li      a4,32
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
.L62:
        addi    a5,s0,-240
        lw      a2,-24(s0)
        mv      a1,a5
        lw      a0,-264(s0)
        call    ecrire_mot
        lw      a5,-24(s0)
        lw      a4,-264(s0)
        add     a5,a4,a5
        sw      a5,-264(s0)
        lw      a5,-264(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        lw      a5,-264(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        sw      zero,-24(s0)
        sw      zero,-28(s0)
        j       .L59
.L60:
        lw      a5,-264(s0)
        addi    a5,a5,-1
        lbu     a4,0(a5)
        li      a5,10
        bne     a4,a5,.L63
        lw      a5,-264(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        sw      zero,-28(s0)
        sw      zero,-24(s0)
        j       .L59
.L63:
        lw      a5,-260(s0)
        lbu     a4,0(a5)
        li      a5,32
        bne     a4,a5,.L64
        lw      a5,-24(s0)
        addi    a4,s0,-16
        add     a5,a4,a5
        li      a4,32
        sb      a4,-224(a5)
        lw      a5,-24(s0)
        addi    a5,a5,1
        sw      a5,-24(s0)
        lw      a5,-28(s0)
        addi    a5,a5,1
        sw      a5,-28(s0)
        lw      a5,-260(s0)
        addi    a5,a5,1
        sw      a5,-260(s0)
        j       .L59
.L64:
        lw      a5,-260(s0)
        lbu     a4,0(a5)
        li      a5,10
        bne     a4,a5,.L65
        lw      a5,-24(s0)
        addi    a5,a5,-1
        addi    a4,s0,-16
        add     a5,a4,a5
        lbu     a4,-224(a5)
        li      a5,32
        bne     a4,a5,.L66
        lw      a5,-24(s0)
        addi    a5,a5,-1
        sw      a5,-24(s0)
        lw      a5,-28(s0)
        addi    a5,a5,-1
        sw      a5,-28(s0)
.L66:
        sw      zero,-32(s0)
        j       .L67
.L68:
        lw      a5,-264(s0)
        li      a4,32
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        lw      a5,-32(s0)
        addi    a5,a5,1
        sw      a5,-32(s0)
.L67:
        lw      a4,-268(s0)
        lw      a5,-28(s0)
        sub     a5,a4,a5
        lw      a4,-32(s0)
        blt     a4,a5,.L68
        addi    a5,s0,-240
        lw      a2,-24(s0)
        mv      a1,a5
        lw      a0,-264(s0)
        call    ecrire_mot
        lw      a5,-24(s0)
        lw      a4,-264(s0)
        add     a5,a4,a5
        sw      a5,-264(s0)
        lw      a5,-264(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        lw      a5,-264(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        lw      a5,-260(s0)
        addi    a5,a5,1
        sw      a5,-260(s0)
        j       .L59
.L65:
        addi    a4,s0,-244
        addi    a5,s0,-140
        mv      a2,a4
        mv      a1,a5
        lw      a0,-260(s0)
        call    lire_mot
        lw      a4,-268(s0)
        lw      a5,-28(s0)
        sub     a4,a4,a5
        lw      a5,-244(s0)
        blt     a4,a5,.L69
        lw      a5,-24(s0)
        addi    a4,s0,-240
        add     a5,a4,a5
        lw      a3,-244(s0)
        addi    a4,s0,-140
        mv      a2,a3
        mv      a1,a4
        mv      a0,a5
        call    ecrire_mot
        lw      a5,-244(s0)
        lw      a4,-24(s0)
        add     a5,a4,a5
        sw      a5,-24(s0)
        lw      a5,-244(s0)
        lw      a4,-28(s0)
        add     a5,a4,a5
        sw      a5,-28(s0)
        lw      a5,-244(s0)
        mv      a4,a5
        lw      a5,-260(s0)
        add     a5,a5,a4
        sw      a5,-260(s0)
        j       .L59
.L69:
        lw      a5,-28(s0)
        bne     a5,zero,.L70
        li      a5,0
        j       .L78
.L70:
        lw      a5,-24(s0)
        addi    a5,a5,-1
        addi    a4,s0,-16
        add     a5,a4,a5
        lbu     a4,-224(a5)
        li      a5,32
        bne     a4,a5,.L72
        lw      a5,-24(s0)
        addi    a5,a5,-1
        sw      a5,-24(s0)
        lw      a5,-28(s0)
        addi    a5,a5,-1
        sw      a5,-28(s0)
.L72:
        sw      zero,-36(s0)
        j       .L73
.L74:
        lw      a5,-264(s0)
        li      a4,32
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        lw      a5,-36(s0)
        addi    a5,a5,1
        sw      a5,-36(s0)
.L73:
        lw      a4,-268(s0)
        lw      a5,-28(s0)
        sub     a5,a4,a5
        lw      a4,-36(s0)
        blt     a4,a5,.L74
        addi    a5,s0,-240
        lw      a2,-24(s0)
        mv      a1,a5
        lw      a0,-264(s0)
        call    ecrire_mot
        lw      a5,-24(s0)
        lw      a4,-264(s0)
        add     a5,a4,a5
        sw      a5,-264(s0)
        lw      a5,-264(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        lw      a5,-264(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
.L59:
        lw      a5,-260(s0)
        lbu     a5,0(a5)
        bne     a5,zero,.L75
        sw      zero,-40(s0)
        j       .L76
.L77:
        lw      a5,-264(s0)
        li      a4,42
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        lw      a5,-40(s0)
        addi    a5,a5,1
        sw      a5,-40(s0)
.L76:
        lw      a5,-268(s0)
        addi    a5,a5,1
        lw      a4,-40(s0)
        ble     a4,a5,.L77
        lw      a5,-264(s0)
        li      a4,10
        sb      a4,0(a5)
        lw      a5,-264(s0)
        addi    a5,a5,1
        sw      a5,-264(s0)
        lw      a5,-264(s0)
        sb      zero,0(a5)
        li      a5,1
.L78:
        mv      a0,a5
        lw      ra,268(sp)
        lw      s0,264(sp)
        addi    sp,sp,272
        jr      ra