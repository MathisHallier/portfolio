#TP6

install.packages("MASS")
library(MASS)
install.packages("isdals")
library(isdals)

#1 


x=read.csv("bottles.data")

x
alphastar = 0.1
t.test(x,mu = 500, alternative ="less" ,conf.level = (1-alphastar))
# valeur de statistique de test est t
# degré de liberté de test de student
# p-value  
# est ce que la vraie valeru sous H0 appartient à l'intervalle


#P ( X dans W) <= alpha  probabilité de rejetter 

# si valeur appartient à l'intervalle, on rejete 


alphastar = 0.05
t.test(x,mu = 500, alternative ="less" ,conf.level = (1-alphastar))

#alphastar au dessus de p-value on rejette car la probabilité qu'on rejete est trop grande
#alphastar en dessous de p-value on garde 
#  Cette fonction donne l'intervalle de confiance donc on accepte si notre moyenne est dans l'intervalle de confiance



# prop.test(x,n,p) pour teste de proportion , x nb expérience positive, n nb total expérience et p la proprtion

#2
mm = read.csv("MM.data")
nb = sum(mm)
nb
nb_rouge = mm$Red
nb_green = mm$Green
nb_blue = mm$Blue
nb_orange = mm$Orange
nb_yellow = mm$Yellow
nb_brown = mm$Brown


prop.test(nb_rouge,nb,1/6) # on conserve H0

prop.test(nb_green,nb,1/6) # p-value est très petite donc on rejette
prop.test(nb_blue,nb,1/6) # p-value est très petite donc on rejette très fortement
prop.test(nb_orange,nb,1/6)# p-value est très petite donc on rejette
prop.test(nb_yellow,nb,1/6)# p-value est très petite donc on rejette
prop.test(nb_brown,nb,1/6)# p-value est très petite donc on rejette


# Regression linéaire

#3
data(bodyfat)


# valeur à expliquer Fat

donnees = data.frame(Y= bodyfat$Fat, X=bodyfat$Triceps)
regTri = lm(Y~X,data = donnees)

summary(regTri)

a = regTri$coefficients[1]
b = regTri$coefficients[2]





regTri2 =  lm(Y~0+X, data =donnees) # pour fixer a = 0 je crois
# constante + X pour fixer une valuer
summary(regTri2)


donnees3 = data.frame(bodyfat$Fat, bodyfat$Midarm)
regFTM = lm(bodyfat$Fat~bodyfat$Midarm)

hiiFTM = hatvalues(regFTM)
qqnorm(regFTM$residuals)
shapiro.test()


# Niveau de signification


# 1/ moyenne empirique bon estimateur pour exponentielle car E[X] = 1/theta
# H0 : theta =  theta0 et H1 : theta >theta0
# W = {bar(X) < seuil critique(alpha*)}
#W ={  (bar(X) - (1/theta0))/(1/(sqrt(theta0^2 n )) < qnorm(alpha*)}

#W = {bar(X)  <  qnorm(alpha*) (1/(sqrt(n)theta0)+ (1/theta0))   }

# W {bar(X) < [qnorm(alpha*)/(sqrt(n)+1)](1/theta0) }


# H0 delait attente moyen est 151 donc si theta = theta0 =1/151 et H1 delai < 151 et donc theta > theta0


#5 
theta0 = 1/151
delais = read.csv("delai-data.data")
delais
summary(delais)
n = length(delais$delai)
moy = mean(delais$delai)
moy  # suit une normale d'espérance 1/151 et variance 1/(151^2)*n 

alpha= 0.05

moy < (qnorm(alpha)/(sqrt(n)+1))*(1/theta0)

seuil  = (1/theta0)*(1-(qnorm(1-alpha)/sqrt(n)  ))











