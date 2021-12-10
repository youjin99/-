#plot의 이미지 파일 저장: Plots > Save as Image
#width, height 설정 
#maintain aspect ratio : width, height 비율 유지 
plot(1:10)

#Tools > Blobal options : RStudio의 여러 설정 변경
#Tools > Blobal options > Code > Saving > Encoding > Change > UTF-8(한글 입력)

#기본적인 R명령어
#1. 도움말 관련 명렁어
#Html 도움말
help.start()

#R함수의 도움말
help(solve)
?solve

#R함수의 도움말 예제
example(solve)

#함수 키워드 검색 
help.search("string")
??string

#명령어에서 사용되는 기호들 
#R객체의 할당기호 
x<-3
x
y=15
y

#R객체의 인덱스 기호[위치 값]
x=c(1,3,5,7)
x[3]

#명령어 구분 : 한줄에 여러 문장을 실행하고자 할 때 사용
x=3;y=15
x
y

#주석(#) : R코드 입력 시 변수 설명이나 코드 설명 등을 입력 할 때 사용, R코드의 디버깅 과정에서 생략하고자 하는 코드 앞에 #사용
n<-100 #number of samples
n

#search()함수 : 현재 R에서 불러와 있는 작업 공간 목록을 출력
search()
install.packages("caTools")
library(caTools)
search()

#R의 객체 목록 출력 : objects() or ls()
#ls(pos = number) or ls(number) : number에 해당하는 위치의 작업공간에 정의된 객체 출력
ls(pos=1) #list of objects in BlobalEnv
ls(pos=2) #list of objects in package

#R의 객체 삭제 : rm(object) or remove(object)
rm(list="x") #x삭제 
ls()
rm(list=c("A","h8")) #2개이상 삭제 
ls()
rm(list=ls()) #전체삭제 
ls()

#R의 기본적인 수학 연산(계산기 처럼 사용)
3+10/(2+3)
(1/2+1/3)^2/(1/3^2)
(3+(3*(3+4))-5)/4 #소괄호, 중괄호, 대괄호 모두 () 
sin(pi/4) #radian
sqrt(2)
exp(5)
log10(20)
log(20) #loge = log

#R의 설정 조정 : options(인수들)
?options

#출력되는 소수점 자릿수 변경 : options(digits = 자리수)
pi 
options(digits = 20)
pi #digits를 아무리 늘려도 제한 있음
options(digits=7)
pi


#Practice1
#1
install.packages("animation")
library(animation)
search()

#2
ls("package:animation")

#3 
help(kfcv)
library(animation)
ani.options(interval = 1, nmax = 15)
cv.ani(main = "Demonstration of the k-fold Cross Validation", 
       bty = "l")
## leave-one-out CV
cv.ani(x = runif(15), k = 15)

#4
help.search("test")
 
#5
w = 78 ; h = 180
BMI = w/(h*0.01)^2
BMI
