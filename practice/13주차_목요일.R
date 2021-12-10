#13주차 목요일
#색상 표현하기
#색상 상수로 표현하는 방법
col.table = function(cols, main=NULL, fg=NULL){
  n = length(cols)
  plot(seq(n), rep(1,n), xlim = c(0,n), ylim = c(0,1), type = 'n', xlab = "", ylab = "", axes = F)
  if (is.null(main))
  {
    main = paste0("Color Table by ", deparse(substitute(cols)))
  }
  title(main=main)
  
  if (is.null(fg))
  {
    fg = sapply(cols,function(x) ifelse(mean(col2rgb(x))>127 | toupper(x) %in% c('WHITE','#FFFFFF'), "black", "White"))
  }else
  {
    fg = rep(fg,n)
  }
  for (i in 1:n)
  {
    polygon(c(i-1,i-1,i,i),c(0.05,1,1,0.05),col = cols[i])
    text(mean(c(i-1,i)),0.52,labels = cols[i], srt = 90, adj = 0.5, col=fg[i], cex=1.2)
  }
}

par(mfrow=c(2,1))
col.table(1:16)
col.table(5:20)

#색상의 이름으로 표현하기 
col_name = colors()[1:5]; col_name
col_rgb = col2rgb(col_name); col_rgb
colnames(col_rgb) = col_name
col_rgb
col.table(col_name)

cols = colors()
length(cols)
cols[1:5]
grep('sky',cols, value=T)
col2rgb(grep('sky',cols,value=T))

par(mfrow=c(2,1),mar=c(1,1,3,1))
col.table(grep('sky',cols, value=T))
col.table(grep('red',cols, value=T))

col.map = function(cols=colors())
{
  n = length(cols)
  cnt = floor(sqrt(n))
  plot.new()
  plot.window(xlim=c(0,cnt), ylim=c(0,cnt))
  #plot(1:cnt, xlim=c(0,cnt),ylim=c(0,cnt),type='n',axis=F)
  
  for (i in 1:cnt)
  {
    for (j in 1:cnt)
    {
      rect(i-1,j-1,i,j,col=cols[(i-1)*cnt+j],border=NA)
    }
  }
}
col.map(colors())

#RGB 색상으로 표현하는 방법
#RGB는 2개의 16진수로 표기 : "#RRGGBBAA"
#col2rgb()함수 : 주어진 수 or 색상 이름을 RGB표현으로 바꾸어주는 함수
#as.character.hexmode(number) : 16진수로 변환
as.character.hexmode(255) #ff
#toupper(character) ; 대문자로 변환 
toupper(as.character.hexmode(255)) #FF
#rev(vector) : 벡터의 순서를 반대로 정리
rev(1:10) #10 9 8 7 6 5 4 3 2 1
#흰색과 검은색의 RGB형식 : white("#FFFFFF"), black("#000000")

seqs = seq(0, 255, length = 15); seqs
hexs = toupper(as.character.hexmode(seqs)); hexs

red = paste0('#',hexs,'0000')
green = paste0('#00',hexs,'00')
blue = paste0('#0000',hexs)

mix1 = paste0('#',hexs,hexs,hexs)
mix2 = paste0('#',rev(hexs),hexs,rev(hexs))

par(mfrow=c(5,1), mar = c(1,1,3,1))
col.table(red)
col.table(green)
col.table(blue)
col.table(mix1)
col.table(mix2)

#색상팔레트(color palettes) : 일정 간격으로 색상을 나타내어 미리 정해두고 사용하는 색상 벡터를 나타낸다
#rainbow() : 무지개 색상의 팔레트
#heat.colors() : 따뜻한 색감의 색상 팔레트
#terrain.colors() : 지형을 나타내는 색감의 색상 팔레트(육지)
#topo.colors() : 지형을 나타내는 색감의 색상 팔레트(바다)
#cm.colors() : cyan(하늘)에서 magenta(자주)로 진행되는 색상 팔레트
#gray() : 회색 계열로 구성된 색상 팔레트(0~1)
par(mfrow=c(6,1),mar=c(0,0,2,0))
col.table(rainbow(20))
col.table(heat.colors(20))
col.table(terrain.colors(20))
col.table(topo.colors(20))
col.table(cm.colors(20))
col.table(gray(seq(0,255,length=20)/255))

par(mfrow=c(2,2), mar=c(0,0,2,0))
col.map(rainbow(400, start=0, end=0.8))
col.map(heat.colors(400))
col.map(cm.colors(400))
col.map(topo.colors(400))

#알파 채널
#알파 투명 채널(alpha transparency channel) : 색상의 투명도를 지정하는 값 "#RRGGBBAA"
#AA = 00 : 투명(색상이 나타나지 않는다.) / AA = FF : 불투명(알파 채널 생략 시와 동일한 결과)
seqs = seq(0, 255, length = 20)
alpha = toupper(as.character.hexmode(seqs))

par(mfrow = c(5,1), mar = c(0,0,2,0))
col.table(paste0("#FF0000",alpha),fg=1)
col.table(paste0("#00FF00",alpha),fg=1)
col.table(paste0("#0000FF",alpha),fg=1)
col.table(rainbow(20),main="Alpha Channel 사용 안함")
col.table(rainbow(20, alpha = seq(0,1,length=20)), main="Alpha Channel 사용",fg=1)

x = c(1, 1.3, 1.6)
y = c(1,2,1)
par(mar=c(4,2,3,1), mfrow=c(1,2))
plot(x,y, pch = 16, cex = 20, col = c('red','green','blue'), xlim=c(0,3), ylim=c(-2,5))
title(main="col=c('red','green','blue')")

plot(x,y, pch = 16, cex = 20, col = c('#FF000077','#00FF0077','#0000FF77'), xlim=c(0,3), ylim=c(-2,5))
title(main="alpha channle by \"77\"")

#기타 색상 관련 함수들 
#hsv() 함수 : 색의 세 가지 속성인 색상(hue), 채도(saturation), 명도(value)를 사용하여 색상을 지정
#함수의 인수 : h,s,v,alpha (함수의 인수의 값은 각각 0~1 사이의 값)
#함수의 반환값 : "RRGGBBAA"의 형태

par(mfrow=c(2,2))
par(mar = c(0.1,0.1,1,0.1))
hsv(0.5,0.5,0.5) #"#408080"

hsv1 = c(hsv(0.5,0.5,0.5), hsv(0.6,0.5,0.5), hsv(0.7,0.5,0.5), hsv(0.8,0.5,0.5))
hsv2 = c(hsv(0.5,0.5,0.5), hsv(0.5,0.6,0.5), hsv(0.5,0.7,0.5), hsv(0.5,0.8,0.5))
hsv3 = c(hsv(0.5,0.5,0.5), hsv(0.5,0.5,0.6), hsv(0.5,0.5,0.7), hsv(0.5,0.5,0.8))
hsv4 = c(hsv(0.5,0.5,0.5), hsv(0.6,0.6,0.6), hsv(0.7,0.7,0.7), hsv(0.8,0.8,0.8))

col.map(hsv1)
title('hsv1')
col.map(hsv2)
title('hsv2')
col.map(hsv3)
title('hsv3')
col.map(hsv4)
title('hsv4')


#rgb()함수 : red,green,blue,alpha의 값을 인수로 하여 색상값을 반환
#함수의 인수값은 기본 설정으로 0~1사이의 값으로 표현
#함수의 반환값 : "RRGGBBAA"의 형태

reds1 = rgb((0:15)/15, g = 0, b = 0)
reds2 = rgb((0:15)/15, g = 0, b = 0, alpha = 0.5)
gray1 = gray(0:8/8)
gray2 = gray(0:8/8, alpha = 0.5)

par(mfrow=c(2,2), mar = c(1,3,1,1))
col.map(reds1)
title('rgb((0:15)/15, g=0, b=0)')
col.map(reds2)
title('rgb((0:15)/15, g=0, b=0, alpha = 0.5)')
col.map(gray1)
title('gray(0:8/8)')
col.map(gray2)
title('gray(0:8/8, alpha = 0.5)')

#R에서 Code를 이용하여 그림 내보내기 
#PNG, BMP, PDF 형식
#png,jpeg,bmp,pdf형식 파일 선언하기(device 열기)
png(filename='c:/example/test2.png')
bmp(filename='c:/example/test2.bmp')
pdf(file='c:/example/test2.pdf') #여러개 가능 

#plot실행(그림 그리기)
a = 1:10
b = 2*a + rnorm(10)
c = 3*b + a
plot(a,b)
plot(a,c)
plot(b,c)

#Device OFF
dev.off()

#Device copy를 이용한 내보내기
#plot 실행 
a = 1:10
b = 2*a + rnorm(10)
plot(a,b)

#Device COPY 
dev.copy(jpeg, filename='c:/example/test3.jpg')

#Device OFF
dev.off()
