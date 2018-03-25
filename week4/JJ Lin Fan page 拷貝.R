require(Rfacebook)
page.id <- "193480161484"##林俊傑的粉專 
page <- getPage(page.id, token="EAACEdEose0cBAP0G7oHrLdZCyIxuuhUgM5mCJxEvdfJ4cb4ec2ENZAikn5aZCcPLSr6BAdDdWFdXfWvcqWuqCWPgAypIDffbDcv5RAUASWcpxvZB32wMiWRDdmSGxxWhZAGD399acpRsCAtkTf7sVh4ZBZBIwI4YAWXNNePtKyeYYo3YNlTy0JP3AwWvx9QnbHLZCiJbw04v7gZDZD", n = 100)
View(page)


##以下抄襲自網路
##以下抄襲自網路
##以下抄襲自網路
##以下抄襲自網路
##以下抄襲自網路
##以下抄襲自網路
##會找時間努力搞懂

## convert Facebook date format to R date format
format.facebook.date <- function(datestring) {
  date <- as.POSIXct(datestring, format = "%Y-%m-%dT%H:%M:%S+0000", tz = "GMT")
}
# aggregate metric counts over month
aggregate.metric <- function(metric) {
  m <- aggregate(page[[paste0(metric, "_count")]], list(month = page$month),
                 mean)
  m$month <- as.Date(paste0(m$month, "-15"))
  m$metric <- metric
  return(m)
}
# create data frame with average metric counts per month
page$datetime <- format.facebook.date(page$created_time)
page$month <- format(page$datetime, "%Y-%m")
df.list <- lapply(c("likes", "comments", "shares"), aggregate.metric)
df <- do.call(rbind, df.list)
# visualize evolution in metric
library(ggplot2)
library(scales)
ggplot(df, aes(x = month, y = x, group = metric)) +
  geom_line(aes(color = metric)) +
  scale_y_log10("Average count per post",
                breaks = c(2, 10, 50, 100)) +
  theme_bw() +
  theme(axis.title.x = element_blank())
