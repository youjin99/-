#상자그림(boxplot) : 자료의 분포를 한눈에 알 수 있게 해주는 그래프로 사분위수에 대한 정보와 이상점에 대한 정보를 알 수 있다.
#boxplot(vector/matrix/list, other options..)
setwd("c:/")
load(file='expr_dat.Rdata')
ls()
head(expr_dat)
mat = expr_dat[,c(3,4,7,8)]
x11()
boxplot(mat,col=rainbow(4,alpha=0.3))
res = boxplot(mat,plot=F); res
res$out[res$group==1]
uq_names = colnames(expr_dat)
gr_ind = gl(2, 221)

#선그림(line plot) : 두 변수가 쌍을 이루어 관측된 경우 각 좌표를 직선으로 이어서 나타내는 그래프
#plot(x,y,type="l" or "b", other options) #l:linesonly, b:both points and lines
setwd("C:/example")
pop_dat = read.csv(file="table_2_2.csv")
head(pop_dat)
x11()
plot(pop_dat[,1],pop_dat[,2],type='l',xlab='연도',ylab='인구수')
windows()
plot(pop_dat[,1],pop_dat[,2],type='h',xlab='연도',ylab='인구수')
plot(pop_dat[,1],pop_dat[,2],type='n',xlab='연도',ylab='인구수')
x=c(1,3,2); y=c(5,4,7)
plot(sort(x),y[order(x)],type='l')

#산점도(scatter plot) : 두 변수 사이의 관계를 나타내기 위하여 두 변수의 쌍을 X-Y 좌표평면 상의 점으로 나타내는 그래프
#두 변수 사이의 상관 관계가 높을 수록 직선 형태의 패턴이 나타나며 패턴의 형태에 따라 양의 상관과 음의 상관을 개략적으로 구분 할 수 있다.
#plot(x,y,type='p',pch=number) #pch는 점의 모양 선택, #pch=16->채워진 원
ind1 = 8; ind2 = 12
plot(expr_dat[,ind1],expr_dat[,ind2],type='p',pch=16,xlab=uq_names[ind1],ylab=uq_names[ind2])
cor_mat = cor(expr_dat); cor_mat

cor_mat[ind1,-ind1]
which.max(cor_mat[ind1,-ind1]) #처음나오는인덱스
which(cor_mat[ind1,-ind1]==max(cor_mat[ind1,-ind1]))
ind1 = 8; ind2 = 200
plot(expr_dat[,ind1],expr_dat[,ind2],type='p',pch=16,xlab=uq_names[ind1],ylab = uq_names[ind2])

#산점도 행렬(scatter plot matrix) : 여러 변수에 대한 상관 관계를 한 눈에 파악하기 위하여 각 변수 쌍에 대한 산점도를 행렬의 형태로 나타낸 그래프
#paris(matrix or data.frame)
ind = c(2,8,12,200)
pairs(expr_dat[,ind])
pairs(expr_dat[,ind],"Expression Data",pch=21,bg=c("red","blue")[gr_ind])

iris
iris[,1:4]
iris$Species
pairs(iris[1:4],pch=21,bg=c("red",'green3','blue')[as.numeric(iris$Species)])
as.numeric(iris$Species)

#통계량을 이용한 데이터 탐색
#단일 변수 데이터 탐색
#위치의 척도 
#평균(mean) : 관측치의 총합을 관측치의 개수로 나눈 것 #특이값에 민감하게 영향을 받음
#mean(vector, na.rm=T or F)
mean(expr_dat[,10])

#중위수(median) : 전체 주어진 관측치를 크기 순으로 나열했을 때 중앙에 위치하는 관측치 #특이값에 영향을 덜 받는다.
#median(vector)
median(expr_dat[,10])

#최빈값(mode) : 전체 주어진 관측치들 중에서 가장 빈도가 높은 값 #명목척도로 측정된 자료에 대한 대표값으로 주로 사용됨 
x = c(1,2,3,1,2,5,5,3,3,3,2)
tb_x = table(x); tb_x
names(tb_x)
which.max(tb_x)
names(tb_x)[which.max(tb_x)]
as.numeric(names(tb_x)[which.max(tb_x)])

Mode = function(vec){
  tb = table(vec)
  return(as.numeric(names(tb)[which.max(tb)]))
}
Mode(x)

#분위수(quantile)
quantile(expr_dat[,1],0.25,type=2)
quantile(expr_dat[,1],c(0.25,0.5,0.75),type=7)

#최소값과 최대값
head(expr_dat[,1])
as.dataframe(expr_dat[,1])
min(expr_dat[,1])
max(expr_dat[,1])
range(expr_dat[,1])

#산포의 측도
#표본분산(sample variance)
var(expr_dat[,1])
n = length(expr_dat[,1])
sum((expr_dat[,1]-mean(expr_dat[,1]))^2)/(n-1)
sd(expr_dat[,1])
sqrt(sum((expr_dat[,1]-mean(expr_dat[,1]))^2)/(n-1))

#변동계수(coefficient of variation; 변이계수)(CV) : 자료의 측정단위에 의존하지 않는 상대적인 산포의 측도 
#측정단위가 다르거나 평균에 큰 차이가 있는 자료들의 산포를 비교할때 사용 
#CV= s/x_bar x 100(%)
height=c(72,74,68,76,74,69,72,79,70,69,77,73)
sd(height)/mean(height) * 100

#범위(Range) = 최대값 - 최소값 
#사분위수범위(IQR) = 3사분위수-1사분위수

#왜도(skewness) : 비대칭 정도
#왜도>0 = right or positive skewed(positive value)
#왜도<0 = left or negative skewed(negative value)

#첨도(excess kurtosis) : 뾰족한 정도
#<3 : flat #=3 : Normal distribution #>3 : steep

install.packages("moments")
library(moments)
skewness(expr_dat[,1])
kurtosis(expr_dat[,1])
hist(expr_dat[,1],freq=F)

x = seq(5.5,8.5,length = 100)
lines(x,dnorm(x,mean(expr_dat[,1]),sd(expr_dat[,1])))

#데이터의 요약
#summary함수 
#수치형 자료 : 기초통계량을 계산
#문자형 잘 : 길이 및 class return(요인으로 정의시 빈도)
x = rnorm(100)
summary(x) 
y = c('red','blue','red','white')
summary(y)
f.y = factor(y)
f.y
summary(f.y)

#교차표(cross table) or 분할표(contingency table)
#두 개 이상의 이산형 변수를 정리하여 연관된 특성을 연구하는데 효과적인 도표로 가능한 값을 행과 열로 나누어 각 행, 열에 해당하는 빈도를 정리한 도표
#1차원 도수분포표
mtcars$cyl
mtcars$am
mtcars$gear

table(mtcars$cyl)
table(mtcars$am)
#2차원 분할표 
table(mtcars$cyl, mtcars$am)
table(mtcars$am, mtcars$cyl)

#3차원 분할표
table(mtcars$cyl,mtcars$am,mtcars$gear)

#공분산: 두 변수 사이의 연관성의 방향을 알 수 있으나 크기 비교 어려움
cov(expr_dat[,1],expr_dat[,5])
cov(expr_dat[,c(1,5,8)])
var(expr_dat[,1])
is.array(expr_dat[,c(1,5,8)])
#상관계수(correlation) : 공분산을 각각의 표준편차로 나눈 값으로 상대적인 크기 비교가 가능하다.
cor(expr_dat[,1],expr_dat[,5])
cor(expr_dat[,c(1,5,8)])