#데이터 시각화
#데이터 시각화의 기능 
#커뮤니케이션(communication): 데이터에 있는 정보(메세지)를 쉽고 빠르게 전달 하는 기능, Facebook의 소셜네트워크 그래프

#디스커버리(discovery) : 새로운 사실 관계를 파악하기 위하여 정보를 표현하는 것. 데이터에 있는 정보(메세지)를 쉽고 빠르게 전달 하는 기능
install.packages('lattice')
search()
ls(8) #104개
grep('b.+',ls(8),value=T)
grep('^b.+',ls(8),value=T)

ls(2)
grep('^b.+',ls(2),value=T)
library(lattice)
?barley
x11()
trellis.par.set(theme=col.whitebg())
dotplot(variety ~ yield | site, data=barley, groups=year, key = simpleKey(levels(barley$year),space='bottom',columns=2),
        xlab='Barley Yield (bushels/arce)', ylab='variety',aspect=0.5,layout=c(2,3),
        scales=list(alternating=FALSE, y=list(abbreviate=TRUE, minlength=5),font=4,col='blue'),
        main = 'dotplot(variety~yield | site, data = barley, groups = year)',
        sub = list('arguments = key, aspect, scales, etc',col='gray')
        )

#인사이트(insight) : 정보가 숨겨져 있어 미처 파악 못한 사실이나 이미 알고 있는 사실보다 좀 더 나은 통찰력을 어을 수 있도록 정보를 표현하는 것
#통계량 및 회귀분석의 통계량이 유사하나 패턴의 차이가 존재하는 자료
rm(list=ls())
anscombe
attach(anscombe)
apply(anscombe,2,mean)
apply(anscombe,2,sd)
cal_corr = c(cor(x1,y1),cor(x2,y2),cor(x3,y3),cor(x4,y4)); cal_corr

rm(res)

res = list() 
res[[1]] = lm(y1~x1)
res[[2]] = lm(y2~x2)
res[[3]] = lm(y3~x3)
res[[4]] = lm(y4~x4)
res[[1]]

summ = matrix(0,4,4)
cname = paste(paste('x',1:4,sep=''),paste('y',1:4,sep=''),sep=' vs. ')
colnames(summ) = cname
rownames(summ) = c('estimated beta0','estmated beta1','estimated error variance','R-squre')
for (i in 1:4){
  temp = summary(res[[i]])
  summ[1:2,i] = temp[[4]][1:2,1]
  summ[3,i] = temp[[6]]
  summ[4,i] = temp[[8]]
}
summ
temp[[4]]

x11()
par(mfrow=c(2,2)) #2X2 팔레트그림 
for (i in 1:4){
  plot(anscombe[,i],anscombe[,i+4],pch=16,col=2,
       main = cname[i], xlab=paste("x",i,sep=''),
       ylab = paste("y",i,sep=''),
       xlim=c(4,20),ylim=c(3,13))
       abline(summ[1:2,i],col=4,lwd=2)
}






