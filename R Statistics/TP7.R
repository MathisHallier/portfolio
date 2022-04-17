load("cctp_A2021.RData")

install.packages("MASS")
library(MASS)

# 1

summary(immer)
immer
alphastar = 0.05
t.test(immer$Y1,immer$Y2, paired =TRUE, conf.level= 1-alphastar)
# on a une p-value de 0.002413 pour un niveau 0.05 donc on rejette avec confiance l'hypothese


# 2


vectbool = (immer$Y1>immer$Y2)
vectbool
i = length( vectbool[vectbool==TRUE])
n=length(vectbool)

prop.test(i, n, p=0.5, conf.leve = 1-alphastar)

# au niveau 0.05 on rejette puisque la p-value est plus petite ( 0.001911)


shoes$A
#3 

var.test(shoes$A,shoes$B)
# avec 0.05 comme niveau on accepte l'égalité des variance car p-value est 0.9372


#4 on sait de questions précédente que les variances sont les mêmes

t.test(shoes$A,shoes$B,var.equal=TRUE)

# pvalue a 0.7165 pour un niveau alpha* a 0.05 on accepte l'égalité de l'usure


# II Tests d'adéquation

# 5


length(galaxies)
shapiro.test(galaxies)
# la p-value est extremement faible donc on rejette

#6 Test ks on a besoin de tous les parametres de la loi pour tester

x = read.csv("delai-data.data")
x
lambdachap = 1/mean(x$delai)
lambdachap

ks.test(x$delai,"pexp",lambdachap)
# p-value 0.05795 donc on accepte pour 5%



install.packages("isdals")
library(isdals)
data(bodyfat)
bodyfat$Fat
bodyfat

donnees = data.frame(bodyfat$Triceps,bodyfat$Fat)
reg = lm(bodyfat$Fat~ 0+bodyfat$Triceps, data=donnees)

residu =rstandard(reg) # récupere résidus standardisés et on fait shapiro test dessus
residu

shapiro.test(residu)
# on peut accepter la linéarite pour niveau alpha 0.05


# III Tests d'independance

#8

chocolat = c(100,350)
vanille = c(120,200)
fraise = c(60,90)

data.frame(chocolat,vanille,fraise)






