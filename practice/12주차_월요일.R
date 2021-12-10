#12주차 월요일
#lm() 함수(linear model) : 단순회귀, 중회귀 모형 등 일반적인 회귀모형 적합 시 사용
#lm(formula, options) 
#formula인수 : 종속변수~설명변수
setwd("c:/")
load(file='expr_dat.Rdata')
indy = 8
indx = 200
x = expr_dat[,indx]
y = expr_dat[,indy]
fit = lm(y~x)
summary(fit)

plot(x,y,pch=16)#산점도
abline(fit,col=10,lwd=3) #a+bx #col = color

#결과값 확인
#결과값에 포함된 사항
names(fit)

#결과값의 내용 확인 
fit$coefficients #fit[[1]]
fit$fitted.values #fit[[5]]
cbind(fit$fitted.values,fit[[1]][1]+fit[[1]][2]*x)[1:5,]

#회귀 계수 추정 및 잔차의 계산
#추정된 회귀계수
coef(fit)

#잔차의 계산
resid(fit)

#추정에 사용된 x값에 대한 y의 추정값
fitted(fit)

#summary에서 값 추출
result = summary(fit)
names(result)
result$fstatistic
result[4]

#추정량의 신뢰구간 계산 
confint(fit)

#적합 후 새로운 값에 대한 예측값 계산 
#새로운 x값 2.3에 대한 y의 추정값
pred1 = predict(fit,newdata=data.frame(x=2.3)); pred1 #2.273926
est = coef(fit);x1=2.3
est
y1 = est[1]+est[2]*x1
y1 #2.273926

#새로운 여러 x값 1,2.2,6.7에서의 추정값 
pred2 = predict(fit, newdata=data.frame(x=c(1,2.2,6.7))); pred2 #1.139832 2.186688 6.112397
x2 = c(1,2.2,6.7)
y = est[1] + est[2]*x2
y #1.139832 2.186688 6.112397

#변수선택 - 회귀 모형의 비교
#anova() 함수를 이용하여 전체 모형 중 축소 모형에서 제외된 변수들의 회귀 계수가 모두 0인지에 대한 가설 검정 수행
#fit1 = lm(model1); fit2 = lm(reduced model1); anova(fit2,fit1)=anova(fit1,fit2)
#fit1에 속하고 fit2에 속하지 않는 변수들에 대한 회귀 계수가 모두0(귀무), 적어도 하나는 0이 아님(대립)의 가설 검정을 수행한다.
indy=8
indx=c(10,30,200)
indxr = c(10,200)
xf = expr_dat[,indx] #model
xr = expr_dat[,indxr] #reduced model
y = expr_dat[,indy]

fit1 = lm(y~xf)
fit2 = lm(y~xr)
anova(fit2,fit1)
anova(fit1, fit2)
#유의수준 0.05에서 F-test Pvalue값이 0.1912로 0.05보다 크므로 귀무가설을 기각 할 수 없다. -> 축소모형 지지(fit2)

#예제 : 문자열 및 as.formula()함수 이용
uq_names = colnames(expr_dat)
ftxt = paste0(uq_names[indy],'~',paste0(uq_names[indx],collapse = '+')) 
ftxtr = paste0(uq_names[indy],'~',paste0(uq_names[indxr],collapse = '+')) 
ftxt; ftxtr

colnames(expr_dat)

colnames(expr_dat) = gsub('[ .]',"",uq_names)
colnames(expr_dat)
uq_names

lm_dat = data.frame(expr_dat); head(lm_dat[1:10])
fit1 = lm(as.formula(ftxt),data=lm_dat)
fit2 = lm(as.formula(ftxtr),data=lm_dat)
anova(fit2,fit1)
#축소 모형 지지 

#모형 진단 - 오차항의 가정
#오차항의 등분산성, 오차항의 독립성, 오차항의 정규성
#잔차의 산점도 
rsd = resid(fit2)
ft = fitted(fit2) 
plot(ft,rsd,type='p',pch=16)
hist(rsd,breaks=20)
#모형 가정 위배 X

#QQ plot 
#QQ plot의 산점도 : qqnorm(data) 
#QQ plot의 선 : qqline(data, col, lwd)
#예제 : 잔차에 대한 QQ plot
qqnorm(rsd)
qqline(rsd,col=2,lwd=2)

