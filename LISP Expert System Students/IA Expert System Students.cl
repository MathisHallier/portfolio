(setq *base_regle* '( 
                     ;; Regles sur les gouts
                     (R001 ((member Maths gouts))) ;; Mathematiques
                     (R002 ((member Info gouts))) ;; Informatique
                     (R003 ((member Physique gouts))) ;; Physique
                     (R004 ((member Chimie gouts))) ;; Chimie
                     (R005 ((member Svt gouts))) ;; Svt
                     
                     
                    ;; Regles sur la description de l'etudiant
                   (R11 ((< 12 note))) ;; Bon eleve
                   (R12 ((>= 12 note)))   ;; Eleve moyen
                   (R21 ((< 3 duree))) ;; Etudes longues
                   (R22 ((>= 3 duree))) ;; Etudes courtes
                     
                   ;; Regles pour type de dyplome
                   (R41 ( R22 (equal Theorique type) ) ) ;; Licence
                   (R42 ( R22 (equal Pratique type)   ) )  ;; DUT
                   (R43  ( R21 (equal Pratique type) R11 ) ) ;; Ingenieur
                   (R44  ( R21 (equal Theorique type)R11) ) ;; Master
                     
                     ;; Regles pour les diplomes
                     (R50 ( R44 R001));       Master Mathématiques et Applications
                     (R51 ( R44 R001 R002));; Master Cryptographie  
                     (R52 ( R44 R001 R002));; Master Maths-Info
                     (R53 ( R44 R001 R002));; Master Maths, données, apprentissage                     
                     (R60 ( R44 R001 R002));; Master Mécanique
                     (R55 ( R44 R002));; Master Informatique
                     (R56 ( R44 R002));; Master MIAGE
                     (R57 ( R44 R002));; Master RT
                     (R58 ( R44 R002 R005));; Master bio-Informatique
                     (R59 ( R44 R003));; Master Physique
                     (R49 ( R44 R003));; Master Aeronautique
                     (R61 ( R44 R004 R005));; Master Biologie
                     (R62 ( R44 R004));; Master Chimie
                     (R63 ( R44 R004));; Master Environnement
                     (R64 ( R44 R005));; Master SVT
                     (R65 ( R44 R005));; Master Ecologie
                     (R66 ( R44 R005));; Master Santé
                     (R67 ( R44 R005));; Master Geologie
                     (R68 ( R44 R005 R002));; Master Biotechnologie
                     (R69 ( R44 R005));; Master Sciences_de_l_univers
                     (R70 ( R43 R002));; Ingénieur Réseaux
                     (R71 ( R43 R002));; Ingénieur systeme d'info
                     (R72 ( R43 R002));; Ingénieur info indus
                     (R73 ( R43 R002));; Ingénieur RT
                     (R74 ( R43 R002));; Ingénieur dév log
                     (R75 ( R43 R002));; Ingénieur BigData
                     (R76 ( R43 R002));; Ingénieur Sécurité Info
                     (R80 ( R43 R001));; Ingénieur Maths Appliquées
                     (R81 ( R43 R001 R002));; Ingénieur Maths Modélisation
                     (R82 ( R43 R002));; Ingénieur Statistiques
                     (R83 ( R43 R003));; Ingénieur Mécanique
                     (R84 ( R43 R003));; Ingénieur Aeronautique
                     (R86 ( R43 R003));; Ingénieur Matériaux
                     (R85 ( R43 R004));; Ingénieur Chimie
                     (R87 ( R43 R004));; Ingénieur Biologie 
                     (R88 ( R43 R005 R001));; Ingénieur Biotechnologies
                     (R89 ( R41 R002));; Licence Informatique
                     (R90 ( R41 R002));; Licence MIAGE
                     (R91 ( R41 R002 R001));; Licence MIASHS
                     (R92 ( R41 R001));; Licence Mathématiques
                     (R93 ( R41 R003));; Licence Physique
                     (R94 ( R41 R003));; Licence Mecanique
                     (R95 ( R41 R003));; Licence Pro Aeronautique
                     (R96 ( R41 R002));; Licence 3EA
                     (R97 ( R41 R003));; Licence Genie Civil
                     (R98 ( R41 R003 R004));; Licence Physique_Chimie
                     (R99 ( R41 R004));; Licence Chimie
                     (R100( R41 R005));;Licence SVT
                     (R101( R41 R005));; Licence Staps
                     (R102( R41 R002 R005));; Licence Pro BSA
                     (R103( R41 R004));; Licence Pro Chimie
                     (R104( R41 R003 R002));; Licence Pro Mecatronique
                     (R105( R41 R002));; Licence Pro Informatique
                     (R106( R42 R002));; DUT GEII
                     (R107( R42 R002));; DUT Informatique
                     (R108( R42 R002));; DUT RT
                     (R112( R42 R002));; DUT MMI
                     (R109( R42 R003));; DUT Civil
                     (R110( R42 R003));; DUT Mecanique
                     (R111( R42 R003));; DUT MP
                     (R113( R42 R004));; Dut Chimie
                     (R114( R42 R004));; DUT GCGP
                     (R115( R42 R004));; DUT GB
                     (R116( R42 R003));; DUT Génie Thermique
                     (R117( R42 R003));; DUT Science et génie des matériaux
                     

           ))


(setq liste_diplome '((R50 Master_Mathematique_et_Applications)(R51 Master_Cryptographie) 
                      (R52 Master_Maths-Info)(R53 Master_maths_donnees_apprentissage)(R55 Master_Informatique) 
                          (R56 Master_MIAGE) (R57 Master_RT)( R58 Master_Bio_Informatique)(R59 Master_Physique)
                          ( R49 Master_Aeronautique) (R61 Master_Chimie) (R62 Master_Chimie) ( R63 Master_Environnement)
                          ( R64 Master_Svt)(R65 Master_Ecologie)(R66 Master_Sante) (R67 Master_Geologie)
                          (R68 Master_BioTechnologies)(  R69 Master_Sciences_De_l_univers) (R70 Inge_Reseaux) 
                          (R71 Inge_Systeme _info) (R72 Inge_Informatique_Industrielle)(R73 Inge_RT)
                          (R74 Inge_Developpement_logiciel)(R75 Inge_BigData)(R76 Inge_CyberSecurite)
                          (R80 Inge_Maths_Appliques)(R81 Inge_Maths_Modelisation)(R82 Inge_Statistiques)
                          (R83 Inge_Mecanique)(R84 Inge_Aeronautique)(R85 Inge_Chimie)(R86 Inge_Materiaux)
                          (R87 Inge_Biologie)(R88 Inge_Biotechnologies)( R89 Licence_Informatique)(R90 Licence_Miage)
                          (R91 Licence_Miashs)(R92 Licence_Mathematiques)(R93 Licence_physique)(R94 Licence_Mecanique)
                          (R95 Licence_Pro_Aeronautique)(R96 Licence_3EA)(R97 Licence_Genie_Civil)(R98 Licence_Physique_Chimie)
                          (R99 Licence Chimie) (R100 Licence_SVT)(R101 Licence_STAPS)(R102 Licence_Pro_BSA)
                          (R103 Licence_Pro_Chimie)(R104 Licence_Pro_Mecatronique)(R105 Licence_Pro_Info_Industrielle)
                          (R106 DUT_GEII)(R107 DUT_Informatique)(R108 DUT_Reseaux_Telecom)(R109 DUT_Genie_Civil)
                          (R110 DUT_Mecanique)(R111 DUT_Mesures_Physique)(R112 DUT_Metiers_Multimedias_Internet)
                          (R113 DUT_Chimie)(R114 DUT_Genie_des_procedes)(R115 DUT_Genie_Biologique)(R116 DUT_Genie_Thermique)
                          (R117 DUT_Science_et_genie_des_materiaux)))







;; FONCTIONS 

(defun recherche(*base_fait* *base_regle*)
  (let ( (indicateur nil)
         (new_regles nil)
        test)
    
  ;; Pour chaque regle de la base de regle 
  (dolist (regle *base_regle*)
    (progn
      ;; On test si il est possible d'appliquer la regle avec notre base de faits
      (setq test (test_regle *base_fait* regle))
      
      ;; Si il est possible de l'appliquer, on ajoute sa conclusion à la base de faits 
      (if test (progn
                 (setq *base_fait* (ajout_fait *base_fait* regle))
                 (format t "~%Le fait suivant a été ajouté : ~S" (car regle))
                 (setq indicateur t))
        ;; Si impossible d'appliquer la règle alors nous remettons cette regle la nouvelle base de regle sans celles utilisées
               (push regle new_regles))))
    
   ;; Si aucune modification de la base de regle n'a été effectuée durant cet appel, nous avons finis la recherche
  (if (null indicateur) (return-from recherche *base_fait*))
  (setq *base_fait* (recherche *base_fait* new_regles))
  
  (return-from recherche *base_fait*)
  ))




(defun test_regle(*base_fait* regle)
  (let ( (n (length (cadr regle)))
        (i 0)
        (indicateur t)
        (liste_premisses (cadr regle))
        (test_premisse t)
        premisse)
    
   
    ;; On parcourt les prémisses de la regle
    (while (and (< i n) test_premisse)
      (setq premisse (elt liste_premisses i))
      
      (if (listp premisse)
          ;; Si c'est une liste on doit appliquer sa fonction 
          (progn
            (let (test value)
              
              ;; On recupere la valeur pour la fonction que l'on veut
              (setq value  (cadr (cadr (assoc (caddr premisse) *base_fait*) )))
              
              
              ;; Si on a trouvé une valeur on applique la fonction pour tester premisse sinon test est faux 
              (if value (setq test (funcall (car premisse) (cadr premisse) value)) (setq test nil))
              
              (if test (setq i (+ i 1)) (setq test_premisse nil))))
        
        ;; Sinon on doit avoir le fait dans la base de fait pour continuer le test des prémisses
        (if (null (assoc premisse *base_fait*)) (setq test_premisse nil)  (setq i (+ i 1)))))
    
     ;; Si test_premisse est restée vraie alors on valide la regle et sinon on la rejette
    (if test_premisse (return-from test_regle t) (return-from test_regle nil))))



(defun ajout_fait(*base_fait* regle)
  (push (list (car regle) t) *base_fait*)
  (return-from ajout_fait *base_fait*)
  )



(defun question (fait BDF)
  (format t "~%Veuillez inscrire votre réponse (~S) :  ? " fait)
  (let ((reponse NIL))
    (setq reponse (read))
    
    (push  (list fait(list 'value reponse)) BDF)
    BDF
    ))

  
(defun fonction_finale (BDR liste_diplome)
  (setq cpt 0)
  (let ((BDF NIL)
        (formation NIL)
        (liste_affiche nil) bf test_courant)
    (format t "~%Gout 1 : {Maths, Informatique, Physique, Chimie, SVT}")
    (setq gout1 (read))
    (format t "~%Gout 2 : {Maths, Informatique, Physique, Chimie, SVT}")
    (setq gout2 (read))
    (format t "~%Gout 3 : {Maths, Informatique, Physique, Chimie, SVT}")
    (setq gout3 (read))
    (push (list 'gouts (list 'value (list gout1 gout2 gout3)) )BDF)
    (format t "~%Etes vous plutot théorique ou pratique  ?")
    (setq BDF (question 'type BDF)) 
    (format t "~%Quelle nombre d'années maximum souhaitez vous faire")  
    (setq BDF (question 'duree BDF))   
    (format t "~%Ma note de réussite scolaire sur 20 ")
    (setq BDF (question 'note BDF))
         
    
    (setq bf (recherche BDF BDR))
    (dolist (diplome liste_diplome)
      (setq test_courant (assoc (car diplome) bf))
      (if test_courant (push (cadr diplome) liste_affiche))
      )
    formation
    liste_affiche
    )
  )



;; FIN FONCTIONS


;; Différents jeux de test

;; Rentrez "Maths" "Info" et "Chimie" pour les goûts, "Theorique" comme type de diplome, une note de 13 et une durée d'étude maximum de 5 ans 
(fonction_finale *base_regle* liste_diplome)

;; Ressayer avec mêmes gouts mais une duree de 3
(fonction_finale *base_regle* liste_diplome)








































