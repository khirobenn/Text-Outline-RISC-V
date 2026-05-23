.globl lire_mot

lire_mot:

	#PROLOGUE : On sauvegarde les registres ra et s0
	
    	addi sp, sp, -8
    	sw ra, 4(sp)
    	sw s0, 0(sp)

    	li s0, 0            # s0 sera notre compteur local pour 't'
    	sw s0, 0(a2)        # On écrit 0 à l'adresse pointée par a2 (*t = 0)

boucle_lire:

    	beq a0, zero, fin_lire  #"BRANCH EQUAL": si l'adresse a0 vaut 0, on arrête

    	lb t0, 0(a0)            #t0 = file[0]

    
    	li t1, 32               #Code ASCII de l'espace = 32
    	beq t0, t1, fin_lire

    
    	li t1, 10               #Code ASCII du retour à la ligne = 10
    	beq t0, t1, fin_lire

    	beq t0, zero, fin_lire

   
    	add t2, a1, s0        # t2 = adresse de mot[t]
    	sb t0, 0(t2)          # On y stocke le caractère file[0]

    	addi s0, s0, 1        # On incrémente notre compteur local t

    	addi a0, a0, 1        # On avance le pointeur du fichier de 1 octet

    	j boucle_lire

fin_lire:

    	sw s0, 0(a2)          #Avant de partir, on met à jour la valeur finale de *t en mémoire
    	
	#EPILOGUE : On restaure les registres et la pile 
	
    	lw s0, 0(sp)
    	lw ra, 4(sp)
    	addi sp, sp, 8
    
    	jr ra
    	
