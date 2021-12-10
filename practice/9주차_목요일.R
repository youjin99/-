#R을 이용한 데이터 탐색
#그림을 이용한 데이터 탐색
#단일 변수 데이터 탐색

#막대 그래프 : 이산형 변수의 모든 데이터 값에 대한 빈도수(frequency)를 동일한 폭의 막대 크기로 나타낸 그래프/이산형 변수의 분포를 나타내기 위하여 사용
#barplot함수 : barplot(vector,other options...)
#plot(factor type objects) : factor형 데이터일 경우 적용 가능 
setwd('c:/')
dat = read.table(file = "Ex211_utf.txt", header = T, fileEncoding =  "UTF-8")
head(dat)
dat$Job
attach(dat) #dataframe안에 있는 변수명을 바로 쓸 수 있게 해줌 
search()
x11()
plot(factor(Job),main="직업의 막대그림",xlab = "직업",ylab="인원수(명)",ylim=c(0,15))
box()

freq = table(as.character(Job)) #freq = table(dat[,6])
freq
x11()
barplot(freq,main="직업의 막대그림",xlab = "직업",ylab="인원수(명)",ylim=c(0,15),xlim=c(0,5))
box()

#file로 저장하는 법 
png(file='c:/example/bar.png') #pdf(file='c:/bar.pdf)
barplot(freq,main="직업의 막대그림",xlab = "직업",ylab="인원수(명)",ylim=c(0,15),xlim=c(0,5))
box()
dev.off() #device off 

#barplot2(dataset, beside=T or F, legend=names, plot.ci=T or F, ci.l=lower bound, ci.u=upper.bound)
x11()
barplot(rep(1,11),col=gray(seq(0,1,length=11)))
seq(0,1,length=11)
install.packages("gplots")
library(gplots)
data(VADeaths)
VADeaths
x11()
barplot2(VADeaths,beside=TRUE,col=gray(seq(0.4,0.9,length=5)),legend=rownames(VADeaths),ylim=c(0,100))
title(main='Death Rates in Virginia',font.main=4)

x11()
barplot2(t(VADeaths),beside=TRUE,col=gray(seq(0.4,0.9,length=4)),legend=colnames(VADeaths),ylim=c(0,100))
title(main='Death Rates in Virginia',font.main=4)

#Error bar(신뢰 구간)에 해당하는 값은 plot.ci=T, ci.l, ci.u 값 이용
hh = t(VADeaths)[,5:1]; hh
mybarcol = 'gray20'; mybarcol
ci.l = hh * 0.85
ci.u = hh * 1.15
x11()
mp = barplot2(hh,beside=TRUE, col=gray(seq(0.4,0.9,length=5)),legend=colnames(VADeaths),ylim=c(0,100),main='Death Rates in Virginia',font.main=4,
              sub="Faked 95 percent error bars",cex.names=1.5, plot.ci = TRUE, ci.l=ci.l, ci.u=ci.u, plot.grid = TRUE)
box()

#원그래프(파이 차트) : 하나의 원을 각 변수의 도수에 비례하게 조각으로 나누어 그린 그래프로 상대적인 크기를 비교하기에 용이한 그래프
#pie(frequency or ratio vector, other options)
x11()
pie(freq, main="직업의 원그림")
pie(rep(1,24),col=rainbow(24),radius=0.9)
pie.sales = c(0.12,0.3,0.26,0.16,0.04,0.12)
lbl = c("Blueberry","Cherry","Apple","Boston Cream","Other","Vailla Cream")
names(pie.sales) = paste0(lbl, " (",pie.sales*100,"%)")
pie(pie.sales, col=rainbow(length(pie.sales)))

#히스토그램 : 자료의 분포를 한눈에 볼 수 있는 그래프
#hist(vector, breaks = number of breaks(상자의 개수))
load(file='expr_dat.Rdata')
uq_names = colnames(expr_dat)
head(expr_dat)
x = expr_dat[,10]; head(x)
x
x11()
hist(x,breaks=20,col='gray',main=uq_names[10])
hist(x,breaks=20,freq=F,col='lightblue',main=uq_names[10]) #freq=F : Density
hist(x,breaks=40,plot=F) #그림X, 히스토그램을 그릴 때 필요한 정보들 

#hist()함수 : 원하는 상자 색상 설정하기
set.seed(7)

hist.data = rnorm(100,3,2); hist.data
hist_info = hist(hist.data, breaks='Sturges',plot=F); hist_info
nbins = length(hist_info$mids);nbins
hist_info$density
col_vec = rep('white',nbins);col_vec
col_vec[hist_info$density>0.15] = 'lightblue'; col_vec
x11()
hist(hist.data, breaks="Sturges",col=col_vec)

x11()
hist(hist.data,breaks='Sturges',col=rainbow(nbins))
