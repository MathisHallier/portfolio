load("cctp_A2021.RData")


# REGRESSION LINEAIRE


# 2 Methode pour faire des r�gressions lin�aires 


# 1 Methode sur laquelle on peut faire des pr�dictions

# Creation d'un data frame avec les donn�es


donnees <- data.frame(varx = RL05$X ,
                      vary=RL05$Y)

 # La r�gression lin�aire est donn�e par cette fonction
# si on ne met pas data = donnees fonctionne mais pas de predictions possibles sur des nouveaux points
reg = lm(vary~varx, data = donnees)
#Intercept est la valeur de l'ordonn� � l'origine et varx est la valeur de b celui qui colle x

summary(reg)
a = reg$coefficients[1]
a
b =reg$coefficients[2]
b
reg

# Vecteur des r�sidus

reg$residuals[10]
sum(reg$residuals)


# Image des moyenne de x par le droite des moindres carr�s
(a + b*mean(donnees$varx))

# Variance totale est aussi �gale � var expliqu�e + var residuelle

(SY2 <- mean((donnees$vary - mean(donnees$vary))^2))

# Variance expliqu�e par la r�gression
(Sreg <- mean((reg$fitted.values - mean(donnees$vary))^2))

# Variance r�siduelle    

(Sres <- mean(reg$residuals^2))

#  R^2 Coefficient de corr�lation de Pearson entre observations et les pr�dictions
R2 =Sreg/SY2
R2


# Intervalle de confiance sur coefficients de la droite des moindres carr�s
# donne l'intervalle pour chaque variable repr�sent� par un tableau � 2 colonnes
confint(reg,level = (1-alpha))

# Faire une pr�diction
# on doit au pr�alable cr�er un nouveau data frame avec m�me nom de variables explicatives qu'au d�but
alpha = 0.1
newdata =data.frame(varx=c(1)) # stocke les points que l'on veut pr�dire


#Intervalle de confidence
predict(reg,newdata,interval="confidence", level = (1-alpha))

#Intervalle de pr�diction
predict(reg,newdata,interval="prediction", level = (1-alpha))



# Analyse de la r�gression

# Les coefficients peuvent �tre les m�mes pour un m�me jeu de donn�es 
# mais les r�gressions peuvent �tre bonnes et mauvaises et R2 proche de 1 ne garantit rien


# Homosc�dasticit� valide si les r�sidus corrig�s se r�partissent al�atoirement le long de la droite y =0
# On peut aussi voir � partir de ce graphe l'invalidation de la lin�arit� si on voit une forme particuli�re ou la d�pendance des r�sidus 









