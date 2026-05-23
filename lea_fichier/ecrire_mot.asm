.globl ecrire_mot

ecrire_mot:

    	# PROLOGUE : Sauvegarde de ra et s0
    
    	addi sp, sp, -8     # On réserve 8 octets
    	sw ra, 4(sp)        # On sauvegarde ra à sp + 4
   	sw s0, 0(sp)        # On sauvegarde s0 à sp + 0

    	li t0, 0            # int i = 0

boucle_ecrire:

    	bge t0, a2, fin_ecrire

    	lb t1, 0(a1)       # t1 = *mot
    	sb t1, 0(a0)        # *buff = t1

    	addi a0, a0, 1      # buff++
    	addi a1, a1, 1      # mot++
    	addi t0, t0, 1      # i++
    
    	j boucle_ecrire

fin_ecrire:

    	# ÉPILOGUE : Restauration et libération
    	lw s0, 0(sp)        # On restaure le s0 d'origine
    	lw ra, 4(sp)        # On restaure ra
    	addi sp, sp, 8      # On libère la pile
    
    	jr ra               # Retour