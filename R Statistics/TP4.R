load("cctp_A2021.RData")


logf <- function(x,lambda){
  
  sum(log(f(x,lambda)))
  
}


x = EMV411

f <- function(x,lambda){
  dpois(x,lambda)
  

  
}

logf(x,12)
logf(x,14)
logf(x,17)


y = EMV106
ff <- function(x,nu){
  dnorm(x,mean=nu,sd=0.5)
  
  
}

logff <- function(x,nu){
  
  sum(log(ff(x,nu)))
  
}

logff(y,2)
logff(y,2.5)
logff(y,5)





#TP4

#1

nu = -12
sg = 2
n =500


chisq1 <- function() {
  x <-rnorm(n,nu,sqrt(sg))
  return (((n-1)*var(x))/sg)
  
  
}
c = chisq1()
c_vec=replicate(300,chisq1())
hist(c_vec, freq=FALSE)

curve(dchisq(x,n-1),from=0,to=1000,add=TRUE,col=2)



plot(ecdf(c_vec))

curve(pchisq(x,n-1),from=0,to=1000,add=TRUE,col=2)




#2

ct <- function(x,nu){
  n = length(x)
  result = (mean(x)-nu)/(s/sqrt(n))
  
}


#3

# xb +- quantile 1-alpha/2 * 
n=100
x = rnorm(n,mean =5, sd =0.8)

alpha = 0.05

para = 1-alpha/2
bas = mean(x)-qnorm(para,mean=1,sd=0.8)*(0.8/sqrt(n))
haut = mean(x)+qnorm(para,mean=1,sd=0.8)*(0.8/sqrt(n))

bas 
haut 

#4
s = sqrt(sd(x))
bas2 = mean(x)-qnorm(para,mean=1,sd=0.8)*(s/sqrt(n))
haut2 = mean(x)+qnorm(para,mean=1,sd=0.8)*(s/sqrt(n))

bas2
haut2


t.test(x,conf.level =1-alpha)$conf.int



gen_IC <- function(x,alpha){
  s = sd(x)
  n =length(x)
  para = 1-alpha/2
  inf = mean(x)-qt(para,n-1)*(s/sqrt(n))
  sup = mean(x)+qt(para,n-1)*(s/sqrt(n))
  vect = c(inf,sup)
  
  
}


#6
x =rnorm(150,mean=4,sd=2)

IC_vec = replicate(100,gen_IC(rnorm(100,4,2),0.05))
# tableau à deux dimensions avec en ligne les differents test et en colonne 
# les bornes donc l1 = borne inf et l2 = borne sup




source("src/utils.R")

#7

plot_ICs(IC_vec,4)




#8 

IC_vec = replicate(100,gen_IC(rnorm(100,4,2),0.05))

plot_ICs(IC_vec,4)

#n grand -> largeur petit et inversement


#9


#10
test_IC <-function(mu,s) {
  x=rnorm(100,mean=mu,sd =s)
  ic =gen_IC(x,0.05)
  res = (ic[1] <= mu) & (mu <=ic[2])
  
}


 




n = 100 
alpha = 0.05
x =rnorm(n)
t.test(x,conf.level=1-alpha)$conf.int

gen_IC<- function(x,alpha){
  n=length(x)
  mean(x)+c(-1,1)*qt(1-alpha/2,df=n-1)*sd(x)/sqrt(n)
}

param =3
alpha =0.05
ics = replicate(100,gen_IC(rnorm(n,mean=param),alpha))
ics










sig = 3
mu = 8
n=10000
x= rnorm(n,mean=mu,sd=sig)

gen_icss<-function(n,alpha){
  x =rnorm(n,mean=8,sd=3)
  mean(x)+c(-1,1)*qnorm(1-alpha/2)*sd(x)/sqrt(n)
  
}

gen_icss(n,0.05)

icss = replicate(100,gen_icss(n,0.05))


source("src/utils.R")
plot_ICs(icss,8)




