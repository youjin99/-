#Practice6
#1
i=1
while (i <=5)
{
  if (i==1 | i==5)
  {
    cat(rep(c("*"," ","*"),c(1,6,1)),"\n",sep="")
    i=i+1
  }else if (i==2 | i==4)
  {
    cat(rep(c("*"," ","*"),c(3,3,3)),"\n",sep="")
    i=i+1
  }else if (i==3)
  {
    cat(rep("*",10),"\n",sep="")
    i = i+1  
    }
}
#2
i=0;s=0
for (i in 1:100){
  s = s+i
  if (s>3000){
    cat(i,s)
    break
  }
}

#3
num = c()
for (i in 1:200)
{
  if (sum(i %% (1:i)== 0)==2) {
    num = c(num, i) 
  }
}; num; length(num)

#4
s=0
for (i in 30:50){
  if (sum(i %% (1:i)== 0)!=2) next 
    {
    s = s + i
  }
};s

#5
x = runif(1e7,0,100); x
#1)
tic = Sys.time()
s=0
for (i in x){
  if (i>5&i<20){
    s = s+i
  }  
}
toc = Sys.time()
as.numeric(toc-tic,units="secs") #2.645921

#2)
tic = Sys.time()
sum(x[x>5&x<20])
toc = Sys.time()
as.numeric(toc-tic,units="secs")#0.35904

#creating User-defined R functions 
#사용자 정의 함수 : 계산에 패턴이있고 값만 바꿔서 계산을 많이 할 때 사용
#단계 : 작성 -> R실행 -> 사용
#사용자 정의 함수의 작성 
#작성 형식 : 함수이름 = function(필요한 인수1, 필요한 인수2,...)
#예제 : 문자와 구분자를 입력 받아 parsing하여 단어의 개수를 세는 함수
x = c("(abc)def?xy!z")
temp = gsub("[(),.?!/]",sep=" ",x)

wd_count = function(x,sep=" ") #sep=" " : default 설정, sep 생략->sep=" " 
{
  temp = gsub("[(),.?!/]",sep,x)
  temp = unlist(strsplit(temp,sep))
  temp = temp[temp!=""]
  return(table(temp)) #개수를 세줌
}
wd_count(x)

wd_count_2 = function(x,sep=" ") #sep=" " : default 설정, sep 생략->sep=" " 
{
  temp = gsub("[(),.?!/]",sep,x)
  temp = unlist(strsplit(temp,sep))
  xrm = c("",'a','an','the')
  temp = temp[!(temp %in% xrm)] #temp[temp != ""]
  return(table(tolower(temp))) #개수를 세줌
}

tx_data = c("Hello, I like statistics.", "I want to go out.","You need to take a break.","You are so nice.")
res = wd_count_2(tx_data)
res
sort(res,decreasing = T)

# tolower : 대문자를 소문자로 만들어줌
tolower("A")

# %in% 
x=c("a","b","a","c")
y=c("b","c")
x%in%y #x의 원소가 y에 들어가는지 #F T F T
y%in%x #y의 원소가 x에 들어가는지 #T T
!(x%in%y) #T F T F 

#예제 : 숫자를 입력 받아 해당 구구단을 출력하는 함수 
googoo81 = function(x)
{
  cat=('/n')
  for (i in 1:9)
  {
    cat(x,"*",i,"=",x*i,"\n")
  }
  cat("\n")
}

googoo81(5)

#예제 : n항까지의 피보나치 수열을 생성하는 함수
fibona = function(n){
  if(n<1) return("1보다 큰 수를 입력해주세요.")
  if(n==1) return(1) #return만나면 함수 끝
  if(n==2) return(rep(1,2))
  x = rep(1,n) #x : 1 1 1 1 1 ...
  for (i in 3:n){
    x[i] = x[i-1] + x[i-2]
  }
  return(x)
}
fibona(-1)
fibona(1);fibona(2); fibona(10)

#그래프 그리는 함수 
#input : x, c
x = list(rnorm(10), b=1:10)
c = 1
plot_lst = function(x,c){
  n = length(x)
  for (i in 1:n){
    x11() #x11 : 그래픽 디바이스 띄우는 창
    plot(x[[i]],type='p',pch=c,main=paste0("Num-",i))
  }
}
plot_lst(x,c)
plot_lst(x,c=3)

#함수의 인수는 default로 설정이 가능하며 default 설정된 인수들은 생략이 가능하다.
mean.k = function(x,k)
  return(mean(x^k))
a=c(1,3,5,6)
mean.k(a,2)
mean.k(a) #기본값이 없는 인수 "k"가 누락되어 있습니다.

mean.k2 = function(x,k=3)
  return (mean(x^k))
mean.k2(k=2,x=a)
mean.k2(2,a) #mean(2^a)
mean.k2(k=2,a)
mean.k2(a) #mean.k2(a,3)

#여러 인수를 입력 받는 경우, 인수의 이름을 생략 시 순서대로 입력해야함. 이름을 사용하면 순서를 고려하지 않아도 된다.
m.k = function(x,k,t) #default설정 X
  return (mean((x-t)^k))

a = c(1,3,5,6)
m.k(a,2,1); m.k(a,1,2)
m.k(a,k=2,t=1); m.k(a,t=2,k=1)

#함수의 리턴값(반환값)은 하나의 객체만 허용된다.
std.ftn = function(x)
  return (mean(x),var(x),(x-mean(x))/sd(x))
a = c(1,3,5,6)
std.ftn(a) #error : 다중인자 반환은 허용되지 않습니다.

std.ftn2 = function(x)
  return (list(mean(x),var(x),(x-mean(x))/sd(x)))
a = c(1,3,5,6)
std.ftn2(a)

#사용자 정의 함수의 원형 확인
#인수의 이름을 파악할 때, 도움이 된다.
ls #함수 원형, 실행되는 것이 아닌 정의된 것을 보여줌.
ls() #함수실행행

fibona
mean.k
mean.k2
m.k
read.table

#지역변수 : 가장 기본이 되는 변수로 함수의 내부에서 사용될 때에는 함수가 종료됨과 동시에 변수가 삭제된다.
a = c(1,3,5)
noact = function(x){
  loc = 3
  return(loc)
}
noact(a) #3
loc #error : 객체 'loc'를 찾을 수 없습니다.

#GlobalEnv(기본작업공간)에서 정의한 변수는 함수에서 참조가 가능하다.
#함수 내부에서 GlobalEnv의 지역 변수의 값을 바꾸어 사용할 수 있으나 GlobalEnv에 존재하는 변수의 값은 변하지 않는다.
a = c(1,3,5)
noact = function(x){
  a[1] = 3
  return(a)
}
noact(10); a #3 3 5 / 1 3 5

#전역변수 : 특별히 여러 함수에서 접근하여 값을 변경할 필요가 있을 때 정의하며 함수에서 값의 변경 및 접근이 가능하다. 함수가 종료해도 사라지지 않는다.
#전역벼수를 설정 하는 방법 : 변수이름 <<- 값
a = c(1,3,5)
noact = function(x){
  a[1] = 3; glb <<- c(1,2)
  return(a)
}
noact(10) #3 3 5
a #1 3 5
glb# 1 2

#함수 내부에서 GlobalEnv 내의 변수의 일부의 값을 변경하고자 할 때, <<- 연산자를 사용한다.
a = c(1,3,5)
noact = function(x,type=1){
  if (type==1) a[1] = 3
  if (type==2) a[1] <<- 3
  return(a)
}
noact(10)#3 3 5
a #1 3 5
noact(5,2)# 3 3 5
a #3 3 5

#Practice 7
#1
vec = function(x){
  return (list(length(x), sum(x), prod(x), min(x), max(x), mean(x), var(x)))
}
x=c(1:10)
vec(x)

#2 
vec2 = function(x, num){
  switch(num, length(x), sum(x), prod(x), min(x), max(x), mean(x), var(x))
}
vec2(x,1) #10
vec2(x,2) #55
vec2(x,3) #362880

#3 
vec3 = function(x,num=3){
  switch(num, length(x), sum(x), prod(x), min(x), max(x), mean(x), var(x))
}
vec3(x,3) #3628800
vec3(x) #3628800
vec3(x,1)

#4 
eq = function(a,b,c){
  if (a==0) {
    if (b!=0) {
      return (-c/b)
  }else if (b==0){
    if (c!=0) {
      return ("No solution")
    }else if (c==0) return ("Any value")
    }}
  D = b^2 - 4*a*c
  if (D==0) return (-b/2*a)
  if (D>0) return(c((-b+sqrt(D))/(2*a),(-b-sqrt(D))/(2*a)))
  if (D<0) return(c((-b+sqrt(D+0i))/(2*a),(-b-sqrt(D+0i))/(2*a)))
}

eq(0,0,1)
eq(0,0,0)
eq(1,2,1)
eq(2,3,1)
eq(1,2,3)
