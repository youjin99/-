rm(list=ls())

#R을 이용한 데이터 탐색
#데이터 불러오기
.Platform
setwd('c:/example')
raw_dat = read.csv('Ex_data.csv', header=T)
head(raw_dat[,1:20]) #열의 수가 많아 1:20의 열만 선택
length(raw_dat) #443
dim(raw_dat) #947 443
nrow(raw_dat) #947
ncol(raw_dat) #443
raw_dat[,1]
raw_dat[,-1]
#데이터의 전처리 
#Group Index
#gl(group의 수, group의 크기) : 1,2,group의 수 해당하는 Factor 형 벡터 생성
gr_ind = gl(2, 221) #1x221, 2x221 = c(1,...,1,2,...,2)
gr_ind

#Make a numeric matrix(수치형 행렬로 변환) 
dat_mat = t(as.matrix(raw_dat))
head(dat_mat[,1:20])
dat_mat = t(as.matrix(raw_dat[,-1])) #유전자이름제외하고 전치
head(dat_mat[,1:20])
dim(dat_mat)
rownames(dat_mat) = paste0("S",1:nrow(dat_mat))
rownames(dat_mat)
colnames(dat_mat) = raw_dat[,1]
colnames(dat_mat)
head(dat_mat[,1:20])

#예제 데이터의 결측값의 처리
#결측값을 갖는 표본을 해당하는 열의 평균으로 대체
indx = which(is.na(dat_mat), T); indx
col_ind = indx[,2]; col_ind
col_m = apply(dat_mat[,col_ind],2,mean,na.rm=T); col_m #결측값이 발생한 열들의 평균을 구함 
dat_mat[indx] = col_m
sum(is.na(dat_mat))
dim(dat_mat) #442 947

#동일한 유전자에 대해 측정된 자료를 평균값으로 대체
uq_names = unique(colnames(dat_mat)); uq_names
p = length(uq_names);p #dim(dat_mat)[2] 947
n = dim(dat_mat)[1]; n #442

head(dat_mat[,1:20])

expr_dat = matrix(0,n,p)
expr_dat
for (i in 1:p){
  expr_dat[,i] = apply(as.matrix(dat_mat[,colnames(dat_mat)==uq_names[i]]),1,mean)
  cat("\n",i,"-th step")
}

colnames(expr_dat) = uq_names
rownames(expr_dat) = rownames(dat_mat)
head(expr_dat[,1:20])
dim(expr_dat)#442 794
sum(is.na(expr_dat))#0

#데이터의 통합 
#merge(x,y,by,by.x,by.y,sort=TRUE) #TRUE : default
#x : 데이터 결합의 기본 대상
#y : 결합하고자 하는 추가 데이터
#by : 결합 기준이 되는 열(열이름, 숫자 가능)
#by.x, by.y : x와 y에서 열이름이 다르거나 위치가 다를 경우 적용
dat1 = data.frame(id=1:5, name=c("Kim","Lee","Jung","Park","Choi"),dept=c(1,3,2,2,1))
dat1
dat2 = data.frame(dept_id=c(1,2,3),dept_names=c('Computer Science','Statistics','Economics'))
dat2
merge(dat1,dat2,by.x='dept',by.y='dept_id',sort=F)
merge(dat1,dat2,by.x='dept',by.y='dept_id',sort=T)
