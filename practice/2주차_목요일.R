#벡터의 연산
#연산의 기본적인 규칙
#사칙연산 및 거듭제곱
#길이가 다른 벡터의 연산 : 길이가 짧은 벡터의 원소가 순서대로 반복하여 길이를 맞추어 연산
x<-c(1,2,3); y<-c(1,2,3,4)
v<-2*x+y+1
v
x=c(1,2); y=c(1,2,3,4)
v=2*x+y
v

#연산자의 종류
#할당 연산자
a=3;b<-2;c<-3+3
a;b;c
#사칙연산 및 거듭제곱
a+b+c
a-b-c
a-b*c
a/b-c
a^b*c
a^(b+c)
a^b+c
a%%b; c%%b
#논리 연산자 : &,&&(and), |,||(or)
#And연산자 : 두 값을 비교하여 둘 다 참일 때만 참을 변환
#& : 모든 원소를 각 원소 별로 and로 참, 거짓 비교
#&& : 각 벡터의 첫 번째 원소만 and로 비교하여 결과 반환
A<-T;B<-F;C<-c(T,T);D<-c(F,T)
A&B #F
A&&B #F
C&D #FT
C&&D #F
#Or연산자 : 두 값을 비교하여 둘 중 하나가 참일 때 참을 반환
#| : 모든 원소를 각 원소별로 or로 참, 거짓을 비교
#|| : 각 벡터의 첫번째 원소만 or로 비교하여 결과 반환
A<-T;B<-F;C<-c(T,T);D<-c(F,T)
A|B
A||B
C|D
C||D
#비교연산자 : <,>,<=,>=, ==(같다), !=(같지 않다.)
a<-c(1,2);b<-c(2,2);d<-c(3,4)
a<b; a<=b #TF, TT
a<d; a<=d #TT, TT
a>b #FF
a>=b #FT
#전체가 같은지 확인할 때에는 all(논리값) 함수 이용 
#젠체 중 하나라도 참일 때, 참 : any(논리값)
A<-c(T,T); B<-c(F,T); C<-c(T,T); D<-c(T,F)
A==B ; C==D #FT, TF
all(A==B); all(A==C) #F,T
any(A==B); any(A==C) #T,T
A!=B; B!=D #TF, TT
all(A!=B); all(B!=D) #F,T
any(A!=B); any(B!=D) #T,T

#연산자의 우선순위
3^2%%4 #1
3*2%%4 #6
d=5; r=0
r=3+10*(2+3)/5%%(d-1)
r
a=1;a=a+2
a
r=3+10*(2+3)/(5%%(d-1))
r
r=3+(10*(2+3)/5) %% (d-1)
r
r=(3+10*(2+3)/5)%%(d-1)
r

#벡터 연산의 여러가지 함수들 
#로그함수
log(10) #자연로그, 밑=e
log10(10) ; log(exp(1)) #사용로그, 밑=10
#다른 밑 x를 갖는경우
a = log(10, base=x)
#지수함수 : 자연수를 밑으로 갖는 함수
exp(1); exp(2)
#삼각함수 : radian단위
sin(30); sin(pi/2)
#최댓값, 최솟값 함수
x=c(1,3,2,5,10)
max(x); min(x)
#range(vector) : 벡터의 최솟값, 최댓값 반환
x=c(-5,10,2,5,8,9); range(x)
sum(x)
prod(x)
mean(x)
var(x) ; sum((x-mean(x))^2)/(length(x)-1)
length(x)
x=c(1,5,3,2,4)
sort(x)
sort(x, decreasing=T)
order(x)
#복소수의 표현 : a+bi
#정의 : complex(length, real=value, imaginary=value)
complex(real=-17,imaginary=0) #17+0i
complex(3,1) #length=3, real=1, imaginary=0 #1+0i가 3번반복
#연산 
sqrt(-17) #NaN
sqrt(-17+0i) #0+4.123i
z<-0+0.1i
Re(z) #0
Im(z) #0.1
Mod(z) #0.1
Conj(z) #0-0.1i
z*Conj(z) 0.01+0i
Arg(z) #1.570796
pi/2

#수열을 생성하는 함수들 
#Sequence연산자(:)-시작숫자:끝나는숫자
x<-1:10;y<-3.3:8;x;y
#Repeat함수 : 같은 수를 반복하여 생성하는 함수
#rep(vector, times or each=value)
rep(c(1,2,3),time=3)
rep(c(1,2,3),each=3)
#seq(from,to,length,by) : 3가지결정해야함 #from:시작 to:끝 length:길이 by:증감
seq(from=1, to=10) ; seq(1,10) 
seq(length=10, from=-5, by=3)
seq(length=6, to=10, by=2)

#Practice2
#1
x=c('0','21','12','16')
x

#2
x = as.numeric(x)
x = sort(x)
x

#3
x=as.logical(x)
x

#4
y = seq(0,30,10)
y

#5
(x<y)&(x<=y)

#6
z = rep(c(TRUE,FALSE),times=5)
z
length(z)