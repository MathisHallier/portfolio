#ifndef EX3_H_INCLUDED
#define EX3_H_INCLUDED


typedef struct Voiture{
    char* modele;
    char* immatriculation;
    int km;  //nombre km de la voiture
    int etat_voiture;//on l utilise comme un booleen: 0 pour non louee 1 pour louee
    struct Voiture *suivante; // chainée
}Voiture;


Voiture* creation_voiture ();
void init (Voiture* voitures, int n);
void louer(char *matricule, Voiture *voitures);
void retour (char *matricule, Voiture *voitures);
void etat (char *matricule, Voiture *voitures);
void etatParc (Voiture *voitures);
void afficheListe(Voiture* v);
void save(Voiture* v);
void cleanListe(Voiture *v);
int Menu(Voiture* voitures);



#endif // EX3_H_INCLUDED
