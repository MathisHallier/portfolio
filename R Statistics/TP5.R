

#1 
varx = c(0, 0.2, 0.3, 0.6)
vary=c(1.01, 1.44, 1.55, 2.1)
donnees <- data.frame(varx = c(0, 0.2, 0.3, 0.6),
                      vary = c(1.01, 1.44, 1.55, 2.1))
reg1=lm(vary~varx, data = donnees)
# à gauche la variable à expliquer
# l'ordonnée à l'origine a est intercept et vaut 1.033 et b vaut 1.789 
summary(reg1)
a =reg1$coefficients[1]
b = reg1$coefficients[2]

#2

plot(donnees$varx,donnees$vary)
abline(a,b,col=2)



#3

sum(reg1$residuals)

a+b*mean(varx)

mean(vary)


#4
n= length(varx)
my = mean(vary)
sy2= mean((vary-my)**2)
sy2

sreg = mean((reg1$fitted.values)**2)
sreg

sres = mean(reg1$residuals**2)
sres


stotale = sres+sreg
stotale

r2 = sreg /sy2
r2
summary(reg1)


attach(anscombe)
# pour ne plus avoir besoin de mettre nom$x1 mais juste x1
x1


reg1=lm(y1~x1)
reg2=lm(y2~x2)
reg3=lm(y3~x3)
reg4=lm(y4~x4)

par(mfrow=c(2,2))

plot(x1,y1)
abline(reg1$coefficients[1],reg1$coefficients[2],col=2)

plot(x2,y2)
abline(reg2$coefficients[1],reg2$coefficients[2],col=3)

plot(x3,y3)
abline(reg3$coefficients[1],reg3$coefficients[2],col=4)

plot(x4,y4)
abline(reg4$coefficients[1],reg4$coefficients[2],col=5)
#premire colo premiere ligne hauteur l'origne , 2eme ligne pente
# le R2 est dans R-square en dessous , on a regardé ces donnes
summary(reg1)
summary(reg2)
summary(reg3)
summary(reg4)

#on voit que les droites sont globalement les mêmes alors que les points pas du tout (pente et ordonnee origine sensiblement les memes)
# dans le deuxieme on voit plutot une forme quadratique
# dans le 4 x n'explqiue pas du tout y car plusierus valeurs de y pour un même x et la valeur aberrante a beaucoup d'impact
# dans le droit modele est excellent(pas de bruit) sauf sur une valeur, voir ce que ça donne sans ce point


#hatvalues(reg1) est les leviers pour chaque point
#6
qqnorm(r1stand)
qqline(r1stand)

#8 verifier homosc

#si on voit une forme particulière alors une hypothese n'est pas vérifiée
# si ils varient autour de la droit alors c'est quon a l homosce
# residus independant si pas de forme particuliere

par(mfrow=c(2,2))
plot(reg1$fitted.values,reg1$residuals)
plot(reg2$fitted.values,reg2$residuals)
plot(reg3$fitted.values,reg3$residuals)
plot(reg4$fitted.values,reg4$residuals)

# en premier tracer le plot car en regardant summary on aurait cru qu'ils etaient pareil


# pour prédire on a besoin de la première syntaxe car sinon il ne va pas associer les nouvelles valeurs au vecteur x


#7 #faire import dataset from text base

summary(hooker.data)
attach(hooker.data)
par(mfrow=c(1,1))
donnees2 =  data.frame(Temp,Pression)
reg = lm(Pression~Temp,donnees2)
summary(reg)
plot(Temp,Pression)
abline(reg$coefficients[1],reg$coefficients[2],col=2)



#8

confint(reg,level=0.95)
# intercept est pour a l'ordonnée à l'origine
# Temp c'est b pour la variable qui explique (le x)

#9
predict()

