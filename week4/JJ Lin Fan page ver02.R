require(Rfacebook)
page.id <- "193480161484"##林俊傑的粉專 
page <- getPage(page.id, token="EAACEdEose0cBAMId8MHnSrCOYbnqJhm1f4V147ePdMeJAvnJ522ft4a8ZB31AUyca0N2fYp6gX752VC2zsYkVlvVZBKgCrQGPZCQKeNREYpRkMkf4geW6HCds6dPm0uk9XvG2hpiBP3m3yvjvoY6jRa8COkxxF6zV5MZAYGZBaVbgYRiimPPsaPV4FH2euUtPT4sVyjp5ZCgZDZD", n = 100)
#上面的token每兩小時就要從新更新一次
#更新的網站：https://developers.facebook.com/tools/explorer/
#按“取得權杖”中的“取得粉絲專頁權杖”，之後把token貼上來
View(page)

