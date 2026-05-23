.globl contour

contour:

    	# PROLOGUE : Sauvegarde de ra et des registres s0-s4
    	# On réserve 24 octets (6 registres x 4 octets)
    	# s1 = buff, s2 = max_taille_ligne, s3 = nb_caracteres_ecrits
	#s4 = adresse de taille_mot,ra = adresse de retour
    	
    	addi sp, sp, -24
    	sw ra, 20(sp)
    	sw s0, 16(sp)
    	sw s1, 12(sp)
    	sw s2, 8(sp)
    	sw s3, 4(sp)
    
    # On utilise l'espace tout en bas de la pile 0(sp) 
    # pour y mettre notre variable locale taille_mot
    
    
    	sw s4, 0(sp)

    	mv s0, a0           # s0 = file
    	mv s1, a1           # s1 = buff
    	mv s2, a2           # s2 = max_taille_ligne
    	li s3, 0            # s3 = nb_caracteres_ecrits = 0
    	addi s4, sp, 0      # s4 = adresse de 'taille_mot' (pointe sur 0(sp))

    	#Dessiner la bordure haute (for i = 0 à max_taille_ligne + 2)
    
    	addi t0, s2, 2      # t0 = max_taille_ligne + 2
    	li t1, 0            # t1 = i = 0
    	li t2, 42           # Code ASCII de '*'

boucle_haut:

    	bge t1, t0, fin_haut
    	sb t2, 0(s1)        # buff[0] = '*'
   	addi s1, s1, 1     # buff++
    	addi t1, t1, 1      # i++
    	j boucle_haut

fin_haut:

    	li t2, 10           # Code ASCII de '\n'
    	sb t2, 0(s1)        # buff[0] = '\n'
   	addi s1, s1, 1      # buff++
    
 
   boucle_principale:

    	lb t0, 0(s0)          			# t0 = file[0]
    	beq t0, zero, fin_boucle_principale 	#Si file[0] == '\0', on sort

    	# Condition 1 : if (nb_caracteres_ecrits == max_taille_ligne)
    
    	bne s3, s2, cond_2    #Si nb_caracteres_ecrits != max_taille_ligne, on passe à cond_2
    
    	# if(file[0] == '\n') file++;
    	
   	li t1, 10
    	bne t0, t1, suite_cond_1
    	addi s0, s0, 1        # file++

suite_cond_1:

    	li t2, 42            # Code ASCII pour '*'
   	sb t2, 0(s1)         # buff[0] = '*'
    	addi s1, s1, 1       # buff++
    
    	li t2, 10           # '\n'
    	sb t2, 0(s1)        # buff[0] = '\n'
    	addi s1, s1, 1      # buff++
    
    	li s3, 0            # nb_caracteres_ecrits = 0
    	j boucle_principale # On passe directement au caractère suivant du while


    # Condition 2 : else if ((buff-1)[0] == '\n')
    
cond_2:
    	lb t1, -1(s1)       # t1 = (buff-1)[0]
    	li t2, 10           # '\n'
    	bne t1, t2, cond_3
    
    	li t3, 42           # '*'
    	sb t3, 0(s1)        # buff[0] = '*'
    	addi s1, s1, 1      # buff++
    	li s3, 0            # nb_caracteres_ecrits = 0

	j fin_tour_while
	
    # Condition 3 : else if (file[0] == ' ')

cond_3:
    	lb t0, 0(s0)        # On recharge file[0] au cas où
    	li t1, 32           # ' '
    	bne t0, t1, cond_4  
    
    	sb t1, 0(s1)        # buff[0] = ' '
    	addi s1, s1, 1      # buff++
    	addi s0, s0, 1      # file++
    	addi s3, s3, 1      # nb_caracteres_ecrits++
    	
    	j boucle_principale
    	
    	
    # Condition 4 : else if (file[0] == '\n')

cond_4:

    	li t1, 10           # '\n'
    	bne t0, t1, bloc_else
    
    # for(int va = 0; va < max_taille_ligne - nb_caracteres_ecrits; va++)
    
    	sub t2, s2, s3      # t2 = max_taille_ligne - nb_caracteres_ecrits
    	li t3, 0            # t3 = va = 0
    	li t4, 32           # ' '
    	
boucle_va_cond4:

    	bge t3, t2, fin_va_cond4
    	sb t4, 0(s1)        # buff[0] = ' '
    	addi s1, s1, 1      # buff++
   	addi t3, t3, 1      # va++
   	
    	j boucle_va_cond4

fin_va_cond4:

    	li t4, 42           # '*'
    	sb t4, 0(s1)        # buff[0] = '*'
    	addi s1, s1, 1      # buff++
    
    	li t4, 10           # '\n'
    	sb t4, 0(s1)        # buff[0] = '\n'
    	addi s1, s1, 1      # buff++
    
    	addi s0, s0, 1      # file++
    	li s3, 0            # nb_caracteres_ecrits = 0
    	
    	j boucle_principale
    	
bloc_else:

    	# lire_mot(file, mot, &taille_mot)
    	
    	mv a0, s0           # arg 0 : file
    	
    	# Pour 'mot', on va utiliser la zone mémoire "mot_temp" déclarée dans ton main
    	
    	la a1, mot_temp     # arg 1 : mot
    	mv a2, s4           # arg 2 : &taille_mot (qui pointe sur notre pile)
    	call lire_mot
    
    	lw t1, 0(s4)        # t1 = taille_mot (on récupère ce que lire_mot a écrit)
    	
    
    	# if (taille_mot <= max_taille_ligne - nb_caracteres_ecrits)
    	
    	sub t2, s2, s3      # t2 = max_taille_ligne - nb_caracteres_ecrits
    	bgt t1, t2, else_mot_trop_long
    
    	# ecrire_mot(buff, mot, taille_mot)
    	
   	mv a0, s1           # arg 0 : buff
    	la a1, mot_temp     # arg 1 : mot
    	mv a2, t1           # arg 2 : taille_mot
    	call ecrire_mot
    
    	# Mises à jour des pointeurs d'après ton C :
    	
    	lw t1, 0(s4)        # On recharge taille_mot au cas où
    	add s1, s1, t1      
    	addi s1, s1, -1     # buff += taille_mot - 1
    
    	add s0, s0, t1      # file += taille_mot
    	add s3, s3, t1      # nb_caracteres_ecrits += taille_mot
    	
    
    	j fin_tour_while

else_mot_trop_long:

        # if (nb_caracteres_ecrits == 0) -> Erreur/Exit
    
    	bnez s3, suite_mot_trop_long   # Branch if Not Equal to Zero : si s3 != 0, on saute à 'suite_mot_trop_long'
    	li a7, 10                      # On quitte directement (comme exit(1) en C)
    	ecall

suite_mot_trop_long:

    	# for(int va = 0; va < max_taille_ligne - nb_caracteres_ecrits; va++)
    	
    	sub t2, s2, s3
    	li t3, 0
    	li t4, 32           # ' '
    	
    	
boucle_va_else:

    	bge t3, t2, fin_va_else
    	sb t4, 0(s1)
    	addi s1, s1, 1
    	addi t3, t3, 1
    	
    	j boucle_va_else

fin_va_else:	

    	li t4, 42           # '*'
    	sb t4, 0(s1)
    	addi s1, s1, 1
    	li t4, 10           # '\n'
    	sb t4, 0(s1)
    	addi s1, s1, 1
   	 

fin_tour_while:

    	addi s1, s1, 1      # buff++ (le buff++ général à la fin de ta boucle while C)
    	
    	j boucle_principale
    	
 fin_boucle_principale:
 
    # --- Dessiner la bordure basse (for i = 0 à max_taille_ligne + 2) ---
    
    	addi t0, s2, 2
    	li t1, 0
    	li t2, 42           # '*'
    	
    	
boucle_bas:

    	bge t1, t0, fin_bas
    	sb t2, 0(s1)
    	addi s1, s1, 1
   	addi t1, t1, 1
   	
    	j boucle_bas

fin_bas:

    	li t2, 10           # '\n'
    	sb t2, 0(s1)
    	addi s1, s1, 1
    
    	sb zero, 0(s1)      # buff[0] = '\0' (Fin de la chaîne géante)


    	# ÉPILOGUE : Restauration des registres et de la pile

    	lw s4, 0(sp)
    	lw s3, 4(sp)
    	lw s2, 8(sp)
    	lw s1, 12(sp)
   	lw s0, 16(sp)
    	lw ra, 20(sp)
    	addi sp, sp, 24     # On libère l'espace de la pile
    
    	jr ra               # Retour au main
