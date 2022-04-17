#include <stdio.h>
#include <stdlib.h>
#include "ex3.h"



Voiture* creation_voiture (){ //allocation d'espace
    Voiture* voit = (Voiture*)malloc(sizeof(Voiture));
    return voit;
}

void init (Voiture* voitures, int n){
   Voiture* adresse = voitures; // copie de l'adresse pour la voiture 1
    char* modele=malloc(sizeof(char)*30);
    char* immatriculation=malloc(sizeof(char)*30);
    int kms = 0, location;


    // on rajoute à chaque itération une nouvelle voiture
    for (int i =0; i < n; i++){

        printf("\nVoiture numero %d \n", i+1);
        printf("Quel modele?");
        scanf("%s", modele);
        adresse->modele=malloc(sizeof(char)*strlen(modele));//allocation mémoire car utilisation de char*
        strcpy(adresse->modele , modele);//utilisation de strcpy pour copie d'un char*
        //printf("%s",adresse->modele);

        printf("Quel est le numero d'immatriculation ?");
        scanf("%s", immatriculation);
        adresse->immatriculation=malloc(sizeof(char)*strlen(immatriculation));//allocation mémoire car utilisation de char*
        strcpy(adresse->immatriculation, immatriculation);//utilisation de strcpy pour copie d'un char*
        //printf("%s",adresse->immatriculation);

        printf("Quel est le nombre de kilometres?");

        //fgets(&kms,sizeof(int),stdin);
        scanf("%d",&kms);
        adresse->km = kms;
        //printf("Le nb de kms : %d",adresse->km);

        printf("Tapez 1 si la voiture est louee et 0 sinon ");
        scanf("%d",&location);
        if (location ==0 ){
            adresse->etat_voiture = 0;
        }
        else {
            adresse->etat_voiture = 1;
        }
        //printf("\n etat location : %d \n\n",adresse->etat_voiture);

        if ((i+1)!=n){ //si on rajoute une voiture on alloue de l'espace pour la voiture suivante sinon on pointe vers NULL
        printf("\nVoiture suivante ");
        adresse->suivante = creation_voiture();
        adresse = adresse->suivante;
        }
        else adresse->suivante=NULL;

    }


return 0;

}







//1

void louer(char *matricule, Voiture *voitures){//fonction pour louer une voiture du parc a partir de l immatriculation
    Voiture* adresse=voitures;
    while(adresse!=NULL && strcmp(adresse->immatriculation,matricule))//on parcourt la liste jusqu'à trouver la bonne voiture
        adresse=adresse->suivante;
    if (adresse != NULL ){//verification que la voiture a bien ete retrouvee
            if (adresse->etat_voiture == 0){   //  1 non dispo ; 0 dispo
                adresse->etat_voiture =1 ;
                printf("On loue la voiture, c'est la %s avec immatriculation %s\n",adresse->modele,adresse->immatriculation);            }
            else {
                    printf("La voiture est deja louee\n");
            }

    }
    else{
            printf("Erreur la voiture n'existe pas!!\n");
    }


return 0;
}






//2
void retour (char *matricule, Voiture *voitures){ // fonction pour retourner une voiture du parc a partir de l immatriculation
    Voiture *adresse;
    adresse = voitures;
    int km =0;

    while(adresse!=NULL&& strcmp(adresse->immatriculation,matricule)){//on parcourt la liste jusqu'à trouver la bonne voiture
                adresse = adresse->suivante;
    }

    if (adresse!=NULL){  // verification que la voiture a bien ete trouvee
            if (adresse->etat_voiture!=0){
                printf("Combien de km avez-vous effectue avec la voiture ?");//recuperation du nombre de kilometres effectue
                scanf("%d",&km);
                adresse->km+=km;
                adresse->etat_voiture =0;
                printf("La voiture avec l'immatriculation %s bien ete rendue!!",adresse->immatriculation);
            }

            else {
                printf("La voiture est deja dans le parc!!");
            }
        }

    else {
        printf("La voiture n'existe pas");
        }



return 0;
}

//3

void etat (char *matricule, Voiture *voitures){ // fonction pour ecrire l'etat d'une voiture du parc a partir de l immatriculation
     Voiture *adresse;
     adresse = voitures;

     while (adresse != NULL && strcmp(matricule,adresse->immatriculation)){//on parcourt la liste jusqu'à trouver la bonne voiture
                adresse = adresse->suivante;
     }

    if (adresse!=NULL) { // verification que la voiture a bien ete trouvee
        printf("Modele : %s\n", adresse->modele);
        printf("Numero Immatriculation : %s \n", adresse->immatriculation);
        printf("Kilometrage : %d \n",adresse->km);
        if (adresse->etat_voiture==0) printf("Etat de location : non louee \n");
        else printf("Etat de location : louee \n");
    }

    else {
            printf("Erreur la voiture n'existe pas!! \n");


    }
return 0;

}

//4

void etatParc (Voiture *voitures){
    Voiture *adresse=voitures;
    int nbvoit =0, nbloc=0,nbdispo=0;//initialisation des variables pour les calculs
    float nbkm=0;
    if (adresse!=NULL){//verification que la liste contient au moins une voiture
        while(adresse !=NULL ){
            nbkm += adresse->km;
            nbvoit +=1;//variable permettant de connaitre le nombre de voitures pour la moyenne
            if (adresse->etat_voiture == 0){//pour savoir si la voiture est en location ou non
                nbdispo +=1;
            }
            else {
                nbloc +=1;
            }
            adresse=adresse->suivante;
        }
        nbkm =nbkm/nbvoit;
        printf("1: Il y a %d voitures dans le parc. \n", nbvoit);
        printf("2 : Il y a %d voitures en location.\n", nbloc);
        printf("3 : Il y a %d voitures disponibles. \n",nbdispo);
        printf("4 : Le kilometrage moyen par voiture est de %f", nbkm);
    }

    else {
        printf("La liste de voiture est vide");
        return 0;
    }
    return 0;


}


void save(Voiture* v){
    Voiture* adresse = v;
    int count=0;//variable permettant de verifier que le bon nombre de voitures a ete sauvegarde
    FILE *save = fopen("Voitures.bin","wb");//ouverture du fichier binaire dans laquelle se fera la sauvegarde
    printf("Sauvegarde en cours\n");
    while (adresse != NULL) //pour sauvergarder toutes les voitures de la liste
    {
        fwrite(adresse, sizeof(Voiture), 1, save);//ecriture dans le fichier de l element voiture
        adresse = adresse->suivante;
        count++;
    }
    printf("\n La sauvegarde de %d voitures a ete effectuee !!\n", count);
    fclose(save);//fermeture du fichier
}

void afficheListe(Voiture* v)//fonction permerttant d'afficher la liste de toutes les voitures
{
    Voiture *adresse = v;
    while (adresse != NULL)//pour l'affichage de toutes les voitures de la liste
    {
        printf("Modele: %s | Numero d'Immatriculation: %s | Kilometrage: %d ", adresse->modele, adresse->immatriculation, adresse->km);
        if (adresse->etat_voiture==0) printf("| Etat de location: non louee\n");
        else printf("| Etat de location: louee\n");
        adresse = adresse->suivante;
    }
}

void cleanListe(Voiture *v)//fonction permettant de liberer dynamiquement l'espace alloue pour la liste chainee
{
    Voiture *adresse = v;
    Voiture *tmp;//utilisation d un temp pour acceder a l adresse suivante lors de la liberation de l adresse
    while (adresse != NULL)
    {
        tmp = adresse->suivante;
        free(adresse);//liberation de l espace alloue pour cette adresse
        adresse=tmp;
    }
}
int Menu(Voiture *voitures){
    int choix;//variable pour connaitre le choix de l utilisateur dans le menu
    char* immatriculation=malloc(sizeof(char)*30);

    printf("\n\n\n");
    printf("-----------------Menu----------------\n");
    printf("1: Louer une voiture \n2: Retour d'une voiture\n");
    printf("3: Etat d'une voiture \n4: Etat du parc de voitures\n");
    printf("5: Sauvegarder l'etat du parc \n0: Fin du programme\n");
    scanf("%d",&choix);
    printf("\n\n\n");


    switch (choix){
        case 0: return 1;//l'utilisateur souhaite quitter le menu on retourne 1 pour arreter de l afficher
        case 1: printf("Voici la liste des voitures du parc : \n");
                afficheListe(voitures);
                printf("\nRentrez le Numero d'immatriculation : ");
                scanf("%s",immatriculation);
                louer(immatriculation, voitures);
                break;
        case 2: printf("Voici la liste des voitures du parc : \n");
                afficheListe(voitures);
                printf("\nRentrez le Numero d'immatriculation : ");
                scanf("%s",immatriculation);
                retour(immatriculation, voitures);
                break;

        case 3: printf("Voici la liste des voitures du parc : \n");
                afficheListe(voitures);
                printf("\nRentrez le Numero d'immatriculation : ");
                scanf("%s",immatriculation);
                etat(immatriculation, voitures);
                break;

        case 4:
            printf("etat parc : \n");
            etatParc(voitures);
            break;

        case 5 :
            printf("on sauvegarde la liste de voitures suivante : \n");
            afficheListe(voitures);
            printf("sauvegarde en cours\n");
            save(voitures);
            break;

    }

return 0;
}



