#R의메뉴 
#1. 파일 
#R코드를 소스 : 외부스크립트 실행
#새스크립트 : R editor 실행(비어있음)
#작업공간 불러오기, 작업공간 저장하기 : 작업한 data, 함수 저장 -> binary type(0,1)

#2. 패키지들
#패키지 불러오기 : 기존에 설치된 패키지 불러오기
#CRAN 미러 설정 : 패키지를 다운 받는 서버 위치 선택
#패키지 설치하기

#3. 도움말 
#PDF메뉴얼 -> An Introduction to R, Writing R Extensions, R Internals, Sweave User
#R함수들(텍스트), Html도움말, 도움말 검색


#R의 패키지 설치
#명령어를 이용한 패키지 설치
install.packages("caTools")

#명령어를 이용한 패키지 불러오기
library(caTools)
search()

#R의 패키지 설치
#Bioconductor의 패키지 설치
source("https://bioconductor.org/biocLite.R")
biocLite()
biocLite(c("GenomicReatures","AnnotationDbi"))
