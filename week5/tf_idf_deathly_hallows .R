#目標：學習如何用tf idf，並且觀察deathly_hallows中tf idf 的相關性
library(dplyr)
library(tidytext)#unnest token 要用到的
library(magrittr)#%>%會用到
library(ggplot2)#畫圖用的
library(plotly)#著色會用到
library(harrypotter)#用deathly_hallows來看

View(deathly_hallows)
#可以看出有37rows
text<-data_frame(line=1:37,text=deathly_hallows)
View(text)
#要先轉成data frame ，才能用unnest_tokens


ti_text <- text %>% 
  #ti_text 是 text 經過下面的處理之後，存取的變數
  unnest_tokens(word,text) %>%
  #把text中每個word拆開來
  count(word,sort=TRUE) %>%
  #用來計算text中每個word 出現過幾次
  bind_tf_idf(word, line, n) %>%
  #用來計算每個line中的word的tf idf
  subset(idf!=0)
#把idf＝0的移除掉，idf=0代表太常出現的詞，例如 i am ，是不重要的詞，所以才要移除
#關於 tf idf 可以參考：http://www.cc.ntu.edu.tw/chinese/epaper/0031/20141220_3103.html
#挑出word＆tf 兩欄出來畫圖
ti_text_h50<-head(ti_text,50)
#挑出前50個最常出現的詞用來畫圖
p<-ggplot(data=ti_text_h50,aes(x=tf,y=idf))+geom_point(shape=0.2)+geom_smooth(method=lm,se=FALSE) 
#geom_smooth(method=lm,se=FALSE)是用來畫線的，se=FALSE代表不用畫出灰灰的區域
p <- ggplotly(p)
p
#可以看出在deathly_hallows中TF IDF 無相關