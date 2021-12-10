#Web scraping 과제
rm(list=ls())

library(rvest)

day=c("mon","tue","wed","thu","fri","sat","sun");day
day_name = character()
webtoon_name = character()
day_webtoon2 = data.frame()
webtoon_rating2 = data.frame()
webtoon_recomand2 = data.frame()
webtoon_update2 = data.frame()

for (i in day){
  url = paste0("https://comic.naver.com/webtoon/weekdayList.nhn?week=",i,'&order=User&view=list')
  webpage = read_html(url)
  temp = html_nodes(webpage,'.view_type .sub_tit')
  text = html_text(temp)
  text = gsub('[전체]','',text)
  day_name = c(day_name,text)
  
  temp2 = html_nodes(webpage,'.subject strong')
  text2 = html_text(temp2)
  webtoon_name = c(webtoon_name,text2)
  
  temp3 = html_nodes(webpage,'.rating_type strong') 
  text3 = html_text(temp3)
  rating = as.numeric(text3)
  
  webtoon_rating = data.frame(webtoon = text2, rating=rating)
  webtoon_rating2 = rbind(webtoon_rating2, webtoon_rating)
  
  temp4 = html_nodes(webpage,'.webtoon_spot .sub_tit')
  text4 = html_text(temp4)
  recomand = strtrim(text4,width=14)
  
  
  temp5 = html_nodes(webpage,'.webtoon_spot a strong')
  text5 = html_text(temp5)
  
  webtoon_recomand = data.frame(day=recomand, recomand=text5)
  webtoon_recomand2 = rbind(webtoon_recomand2,webtoon_recomand)
  
  temp6 = html_nodes(webpage,'td+ td a')
  text6 = html_text(temp6)
  writer = gsub('[\n\t]','',text6)
  
  day_webtoon = data.frame(day = text,webtoon = text2,writer=writer)
  day_webtoon2 = rbind(day_webtoon2,day_webtoon)
  
  temp7 = html_nodes(webpage,'.date')
  text7 = html_text(temp7)  
  update = gsub('[\n\t]','',text7)
  
  webtoon_update = data.frame(webtoon=text2, update=update)
  webtoon_update2 = rbind(webtoon_update2,webtoon_update)
}

#요일별 웹툰 
setwd("c:/Webscraping")
write.csv(day_webtoon2, file='day_webtoon.csv')
day_webtoon2
nrow(day_webtoon2)

day = function(x){
  n = (day_webtoon2[1] == paste0(x,'요  웹툰'))
  webtoon_day =  day_webtoon2[n,1]
  webtoon_list = day_webtoon2[n,2]
  webtoon_writer = day_webtoon2[n,3]
  return(list(data.frame('웹툰목록'= webtoon_list,'웹툰작가'=webtoon_writer),'총개수'=length(webtoon_list)))
}

day2 = c('월',"화","수","목","금","토","일")
for (i in day2){
  temp = day(i)
  write.csv(temp,file=paste0(i,'_webtoon.csv'))
}

#웹툰 별점 
webtoon_rating2
write.csv(webtoon_rating2, file='webtoon_rating.csv')

#내림차순 
x = order(webtoon_rating2[2],decreasing=TRUE)
webtoon = webtoon_rating2[x,1]
rating = webtoon_rating2[x,2]
webtoon_rating_dec = data.frame('webtoon'=webtoon, 'rating'=rating)
write.csv(webtoon_rating_dec, file='webtoon_rating_dec.csv')

png(file='rating_barplot.png')
barplot(table(webtoon_rating2[,2]),main='웹툰별점',xlab='별점',ylab='웹툰 개수')
box()
dev.off()

#요일별 추천 웹툰
webtoon_recomand2 
write.csv(webtoon_recomand2,file='webtoon_recomand.csv')

day_recomand = function(x){
  n = (webtoon_recomand2[1] == paste0(x,'요 추천 웹툰'))
  webtoon_day =  webtoon_recomand2[n,1]
  webtoon_list = webtoon_recomand2[n,2]
  return(data.frame('요일'=webtoon_day, '웹툰목록'= webtoon_list))
}

day2 = c('월',"화","수","목","금","토","일")
for (i in day2){
  temp = day_recomand(i)
  write.csv(temp,file=paste0(i,'_webtoon_recomand.csv'))
}

#웹툰 업로드 날짜, 시간
webtoon_update2
write.csv(webtoon_update2,file='webtoon_update.csv')

webtoon_update2[2]
min = now$min
plot(table(min))

png(file='update_barplot.png')
plot(table(min),main='웹툰업로드시간(분)',xlab='시간(분)',ylab='웹툰 개수')
box()
dev.off()