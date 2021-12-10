#문자열을 다루는 함수들 
#Extended regular expression(확장 정규 표현식)
#대부분의 알파벳 및 숫자는 문자 그대로 적용 가능
#[]를 이용하여 여러 형식으로 하나의 문자를 나타낼 수 있음 
#메타문자
#strsplit과 정규포현식 사용의 예
x <- c(as="asfef",qu="qwerty","yuiop[","b","stuff.blah.yech")
strsplit(x,"e")
unlist(strsplit(x,'[a-f]'))
strsplit(x,'[aleu]')
strsplit(x, "[aleu][ab]")
is.vector(unlist(strsplit(x,"[aleu][ab]")))

unlist(strsplit("a.b.c","."))
unlist(strsplit("a.b.c","[.]"))
unlist(strsplit("a.b.c",".", fixed=TRUE))

y = c("ab/cd/ef~z!yk?c","a/x!b,y,z.t/s")
strsplit(y,"[/~!?]")

strsplit(y,"[[:punct:]]")

#현재 작업 폴더 정보 관련 함수들
#getwd() : 현재 작업 폴더를 반환
getwd()
#setwd(path) : 새로운 작업 폴더를 지정 (폴더구분:\)
setwd("C:/Users/qual9/OneDrive/문서") #Use "/" or "\\" instead of "\"
#dir() : 현재 작업폴더 내의 파일 이름을 문자열 벡터로 반환
dir()
#dir.create()함수 : 디렉토리 (폴더) 생성 함수 #같은 이름의 폴더는 만들수 X
#dir.create('path/directory name') #절대참조, 상대참조 
dir.create('./test'); dir #폴더 지울때는 unlink(path)
#grep(정규표현식, 탐색대상, value=F)
#탐색 대상 내에서 정규표현식에 매치되는 값들의 위치를 반환
#value = T이면 실제 값을 반환
test = dir("C:/windows")
t1 = grep("^[A-Ca-c][a-z]",test) #index return
t1
t2 = grep("[.]exe$",test,value=T) #값 return 
t2

#gsub(정규표현식, 바꿀문자열, 대상)
#대상 내에 정규표현식에 해당하는 문자열들을 바꿀 문자열로 치환
gsub('[.]exe','.csv',t2)

getwd()
setwd('c:/')
getwd()
dir()
dir.create('example2')
setwd("example2")
getwd()
dir('../') #c:/
dir.create('./test')
dir('c:/windows')
unlink("test",recursive=T,T);
?unlink
dir() #character(0) : 안에 아무것도 없다

test = dir("C:/Windows")
test
t1 = grep("^[A-Ca-c][a-z]",test,value=T); t1
t2 = grep("[.]exe$", test, value=T); t2
t3 = grep("^[BbCc].+exe$",test,value=T); t3

colors()
colors()[1:5]
cn = grep("red",colors(),value=T)
x11()
barplot(rep(3,length(cn)),col=cn)

cn = grep("yellow",colors(),value=T)
x11()
barplot(rep(3,length(cn)),col=rep(3,length(cn)))

rep(3,length(cn))

x = c("010-3123-2134","032-860-7642","02-111-1234","010-123-5656")
grep("010-[0-9]{3,4}-[0-9]{4}",x);grep("010-[0-9]{3,4}-[0-9]{4}",x,value=T)

setwd('c:/example2')
for (i in 1:20)
{
  write.table(1:10,file=paste0('data_',i,'.txt'))
}

fname = dir(); fname
fname2 = grep('data_[0-9][.]txt',fname,value=T); fname2
fname3 = paste0(substr(fname2,1,5),"0",substr(fname2,6,nchar(fname2))); fname3
file.rename(fname2,fname3)
cbind(fname2,fname3)
dir()

fix(dat);dat
edit(dat); dat

?unlink
