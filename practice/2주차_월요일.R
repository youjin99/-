#R Objects & Basic Operations

#R에서 사용되는 값의 유형(type)
#정수형(integer) 
real<-3.5
as.integer(real) #정수로 변환
intg <- 3 #double형, 실수형(기본설정) 
is.integer(intg) #정수인가?
intg2 <- as.integer() #정수로 저장
is.integer(intg2) #True
is.integer(1:3) #True

#실수형(double) : 정수형, 실수형을 합하여 numeric형 
real <- 3
is.double(real) #True

#문자형(character)
ch <- c("red","blue","yellow")
ch[1] #red
ch[3] #yellow
ch2 <- c("a","b",'c')
ch2

#논리형(logical) 
#True = T, False = F로 두가지 값을 갖는다.
#숫자변환시 True는 1로 False는 0으로 대체됨
test<-c(TRUE,FALSE,TRUE)
is.logical(test) #True
test2 <-c(T,F,T)
#수치형으로 변환 
as.numeric(test2) #1 0 1

#유형 확인 함수
#일반적인 유형 확인 : mode(객체)
x<-"char"
mode(x) #character
#is.자료의유형(변수명 or 값)
x<-5
is.character(x) #F
is.numeric(x) #T
is.double(x) #T

#유형 변환 함수
#as.자료의 유형(변수명 or 값)
#숫자를 문자로 숫자 문자를 숫자로는 가능, 다른 경우는 NA
x<-"abc"
as.double(x) #NA
x<-1
as.character(x) #"1"
as.character(123) #"123" 

#벡터
vec <- c(1,3,4,2,5)
vec #1 3 4 2 5
vec[1] #1
vec[3:5] #4 2 5
vec[7] #NA
vec[7] = 5 
vec #1 3 4 2 5 NA 5

#객체의 이름 규칙
#영문자와 숫자,".","_"의 조합으로 이름 붙일 수 있다.
#이름의 첫글자로 "_"및 숫자가 올 수 없다.
#특정 키워드는 객체의 이름으로 사용할 수 없다.
if <- c(1,2,3) #if,else,for : 오류
_a <- 3 #오류

#벡터의 생성을 위한 함수
#Combine(or Concatenate)함수
#c(arguments) : ,로 값을 구분하여 생성 가능
#하나의 벡터에는 같은 형태의 값을 가져야 한다.(자동변환됨 : 논리<숫자<문자)
num <-c(1,2,3) #num
mode(num)
ch <- c("red","blue","yellow") #character 
mode(ch)
lo <- c(T,F,T,F) #logical
mode(lo)
num2 <- c(1,2,"red","blue") #character
mode(num2)
lo2<-c(T,F,T,1,3) #numeric
mode(lo2)
lo3 <-c(T,F,"abc") #character
mode(lo3)

#변수에 객체를 할당하는 함수 및 연산자
#assign()함수 : 번거롭기 때문에 자주사용 X
assign("x",1:10)
x
#할당 연산자 : <- , =, <<-
x1 <- 1:10 #(x=1:10) #local assign
x1
x2 =5:1
x2 
x3 <<- 1:10 #global assign
x3

rm(list=ls())
assign("x",1:10)
x
name = paste0("x",1:200) #paste0 :
name
ls()
for (i in 1:200)
  assign(name[i],1:10)
ls()
rm(list=name)
ls()
