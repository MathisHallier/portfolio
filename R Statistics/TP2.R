load("TP2/cctp_A2021.RData")
ls()

a=c(MR733_1,MR733_2)

mean(a)
b = 1.05*MR733_2

c = c(MR733_1,b)
mean(c)     


x= MR733_1[MR733_1<=c]
length(x)

y=is.na(MR615) 




library(MASS)
head(painters)

#1
hist(painters$Composition)
hist(painters$Drawing)
hist(painters$Expression)
hist(painters$Colour)

#2 

moye =painters[,1:4]
rowMeans(moye)
#ou 
moyenne = (painters$Composition+ painters$Drawing +painters$Colour+painters$Expression)/4
moyenne

#3
moyemp = sum(moyenne)/length(moyenne)


carr = moyenne**2 
n = length(moyenne)
va = (sum(carr))/n-moyemp**2 

ecart = sqrt(va)

varco = ((n-1)/n)*va
ecarcor = sqrt(varco)

#4

mean(moyenne)
moyemp

var(moyenne)
va
sd(moyenne)
ecart

#5
hist(moyenne)


#punif(-3,2,3) = fonction de repartition uniforme de loi [2,3] en -3
#dunif(2.5,2,3) densité en  2.5 
#qunif(0.5,2,3) quantile 0.5
#runif(30,2,3) simule 30 var
#(p,d,q,r)+norm(, E(X), ecart-type(X))

#6

a = 1-pnorm(3)
a

b =pnorm(42,35,6)
b

c= pnorm(50,35,6)-pnorm(40,35,6)
c

n=5
d = dbinom((n-1),n,p=0.5)
d


e = 1-pbinom(14,20,0.5)
e

f = pbinom(15,20,0.5)-pnorm(10,20,0.5)
f

#7

a2 =qnorm(0.05,0,1)
a2

b2 = qchisq(0.05,10)
b2


c2 = qt(0.05,5)
c2


d2 = qf(0.05,2,5)
d2






# III

#8 

dloi <- function(x,b){
  a = 2/b^2
  f = a*x
  f[x<0] = 0 #pour chaque position i du vecteur x tq xi < 0 alors cette position devient 0 dans vecteur f
  f[x>b] =0 
  return(f)
  
}
#9
dloi(-1,3)
dloi(0,3)
dloi(1,3)
dloi(2,3)
dloi(3,3)
 


#10 

curve(dloi(x,3), from=-5, to =5)
# from to sont les bornes en abscisses


ploi <- function(x,b){
f= (x^2)/b^2
  f[x<0]=0
  f[x>=b] =1
  return(f)
  
}

#11
curve(ploi(x,3), from=-5, to =5)

#12
qloi <- function(alpha,b){
   fa <- b*sqrt(alpha)
   fa[alpha ==0] =0
   fa[alpha == 1]=b
   return(fa)
  
}

curve(qloi(x,3), from =0 , to =1)


#13

rloi <- function(n,b){
  u <- runif(n)  #on génère n nombres aléatoire 
  x<-qloi(u,b)  # on associe à chaque nombre aléatoire la loi
  return(x)
  
}      #pareil que faire P(U = x) avec P suivant la loi L(b)



# 14

par(mfrow = c(2,2)) #diviser l'espace en 4 cases

for(n in c(10,50,100,1000)){
  hist(rloi(n,3), breaks = round(1+(10/3) *log(n)), freq = FALSE, main = n , xlim = c(-1,4))
  curve(dloi(x,3), add = TRUE, col = "red")
  
}

#main le titre , freq pour si on veut freq ou freq relative, xlim les bornes pour x, 





#test
f = c(1 , 4,18,32,6,0)
x = c(4,5,-2,-3,0,5)
f[x<=0]=122
f

floor(2.6)
x = c(1,2.6,8,10)
floor(x)
floor(x)==x
all(floor(x)==x)



x = diag(1,5)
x
e = list(c(1,2),
         c(3,4,5),
         4,
         5,
         0)
         
w = list(c(3,5), 
         c(1,10,11),
         5,
         3,
         0
         )

length(e)

mat = matrix(nrow = 5 ,ncol=5)
mat[e]=w

mat = matrix(unlist(e),nrow =length(e))
mat


g = c(1:5)
x[g,e]=w
x


