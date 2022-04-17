# II
a <- log(640320**3+744)/sqrt(163)
b= a**2
c=a+1
print(a)
print(b)
print(c)


#III

#vecteur

vect1 = c(1,2,3,4,5)

vect2 =c(1:5) #vecteur avec chiffres de 1 à 5


notes  = c(18,1.5,9.5,15.5,15,15.5,0.5,14.5,10)


notes = c(notes,4) # mettre bout à bout deux vecteurs
print(notes)



v <- c(1:5)
u <-c(5:1)
v1 =v+1 # ajoute 1 à chaque coordonnées
v2 = 2*v  # multiplie par  2 chaque coordonnées
v3=v/3  # divise par 3 chaque 
uv= u*v  # multiplie les coordonnées de u et v entre elles


notes10 = notes/2


# 4




#5
moyenne = (notes10[1]+notes10[3]+notes10[10])/3


#6 


meil=notes10[notes10 > 6]


length(meil)


#7

floor(notes10)
min(floor(notes10))







#8

notes2 = notes10-2


#9

notes2[notes2<0]<- 0

#10

adn =c("A","C","A","A","G","A","T","G","C","C","A","T","T","G","T","C")

levels(adn) #les différentes modalités
nlevels(adn) #combien de valeurs différentes possibles
#=combien de modalités

#11

A = adn[adn =="A"]
length(A)

C = adn[adn =="C"]
length(C)


G = adn[adn =="G"]
length(G)

T = adn[adn =="T"]
length(T)

#12

X <- read.csv("TP1/data/sy02.data")
# changer répertoire dans Session , Set working directory,choose directory
length(X) # 
ncol(X) #nb de colonnes dans fichier
nrow(X) #nb de lignes dans notre fichier
names(X) # noms des colonnes ?


#13

head(X) # 
summary(X) #




# 6 variables dont 3 qualitatives dont 1 ordinale
# 3 variables quantitatives discrètes


#14

Col= X[, c(2,6)]
Col


#15 
moyEG = mean(X[X$correcteur.median=="EG",2]) 
moyEG

#16

progres= X$median < X$final

prog =progres[progres==TRUE]
length(prog)

#17

moymedian= mean(X$median)
ecartmedian = sd(X$median)
medianemedia= median(X$median)
maxmed = max(X$median)
minmed = min(X$median)

#18 #19
summary(X$median)
quantmedian = quantile(X$median)

etendue = IQR(X$median) #ecart entre quantile 3/4 et quantile 1/4


#20
tri = sort(X$median)
nbr=length(tri)

tritronq = tri[11:(nbr-10)]

length(tritronq)

#21

t = table(X$correcteur.median) # dans chaque nom met le nombre où il apparait
t
barplot(t)


#22
notesfin = X$final

boxplot(notesfin)

summary(X$final)

#23
IQR(X$final)
critique = 12.5 - 1.5*IQR(X$final)
aberr= length( X$final[X$final < critique]) # 12 notes en dessous moustache
aberr


#24 

stem(X$moyenne)  # diagramme tige et feuilles


#25 

hist(X$final)

#26
hist(X$final, breaks = c(0,15,20) )



#27
h = hist(X$final, breaks = c(0,11,15,20), plot = FALSE)

#28

intervalles =diff(c(0,11,15,20)) #calcul les intervalles entres xi et x_i+1
fre = h$density*intervalles 
sum(fre)


#29 graphique de dispersion plot normal

plot(X$median,X$final ) #dispersion final par rapport au médian
# pareil que 
plot(final ~ median , data= X)  #valeur de sortie (en y) avant l'autre

#on conclue que plus les notes de median sont élevés plus celles dse finaux 
#le sont en general



#30 

boxplot(final ~ correcteur.final , data = X )

#boites à moustaches en fonctions de chaque correcteur

#31

notesdh = X[X$correcteur.final == "DH" , "final"]
#lignes où correctfinal est dh ET prendre les notes dans colonne final
notesdh
boxplot(notesdh)

#32

stripchart(final ~ correcteur.final, data= X)

# 33

stripchart(final ~ correcteur.final, data= X, method = "jitter")

#method = jitter permet de ne pas superposer les carrés mais de les avoir
# parallele aux ordonnés






n = 100 
alpha = 0.05
x =rnorm(n)
t.test(x,conf.level=1-alpha)$conf.int

gen_IC<- function(x,alpha){
  n=length(x)
  mean(x)+c(-1,1)*qt(1-alpha/2,df=n-1)*sd(x)/sqrt(n)
}































