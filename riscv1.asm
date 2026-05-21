.data
path: .asciz "/home/khiro/Desktop/assembly/test"
etoile: .asciz "*************\n"
buffer: .space 100
new_str: .space 100
file_descriptor: .word -1
nb_char: .word 0

.text
main:
ori a7, zero, 1024 # Pour lire un fichier
la a0, path # on met la chaine du chemin du fichier dans a0
ori a1, zero, 0 # càd read-only
ecall

# ici a0 contient le file_descripteur
la a1, buffer
jal ra, lecture

ori a3, zero, 10 # nombre de caractéres dans une ligne
la a2, new_str
jal ra, ecriture

ori a7, zero, 4
la a0, etoile
ecall

la a0, new_str
ecall

la a0, etoile
ecall

ori a7, zero, 10
ecall

# ------------ Fonctions ------------
# --- fonction écriture avec des étoiles ------
ecriture: # a1 contient l'adresse du buffer lus, a2 contient l'adresse du segment où on écrit
# a3 contient le nombre de caractéres dans une ligne
# a0 contient le nombre de caractères lus dans le buffer
addi sp, sp, -40 # prologue
sw a1, 0(sp)
sw a2, 4(sp)
sw a0, 8(sp)
sw s1, 12(sp)
sw s2, 16(sp)
sw s3, 20(sp)
sw s4, 24(sp)
sw s5, 28(sp)
sw s6, 32(sp)
sw a3, 36(sp)

ori s1, zero, '\n'
ori s2, zero, '*'
ori s3, a3, 0
ori s4, zero, ' '

ori s5, zero, 0 # s5 compteur du buffer


boucle: 
beq s5, a0, fin_lecture

lb s6, 0(a1)

bne s6, s1, skip # si s6 != '\n' on se met à skip

espace_loop:
sb s4, 0(a2)
addi a2, a2, 1
addi s3, s3, -1
bne s3, zero, espace_loop

sb  s2, 0(a2)
addi a2, a2, 1

sb s1, 0(a2)
addi a2, a2, 1

addi a1, a1, 1
addi s5, s5, 1

or s3, a3, zero
j boucle

skip:
sb s6, 0(a2)
addi a2, a2, 1
addi a1, a1, 1
addi s5, s5, 1
addi s3, s3, -1
j boucle

fin_lecture:

lw a1, 0(sp) # epilogue
lw a2, 4(sp)
lw a0, 8(sp)
lw s1, 12(sp)
lw s2, 16(sp)
lw s3, 20(sp)
lw s4, 24(sp)
lw s5, 28(sp)
lw s6, 32(sp)
lw a3, 36(sp)

addi sp, sp, 40

jr ra

# Fonction lecture fichier --------------------
lecture : # a0 contient le file_descripteur, a1 contient l'adresse où on va stocker ce qu'on lit
# au retour le nombre de caractères lus sera stocké dans a0

addi sp, sp, -16 # prologue
sw a0, 0(sp)
sw a1, 4(sp)
sw s1, 8(sp)
sw a7, 12(sp)

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
addi sp, sp, 16

jr ra