#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ex3.h"
int main(){
    int n;
    Voiture* voitures=(Voiture*)malloc(sizeof(Voiture));
    printf("On initialise : rentrez le nombre de voitures que vous souhaitez rentrer dans le parc : ");//initialisation des voitures dans le parc
    scanf("%d",&n);
    init(voitures, n);
    printf("Initialisation terminee");
    int k=0;
    while(k==0)//tant que k est égal à 0 on met le menu, si il vaut 1 cela signifie qu'on arrête le menu
        k=Menu(voitures);

    printf("On libere l'espace alloue\n");//on libere dynamiquement l'esapce alloue durant notre initialisation
    cleanListe(voitures);
    printf("L'espace a ete libere\n");
    return 0;
}
