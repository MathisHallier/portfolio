#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "TP4.h"

// 1 CREER NOEUD
T_arbre creer_noeud(char * mot){
    T_arbre noeud = (T_arbre)malloc(sizeof(T_Noeud));
    noeud->mot = (char *)malloc(sizeof(char)*30);
    strcpy(noeud->mot,mot); // on copie le mot
    minuscules(noeud->mot); // on met le mot en minuscule
    noeud->pere =NULL; // on initialise les noeuds fils et pere à NULL
    noeud->gauche =NULL;
    noeud->droit = NULL;
    noeud->nombre_occurences =1; // on initialise l'occurence à 1
    free(mot);  // on libère l'espace memoire du mot donné dans la fonction
    return noeud;
}


// 2 AJOUTER NOEUD

T_arbre ajouter_noeud(T_arbre arbre, T_arbre noeud){
    T_arbre courant = arbre;
    T_arbre memoire = arbre;
    int test = 0;
    int position =0; // indicateur de si nous avons trouvé le mot ou non
    if(arbre==NULL)return noeud; // si l'arbre est vide la racine devient le noeud en argument

    while (courant != NULL && position==0){
        test = strcmp(noeud->mot,courant->mot);  // on teste une fois la position des deux mots pour limiter la recherche de strcmp (pas dans chaque if )

        if (test <0 ){                          // le mot est plus petit que celui du noeud courant il sera dans le sous arbre gauche
            memoire = courant;
            courant = courant->gauche;

        }
        else if (test> 0){                      // le mot est plus grand que celui du noeud courant il sera dans le sous arbre droit
                memoire = courant;
                courant = courant->droit;

        }
        else {                                  // le mot est déjà dans l'arbre donc on augmente son occurence
            courant->nombre_occurences++;
            liberer_noeud(noeud);             //liberer la memoire du noeud
            position =1;
        }

    }
    if(position ==1)return arbre;  // si le mot était déjà dans l'arbre

    else {                         // on doit ajouter le mot dans l'arbre a la bonne place
        if(test>0){
                memoire->droit=noeud;
                noeud->pere = memoire;
        }
        else{
            memoire->gauche=noeud;
            noeud->pere = memoire;
        }
        return arbre;
    }
}

//3// RETIRER L'OCCURENCE D'UN MOT

T_arbre abaisser_occurence(T_arbre arbre, char * mot){
    T_arbre courant = arbre;
    T_arbre memoire =arbre;
    int position =0;
    int test ;
    while(courant!=NULL&& position ==0){
        test = strcmp(mot,courant->mot);  // on teste une fois la position des deux mots pour limiter la recherche de strcmp

        if (test <0 ){                          // le mot est plus petit que celui du noeud courant
            memoire = courant;
            courant = courant->gauche;

        }
        else if (test> 0){                      // le mot est plus grand que celui du noeud courant
                memoire = courant;
                courant = courant->droit;

        }
        else {                                  // le mot est déjà dans l'arbre donc on augmente son occurence
            position =1;
        }
    }

    if (position ==1){                  // on a trouvé le noeud
        if (courant->nombre_occurences>1){
                courant->nombre_occurences--;  //si plusieurs occurences, on baisse
                return arbre;
        }
        else{   // si le noeud à supprimer est la racine
        else{   // si le noeud à supprimer est la racine
            if(courant->pere==NULL)return suppression(arbre,courant); // la suppression renverra la nouvelle racine

            else {
                suppression(arbre,courant);
                return arbre;
            }
        }
    }
    else printf("\nL'élément n'a pas été trouvé.\n");
    return arbre;
}


// 4 //  AFFICHER UN ARBRE
int afficher(T_arbre arbre){
    T_arbre courant ;
    char lettre ;
    if(arbre==NULL){
        printf("L'arbre est vide.");
        return 0;
    }
    courant= mini(arbre);  // On prend le minimum de l'arbre puis on va chercher le successeur jusqu'a la fin de l'arbre
    lettre = courant->mot[0];
    printf("%c--",toupper(lettre));
    printf("%s [%d]\n",courant->mot,courant->nombre_occurences);
    courant = successeur(courant);
    while(courant!=NULL){
        if(courant->mot[0]!=lettre){ // si la lettre est différente du mot précédent on modifie l'affichage
                lettre = courant->mot[0];
                printf("%c--",lettre);
                printf("%s [%d]\n",courant->mot,courant->nombre_occurences);
            }
        else {
            printf("   %s [%d]\n",courant->mot,courant->nombre_occurences);
        }

        courant = successeur(courant);
    }

    printf("\n          FIN DE L'ARBRE\n");
    return 0;

}


// 5 // ARBRE PARFAIT

int max(int a, int b){          // la fonction retourne le maximum entre 2 entiers
    return (a>b) ? a : b;       // on s'en servira dans le calcul de la profondeur
}


int hauteur_arbre(T_arbre arbre){

    if(arbre==NULL){
        return -1;
    }

    else{
        return 1 + max(hauteur_arbre(arbre->droit), hauteur_arbre(arbre->gauche));
    }
}


int niveau_noeud(T_arbre arbre){            // donne la profondeur de l'arbre
    if(arbre==NULL) return 0;
    return 1+ niveau_noeud(arbre->pere);
}


int est_parfait(T_arbre arbre, int h){     // h = profondeur de l'arbre
    T_arbre pere_feuille, feuille;
    if(arbre->droit==NULL && arbre->gauche==NULL){
            feuille=arbre;
            pere_feuille=arbre;
            if(pere_feuille->droit!=NULL && pere_feuille->gauche==NULL){            //cad possede 1 fils droit mais pas de fils gauche
                return 0;
            }
            if(niveau_noeud(feuille)<h-1){                 // les feuilles doivent se situer au dernier ou ou avant dernier niveau
                return 0;
            }
    return 1;               // si aucune des conditions n'est réaliée
    }
    if(arbre->gauche!=NULL){
        est_parfait(arbre->gauche, h);
    }

    if(arbre->droit!=NULL){
        est_parfait(arbre->droit, h);
    }
}


// 6 // ARBRE EQUILIBRE
// renvoie 1 si equilibré
int equilibre(T_arbre arbre){
    if(arbre!=NULL){
            int eq=hauteur_arbre(arbre->droit)-hauteur_arbre(arbre->gauche);
            if(eq<=1 && -1<=eq){
                    int t1 = equilibre(arbre->droit);
                    int t2 = equilibre(arbre->gauche);
                    if(t1!=0 && t2!=0)return 1;
                    else return 0;

            }
            else return 0;
    }
    else return 1;

}


// 7 TRANSFORMATION ARBRE EN LISTE

t_liste transformer_arbre2liste(T_arbre arbre){
    T_arbre courant = mini(arbre); // nous cherchons le minimum de l'arbre
    if(arbre==NULL)return NULL;  // si l'arbre est vide nous renvoyons NULL
    t_liste lexique = creerMot(courant->mot); // l'arbre n'est pas vide donc nous créons une liste avec le minimum comme premier mot
    t_liste premier = lexique;
    courant =successeur(courant);
    while(courant!=NULL){  // tant qu'on a pas fini de parcourir l'arbre
        lexique->suivant = creerMot(courant->mot); // on cree un mot pour liste à partir du mot du noeud de l'arbre
        lexique = lexique->suivant;
        lexique->nombre_occurences=courant->nombre_occurences; // on met le bon nombre d'occurences
        courant =successeur(courant); // on passe au mot suivant dans l'arbre
    }

return premier;
}


// 8 INDICE DE JACCARD
float test_similarite(T_arbre arbre1, T_arbre arbre2){
    int test;
    int uni = 0, inter =0; // nombre de mot dans l'union et dans l'intersection
    float j;
    T_arbre succ1 = mini(arbre1);
    T_arbre succ2 = mini(arbre2);
    while(succ2 !=NULL &&succ1 !=NULL){
            test = strcmp(succ2->mot,succ1->mot); // si mot 2 est plus petit que 1 alors on ne le trouvera pas
            if(test>0){
                    succ1=successeur(succ1);
                    uni++;
            }
            else if(test<0){
                uni++;
                succ2 = successeur(succ2);
            }
            else {
                inter++;
                uni++;
                succ1=successeur(succ1);
                succ2 = successeur(succ2);
            }
    }

    if(succ2!=NULL){
        while(succ2!=NULL){
            uni++;
            succ2=successeur(succ2);
        }
    }

    else if (succ1!=NULL) {
        while(succ1!=NULL){
            uni++;
            succ1=successeur(succ1);
        }
    }


    j = ((float)inter)/((float)uni);
    return j;

}





// Fonction Basiques ABR

T_arbre maxi(T_arbre noeud){  // renvoie le maximum de l'arbre
    T_arbre pere;
    if(noeud==NULL)return NULL;
    while (noeud->droit!=NULL)noeud=noeud->droit;
    return noeud;
}

T_arbre mini(T_arbre noeud){ // renvoie le minimum de l'arbre
    if(noeud==NULL)return NULL;
    while (noeud->gauche!=NULL)noeud=noeud->gauche;
    return noeud;
}


T_arbre successeur (T_arbre noeud){ // renvoie le successeur de l'arbre
    T_arbre pere;
    if(noeud==NULL)return NULL;
    if(noeud->droit!=NULL){
            T_arbre succ = mini(noeud->droit);
            return succ;
    }
    else {
        pere = noeud->pere;
        int compt =0;
        while(compt != 1 && pere !=NULL){
            if(pere->gauche==noeud)compt=1;

            else {
                noeud = noeud->pere;
                pere = noeud->pere;
            }
        }
        return pere;
    }
}

T_arbre suppression(T_arbre arbre, T_arbre courant){
    T_arbre pere;
    T_arbre succ;
    int nb_fils = fils(courant) ; // connaitre le nombre de fils qu'a le noeud
    switch(nb_fils){
        case -1: return NULL;           // l'arbre est vide

        case 0 :     // aucun fils
            pere = courant->pere;
            if(pere==NULL){      // si il n'y aucun fils et pas de pere donc seul un noeud dans l'arbre
                    liberer_noeud(courant);
                    return NULL;
            }
            else {
                if(pere->droit==courant)pere->droit=NULL;
                else pere->gauche=NULL;

                liberer_noeud(courant);
                return arbre;
                }

        case 1:       // le noeud à supprimer possède seulement un fils à gauche
            arbre = suppression_fils_gauche(arbre, courant);
            return arbre;

        case 2 : // le noeud à supprimer possède seulement un fils à droite
            arbre = suppression_fils_droit(arbre,courant);
            return arbre;


        case 3 :  // le noeud à supprimer possede deux fils
                arbre = suppression_deux_fils(arbre,courant);
                return arbre;

        }
}



// Fonction qui supprime un noeud avec qu'un fils droit
T_arbre suppression_fils_droit(T_arbre arbre, T_arbre noeud){
            T_arbre pere = noeud->pere;
            if (pere==NULL){       // noeud à supprimer est la racine de l'arbre
                T_arbre minn = mini(noeud->droit);
                T_arbre pere_min = minn->pere;
                if(pere_min!=noeud){ // si le fils de la racine n'est pas le minimum alors
                    pere_min->gauche = minn->droit;
                     if(minn->droit!=NULL) (minn->droit)->pere = pere_min;
                    minn->droit= noeud->droit;
                    }
                 minn->pere=NULL;
                 liberer_noeud(noeud);
                 return minn;
            }
            else if (pere->droit==noeud) pere->droit = noeud->droit;  // si le noeud qu'on supprime venait de la droite du pere

            else pere->gauche= noeud->droit; // si le noeud à supprimer venait de la gauche du pere
            noeud->droit->pere = pere;
            liberer_noeud(noeud);
            return arbre;

}



// Fonction qui supprime un noeud avec qu'un fils gauche

T_arbre suppression_fils_gauche(T_arbre arbre,T_arbre noeud){
            T_arbre pere = noeud->pere;
            if (pere==NULL){       // noeud à supprimer est la racine de l'arbre (changer la racine dans ce cas
                 T_arbre maxx = maxi(noeud->gauche);
                 T_arbre pere_max = maxx->pere;
                 if(pere_max!=noeud){ // si le fils de la racine n'est pas le maximum alors
                    pere_max->droit = maxx->gauche;
                    if(maxx->gauche!=NULL)(maxx->gauche)->pere= pere_max;
                    maxx->gauche = noeud->gauche;
                    }
                 maxx->pere=NULL;
                 liberer_noeud(noeud);
                 return maxx;

            }
            else if (pere->droit==noeud) pere->droit = noeud->gauche;   // si le noeud qu'on supprime venait de la droite du pere

            else pere->gauche= noeud->gauche;   // si le noeud à supprimer venait de la gauche du pere
            noeud->gauche->pere=pere;
            liberer_noeud(noeud);
            return arbre;

}


T_arbre suppression_deux_fils (T_arbre arbre, T_arbre noeud){
    T_arbre succ = successeur(noeud);
    T_arbre pere = noeud->pere;   // son successeur est dans son sous arbre droit car il a deux fils
    if (pere==NULL){             // si le noeud à supprimer est la racine

        succ->gauche = noeud->gauche;  // relier le fils gauche du noeud à supprimer avec le successeur
        if(noeud->gauche!=NULL) (noeud->gauche)->pere = succ;
        if(succ->pere!=noeud){
            (succ->pere)->gauche = succ->droit;
            if(succ->droit !=NULL)(succ->droit)->pere = succ->pere;
            succ->droit=noeud->droit;
            (noeud->droit)->pere=succ;
        }
        succ->pere = NULL;
        return succ;
    }

    // le noeud qu'on supprime n'est pas la racine
    if(pere->droit==noeud)pere->droit=succ; // relier le pere du noeud à supprimer avec le succ
    else pere->gauche =succ;
    succ->gauche = noeud->gauche;  // relier le fils gauche du noeud à supprimer avec le successeur
    if(noeud->gauche!=NULL)(noeud->gauche)->pere = succ;

    if(succ->pere!=noeud){
        (succ->pere)->gauche = succ->droit;
        if(succ->droit !=NULL)(succ->droit)->pere = succ->pere;
        succ->droit=noeud->droit;
        (noeud->droit)->pere=succ;
        }
    succ->pere = pere;
    liberer_noeud(noeud);

    return arbre;

}



// Menu

menu* Menu(menu * retour){
    int nb;
    int choix;
    char *nomfichier = (char*)malloc(sizeof(char)*30);
    char *nom = (char*)malloc(sizeof(char)*30);
    char *nom2 = (char*)malloc(sizeof(char)*30);
    char *mot = (char*)malloc(sizeof(char)*30);
    T_arbre noeud;
    T_arbre arbre;
    T_arbre arbre2;
    a_repertoire_arbre rep_arbre=NULL;
    a_repertoire_lexique rep_lexique =NULL;
    t_liste lexique = NULL;

    printf("\n\n\n");
    printf("-----------------Menu----------------\n");
    printf("1: Creer un nouvel arbre \n");// boucle si on veut ajouter plusieurs mots
    printf("2: Afficher un arbre \n");
    printf("3: Ajouter un mot dans un arbre \n"); // boucle si on veut ajouter plusieurs mots
    printf("4: Retirer un mot d'un arbre \n");
    printf("5: Verifier si un arbre est parfait \n");
    printf("6: Verifier si un arbre est equilibre \n");
    printf("7: Transformer un arbre en un lexique en liste lineairement chainee et afficher le lexique \n");
    printf("8: Tester la similarite entre deux textes \n");
    printf("9: Importer un fichier dans un arbre \n");
    printf("10 : Quitter\n");
    scanf("%d",&choix);
    printf("\n\n\n");

    switch (choix){
        case 1 :
                printf("Entrez le nom de votre arbre: \n");
                scanf("%s",nom);
                printf("Combien de mots voulez-vous ajouter ? \n");
                scanf("%d",&nb);
                if (nb==0){
                    printf("La creation de l'arbre se fera plus tard.");
                    break;
                }
                int compt =2;
                printf("Veuillez rentrer le mot numero %d \n",1);
                scanf("%s",mot);
                arbre = creer_noeud(mot);
                while (compt <= nb){
                    mot=(char*)malloc(sizeof(char)*30);
                    printf("Veuillez rentrer le mot numero %d \n",compt);
                    scanf("%s",mot);
                    noeud=creer_noeud(mot);
                    arbre = ajouter_noeud(arbre,noeud);
                    compt++;
                }
                retour->rep_arbre = modifier_rep_arbre(nom,retour->rep_arbre,arbre);
                break;

        case 2 :
                afficher_repertoire_arbre(retour->rep_arbre);
                printf("\n Choisissez l'arbre parmi ceux affiches : \n");
                scanf("%s", nom);
                arbre = recherche_arbre(nom,retour->rep_arbre);
                afficher(arbre);
                free(nom);
                break;

        case 3:
            afficher_repertoire_arbre(retour->rep_arbre);
            printf("\n\nDans quel arbre voulez-vous ajouter un mot? \n");
            scanf("%s", nom);
            printf("\n \n Entrez le mot que vous voulez ajouter : \n");
            scanf("%s",mot);
            arbre = recherche_arbre(nom,retour->rep_arbre);
            if(arbre==NULL){
                printf("L'arbre demande n'existe pas, veuillez le créer.");
                break;
            }
            afficher(arbre);
            noeud = creer_noeud(mot);
            arbre = ajouter_noeud(arbre,noeud);
            printf("\n Voici l'arbre modifié \n");
            afficher(arbre);
            break;



        case 4:
            afficher_repertoire_arbre(retour->rep_arbre);
            printf("\n\nDans quel arbre voulez-vous retirer un mot? \n");
            scanf("%s", nom);
            printf("\n \n Entrez le mot que vous voulez retirer : \n");
            scanf("%s",mot);
            arbre = recherche_arbre(nom,retour->rep_arbre);
            afficher(arbre);
            arbre2 = arbre;
            arbre = abaisser_occurence(arbre,mot);
            if(arbre2!=arbre) {
                    if(arbre==NULL){
                        retour->rep_arbre =supprimer_arbre(retour->rep_arbre,nom);
                        printf("\n L'arbre est maintenant vide \n");

                    }
                    else {
                        retour->rep_arbre=modifier_rep_arbre(nom,retour->rep_arbre,arbre);
                        printf("\n Voici l'arbre modifie \n");
                        afficher(arbre);
                    }
            }
            else {
                printf("\n Voici l'arbre modifie \n");
                afficher(arbre);
                    }

            free(nom);
            free(mot);
            break;


        case 5 :
            afficher_repertoire_arbre(retour->rep_arbre);
            printf("\n\n Choisissez l\'arbre dont vous voulez verifier la perfection : \n");
            scanf("%s", nom);
            arbre = recherche_arbre(nom,retour->rep_arbre);
            printf("\n");
            afficher(arbre);
            int verif=1, h=hauteur_arbre(arbre);
            //printf("\n arbre de hauteur = %d \n", h);
            if (est_parfait(arbre, h)!=1){
                printf("\n*** L\'ARBRE N\'EST PAS PARFAIT ***\n");
            }
            else printf("\n*** L\'ARBRE EST PARFAIT ***\n");

            free(nom);
            break;


        case 6 :
            afficher_repertoire_arbre(retour->rep_arbre);
            printf("\n\n Choisissez l\'arbre dont vous voulez connaitre si il est equilibre : \n");
            scanf("%s", nom);
            arbre = recherche_arbre(nom,retour->rep_arbre);
            printf("\n");
            afficher(arbre);
            int i = equilibre(arbre);
            if(i==1)printf("\n ***ARBRE EST EQUILIBRE***\n");
            else printf("\n ***ARBRE NON EQUILIBRE*** \n");
            free(nom);
            break;


        case 7 :
            afficher_repertoire_arbre(retour->rep_arbre);
            printf("\n\n Choisissez l'arbre que vous voulez transformer : \n");
            scanf("%s", nom);
            arbre = recherche_arbre(nom,retour->rep_arbre);
            if(arbre==NULL){
                printf("L'arbre n'a pas ete trouve.");
                break;
            }
            lexique = transformer_arbre2liste(arbre);
            afficherMots(lexique);
            printf("\n--------Fin de votre lexique---------\n");
            retour->rep_lexique =modifier_repertoire_lexique(nom,retour->rep_lexique,lexique);
            afficher_repertoire_lexique(retour->rep_lexique);
            printf("\n--------Fin de la liste de lexique---------\n");
            free(nom);
            break;

        case 8 :
            afficher_repertoire_arbre(retour->rep_arbre);
            printf("\n\n Choisissez les deux arbres dont vous voulez tester la similarite : \n");
            printf("Premier arbre :\n");
            scanf("%s", nom);
            printf("Deuxieme arbre :\n");
            scanf("%s", nom2);
            arbre = recherche_arbre(nom,retour->rep_arbre);
            arbre2 = recherche_arbre(nom2,retour->rep_arbre);
            if(arbre==NULL || arbre2==NULL){
                printf("Un des deux arbres n'a pas été trouvé ou est vide");
                free(nom);
                free(nom2);
                break;
            }
            float j = test_similarite(arbre,arbre2);
            printf("\n L'indice de Jaccard est  :%f \n",j);
            free(nom);
            free(nom2);
            break;

        case 9 :
            printf("\n\n Rentrez le nom de votre fichier : \n");
            scanf("%s",nomfichier);
            afficher_repertoire_arbre(retour->rep_arbre);
            printf("\n\n Choisissez un arbre dans lequel vous voulez importer le fichier (mettez un nouveau nom pour un nouvel arbre) : \n");
            scanf("%s", nom);
            arbre = recherche_arbre(nom,retour->rep_arbre);
            arbre2=arbre;
            arbre = importer_fichier_arbre(nomfichier,arbre);
            if(arbre2!=arbre)retour->rep_arbre = modifier_rep_arbre(nom,retour->rep_arbre,arbre);
            afficher(arbre);

            break;

        case 10 :
            retour->choix =1;
            return retour;

    }

return retour;
}




// Fonctions autres
char * ajuster_mot(char *mot){
    int i=0;
    while( i< 30){  // on ajuste la longueur du mot
            if (mot[i]==' ' || mot[i]=='\n'){
                mot[i] = '\0';
                i =30;
            }
            else i++;

        }
    return mot;
}


int fils(T_arbre noeud){
    if(noeud==NULL)return -1;
    if(noeud->droit==NULL && noeud->gauche ==NULL)return 0;        // pas de fils
    else if (noeud->droit!=NULL && noeud->gauche !=NULL)return 3; // deux fils
    else {                                                                  // un fils
        if(noeud->gauche!=NULL)return 1;     // qu'un fils gauche
        else return 2;                            // qu'un fils droit
    }

}


// Transforme le mot avec seulement des minuscules
char *minuscules(char *mot){
    char *co = mot;
    while (*co != '\0'){
        *co = tolower(*co);
        co++;
    }
    return mot;
}


int liberer_noeud (T_arbre noeud){
    free(noeud->mot);
    free(noeud);
    return 0;
}

int clean_arbre(T_arbre arbre){
    T_arbre memoire =arbre;
    arbre = mini(arbre);
    while(!arbre){
        memoire =successeur(arbre);
        liberer_noeud(arbre);
        arbre=memoire;
    }
return 0;
}

// Nous utilisons dans le menu un repertoire d'arbre (liste chainée avec le nom de l'arbre et le pointeur sur l'arbre)
// Cette fonction libère la memoire du repertoire d'arbre
int clean_rep_arbre(a_repertoire_arbre repertoire){
    a_repertoire_arbre memoire = repertoire;

    while(repertoire!=NULL){
        clean_arbre(repertoire->arbre);
        free(repertoire->nom);
        memoire =repertoire->suivant;
        free(repertoire);
        repertoire =memoire;
    }
return 0;
}

// libérer mot d'une liste chainée
int clean_mot(t_liste liste){
    free(liste->mot);
    free(liste);
    return 0;
}


// libérer une liste chainée de mots
int clean_lexique(t_liste liste){
    t_liste memoire;
    while(liste!=NULL){
            memoire = liste->suivant;
            clean_mot(liste);
            liste =memoire;
    }
    return 0;
}


// libérer un repertoire de lexiques
int clean_rep_lexique(a_repertoire_lexique repertoire){
    a_repertoire_lexique memoire = repertoire;
    while(repertoire!=NULL){
        clean_lexique(repertoire->lexique);
        free(repertoire->nom);
        memoire =repertoire->suivant;
        free(repertoire);
        repertoire =memoire;
    }
return 0;

}





// Lié au Menu

a_repertoire_arbre creerlexique_arbre(char *nom){
    a_repertoire_arbre nouveaulexique = (a_repertoire_arbre)malloc(sizeof(t_repertoire_arbre));
    if (nouveaulexique != NULL){
        nouveaulexique->nom = (char*)malloc(sizeof(char)*30) ;
        strcpy(nouveaulexique->nom,nom);
        nouveaulexique -> suivant = NULL ; // pour savoir que fin de liste
    }
    free(nom);
    return nouveaulexique;
}


void afficher_repertoire_arbre (a_repertoire_arbre repertoire){
    int i=1;
    a_repertoire_arbre adresse = repertoire;
    while (adresse!=NULL){
        printf("\n Le répertoire numero %d est le lexique : %s\n", i, adresse->nom);
        adresse =adresse->suivant;
        i++;
    }
    if (i==1){
        printf("\n \nLe repertoire est vide \n \n");
    }
}


T_arbre recherche_arbre (char* nom, a_repertoire_arbre repertoire){  // renvoie l'adresse du lexique avec le nom demandé
    int compt=0;
    while (repertoire!=NULL && compt ==0){
        if (!(strcmp(repertoire->nom,nom))){
            compt =1;
        }
        else {
            repertoire =repertoire->suivant;
        }
    }
    if (repertoire==NULL){
        return NULL;
    }
    else {
        return repertoire->arbre;
    }
}


a_repertoire_arbre modifier_rep_arbre (char* nom, a_repertoire_arbre rep_arbre, T_arbre arbre){   // modifie l'adresse d'un lexique déjà existant ou crée un nouveau lexique
    int compt=0;
    int i=0;
    a_repertoire_arbre adresse =rep_arbre;
    a_repertoire_arbre memoire =rep_arbre;
     if (rep_arbre==NULL){  // test si le repertoire est vide
        rep_arbre = creerlexique_arbre(nom);
        rep_arbre->arbre= arbre;
        return rep_arbre;
    }

    while (adresse!=NULL && compt ==0){
        if (!(strcmp(adresse->nom,nom))){
            compt =1;
        }
        else {
            memoire =adresse;
            adresse =adresse->suivant;
            i++;
        }
    }
    if (adresse==NULL){  // si on trouve pas on le créé
        memoire->suivant = creerlexique_arbre(nom);
        adresse = memoire->suivant;
        adresse->arbre= arbre ;
        return rep_arbre;
    }
    else {    // si on trouve on modifie l'adresse de départ du lexique
        adresse->arbre = arbre;
        return rep_arbre;
    }
}


a_repertoire_arbre supprimer_arbre (a_repertoire_arbre repertoire, char *nom){
    a_repertoire_arbre memoire =repertoire;
    a_repertoire_arbre adresse = repertoire;
    int compt =1;
    int i =0;
    while(adresse !=NULL && i ==0){
        if(!(strcmp(adresse->nom,nom))){
            i =1;
        }
        else {
            memoire = adresse;
            adresse = adresse->suivant;
            compt++;
        }
    }

    if (i==1){  // on a trouvé le lexique

        if (compt==1){  // on supprime le premier
            adresse = repertoire->suivant;
            free(repertoire->nom);
            free(repertoire);
            return adresse;
            }

        else if (adresse->suivant ==NULL){//on supprime le dernier
            memoire->suivant = NULL;
            free(adresse->nom);
            free(adresse);
            return repertoire;
        }

        else {  // on supprime un lexique entre deux autres
            memoire->suivant = adresse->suivant;
            free(adresse->nom);
            free(adresse);
            return repertoire;

        }


    }

    else { // on a pas trouvé le lexique
        return repertoire ;
    }

}

// Fonctions pour mettre les mots d'un fichier dans un arbre

T_arbre importer_fichier_arbre (char * nomfichier, T_arbre arbre){
    T_arbre noeud =arbre;
    char *mot;
    FILE *fichier = fopen(nomfichier,"r");
    if (feof(fichier))return NULL;  // si fichier vide, on arrête
    if(arbre==NULL){
        mot = (char *)malloc(sizeof(char)*30);
        fgets(mot,sizeof(char)*30,fichier);
        ajuster_mot(mot);
        noeud = creer_noeud(mot);
        arbre = noeud;
    }
    while (!feof(fichier)){  // tant qu'on est pas à la fin du fichier
        mot = (char *)malloc(sizeof(char)*30);
        fgets(mot,sizeof(char)*30,fichier);
        ajuster_mot(mot);
        noeud = creer_noeud(mot);
        arbre = ajouter_noeud(arbre, noeud);
    }
    fclose(fichier);
    return arbre;
}


// Modifie l'adresse d'un lexique déjà existant ou crée un nouveau lexique
a_repertoire_lexique  modifier_repertoire_lexique (char* nom, a_repertoire_lexique repertoire, t_liste liste){
    int compt=0;
    int i=0;
    char *nom2 = (char *)malloc(sizeof(char)*30);
    strcpy(nom2,nom);
    a_repertoire_lexique adresse =repertoire;
    a_repertoire_lexique memoire =repertoire;
     if (repertoire==NULL){  // test si le repertoire est vide
        repertoire = creerlexique_lexique(nom2,liste);
        return repertoire;
    }

    while (adresse!=NULL && compt ==0){
        if (!(strcmp(adresse->nom,nom2))){
            compt =1;
        }
        else {
            memoire =adresse;
            adresse =adresse->suivant;
            i++;
        }
    }
    if (adresse==NULL){  // si on trouve pas on créé un lexique de ce nom mais vide
        memoire->suivant = creerlexique_lexique(nom2,liste);
        adresse = memoire->suivant;
        adresse->lexique= liste ;
        return repertoire;
    }
    else {    // si on trouve on modifie l'adresse de départ du lexique
        adresse->lexique = liste;
        return repertoire;
    }
}


a_repertoire_lexique creerlexique_lexique(char *nom, t_liste liste){
    a_repertoire_lexique nouveaulexique = (a_repertoire_lexique)malloc(sizeof(t_repertoire_lexique));
    if (nouveaulexique != NULL){
        nouveaulexique->nom = (char*)malloc(sizeof(char)*30) ;
        strcpy(nouveaulexique->nom,nom);
        nouveaulexique->lexique=liste;
        nouveaulexique-> suivant = NULL ; // pour savoir que fin de liste
    }
    free(nom);
    return nouveaulexique;
}


void afficher_repertoire_lexique (a_repertoire_lexique repertoire){
    int i=1;
    a_repertoire_lexique adresse = repertoire;
    while (adresse!=NULL){
        printf("\n Le répertoire numero %d est le lexique : %s\n", i, adresse->nom);
        adresse =adresse->suivant;
        i++;
    }
    if (i==1){
        printf("\n \nLe repertoire est vide \n \n");
    }

}


// FONCTIONS LISTES CHAINEES

t_mot *creerMot(char *mot){
    t_mot *nouveauMot = (t_liste)malloc(sizeof(t_mot));
    if (nouveauMot != NULL){
        nouveauMot -> nombre_occurences =1;
        nouveauMot->mot = (char *)malloc(sizeof(char)*30);
        strcpy(nouveauMot->mot,mot);
        nouveauMot-> suivant = NULL ; // pour savoir que fin de liste
    }
    //free(mot); ici on ne libere pas car on ne s'en sert qu'avec un mot d'un arbre
    return nouveauMot;
}


t_mot *ajouterMot(t_liste liste, char *mot){
    t_liste adresse = liste; // pointeur tête de liste
    t_liste memoire ;
    t_liste memoire2;
    int n ;
    minuscules(mot);
    if(liste==NULL){
        liste= creerMot(mot);
        return liste;
    }
    n= alphabet_deuxmot(adresse, mot);

    if (n==-1){ // mot est avant le premier de la liste
        memoire = creerMot(mot);
        memoire->suivant = liste;
        return memoire;
    }

    else {
        while(adresse->suivant != NULL){
            n=alphabet_deuxmot(adresse,mot);
            switch (n) {
                case 0 : // on a trouvé le mot
                    adresse->nombre_occurences+=1;
                    return liste;

                case 1 : // le mot est entre deux mots de la liste
                     memoire = adresse->suivant;
                     adresse->suivant = creerMot(mot);
                     memoire2 = adresse->suivant;
                     memoire2->suivant = memoire;
                     return liste;

            }
            adresse = adresse->suivant;
        }
        adresse->suivant =creerMot(mot); // le mot est le dernier
        return liste;

    }
}


// Fonctions pour connaitre la place du mot par rapport au mot actuel dans la liste chainee

int alphabet_deuxmot(t_liste liste, char *mot){
    t_liste motsuiv;
    char *mot1 = liste->mot;
    char *mot2;
    int nb1 = strlen(mot1);
    int nb2;
    int compt =0;
    int i =0;
    if (strcmp(mot,mot1)==0){ // si égalité on retourne 0 dans le reste on ne peut plus avoir égalité ave mot1
        return 0;
    }
    while(mot1[i] <= mot[i] && compt <nb1 ){ // test si le mot est après le premier de la liste
            if (mot1[i] < mot[i]){
                compt =nb1;
            }
            else {
                compt++;
                i++;
            }
    }

    if (compt== nb1){    // le mot est strictement après le premier
        compt =0;
        i=0;

        if (liste->suivant !=NULL){
            motsuiv = liste->suivant;
            mot2 = motsuiv->mot;
            nb2 = strlen(mot2);
            if (strcmp(mot,mot2)==0){   // mot égal au mot2
                return 2;
            }
            while(mot[i] <= mot2[i] && compt <nb2 ){ // test si le mot est avant le deuxieme de la liste
                if (mot[i] < mot2[i]){
                    compt = nb2+1;
                }
                else {
                    compt++;
                    i++;
                }
            }
            if (compt==nb2+1){
                return 1;   // mot est entre les deux

            }
            else  {
                return 3;
                // le mot est après les deux
            }

        }
        else {
            return 4; // le mot est en fin de liste
        }
    }
    else {
        return -1; // le mot est avant le premier de la liste
    }

}


void afficherMots(t_liste liste){
    char lettre =' ';
    char test;
    t_liste adresse =liste;
    while (adresse != NULL){
        if(lettre!= *(adresse->mot)){  // si la première lettre d'un mot est différente du mot précédent on affiche la lettre en majuscule
            lettre = *(adresse->mot);
            printf("%c \n",toupper(lettre));
        }
        printf("--- %s [%d] \n", adresse->mot,adresse->nombre_occurences);
        adresse=adresse->suivant;
    }
    printf("\n------fin du lexique------\n");
}




