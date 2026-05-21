#include <stdio.h>
#include <stdlib.h>

void contour(char *file, char *buff, int max_taille_ligne);
void contour_milieu(char *file, char *buff, int max_taille_ligne);
void lire_mot(char *file, char *mot, int *t);
void ecrire_mot(char *buff, char *mot, int t);

int main(){
    char ch;

    FILE *fptr = fopen("test", "r");
    char file[50];
    int i = 0;
    while ((ch = fgetc(fptr)) != EOF){
        file[i] = ch;
        i++;
    }
    file[i] = '\0';

    char buff[1000];
    contour_milieu(file, buff, 6);
    printf("%s", buff);

    fclose(fptr);

}

void contour(char *file, char *buff, int max_taille_ligne){
    for(int i=0; i<max_taille_ligne+2; i++){
        buff[0] = '*';
        buff++;
    }
    buff[0] = '\n';
    buff++;
    char mot[100];
    int taille_mot;
    int nb_caracteres_ecrits = 0;
    
    while(file[0] != '\0'){
        if (nb_caracteres_ecrits == max_taille_ligne){
            if(file[0] == '\n') file++;
            buff[0] = '*';
            nb_caracteres_ecrits = 0;
            buff++;
            buff[0] = '\n';
        }
        else if((buff-1)[0] == '\n'){
            buff[0] = '*';
            nb_caracteres_ecrits = 0;
        }
        else if(file[0] == ' '){
            buff[0] = ' ';
            file++;
            nb_caracteres_ecrits++;
        }
        else if(file[0] == '\n'){
            for(int va = 0; va < max_taille_ligne - nb_caracteres_ecrits; va++){
                buff[0] = ' ';
                buff++;
            }
            buff[0] = '*';
            buff++;

            buff[0] = '\n';
            file++;
            nb_caracteres_ecrits = 0;
        }
        else{
            lire_mot(file, mot, &taille_mot);
            if(taille_mot <= max_taille_ligne - nb_caracteres_ecrits){
                ecrire_mot(buff, mot, taille_mot);
                buff += taille_mot-1;
                file += taille_mot;
                nb_caracteres_ecrits += taille_mot;
            }
            else{
                if(nb_caracteres_ecrits == 0){
                    printf("Le nombre maximale de ligne est trop petit par rapport à la taille des mots!\n");
                    exit(1);
                }
                for(int va = 0; va < max_taille_ligne - nb_caracteres_ecrits; va++){
                    buff[0] = ' ';
                    buff++;
                }
                buff[0] = '*';
                buff++;
                buff[0] = '\n';
            }
        }

        buff++;
    }


    for(int i=0; i<max_taille_ligne+2; i++){
        buff[0] = '*';
        buff++;
    } 

    buff[0] = '\n';
    buff++;
    buff[0] = '\0';
}

void contour_milieu(char *file, char *buff, int max_taille_ligne){
    for(int i=0; i<max_taille_ligne+2; i++){
        buff[0] = '*';
        buff++;
    }
    buff[0] = '\n';
    buff++;
    char mot[100];
    char ligne[100];
    int taille_ligne = 0;
    int taille_mot;
    int nb_caracteres_ecrits = 0;
    
    while(file[0] != '\0'){
        if (nb_caracteres_ecrits == max_taille_ligne){
            if(file[0] == '\n') file++;
            ecrire_mot(buff, ligne, taille_ligne);
            buff += taille_ligne;
            buff[0] = '*';
            nb_caracteres_ecrits = 0;
            taille_ligne = 0;
            buff++;
            buff[0] = '\n';
        }
        else if((buff-1)[0] == '\n'){
            buff[0] = '*';
            nb_caracteres_ecrits = 0;
            taille_ligne = 0;
        }
        else if(file[0] == ' '){
            ligne[taille_ligne] = ' ';
            taille_ligne++;
            file++;
            nb_caracteres_ecrits++;
        }
        else if(file[0] == '\n'){
            int reste = (max_taille_ligne - nb_caracteres_ecrits) % 2;
            for(int va = 0; va < (max_taille_ligne - nb_caracteres_ecrits)/2; va++){
                buff[0] = ' ';
                buff++;
            }

            ecrire_mot(buff, ligne, taille_ligne);
            buff += taille_ligne;

            for(int va = 0; va < (max_taille_ligne - nb_caracteres_ecrits)/2 + reste; va++){
                buff[0] = ' ';
                buff++;
            }

            buff[0] = '*';
            buff++;

            buff[0] = '\n';
            file++;
        }
        else{
            lire_mot(file, mot, &taille_mot);
            if(taille_mot <= max_taille_ligne - nb_caracteres_ecrits){
                ecrire_mot(ligne + taille_ligne, mot, taille_mot);
                taille_ligne += taille_mot;
                file += taille_mot;
                nb_caracteres_ecrits += taille_mot;
                continue;
            }
            else{
                if(nb_caracteres_ecrits == 0){
                    printf("Le nombre maximale de ligne est trop petit par rapport à la taille des mots!\n");
                    exit(1);
                }
                int reste = (max_taille_ligne - nb_caracteres_ecrits) % 2;
                for(int va = 0; va < (max_taille_ligne - nb_caracteres_ecrits)/2; va++){
                    buff[0] = ' ';
                    buff++;
                }

                ecrire_mot(buff, ligne, taille_ligne);
                buff += taille_ligne;

                for(int va = 0; va < (max_taille_ligne - nb_caracteres_ecrits)/2 + reste; va++){
                    buff[0] = ' ';
                    buff++;
                }

                buff[0] = '*';
                buff++;

                buff[0] = '\n';
                file++;
            }
        }

        buff++;
    }


    for(int i=0; i<max_taille_ligne+2; i++){
        buff[0] = '*';
        buff++;
    } 

    buff[0] = '\n';
    buff++;
    buff[0] = '\0';
}


void lire_mot(char *file, char *mot, int *t){
    *t = 0;
    while(file != NULL  && file[0] != ' ' && file[0] != '\n' && file[0] != '\0'){
        mot[(*t)++] = file[0];
        file++;
    }
}

void ecrire_mot(char *buff, char *mot, int t){
    for(int i = 0; i<t; i++){
        buff[0] = mot[i];
        buff++;
    }
}