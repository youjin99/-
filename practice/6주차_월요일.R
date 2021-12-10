#if statement : 조건(논리값)을 만족하는 경우만 실행하도록 하고자 할 때 
#단일 문장에 적용 : if(논리 연산) 실행할 표현식
#여러 구문에 적용 : if(논리연산) { 실행할 표현식1; 실행할 표현식2 ...}
#조건문은 일반적으로 반복문과 함께 쓰인다.
x = 1:5; y=-2:2
if(any(x<0)) print(x) #하나의 논리값을 위해 any 사용용
if(any(y<0)) print(abs(y)) 
if(y<0) print(y) #벡터 논리값은 warning
if(any(y<0)){
  print(abs(y))
  cat("\n y contains negative values")
}

#if-else statement : 조건을 만족할 때와 하지 않을 때를 구분하여 실행, else는 단독으로 쓰일 수 없다
#단일 문장 : if(논리 연산) 실행할 표현식 else 실행할 표현식
#여러 구문 : if(논리연산){실행할 표현식...} else{실행할 표현식...}
if(pi>3) cat("\n expr(T)") else cat("\n expr(F)")
if(pi<3) cat("\n expr(T)") else cat("\n expr(F)")
x = 1:5
x = 1:3
if(length(x)==5)
{
  if(sum(x)==15)
    cat("\n Vector x length=",length(x), ", sum = ",sum(x))
}else
{
  cat("\n Vector x length !=",5)
}
#if(length(x)==5 && sum(x)==15) 동시에 비교 가능 
#&& : 논리 연산 후 첫번째 원소

if(length(x)==5 & sum(x)==15){
  cat("\n Vector x length=",length(x), ", sum = ",sum(x))
}else{
  cat("\n Vector x length !=",5)
}


x = -3
y=5
if(x>0)
{
  print(x)
} else
{
  y = -x
}
y


#이차방정식 근 구하기 ax^2 + bx + c = 0
a = 1; b = 2; c = -3
D = b^2 -4*a*c
if (D>0)
{
  rt = c((-b-sqrt(D))/(2*a),-b+sqrt(D)/(2*a))
}else if(D==0)
{
  rt = -b/(2*a)
}else
{
  cat("\n No roots")
}
rt

#ifelse function : 논리 벡터에 적용 가능하며 간단한 표현을 적용할 때 사용
#ifelse(논리벡터, 참일 때 표현식, 거짓일 때 표현식)
x = c(10,3,6,9); y = c(1,5,4,12)
ifelse(x>y,x,y)
score = c(80,75,40,98)
grade = ifelse(score>=50,"pass","fail"); grade
data.frame(score,grade)
cbind(score,grade)

y = -2:2
ifelse(y>=0,y,-y)
abs(y)

tmp = c(3,-1,1,-2,0)
sn = ifelse(tmp>0,"pos",ifelse(tmp<0,"neg","zero")); sn
data.frame(tmp,sn)

#switch function : 여러값에 대하여 각각 다른 처리를 하고자 할 때 사용
#숫자형 변수에서는 1,2,3의 순서로 표현식이 선택된다. 
#수치형 변수 이용시
x=c(1,3,2,5,2)
i=2
switch(i,mean(x),median(x),sd(x),var(x))
switch(5,mean(x),median(x),sd(x),var(x))
#문자형 변수 이용시 
type = "mean"
switch(type,mean=mean(x),sd=sd(x),var=var(x))

#Practice5 
x=runif(10);x
#1
if (sum(x)>5){
  "sum(x) is greater than 5"
}else if(sum(x)<5){
  "sum(x) is less than 5"
}else{
  "sum(x) is equal to 5"
}

#2
y = ifelse(x<0.5,x,x-0.3);y 

#3
i=1
switch(i,x+y,x-y,x*y)

#4
score = 65
if(score>=90){
  "A"
}else if(score>=75){
  "B"
}else if(score>=50){
  "C"
}else{
  "D"
}

#5
type = "log"
switch(type,sqrt=sqrt(score),square=(score)^2,log=log10(score))

































x=runif(10)
x
#1
if(sum(x)>5){
  cat("sun(x) is greater than 5")
}else if(sum(x)<5){
  cat("sum(x) is less than 5")
}else{
  cat("sum(x) is eual to 5")
}

s = sum(x)
if(s>5)
{
  cat("sum(x) is greater than 5.")
} else if(s<5)
{
  cat("sum(x) is less than 5.")
} else
{
  cat("sum(x) is equal to 5.")
}

#2
y=ifelse(x<0.5,x,x-0.3)
y

#3
i=1
switch(i,x+y,x-y,x*y)

#4
score=65
if(score>=90){
  cat("A")
}else if(score>=75){
  cat("B")
}else if(score>=50){
  cat("C")
}else{
  cat("D")
}

#5
type="square"
switch(type,sqrt=sqrt(score),square=score^2,log=log10(score))
