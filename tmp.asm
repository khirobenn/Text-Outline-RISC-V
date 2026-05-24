# ======================================================


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