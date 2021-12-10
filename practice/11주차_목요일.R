rm(list=ls())

#t-test(vec,mu=0,conf.level=0.95,alternative=c("two.sided","less","greater"))
setwd("c:/")
load(file="expr_dat.rdata")
t1 = t.test(expr_dat[,1],mu=7,conf.level = 0.95, alternative = "two.sided")
t1

t2 = t.test(expr_dat[,1],mu=0,conf.level = 0.95, alternative = "less")
t2

t3 = t.test(expr_dat[,1],mu=0,conf.level = 0.95, alternative = "greater")
t3

mean(expr_dat[,1])

names(t1)
t1$statistic
t1$p.value
t1$stderr

summary(t1)

#t-test(x,y,mu=0,conf.level=0.95,paired=T or F, alternative=c("two.sided","less","greater"), var.equal=T or F)
#two sample, indep
gr_ind = colnames(expr_dat)
x = expr_dat[gr_ind==1,1]
y = expr_dat[gr_ind==2,1]
t1 = t.test(x,y,mu=0, conf.level=0.95, paired=F, alternative="two.sided")
t1
t2 = t.test(x,y,mu=0, conf.level = 0.95, alternative = "less")
t2
t3 = t.test(x,y,mu=0, conf.level=0.95, alternative = "greater")
t3


t1$conf.int
t1$parameter
t1$p.value

#Paired t-test
n = 25
x = rnorm(n,mean=1,sd=1)
y = x+rnorm(n,mean=0.5,sd=1)
t1 = t.t  est(x,y,alternative = "two.sided", paired=T, var.equal = F)
t1
t2 = t.test(x,y,alternative='less',paired=T,var.equal=F)
t2
t3 = t.test(x,y,alternative = 'greater', paired=T, var.equal=F)
t3
