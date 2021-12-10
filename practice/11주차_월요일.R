#R의 기초통계 분석
#분포관련 R함수
#분포의 이름과 키워드를 조합하면 분포에 대한 함수로 사용할 수 있다.(키워드 + R에서의 분포의 이름)
#d(Density function):dnorm(x,mean=0,sd=1) - 확률밀도함수의 값
#q(Quantile function) : qnorm(0.5,mean=5,sd=5) - 분위수 계산
#p(Cumulative Density function) : pnorm(3,mean=0,sd=3) - 누적확률을 계산
#r(generate random numbers from such distribution) : rnorm(1000,mean=10,sd=5) - 난수계산
?dnorm

#균일분포(uniform distribution): p(x)의 그래프가 정의된 구간에서 같은 높이로 주어지는 분포
dunif(0.5,min=0,max=1) #1
dunif(0.1,min=0, max=2) #0.5

qunif(0.5,0,1,lower.tail=T) #0.5
qunif(0.3,0,1,lower.tail=T) #0.3이 나오도록하는 x값 = 0.3
qunif(0.3,0,1,lower.tail=F) #0.7

punif(3,0.1,lower.tail = F) #0
punif(3,0.1,lower.tail = T) #1

runif(10,0,1)

#초기하분포(hypergeometric distribution) : 전체 N개의 특성값중에 D개의 관심이 있는 값이 있고 그 중 n개를 뽑는다. HG(N,D,n) 
#dhyper(x,m,n,k,log=FALSE,lower.tail=TRUE, log.p=FALSE)-HG(m+n,m,k)
dhyper(5,10,10,5,log=F)
dhyper(c(1,3),10,10,5,log=F)
phyper(4,10,10,5,lower.tail=TRUE, log.p=FALSE)
qhyper(0.5,10,10,5,lower.tail=TRUE, log.p=FALSE)
rhyper(10,10,10,5)

#이항분포(binomial distribution) : 베르누이시행을 독립 반복하여 관심 있는 사건(성공)이 몇 번 나오는지에 대하여 확률적 규칙을 정할 때, 관심 있는 사건의 수의 확률분포
#X-B(n,p)
#binom(x,size,prob,log=FALSE,lower.tail=TRUE,log.p=FALSE)
dbinom(3,10,0.2,log=FALSE)
pbinom(3,10,0.2,lower.tail=TRUE,log.p=FALSE)
qbinom(0.3,10,0.2,lower.tail = T,log.p=F)
rbinom(10,10,0.3)

#정규분포(normal distribution) : 평균u, 표준편차 인 정규분포의 밀도함수 #X-N(u, )
#norm(x,mean,sd,log,lower.tail,log.p)
dnorm(10,mean=0,sd=1,log=F)
pnorm(4,mean=0,sd=1,log=F,lower.tail=T)
qnorm(0.5,mean=0,sd=1,lower.tail=T,log.p=F)
rnorm(10,0,1)

#카이제곱분포 : 정규분포에서의 랜덤표본에서 표본분산과 관계되는 분포
#chisq(x,df,log,lower.tail,log.p)
dchisq(5,4)
pchisq(5,4,lower.tail = T,log.p=F)
qchisq(0.5,4,lower.tail=T,log.p=F)
rchisq(10,4)

#t-분포 : 평균검정할 때 사용 #T-t(k)
#t(x,df,log,lower.tail=T,log.p=F)
dt(5,4,log=F)
pt(10,4,lower.tail = T,log.p=F)
qt(0.4,4,log=F)
rt(10,4)

#F-분포 : 두 정규모집단의 분산을 비교하거나 분산분석 등에 사용 #F-F(k1,k2)
#f(x,df1,df2,log,lower.tail,log.p)
df(3,5,4,log=F)
pf(3,5,4,lower.tail=T,log.p=F)
qf(0.5,5,4,lower.tail=T,log.p=F)
rf(10,5,4)

#중심극한정리(central limit theorem)  
#X1,X2...Xn-i.i.d.(u, )
df = 4
niter = 1000
xm = rep(0,niter)
for (i in 1:niter){
  X = rchisq(100,df=4)
  xm[i] = (mean(X)-4)/(sqrt(2*4)/sqrt(100))
}
hist(X,breaks = 20,main=expression(chi^2~(4)),col='lightblue')
hist(xm,breaks = 20,main=expression(over(bar(X)-mu,sigma/sqrt(n))),col='gray',xlab='normalized sample mean')

