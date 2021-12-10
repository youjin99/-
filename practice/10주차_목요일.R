#10二쇱감 紐⑹슂?씪
#Web scraping with rvest
#rvest : Chrome?쓽 SelectorGadget怨? ?븿猿? ?궗?슜?븯?뿬 ?돺寃? ?쎒?뒪?겕?옒?븨?쓣 吏꾪뻾?븯?뒗 R?쓽 ?뙣?궎吏
#二쇱슂 ?븿?닔?뱾
#read_html(web page url) : Webpage瑜? ?씫怨? Tag濡? 援ъ“?솕?븯?뿬 媛앹껜 ?깮?꽦
#html_nodes(web_page,"css selector location") : ?썝?븯?뒗 ?깭洹몃쭔 戮묎쿋?떎
#html_text(html) : ?꽑?깮?맂 Tag?쓽 Text?뱾留? ?꽑?깮?븯?뿬 諛섑솚

install.packages("rvest")
library(rvest)
search()
ls(2)

#IMDB Example
url = 'https://www.imdb.com/search/title?count=100&release_date=2019,2019&title_type=feature'
webpage = read_html(url); webpage

temp = html_nodes(webpage,'.lister-item-header a')
temp
html_text(temp)

temp2 = html_nodes(webpage,'.ratings-imdb-rating strong')
temp2
html_text(temp2)

temp3 = html_nodes(webpage,'.text-primary')
temp3
x = html_text(temp3)
x
x = gsub('[.]','',x);x

temp4 = html_nodes(webpage,'.text-muted.unbold')
temp4
x2 = html_text(temp4);x2
x2 = as.numeric(gsub("[()]|([I]+)","",x2));x2

dat = data.frame(title=html_text(temp),rating=html_text(temp2))
head(dat)

temp5 = html_nodes(webpage,'.sort-num_votes-visible span:nth-child(2)')
t5_text = html_text(temp5); t5_text
vote = as.numeric(gsub("[,]","",t5_text))
vote

dat2 = data.frame(title=html_text(temp),rating=html_text(temp2),votes=vote)
head(dat2)

str_date = '2019-01-01'
end_date = '2019-12-31'
cnt = 100
str_num = 1
url = paste0('https://www.imdb.com/search/title/?title_type=feature&relase_date=',str_date,",",end_date,"&count=",cnt,'&start=',str_num,'&ref_=adv_nxt')

page = read_html(url)
temp = html_node(page,'.desc span:nth-child(1)')
html_text(temp)
strsplit(html_text(temp),"[ ]")[[1]][3]

num_tt = as.numeric(gsub(',','',strsplit(html_text(temp),'[ ]')[[1]][3]))
num_tt
num_page = ceiling(num_tt/cnt)
num_page

mv_list = data.frame()

for (i in 1:5)
  {
  url = paste0('https://www.imdb.com/search/title/?title_type=feature&relase_date=',str_date,",",end_date,"&count=",cnt,'&start=',str_num,'&ref_=adv_nxt')
  page = read_html(url)
  
  temp = html_nodes(webpage,'.lister-item-header a')
  temp = html_text(temp)
  
  temp2 = html_nodes(webpage,'.ratings-imdb-rating strong')
  temp2 = as.numeric(html_text(temp2))
  
  mv_list2 = data.frame(temp, temp2)
  mv_list = rbind(mv_list,mv_list2)
  Sys.sleep(runif(1,0.5,2))
  str_num = str_num + cnt
  cat('\n Page: ',i,' / Total: ',num_page)
}

mv_list

#Example2
url = "https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=136900&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false"
i=1
url_temp = paste0(url,'&page=',i);url_temp

mv_webpage = read_html(url_temp)
tt_cnt_temp = html_nodes(mv_webpage,'total em')
v_count = html_text(tt_cnt_temp); v_count
v_count = gsub("[,]","",v_count)
tt_cnt = as.numeric(v_count); tt_cnt

page_index = 1:ceiling(tt_cnt/10)
length(page_indx)

rating = numeric()
u_name = character()
for (i in 1:10){
  w_temp = read_html(paste0(url,'&page=',i))
  r_temp = html_nodes(w_temp,'.score_result .star_score em')
  rating = c(rating, as.numeric(html_text(r_temp)))
  
  u_temp = html_nodes(w_temp,'.score_reple a span')
  u_txt = html_text(u_temp)
  u_txt = u_txt[u_txt!='BEST']

  u_name = c(u_name,u_txt)
  Sys.sleep(runif(1,1,3))
  cat('\n',i,'page')
}

u_name

rating

data.frame(rating,u_name)

temp = gsub(")","",u_name)
temp
temp_list = strsplit(temp,"[(]"); temp_list
res2 = vector()
for (i in 1:length(temp_list)){
  res = temp_list[[i]][2]
  res2 = c(res2, res)
}

res = sapply(temp_list,function(x) x[length(x)])
res2

x11()
plot(table(rating),type='h')
