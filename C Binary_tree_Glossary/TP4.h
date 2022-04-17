#ifndef TP4_H_INCLUDED
#define TP4_H_INCLUDED

typedef struct T_Noeud {
    char * mot;
    int nombre_occurences;
    struct T_Noeud *pere;
    struct T_Noeud *gauche;
    struct T_Noeud *droit;
}T_Noeud;


typedef T_Noeud *T_arbre;

typedef struct t_repertoire_arbre {    // liste chainée avec des lexiques et leurs noms
    T_arbre arbre;
    char *nom;
    T_arbre suivant;
}t_repertoire_arbre;

typedef t_repertoire_arbre *a_repertoire_arbre;

typedef struct t_mot {
    char *mot;
    unsigned int nombre_occurences ;
    struct t_mot *suivant; // pointeur sur le mot d'après

}t_mot;

typedef t_mot *t_liste; // tête de liste




typedef struct t_repertoire_lexique {    // liste chainée avec des lexiques et leurs noms
    t_liste lexique;
    char *nom;
    t_liste suivant;
}t_repertoire_lexique;

typedef t_repertoire_lexique *a_repertoire_lexique;




typedef struct menu {
    a_repertoire_arbre rep_arbre;
    a_repertoire_lexique rep_lexique;
    int choix;
}menu;



// Demandé dans le TP

T_arbre creer_noeud(char * mot);
T_arbre ajouter_noeud(T_arbre arbre, T_arbre noeud);
T_arbre abaisser_occurence(T_arbre arbre, char * mot);
int afficher(T_arbre arbre);
float test_similarite(T_arbre arbre1, T_arbre arbre2);
int equilibre(T_arbre arbre);





// Lié au Menu

menu * Menu(menu * retour);

void afficher_repertoire_arbre (a_repertoire_arbre repertoire);
void afficher_repertoire_lexique (a_repertoire_lexique repertoire);

T_arbre recherche_arbre (char* nom, a_repertoire_arbre repertoire);
a_repertoire_arbre modifier_rep_arbre (char* nom, a_repertoire_arbre rep_arbre, T_arbre arbre);
a_repertoire_lexique  modifier_repertoire_lexique (char* nom, a_repertoire_lexique repertoire, t_liste liste);
a_repertoire_arbre supprimer_arbre (a_repertoire_arbre repertoire, char *nom);

a_repertoire_arbre creerlexique_arbre(char *nom);
a_repertoire_lexique creerlexique_lexique(char *nom,t_liste liste);



// Fonctions listes chainées
t_mot *creerMot(char *mot);
t_mot *ajouterMot(t_liste liste, char *mot);
int alphabet_deuxmot(t_liste liste, char *mot);
void afficherMots(t_liste liste);



// Fonctions basiques ABR
T_arbre mini(T_arbre noeud);
T_arbre maxi(T_arbre noeud);
T_arbre successeur (T_arbre noeud);
T_arbre suppression(T_arbre arbre, T_arbre courant);
T_arbre suppression_fils_droit(T_arbre arbre, T_arbre noeud);
T_arbre suppression_fils_gauche(T_arbre arbre, T_arbre noeud);
T_arbre suppression_deux_fils (T_arbre arbre, T_arbre noeud);

// Fonction  ajoutées
char * ajuster_mot(char *mot);   // fonction qui ré ajuste la longueur d'un mot (enlève les espaces et \n
int fils(T_arbre noeud);
char *minuscules(char *mot);
T_arbre importer_fichier_arbre (char * nomfichier, T_arbre arbre);
int max(int a, int b);
int hauteur_arbre(T_arbre arbre);
int niveau_noeud(T_arbre arbre);
int est_parfait(T_arbre arbre, int h);
int est_equilibre(T_arbre arbre);




int liberer_noeud (T_arbre noeud);
int clean_arbre(T_arbre arbre);
int clean_mot(t_liste liste);
int clean_lexique(t_liste liste);

int clean_rep_arbre(a_repertoire_arbre repertoire);
int clean_rep_lexique(a_repertoire_lexique repertoire);




#endif // TP4_H_INCLUDED
