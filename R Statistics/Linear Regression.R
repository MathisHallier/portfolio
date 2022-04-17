load("cctp_A2021.RData")


# REGRESSION LINEAIRE


# 2 Methode pour faire des régressions linéaires 


# 1 Methode sur laquelle on peut faire des prédictions

# Creation d'un data frame avec les données


donnees <- data.frame(varx = RL05$X ,
                      vary=RL05$Y)

 # La régression linéaire est donnée par cette fonction
# si on ne met pas data = donnees fonctionne mais pas de predictions possibles sur des nouveaux points
reg = lm(vary~varx, data = donnees)
#Intercept est la valeur de l'ordonné à l'origine et varx est la valeur de b celui qui colle x

summary(reg)
a = reg$coefficients[1]
a
b =reg$coefficients[2]
b
reg

# Vecteur des résidus

reg$residuals[10]
sum(reg$residuals)


# Image des moyenne de x par le droite des moindres carrés
(a + b*mean(donnees$varx))

# Variance totale est aussi égale à var expliquée + var residuelle

(SY2 <- mean((donnees$vary - mean(donnees$vary))^2))

# Variance expliquée par la régression
(Sreg <- mean((reg$fitted.values - mean(donnees$vary))^2))

# Variance résiduelle    

(Sres <- mean(reg$residuals^2))

#  R^2 Coefficient de corrélation de Pearson entre observations et les prédictions
R2 =Sreg/SY2
R2


# Intervalle de confiance sur coefficients de la droite des moindres carrés
# donne l'intervalle pour chaque variable représenté par un tableau à 2 colonnes
confint(reg,level = (1-alpha))

# Faire une prédiction
# on doit au préalable créer un nouveau data frame avec même nom de variables explicatives qu'au début
alpha = 0.1
newdata =data.frame(varx=c(1)) # stocke les points que l'on veut prédire


#Intervalle de confidence
predict(reg,newdata,interval="confidence", level = (1-alpha))

#Intervalle de prédiction
predict(reg,newdata,interval="prediction", level = (1-alpha))



# Analyse de la régression

# Les coefficients peuvent être les mêmes pour un même jeu de données 
# mais les régressions peuvent être bonnes et mauvaises et R2 proche de 1 ne garantit rien


# Homoscédasticité valide si les résidus corrigés se répartissent aléatoirement le long de la droite y =0
# On peut aussi voir à partir de ce graphe l'invalidation de la linéarité si on voit une forme particuliére ou la dépendance des résidus 









