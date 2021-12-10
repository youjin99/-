#R에서 사용되는 개체들
#vector
#가장 기본이 되는 객체로 하나의 벡터에는 하나의 값 type 가능 : 논리<숫자<문자
vec<-vector() #비어있는 객체 생성
x = vector()
y = numeric()
y[1] = 3
y[2] = "a"
y
z = logical(3)
z[1] = 3
z
m = character()
m[1] = 123
m
vec <- 1:10 #숫자형 벡터
vec
vec2 <- c("abc",'def') #문자형 벡터
vec2
vec3 <- c(T,F,F,T) #논리형 벡터
vec3
#각 원소에 이름을 할당할 수 있다.(문자형으로 적용)
names(vec2) #NULL
names(vec2) <- c('first','second')
names(vec2) #"first" "second"
#비어있는 객체를 생성하고 인덱스를 활용하여 추가 가능
vec4 <- vector()
vec4[1] <- 1; vec4[2]=5;vec4
vec4[4] = 3
vec4[4] #3
vec4[3] #NA

#matrix
#하나의 행렬에는 하나의 값의 type만 가능
#정의 : 변수명 = matrix(값, nrow=행의수, ncol=열의수)
#추가설정 : byrow = T or F를 이용하여 행기준, 열기준 설정(byrow=T이면 행을 먼저 채우고 F이면 열을 먼저 채운다.)
#기본설정 : 열채움 
ma = matrix(1:4,2,2)
ma
ma2 = matrix(1:4,2,2,byrow=T)
ma2
#Example
x1 <- matrix(1:10, nrow=5,ncol=2,byrow=T)
x1
x2 = matrix(1:10, 5,2)
x2
cbind(x1,x2) #행을 기준으로 열을 덧붙임, 행의 개수가 같아야함
rbind(x1,x2) #열을 기준으로 행을 덧붙임, 열의 개수가 같아야함 

#행렬의 행과 열의 이름 부여
#행과 열의 이름 설정 : rownames와 colnames 함수 이용
A = matrix(1:12,4,3)
rownames(A) = c("n1","n2","n3","n4")
colnames(A) = c("x1",'x2','x3')
A
paste0("n",1:4)
paste0("x",1:3)

B = matrix(1:12,4,3)
rownames(B) = paste0("n",1:4)
colnames(B) = paste0("x",1:3)
B
#행렬 생성시 dimnames를 이용하여 설정 가능
rname = c("n1","n2","n3","n4")
cname = c("x1",'x2','x3')
B = matrix(1:12,4,3, dimnames=list(rname, cname)) #dimnames=list(row, col)
B

#행렬의 원소의 선택
#하나의 원소 선택
A = matrix(1:12,4,3)
A
A[1,2] #5
A[2,3] #10
#하나의 행 또는 열 선택
A[1,] #1행 선택 1 5 9
A[,2] #2열 선택 5 6 7 8
#여러 행 또는 열의 선택 
A[c(1,3),] #1,3행 선택 
A[,1:2] #1,2열 선택택
A[,-3] #[-index] : 제외

#행렬의 연산
#행렬의 합과 차 : 차원이 동일한 경우에 연산 
A = matrix(1:12,4,3); B = matrix(1,4,3)
A+B ;A-B
#행렬의 곱 : 순서가 중요 , A%*%B와 같이 연산
A = matrix(1:6,2,3); B = matrix(1,3,2)
A%*%B
#역행렬의 계산 : A의 역행렬 - solve(행렬)
A = matrix(1:4,2,2)
A
solve(A)

#전치(transpose) : Aij->Aji로 변환, t(행렬)
A = matrix(1:12,4,3); B = matrix(1,4,3)
t(A); t(B)
#대각합 
#diag(숫자) : 단위행렬, diag(벡터) : 대각행렬, diag(행렬) : 행렬의 대각성분 반환, diag(행렬)=벡터 : 행렬의 대각 성분을 벡터로 바꿔줌 
A = matrix(1:9,3,3)
sum(diag(A)) #15
#내적(inner product)
x = c(1,2,3); y = c(1,2,3)
sum(x*y) #14

#행렬식(determinant)
#det(행렬)함수
A = matrix(1:4,2,2)
det(A)
#고유값과 고유벡터
A = matrix(1:4,2,2)
eigen(A)
eigen(A)$values
eigen(A)$vectors

#list
#R에서 사용가능한 모든 객체가 가능
#R의 패키지에서 인수 또는 반환값의 형태로 많이 쓰인다
#(1)변수명 = list(이름1 = 구성요소1,....) #이름1은 생략가능
lst1 = list(a=1:10, b=matrix(1:4,2,2))
lst1
#(2) 비어있는 리스트 생성 후 추가 : [[순서]] 기호 사용
lst2 = list()
lst2[[1]] = matrix(1:10,5,2)
lst2
lst2[1]
lst2[[1]]
lst2[[3]] <- lst1
lst2

#변수명을 설정한 경우의 인덱싱 방법 : 리스트$변수명
lst1$a
lst1$b
#변수명이 없는 경우 및 일반적인 인덱싱 방법 : 리스트[[순서]]
lst1[1] #리스트 객체로 반환환 1:10(리스트)
lst1[[1]] #리스트의 원소를 나타낸다 1:10(벡터)
lst2[[1]] #행렬
lst2[[1]][3] #3
lst2[[2]][1]
A = matrix(1:10,5,2); A
A[3,1] #3
A[3,2] #8
A[3] #3 
A[6] #6