load("cctp_A2021.RData")

rm(param)
runifa <- function(n) {
  if(!exists("param")) param <<- sample(10:20, 1)
  runif(n,min=0,max=param)
}
# <<- fait une variable globale qu'on ne peut pas changer

estim <- function(x){
  est =mean(x)*2
  return(est)
  
  
}

X = runifa(300)
estim(X)

x = replicate(1000, estim(runifa(300)))

x

#3
boxplot(x)
param


#4

estimk <- function(x,k){
  est =mean(x**k)*(k+1)
  est = est**(1/k)
  return(est)
  
}


y = replicate(1000, estimk(runifa(300),45))

sd(y)
#plus le moment est grand meilleure est l'estimation




runknown <- function(n) {
  bn <- rbinom(n, 1, 0.2)
  bn * rnorm(n, mean=-4, sd=1) + (1 - bn) * rnorm(n, mean=10, sd=1)
}
n=1000
a=runknown(n)
rm(x)
#5

mean(x)
sd(x)**2

#on se rapproche bien de 7.2

#6

hist(x,breaks=round(1+10/3 *log10(n)), freq = FALSE)


#7 


plot(ecdf(a))
#ecdf compte le nombre de xi plus petit que t pour fonction répartition et divise par n, le nombre de xi



#

T = (mean(a)-7.2)/(sqrt(32.36)/sqrt(n))
T



random.T <- function(n){
  a=runknown(n)
  valeur =(mean(a)-7.2)/(sqrt(32.36)/sqrt(n))
  return(valeur)
  
  
}


t.10 =replicate(10,random.T(n))


t.1000 =replicate(1000,random.T(n))
mean(t.1000)
sd(t.1000)

par(mfrow=c(2,1))
hist(t.1000, freq=FALSE)
curve(dnorm,add=TRUE, col=2)
plot(ecdf(t.1000))

a=runknown(1000)


plot(ecdf(a), col=2)   #pas de add =TRUE avec plot
par(new=TRUE)
plot(ecdf(t.1000))



# 3 EMV

#14 On met lambda = 3 donc la réalisation doit etre proche de 3
#pour que ça fonctionne
f <- function(la,y){
  dexp(y,la)
  
}

L <- function(la,y){
  prod(f(la,y))
  
}

logL <- function(lambda,x){
  sum(log(f(lambda,x)))
  
}

x = rexp(100,3)

logL(3.1,x)

logL(2.8,x)

#18

lambdas <- seq(0, 6, 0.01)
logL.lambdas <- sapply(lambdas, function(lambda) logL(lambda, x))
plot(lambdas, logL.lambdas, type = "l")


# vraisemblance
load("cctp_A2021.RData")

f <- function(lambda,x){
  dpois(x,lambda)
  
  
  
}

Logl <-function(lambda,x){
  sum(log(f(lambda, x)))
  
}

x = EMV439
Logl(11,x)


ff <- function(x,nu){
  dchisq(x,nu)

  
}

logff <- function(x,nu){
  
  sum(log(ff(x,nu)))
  
}

xx = c(12,18,24)
logff(EMV328,12)

