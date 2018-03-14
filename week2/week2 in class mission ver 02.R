library(rvest)
url=read_html("http://24h.pchome.com.tw/store/DHAZ7E/ger")
url=html_nodes(url,"a") #爬下選定的網頁中的幾個連結
url=html_attr(url,"href")
url