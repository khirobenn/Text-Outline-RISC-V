.data
path: .asciz "test"
path_output: .asciz "test_contour"
choix1: .asciz "1. Contour à gauche.\n"
choix2: .asciz "2. Contour au milieu.\n"
choix3: .asciz "3. Contour à droite.\n"
fleche: .asciz "--> " 
mauvais_choix: .asciz "\nVeuillez choisir 1 ou 2 ou 3 seulement.\n"

demande_nb_max: .asciz "\nVeuillez entrer le nombre de caractères maximum pour une ligne : "

erreur_message: .asciz "\nLe nombre de caractères maximum est trop petit par rapport au mots du fichier"

chaine:	.space 5000
buff:	.space 5000
mot_temp: .space 100 ## On utilisera ce mot dans chaque fonction de contour
ligne: .space 100
taille_mot: .word 0

.text
main:

	ori a7, zero, 1024 # Pour lire ou écrire dans un fichier
	la a0, path # on met la chaine du chemin du fichier dans a0
	ori a1, zero, 0 # càd read-only
	ecall
	
	# ici a0 contient le file_descripteur
	la a1, chaine
	call lecture
	
	# ici a0 contient le nombre de caractère lus
	# on va checker si y a '\n' à la fin de la chaine, si y a pas on l'ajoutera
	# cet ajout c'est pour rendre le contour beau
	addi a0, a0, -1
	la a1, chaine
	add a1, a1, a0
	lb a2, 0(a1)
	ori s0, zero, '\n'
	ori s1, zero, '\0'
	beq a2, s0, sauter_vers_le_menu
	addi a1, a1, 1
	sb s0, 0(a1)
	addi a1, a1, 1
	sb s1, 0(a1)
	
sauter_vers_le_menu:
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
	bne s1, s0, deuxieme_test
	call contour
	beq a0, zero, erreur
	j fin
	
deuxieme_test:
	ori s1, zero, 2
	bne s1, s0, troisieme_test
	call contour_milieu
	beq a0, zero, erreur
	j fin
	
troisieme_test:
	ori s1, zero, 3
	bne s1, s0, aucun_choix
	call contour_droite
	beq a0, zero, erreur
	j fin

aucun_choix:
	ori a7, zero, 4
	la a0, mauvais_choix
	j fin_sans_affichage
	ecall
	
fin:	
	ori a7, zero, 1024 # Pour lire ou écrire dans un fichier
	la a0, path_output # on met la chaine du chemin du fichier dans a0
	ori a1, zero, 1 # càd write-only (ceci créera le fichier si il existe pas)
	ecall
	
	# ici a0 contient le file_descripteur
	la a1, buff
	## on écrira buff dans le fichier path_output
	call ecriture
	j fin_sans_affichage
	
erreur:
	ori a7, zero, 4
	la a0, erreur_message
	ecall
fin_sans_affichage:
	ori a7, zero, 10
	ecall
	
# ------------ Fin du main ----------------------

	
    	
 
 # ---------------------------------------------------------   	
 .globl ecrire_mot
# void ecrire_mot(char *buff, char *mot, int t)
# a0 = buff
# a1 = mot
# a2 = t
ecrire_mot:
	addi sp, sp, -20
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw s0, 8(sp)
	sw s1, 12(sp)
	sw ra, 16(sp)
	
	ori s0, zero, 0
boucle_ecrire_mot:
	bgeu  s0, a2, fin_boucle_ecrire_mot
	lb s1, 0(a1)
	sb s1, 0(a0)
	addi a1, a1, 1
	addi a0, a0, 1
	addi s0, s0, 1
	j boucle_ecrire_mot
fin_boucle_ecrire_mot:
	lw a0, 0(sp)
	lw a1, 4(sp)
	lw s0, 8(sp)
	lw s1, 12(sp)
	lw ra, 16(sp)
	addi sp, sp, 20
	ret
	
    	
# --------------------------------
.globl lire_mot

# void lire_mot(char *file, char *mot, int *t)
# a0 = file
# a1 = mot
# a2 = &taille_mot cad l'adresse de l'entier
lire_mot:

	#prologue
	addi sp, sp, -40
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)
	sw s3, 12(sp)
	sw s4, 16(sp)
	sw s5, 20(sp)
	sw a0, 24(sp)
	sw a1, 28(sp)
	sw a2, 32(sp)
	sw ra, 36(sp)

	ori s0, zero, 0
	ori s1, zero, 0
	ori s2, zero, ' '
	ori s3, zero, '\n'
	ori s4, zero, '\0'
	
	boucle_while_lire_mot:
	beq a0, s1, fin_boucle_while_lire_mot
	lb s5, 0(a0)
	beq s5, s2, fin_boucle_while_lire_mot
	beq s5, s3, fin_boucle_while_lire_mot
	beq s5, s4, fin_boucle_while_lire_mot
	sb s5, 0(a1)
	addi a1, a1, 1
	addi a0, a0, 1
	addi s0, s0, 1
	j boucle_while_lire_mot
	
	fin_boucle_while_lire_mot:
	
	sw s0, 0(a2) # on enregistre la taille du mot dans l'adresse a2
	
	# epilogue
	lw s0, 0(sp)
	lw s1, 4(sp)
	lw s2, 8(sp)
	lw s3, 12(sp)
	lw s4, 16(sp)
	lw s5, 20(sp)
	lw a0, 24(sp)
	lw a1, 28(sp)
	lw a2, 32(sp)
	lw ra, 36(sp)
	addi sp, sp, 40
	ret

# ==========================================================	
.global ecrire_n_fois_le_caratere
# void ecrire_n_fois_le_caratere(char *buff, char c, int n)
# a0 = buff
# a1 = c
# a2 = n
ecrire_n_fois_le_caratere:

	addi sp, sp, -12
	sw s0, 0(sp)
	sw ra, 4(sp)

	ori s0, zero, 0
boucle_ecrire_n_fois_le_caratere:	
	bgeu s0, a2, fin_boucle_ecrire_n_fois_le_caratere
	sb a1, 0(a0)
	addi a0, a0, 1
	addi s0, s0, 1
	j boucle_ecrire_n_fois_le_caratere
fin_boucle_ecrire_n_fois_le_caratere:
	
	lw s0, 0(sp)
	lw ra, 4(sp)
	addi sp, sp, 12
	
	ret
# ==========================================================
	
	
.globl contour
# int contour(char *file, char *buff, int max_taille_ligne)
# a0 = file
# a1 = buff
# a2 = max_taille_ligne
# le résultat on le metra dans a0 qui sera 0 si y a une erreur et 1 si tout se passe bien
contour:

	# prologue
	addi sp, sp, -120
	sw ra, 116(sp)
	sw s2, 112(sp)
	sw s3, 108(sp)
	sw s4, 104(sp)
	sw s5, 100(sp)
	sw s6, 96(sp)
	sw s7, 92(sp)
	sw s8, 88(sp)
	sw s9, 84(sp)
	sw s10, 80(sp)
	sw s11, 76(sp)
	
	ori s2, zero, '*'
	ori s3, zero, '\n'
	ori s4, zero, ' '
	la s5, mot_temp
	ori s6, zero, 0 # s6 contiendra la taille de mot_temp
	ori s7, zero, 0 # s7 est nb_caracteres_ecrits dans le code C
	ori s8, zero, '\0'
	
	
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw a2, 8(sp)
	or a0, zero, a1
	or a1, zero, s2
	addi a2, a2, 2
	call ecrire_n_fois_le_caratere
	lw a0, 0(sp)
	lw a1, 4(sp)
	add a1, a1, a2
	lw a2, 8(sp)
	
	
	sb s3, 0(a1)
	addi a1, a1, 1

while:		
	lb s9, 0(a0) # s9 = file[0]
	beq s9, s8, fin_while
		bne s7, a2, else_if_1 # if nb_caract != max_taille_ligne
		bne s9, s3, sauter_file_plus_plus
		addi a0, a0, 1
		sauter_file_plus_plus:
		sb s2, 0(a1)
		addi s7, s7, 1
		addi a1, a1, 1
		sb s3, 0(a1)
		j fin_if
	else_if_1:
		or s10, zero, a1
		addi s10, s10, -1
		lb s10, 0(s10)
		bne s10, s3, else_if_2
		sb s2, 0(a1)
		ori s7, zero, 0
		j fin_if
	else_if_2:
		bne s9, s4, else_if_3
		sb s4, 0(a1)
		addi a0, a0, 1
		addi s7, s7, 1
		j fin_if
	
	else_if_3:
		bne s9, s3, else
		
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		or a0, zero, a1
		sub a2, a2, s7
		or a1, zero, s4
		call ecrire_n_fois_le_caratere
		lw a0, 0(sp)
		lw a1, 4(sp)
		add a1, a1, a2
		lw a2, 8(sp)
		
		sb s2, 0(a1)
		addi a1, a1, 1
		sb s3, 0(a1)
		addi a0, a0, 1
		ori s7, zero, 0
		j fin_if
		
	else:
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		
		la a1, mot_temp
		la a2, taille_mot
		call lire_mot
		lw s11, 0(a2) # s11 contient taille mot
		
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		
		sub a5, a2, s7 # a5 = max_taille - nb_caractere
		bgt s11, a5, else_else # if taille_mot > max_taille - nb_carac
	
		or a0, zero, a1
		la a1, mot_temp
		or a2, zero, s11
		call ecrire_mot
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		add a0, a0, s11
		add s7, s7, s11
		addi s11, s11, -1
		add a1, a1, s11
		addi s11, s11, 1
		j fin_if
		
		else_else:
		bnez s7, continue_else_else
		ori a0, zero, 0
		j epilogue
		continue_else_else:
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		or a0, zero, a1
		or a2, zero, a5
		or a1, zero, s4
		call ecrire_n_fois_le_caratere
		lw a0, 0(sp)
		lw a1, 4(sp)
		add a1, a1, a2
		lw a2, 8(sp)
		sb s2, 0(a1)
		addi a1, a1, 1
		sb s3, 0(a1)
	
	fin_if:
	addi a1, a1, 1
	j while
fin_while:

	sw a0, 0(sp)
	sw a1, 4(sp)
	sw a2, 8(sp)
	or a0, zero, a1
	addi a2, a2, 2
	or a1, zero, s2
	call ecrire_n_fois_le_caratere
	lw a0, 0(sp)
	lw a1, 4(sp)
	add a1, a1, a2
	lw a2, 8(sp)
	sb s3 , 0(a1)
	addi a1, a1, 1
	sb s8, 0(a1)
	
	ori a0, zero, 1
	epilogue:
	lw ra, 116(sp)
	lw s2, 112(sp)
	lw s3, 108(sp)
	lw s4, 104(sp)
	lw s5, 100(sp)
	lw s6, 96(sp)
	lw s7, 92(sp)
	lw s8, 88(sp)
	lw s9, 84(sp)
	lw s10, 80(sp)
	lw s11, 76(sp)
	addi sp, sp, 120
	ret

# ======================================================


.globl contour_milieu
# int contour(char *file, char *buff, int max_taille_ligne)
# a0 = file
# a1 = buff
# a2 = max_taille_ligne
# le résultat on le metra dans a0 qui sera 0 si y a une erreur et 1 si tout se passe bien
contour_milieu:

	# prologue
	addi sp, sp, -120
	sw ra, 116(sp)
	sw s2, 112(sp)
	sw s3, 108(sp)
	sw s4, 104(sp)
	sw s5, 100(sp)
	sw s6, 96(sp)
	sw s7, 92(sp)
	sw s8, 88(sp)
	sw s9, 84(sp)
	sw s10, 80(sp)
	sw s11, 76(sp)
	sw s0, 72(sp)
	sw s1, 68(sp)
	
	ori s0, zero, 0 # s0 est taille_ligne dans le code C
	
	ori s2, zero, '*'
	ori s3, zero, '\n'
	ori s4, zero, ' '
	la s5, mot_temp
	ori s6, zero, 0 # s6 contiendra la taille de mot_temp
	ori s7, zero, 0 # s7 est nb_caracteres_ecrits dans le code C
	ori s8, zero, '\0'
	
	
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw a2, 8(sp)
	or a0, zero, a1
	or a1, zero, s2
	addi a2, a2, 2
	call ecrire_n_fois_le_caratere
	lw a0, 0(sp)
	lw a1, 4(sp)
	add a1, a1, a2
	lw a2, 8(sp)
	
	
	sb s3, 0(a1)
	addi a1, a1, 1

while_milieu:		
	lb s9, 0(a0) # s9 = file[0]
	beq s9, s8, fin_while_milieu
		bne s7, a2, else_if_1_milieu # if nb_caract != max_taille_ligne
			bne s9, s3, sauter_file_plus_plus_milieu
			addi a0, a0, 1
		sauter_file_plus_plus_milieu:
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		
		or a0, a1, zero
		la a1, ligne
		or a2, zero, s0
		call ecrire_mot
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		add a1, a1, s0
		
		sb s2, 0(a1)
		addi a1, a1, 1
		sb s3, 0(a1)
		addi a1, a1, 1
		ori s0, zero, 0
		ori s7, zero, 0
		j fin_if_milieu
	else_if_1_milieu:
		or s10, zero, a1
		addi s10, s10, -1
		lb s10, 0(s10)
		bne s10, s3, else_if_2_milieu
		sb s2, 0(a1)
		addi a1, a1, 1
		ori s7, zero, 0
		ori s0, zero, 0
		j fin_if_milieu
	else_if_2_milieu:
		bne s9, s4, else_if_3_milieu
		la s1, ligne
		add s1, s1, s0
		sb s4, 0(s1)
		addi a0, a0, 1
		addi s7, s7, 1
		addi s0, s0, 1
		j fin_if_milieu
	
	else_if_3_milieu:
		bne s9, s3, else_milieu
		 
		la s1, ligne
		addi s0, s0, -1
		add s1, s1, s0
		lb s1, 0(s1)
		beq s1, s4, decrementer_nb_caracter
		addi s0, s0, 1
		j sauter_decrementation
		decrementer_nb_caracter:
		addi s7, s7, -1
		sauter_decrementation:
		sub a5, a2, s7
		andi a6, a5, 1 # on met le reste de la division par 2 dans a6
		srli a5, a5, 1 # on dévise max_taille - nb_carac par 2
		
		
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		
		or a0, zero, a1
		or a1, zero, s4
		or a2, zero, a5
		call ecrire_n_fois_le_caratere
		lw a0, 0(sp)
		lw a1, 4(sp)
		add a1, a1, a2
		lw a2, 8(sp)
		
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		or a0, zero, a1
		la a1, ligne
		or a2, zero, s0
		call ecrire_mot
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		add a1, a1, s0
		
		add a5, a5, a6
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		or a0, zero, a1
		or a1, zero, s4
		or a2, zero, a5
		call ecrire_n_fois_le_caratere
		lw a0, 0(sp)
		lw a1, 4(sp)
		add a1, a1, a2
		lw a2, 8(sp)
		
		sb s2, 0(a1)
		addi a1, a1, 1
		sb s3, 0(a1)
		addi a1, a1, 1
		addi a0, a0, 1
		ori s0, zero, 0
		ori s7, zero, 0
		j fin_if_milieu
		
	else_milieu:
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		
		la a1, mot_temp
		la a2, taille_mot
		call lire_mot
		lw s11, 0(a2) # s11 contient taille mot
		
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		
		sub a5, a2, s7 # a5 = max_taille - nb_caractere
		bgt s11, a5, else_else_milieu # if taille_mot > max_taille - nb_carac
	
		la a0, ligne
		add a0, a0, s0
		la a1, mot_temp
		or a2, zero, s11
		call ecrire_mot
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		
		add a0, a0, s11
		add s7, s7, s11
		add s0, s0, s11
		j fin_if_milieu
		
		else_else_milieu:
		bnez s7, continue_else_else_milieu
		ori a0, zero, 0
		j epilogue_milieu
		continue_else_else_milieu:
		la s1, ligne
		add s1, s1, s0
		addi s1, s1, -1
		lb s1, 0(s1)
		bne s1, s4, continuer_encore
		addi s0, s0, -1
		addi s7, s7, -1
		continuer_encore:
		
		sub a5, a2, s7
		andi a6, a5, 1 # on met le reste de la division par 2 dans a6
		srli a5, a5, 1 # on dévise max_taille - nb_carac par 2
		
		
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		or a0, zero, a1
		or a1, zero, s4
		or a2, zero, a5
		call ecrire_n_fois_le_caratere
		lw a0, 0(sp)
		lw a1, 4(sp)
		add a1, a1, a2
		lw a2, 8(sp)
		
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		or a0, zero, a1
		la a1, ligne
		or a2, zero, s0
		call ecrire_mot
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		add a1, a1, s0
		
		add a5, a5, a6
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		or a0, zero, a1
		or a1, zero, s4
		or a2, zero, a5
		call ecrire_n_fois_le_caratere
		lw a0, 0(sp)
		lw a1, 4(sp)
		add a1, a1, a2
		lw a2, 8(sp)
		
		sb s2, 0(a1)
		addi a1, a1, 1
		sb s3, 0(a1)
		addi a1, a1, 1
		
		ori s0, zero, 0
		ori s7, zero, 0
	
	fin_if_milieu:
	j while_milieu
fin_while_milieu:

	sw a0, 0(sp)
	sw a1, 4(sp)
	sw a2, 8(sp)
	or a0, zero, a1
	addi a2, a2, 2
	or a1, zero, s2
	call ecrire_n_fois_le_caratere
	lw a0, 0(sp)
	lw a1, 4(sp)
	add a1, a1, a2
	lw a2, 8(sp)
	sb s3 , 0(a1)
	addi a1, a1, 1
	sb s8, 0(a1)
	
	ori a0, zero, 1
	epilogue_milieu:
	lw ra, 116(sp)
	lw s2, 112(sp)
	lw s3, 108(sp)
	lw s4, 104(sp)
	lw s5, 100(sp)
	lw s6, 96(sp)
	lw s7, 92(sp)
	lw s8, 88(sp)
	lw s9, 84(sp)
	lw s10, 80(sp)
	lw s11, 76(sp)
	lw s0, 72(sp)
	lw s1, 68(sp)
	addi sp, sp, 120
	ret

# ======================================================

# Pour le code de contour_droite c'est presque le même que contour_milieu
# On ajoutera un petit bloc dans le premier if de la boucle while
# On enlève aussi un petit bloc qui est l'écriture de n/2 espaces après le mot
# sachant que n est le nombre de cases restantes pour atteindre le max de la ligne

.globl contour_droite
# int contour_droite(char *file, char *buff, int max_taille_ligne)
# a0 = file
# a1 = buff
# a2 = max_taille_ligne
# le résultat on le metra dans a0 qui sera 0 si y a une erreur et 1 si tout se passe bien
contour_droite:

	# prologue
	addi sp, sp, -120
	sw ra, 116(sp)
	sw s2, 112(sp)
	sw s3, 108(sp)
	sw s4, 104(sp)
	sw s5, 100(sp)
	sw s6, 96(sp)
	sw s7, 92(sp)
	sw s8, 88(sp)
	sw s9, 84(sp)
	sw s10, 80(sp)
	sw s11, 76(sp)
	sw s0, 72(sp)
	sw s1, 68(sp)
	
	ori s0, zero, 0 # s0 est taille_ligne dans le code C
	
	ori s2, zero, '*'
	ori s3, zero, '\n'
	ori s4, zero, ' '
	la s5, mot_temp
	ori s6, zero, 0 # s6 contiendra la taille de mot_temp
	ori s7, zero, 0 # s7 est nb_caracteres_ecrits dans le code C
	ori s8, zero, '\0'
	
	
	sw a0, 0(sp)
	sw a1, 4(sp)
	sw a2, 8(sp)
	or a0, zero, a1
	or a1, zero, s2
	addi a2, a2, 2
	call ecrire_n_fois_le_caratere
	lw a0, 0(sp)
	lw a1, 4(sp)
	add a1, a1, a2
	lw a2, 8(sp)
	
	
	sb s3, 0(a1)
	addi a1, a1, 1

while_droite:		
	lb s9, 0(a0) # s9 = file[0]
	beq s9, s8, fin_while_droite
		bne s7, a2, else_if_1_droite # if nb_caract != max_taille_ligne
			bne s9, s3, sauter_file_plus_plus_droite
			addi a0, a0, 1
		sauter_file_plus_plus_droite:
		## le bloc ajouté par rapport a milieu
		#################
		la t1, ligne
		addi t2, s0, -1
		add t1, t1, t2
		lb t1, 0(t1)
		bne t1, s4, sauter_encore_file_plus_plus_droite
		sb s4, 0(a1)
		addi a1, a1, 1
		addi s0, s0, -1
		addi s7, s7, -1
		sauter_encore_file_plus_plus_droite:
		##############################
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)

		or a0, a1, zero
		la a1, ligne
		or a2, zero, s0
		call ecrire_mot
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		add a1, a1, s0
		
		sb s2, 0(a1)
		addi a1, a1, 1
		sb s3, 0(a1)
		addi a1, a1, 1
		ori s0, zero, 0
		ori s7, zero, 0
		j fin_if_droite
	else_if_1_droite:
		or s10, zero, a1
		addi s10, s10, -1
		lb s10, 0(s10)
		bne s10, s3, else_if_2_droite
		sb s2, 0(a1)
		addi a1, a1, 1
		ori s7, zero, 0
		ori s0, zero, 0
		j fin_if_droite
	else_if_2_droite:
		bne s9, s4, else_if_3_droite
		la s1, ligne
		add s1, s1, s0
		sb s4, 0(s1)
		addi a0, a0, 1
		addi s7, s7, 1
		addi s0, s0, 1
		j fin_if_droite
	
	else_if_3_droite:
		bne s9, s3, else_droite
		 
		la s1, ligne
		addi s0, s0, -1
		add s1, s1, s0
		lb s1, 0(s1)
		beq s1, s4, decrementer_nb_caracter_droite
		addi s0, s0, 1
		j sauter_decrementation_droite
		decrementer_nb_caracter_droite:
		addi s7, s7, -1
		sauter_decrementation_droite:
		sub a5, a2, s7 # a5 = max_taille - nb_carac
		
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		
		or a0, zero, a1
		or a1, zero, s4
		or a2, zero, a5
		call ecrire_n_fois_le_caratere
		lw a0, 0(sp)
		lw a1, 4(sp)
		add a1, a1, a2
		lw a2, 8(sp)
		
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		or a0, zero, a1
		la a1, ligne
		or a2, zero, s0
		call ecrire_mot
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		add a1, a1, s0
		
		sb s2, 0(a1)
		addi a1, a1, 1
		sb s3, 0(a1)
		addi a1, a1, 1
		addi a0, a0, 1
		ori s0, zero, 0
		ori s7, zero, 0
		j fin_if_droite
		
	else_droite:
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		
		la a1, mot_temp
		la a2, taille_mot
		call lire_mot
		lw s11, 0(a2) # s11 contient taille mot
		
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		
		sub a5, a2, s7 # a5 = max_taille - nb_caractere
		bgt s11, a5, else_else_droite # if taille_mot > max_taille - nb_carac
	
		la a0, ligne
		add a0, a0, s0
		la a1, mot_temp
		or a2, zero, s11
		call ecrire_mot
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		
		add a0, a0, s11
		add s7, s7, s11
		add s0, s0, s11
		j fin_if_droite
		
		else_else_droite:
		bnez s7, continue_else_else_droite
		ori a0, zero, 0
		j epilogue_droite
		continue_else_else_droite:
		la s1, ligne
		add s1, s1, s0
		addi s1, s1, -1
		lb s1, 0(s1)
		bne s1, s4, continuer_encore_droite
		addi s0, s0, -1
		addi s7, s7, -1
		continuer_encore_droite:
		
		sub a5, a2, s7 # a5 = max_taille - nb_caracteres_ecrits
		
		
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		or a0, zero, a1
		or a1, zero, s4
		or a2, zero, a5
		call ecrire_n_fois_le_caratere
		lw a0, 0(sp)
		lw a1, 4(sp)
		add a1, a1, a2
		lw a2, 8(sp)
		
		sw a0, 0(sp)
		sw a1, 4(sp)
		sw a2, 8(sp)
		or a0, zero, a1
		la a1, ligne
		or a2, zero, s0
		call ecrire_mot
		lw a0, 0(sp)
		lw a1, 4(sp)
		lw a2, 8(sp)
		add a1, a1, s0
			
		sb s2, 0(a1)
		addi a1, a1, 1
		sb s3, 0(a1)
		addi a1, a1, 1
		
		ori s0, zero, 0
		ori s7, zero, 0
	
	fin_if_droite:
	j while_droite
fin_while_droite:

	sw a0, 0(sp)
	sw a1, 4(sp)
	sw a2, 8(sp)
	or a0, zero, a1
	addi a2, a2, 2
	or a1, zero, s2
	call ecrire_n_fois_le_caratere
	lw a0, 0(sp)
	lw a1, 4(sp)
	add a1, a1, a2
	lw a2, 8(sp)
	sb s3 , 0(a1)
	addi a1, a1, 1
	sb s8, 0(a1)
	
	ori a0, zero, 1
	epilogue_droite:
	lw ra, 116(sp)
	lw s2, 112(sp)
	lw s3, 108(sp)
	lw s4, 104(sp)
	lw s5, 100(sp)
	lw s6, 96(sp)
	lw s7, 92(sp)
	lw s8, 88(sp)
	lw s9, 84(sp)
	lw s10, 80(sp)
	lw s11, 76(sp)
	lw s0, 72(sp)
	lw s1, 68(sp)
	addi sp, sp, 120
	ret
# ======================================================

# Fonction lecture fichier --------------------
lecture : # a0 contient le file_descripteur, a1 contient l'adresse où on va stocker ce qu'on lit
# au retour le nombre de caractères lus sera stocké dans a0

addi sp, sp, -20 # prologue
sw a0, 0(sp)
sw a1, 4(sp)
sw s1, 8(sp)
sw a7, 12(sp)
sw ra, 16(sp)

ori s1, zero, 0 # s1 est le nombre de caractères lus jusqu'à présent

ori a2, zero, 10 # Le nombre de caractères maximum pour la lecture
ori a7, zero, 63

lecture_boucle:
lw a0, 0(sp) # réeinitialiser toujours a0 vers le descripteur_file
ecall
add a1, a1, a0
add s1, s1, a0

bne a0, zero, lecture_boucle


# Pour fermer le fichier ----
lw a0, 0(sp) # a0 = file_descriptor
ori a7, zero, 57
ecall

or a0, zero, s1

# epilogue
lw a1, 4(sp)
sw s1, 8(sp)
sw a7, 12(sp)
sw ra, 16(sp)
addi sp, sp, 16

ret


# ==========================================
# Fonction ecriture de la chaine dans test_output --------------------
ecriture : # a0 contient le file_descripteur, a1 contient l'adresse de la chaine qu'on va écrire
addi sp, sp, -20 # prologue
sw a0, 0(sp)
sw a1, 4(sp)
sw s1, 8(sp)
sw s0, 12(sp)
sw ra, 16(sp)

ori s0, zero, '\0'


ori a7, zero, 64 # c'est pour write

ecriture_boucle:
lb s1, 0(a1)
beq s1, s0, fin_ecriture
ori a2, zero, 1 # Le nombre de caractères à écrire pour la lecture
lw a0, 0(sp) # réeinitialiser toujours a0 vers le descripteur_file
ecall
addi a1, a1, 1 # on bouge notre chaine de 1 pour la prichaine itération
j ecriture_boucle

fin_ecriture:
# Pour fermer le fichier ----
lw a0, 0(sp) # a0 = file_descriptor
ori a7, zero, 57
ecall

or a0, zero, s1

# epilogue
lw a1, 4(sp)
sw s1, 8(sp)
sw s0, 12(sp)
sw ra, 16(sp)
addi sp, sp, 16

ret