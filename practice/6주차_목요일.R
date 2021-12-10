#Loop statements
#for statement : 주어진 값들(수치형 or 문자형)에 대해서 반복하는 구문
#for (변수 in 수착 or 문자형 벡터) { 반복할 표현 1 ...}
#for문 내부에 다시 for문 중복 가능
s=0
for (i in 1:100)
{
  s=s+i
}
s # 5050

x=3
for (i in 1:9)
{
  cat(x,'*',i,'=',x*i,'\n')
}

for (i in 1:5)
{
  cat(rep('*',i),'\n')
}

setwd("c:/")
dir.create('./datafile')
f_pre = "./datafile/file_"
f_post = '.txt'
dat = mtcars
n = nrow(dat);n #32
cut = 10 #10개씩 자른다.
nfile = ceiling(n/cut); 4 #ceiling : 올림, floor : 내림
for (i in 1:(nfile-1))
{
  ind = (cut*(i-1)+1):(cut*i)
  write.table(dat[ind,], file=paste0(f_pre,i,f_post),sep='\t')
}
ind = (cut*i+1):n 
write.table(dat[ind,],file=paste0(f_pre,i+1,f_post),sep='\t')

setwd('c:/datafile')
dir()
dat = read.table(file='file_1.txt',header=T);dat
#dat <- file1 -> dat = (dat; file)


for (i in 2:4)
{
  temp = read.table(file=paste0('file_',i,'.txt'),header=T)
  dat = rbind(dat,temp)
}
dat 
dim(dat) #32 11

#while statement : 끝나는 지점을 시작할때 모르고 나중에 조건으로 체크하고 싶을때
#while(조건){ 반복할 표현1...}
#for문과 다르게 조건과 관련된 변수의 증감을 조절해야함
s = 0; i = 1
while(i<=100)
{
  s=s+i
  i=i+1
}
s #5050

x=3;i=1
while(i<=9)
{
  cat(x,'*',i,'=',x*i,'\n')
  i=i+1
}

i = 1
while(i<=5)
{
  cat(rep('*',i),'\n')
  i=i+1
}

#특정 단어를 만나기 전까지 "/"로 parsing 작업 수행 
ch = c("A/B/C/D/F","A/AA","BB/B","Quit","CC/C")
xp = list()
i = 1
while(ch[i] != "Quit" & i <= length(ch))
{
  xp[[i]]=unlist(strsplit(ch[i],'/'))
  print(xp[[i]])
  i = i + 1
}
xp
unlist(xp)
table(unlist(xp))

#break : break 문이 포함된 반복문을 빠져 나오는 명령어, 반복문은 실행되다가 break를 만나면 해당 위치에서 반복을 멈춤 
s = 0
for (i in 1:10){
  s = s+i #i=5까지 더했음 -> 1+2+3+4+5
  if(i>=5) break
}; s

#next : 하위에 위치한 명령어는 실행하지 않고 다음 반복을 실행
s = 0
for (i in 1:10){
  if(i%%2==1) next
  s = s+i
}; s #30

#실행 시간 비교 
#system.time({}) 함수 이용
system.time({sum(as.double(1:1e6))})
#for문을 쓰면 {}블럭화 해야함
system.time({s=0;for(i in 1:1e6){s=s+i}})
y = system.time({sum(as.double(1:1e6))})
y[1];y[2];y[3] #사용자 시스템 총시간

#기본함수가 for문보다 훨씬 빠름
system.time({
  s=0
  for(i in 1.1:1e8)
  {
    s=s+i
  }
}) # 5.8y3

y = system.time({sum(1.1:1e8)})
y #0.58 

#Sys.time() 함수 이용
#현재시간과 실행 후의 시간을 비교하여 직접 계산해야 함
tic = Sys.time() #현재시간
sum(as.double(1.1:1e8))
toc = Sys.time()
as.numeric(toc-tic,units='secs') #0.53087

tic = Sys.time()
s=0
for (i in 1.1:1e8){
  s=s+i
}
toc = Sys.time()
as.numeric(toc-tic,units='secs')#4.253618

#while의 무한루프
#멈출땐 esc누르기
s=0; i=1
while(i<=100) #항상 참
{
  s=s+i
  cat('\n',s)
}

#1부터 1000까지의 수 중에서 2또는 3의 배수를 합하는 코드
#반복문 
tic = Sys.time()
s=0
for(i in 1:1000){
  if(i%%2==0|i%%3==0)
    s=s+i
};s
toc = Sys.time()
as.numeric(toc-tic,units='secs') #0.02593517

#인덱스
tic = Sys.time()
x=1:1000
s2=sum(x[x%%2==0||x%%3==0]);s2
toc = Sys.time()
as.numeric(toc-tic,units='secs') #0.002992868

i =  1
for (i in 1:10000){
  if (i )
}
