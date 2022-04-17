# -*- coding: utf-8 -*-
"""
Created on Sun Dec 26 18:44:43 2021

@author: mathi
"""

import tkinter
import numpy

#initialisation des variables globales,la taille correspondant à la taille de la grille, la matrice à la grille en ellle-même et stop pour stopper le lancement du jeu
global taille
global matrice
global stop
# assignation d'une valeur de base à ces valeurs
stop=1

taille=100
matrice = numpy.random.randint(2,size=(taille,taille))








#affichage de la matrice avec les couleurs correspondant à l'existence de la vie ou non
def afficher_mat(matrice,taille):
    for i in range(taille):
            for j in range(taille):
                if(matrice[i][j]==1) :
                    couleur ="red"#la cellule est vivante
                else :
                    couleur = "white"#la cellule est morte
                case = tkinter.Canvas(tableau, width=10, height=10, bg=couleur)#utilisation du canvas de tkinter pour créer les cellules
                case.grid(row = i , column =j)# permet de mettre notre cellule dans un tableau de deux dimensions

#génération de cellules vivantes ou mortes en fonction de leurs voisins
def nombre_voisin(matrice,taille) :
    nbvois = 0
    matcop = matrice.copy()
    for i in range(taille) :
            for j in range(taille) :
                    nbvois = matrice[(taille+i)%taille][(taille+j+1)%taille]+matrice[(taille+i)%taille][(taille+j-1)%taille] # addition même ligne
                    nbvois = nbvois + matrice[(taille+i+1)%taille][(taille+j)%taille]+matrice[(taille+i-1)%taille][(taille+j)%taille] # addition même colonne
                    nbvois = nbvois + matrice[(taille+i+1)%taille][(taille+j+1)%taille]+matrice[(taille+i-1)%taille][(taille+j+1)%taille] # diagonales à droite
                    nbvois = nbvois + matrice[(taille+i+1)%taille][(taille+j-1)%taille]+matrice[(taille+i-1)%taille][(taille+j-1)%taille]  #diagonales à gauche

                    if(matcop[i][j]==1) :
                        if (nbvois>=4 or nbvois <=1 ) :#vérification des voisins
                            matrice[i][j]=0#cellule morte

                
                    else :
                        if (nbvois==3) :
                            matrice[i][j]=1 #cellule vivante
                    
                    nbvois =0 
                    
    return matrice
    
#defintion de la fonction lancer bouton qui lancera le jeu
def lancer_bouton() :
    global matrice
    global taille 
    global stop
    if (stop==1): #si le bouton arreter est enclenché on peut le lancer 
        stop = 0 #le jeu est lancé donc il on met stop à 0
        boucle() #on lance la boucle qui fait tourner le jeu tant que le bouton stop n est pas utilisé


#definition de la boucle faisant tourner le programme     
def boucle():
    global stop
    global matrice
    global taille 
    if (stop==0): #si le jeu n'a pas été stoppé on continue la boucle  
        matrice = nombre_voisin(matrice,taille) #on actualise la vie et la mort des cellules
        afficher_mat(matrice,taille) # on affiche le tableau avec la nouvelle génération de cellules
        app.after(int(1000/vitess.get()),boucle)#on met un délai selon la vitesse qui est demandée par l'utilisateur, et on appelle notre fonction boucle pour continuer à faire tourner le jeu          

#definition du bouton arreter le jeu                
def arreter_bouton():
    global stop
    stop=1 # on met stop à 1 pour stopper la boucle et donc le jeu

            
            
#definition du bouton initialiser
def initialiser_bouton():
    global matrice
    global taille 
    taille = grille_taille.get() #on récupère la taille de la grille voulue par l'utilisateur
    nbre_vie = range(101)# on assigne a une variable une portée pouvant aller de 0 à 100
    for i in range(taille):
        for j in range(taille):
            if(numpy.random.choice(nbre_vie)<=pourcent_vie.get()): #afin de savoir si la cellule est vivante ou morte, on génère un nombre aléatoire entre 0 et 100 et on le compare au pourcentage de vie, si il est inférieur ou égal au pourcentage de vie, la cellule est vivante, sinon elle est morte
                matrice[i][j] = 1#la cellule est jugée comme vivante
                couleur ="red"
            else :
                matrice[i][j] = 0 #la cellule est jugée comme morte
                couleur = "white"
            case = tkinter.Canvas(tableau, width=10, height=10, bg=couleur)#utilisation du canvas de tkinter pour créer les cellules
            case.grid(row = i , column =j)# permet de mettre notre cellule dans un tableau de deux dimensions


#defintion de la fonction qui servira à fermer la fenêtre lors de l'appui sur le bouton quitter
def fermer_fenetre():
    app.destroy()



app = tkinter.Tk()#generation d'une fenetre à l'aide de tkinter 
app.geometry("1000x750")#géométrie de la fenêtre
app.title("SR01 Jeu de la vie") #titre de la fenêtre qui s'ouvrira


tableau= tkinter.Frame(app, width=300,height =300) # assignation d'une partie réservée à la grille 
droit = tkinter.Frame(app)#assignation de la partie réservée aux boutons

#initialisation des boutons avec leurs relations avec les fonctions
lancer = tkinter.Button(droit,text = "Lancer", command = lancer_bouton)
arreter = tkinter.Button(droit,text = "Arreter", command = arreter_bouton)
initialiser = tkinter.Button(droit,text = "Initialiser", command = initialiser_bouton)


#création des variables qui vont nous aidé à récupérer les valeurs des sliders 
grille_taille = tkinter.IntVar()
pourcent_vie = tkinter.IntVar()
vitess = tkinter.IntVar()

#initialisation des boutons et des sliders, avec recupération de leurs valeurs
quitter = tkinter.Button(droit,text ="Quitter",command = fermer_fenetre)
pourcentage_vie= tkinter.Scale(droit, from_=0 , to =100,label = "% de vie" ,orient=tkinter.HORIZONTAL,variable=pourcent_vie)
taille_grille= tkinter.Scale(droit, from_=0 , to =100,label = "Taille de la grille" ,orient=tkinter.HORIZONTAL,variable=grille_taille)
vitesse= tkinter.Scale(droit, from_=0 , to =100,label = "Vitesse" ,orient=tkinter.HORIZONTAL, variable=vitess)



# PLACEMENT FILE DE DROITE
droit.pack(side="right", fill ="y")
lancer.pack(side="top", fill ="x")
initialiser.pack(fill ="x")
arreter.pack(fill ="x")
quitter.pack(side="bottom",fill ="x")
vitesse.pack(side="bottom")
pourcentage_vie.pack(side="bottom")
taille_grille.pack(side ="bottom")
couleur = "red"




# TABLEAU 
tableau.pack(expand=1)
app = tkinter.mainloop()

