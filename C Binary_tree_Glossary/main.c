#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "TP4.h"


// un fichier test.txt est dans le dossier du projet
int main() {
    menu *retour = (menu*)malloc(sizeof(menu));
    retour->rep_arbre =NULL;
    retour->rep_lexique =NULL;
    retour->choix =0;

    while (!retour->choix){
            retour =Menu(retour);
    }
    clean_rep_arbre(retour->rep_arbre);
    clean_rep_lexique(retour->rep_lexique);
    free(retour);
    return 0;
}




