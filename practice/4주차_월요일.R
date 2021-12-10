#Practice 3
#1
x = seq(from=-10, to = 10, length= 30)
x

#2
y = rep(c("S","T","A","T","S"),times = 6)
y

#3
z = rep(c(0,7),each=15)
z
zm = as.logical(z)
zm

#4
xmat = matrix(x,6,5,byrow=T)
xmat

#5
xdat = data.frame(x,y,z,zm)
xdat

#6
xlst = list(x,y,zm,xdat)
xlst

#7 
as.matrix(xdat[c(1,2)])

#8
as.matrix(xdat[c(1,3)])

#9
sum(x[x>-2&x<4])

#10
apply(xmat,1,sum)
apply(xmat,2,mean)
apply(xmat,2,var)

#R Input & Output
#ë¬¸ì?—´?„ ?‹¤ë£¨ëŠ” ?•¨?ˆ˜?“¤ 
#paste ?•¨?ˆ˜ : ?¸?ˆ˜?“¤?„ ?•˜?‚˜?˜ ë¬¸ì?—´ë¡? ë§Œë“œ?Š” ?•¨?ˆ˜, ?—¬?Ÿ¬ ë²¡í„° ?¸?ˆ˜?“¤ ?…? ¥?‹œ ê°? ?›?†Œ?“¤?„ ?•˜?‚˜?˜ ë¬¸ì?—´ë¡? ë°˜í™˜
#paste(string1, string2,...,sep=" ")
#" "-ê³µë°±(defaultL sep=" ")
myname <- "Jason Bourne"
paste("My name is", myname, sep=" ")
paste(c("A","B"),c("C","D"))
paste("A","B", sep="/")
file_id = 1533 #file name
paste("Dataset_",file_id,".txt",sep="")
#letters -> "a""b""c"..."z"
#Letters -> "A""B""C"..."Z"
paste(LETTERS[1:5],1:5)

#paste(vector1, vector2,...,collapse=string value)
#vectir ?¸?ˆ˜?“¤?„ ?›?†Œë³„ë¡œ ê²°í•© ?›„ collapse ? •?˜ ë¬¸ìë¡? êµ¬ë¶„
#defalut : collapse=NULL
paste("A","B")
paste("A","B",collapse="/") #"A B"
paste(c("A","B"))
paste(c("A","B"),collapse='/') #"A/B"
paste(c("A","B"),1:2,collapse = '/') #"A 1/B 2"
paste(c("A","B"),1:2,sep='?',collapse='/') #"A?1/B?2"
#paste0(vector1, vetor2,...,sep='',collapse=NULL) : ê³µë°±?—†?´ ?•©ì¹œë‹¤ : sep= ""
paste(c("A","B","C"),1:2,sep="",collapse = '/') #"A1/B2"
paste0(c("A","B"),c("B",'D'),1:2,collapse='/') #"A1/B2"
paste0(LETTERS[1:5],letters[1:5]) #"Aa""Bb""Cc""Dd""Ee"

#nchar : ë¬¸ì?—´?˜ ê°??ˆ˜ë¥? ?„¸?Š” ?•¨?ˆ˜
#nchar(ë¬¸ì?—´)
test <- c("abcedfg","AFFY1245820")
nchar(test) #7 11
nchar("abcd")

#substr : ë¬¸ì?—´?—?„œ ë¶€ë¶„ì„ ì¶”ì¶œ?•˜?Š” ?•¨?ˆ˜
#substr(ë¬¸ì?—´, ?‹œ?‘?œ„ì¹?, ë§ˆì?€ë§‰ìœ„ì¹?)
f_name = "AFFY1245820"
substr(f_name,5,nchar(f_name)) #1245820
y = c("ax_1234","ax_3456")
substr(y,4,7) #"1234""3456"

#strtrim : ë¬¸ì?—´?„ ?ë¥´ëŠ” ?•¨?ˆ˜
#strtrim(ë¬¸ì?—´ë²¡í„°, width=?‘œ?˜„?ˆ«?ë²¡í„° )
strtrim("ABCDEF",3)#"ABC"
strtrim(rep("abcdef",3),c(1,4,10)) #"a""abcd"abcdef" 
#ì£¼ì–´ì§? ?ˆ«?> ë²¡í„°ê¸¸ì´ : ë¬¸ì?—´ ê·¸ë?€ë¡? ?œ ì§€

#strsplit : ë¬¸ì?—´?„ ì£¼ì–´ì§? ê°’ìœ¼ë¡? êµ¬ë¶„?•˜?—¬ ?ë¥´ëŠ” ?•¨?ˆ˜
#strsplit(ë¬¸ì?—´ ë²¡í„°,split=?‘œ?˜„,fixed-F,perl=F,useBytes=F)
#Defalut(ëª¨ë“  ?¸?ˆ˜=F)?´ë©? extended regular expression?„ ?´?š©
#fixed=T?´ë©? ë¬¸ì?‘œ?˜„ ê·¸ë?€ë¡? ?´?š©
#ê°? ë¬¸ì?—´ ë²¡í„°?˜ ?›?†Œ?— ??€?•œ ?•¨?ˆ˜ ? ?š© ê²°ê³¼ë¥? ë¦¬ìŠ¤?Š¸ ?˜•?ƒœ ë°˜í™˜
x="a.b,c/d"
y="a.,/b"
strsplit(x,split=".,/");strsplit(y,split=".,/")





