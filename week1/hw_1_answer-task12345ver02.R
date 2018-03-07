### hw_1_question


########################################################### Task 1

# 查看內建資料集: 鳶尾花(iris)資料集
iris

# 使用dim(), 回傳iris的列數與欄數
dim(iris)

# 使用head() 回傳iris的前六列
head(iris)

# 使用tail() 回傳iris的後六列
tail(iris)

# 使用str() 
str(iris)

# 使用summary() 查看iris敘述性統計、類別型資料概述。
summary(iris)

########################################################### Task 2

# 使用for loop 印出九九乘法表
# Ex: (1x1=1 1x2=2...1x9=9 ~ 9x1=9 9x2=18... 9x9=81)

for(x in c(1:9)){
  for(y in c(1:9) ){
    z<-x*y
    print(paste(x,"x",y,"=",z))
  }
}

########################################################### Task 3

# 使用sample(), 產出10個介於10~100的整數，並存在變數 nums
nums<- sample(10:100,size=10)

# 查看nums
print(nums)

# 1.使用for loop 以及 if-else，印出大於50的偶數，並提示("偶數且大於50": 數字value)
# 2.特別規則：若數字為66，則提示("太66666666666了")並中止迴圈。

for (x in c(26:50)) {
  y<-x*2
  if (x!=33)
    print(paste("偶數且大於50:",y))
  else{
    print("太66666666666了")
    break
  }
}  

########################################################### Task 4

# 請寫一段程式碼，能判斷輸入之西元年分 year 是否為閏年
# 閏年的定義為4的倍數但不是100的倍數，或是400的倍數
{
k <-readline(prompt="Enter an integer: ")
k <-as.integer(k)
if (k %% 400 == 0){
  print("是閏年")
}else if(k %% 4 ==0){
  if (k %% 100==0){
    print("不是閏年")
  }else {
    print("是閏年")
  }
}
}

########################################################### Task 5

# 猜數字遊戲
# 1. 請寫一個由電腦隨機產生不同數字的四位數(1A2B遊戲)
# 2. 玩家可重覆猜電腦所產生的數字，並提示猜測的結果(EX:1A2B)
# 3. 一旦猜對，系統可自動計算玩家猜測的次數

# 隨機四位數
{
x<- sample(0:9,size=1)
y<- sample(0:9,size=1)
z<- sample(0:9,size=1)
w<- sample(0:9,size=1)

# 計數器
t<-0

# 輸入數字的程式
repeat{
  
k1 <-readline(prompt="請輸入千位: ")
k1 <-as.integer(k1)
k2 <-readline(prompt="請輸入百位: ")
k2 <-as.integer(k2)
k3 <-readline(prompt="請輸入十位: ")
k3 <-as.integer(k3)
k4 <-readline(prompt="請輸入個位: ")
k4 <-as.integer(k4)
#幾Ａ幾Ｂ
a<-0
b<-0

t<-t+1

# 比較的部分

if (x==k1){
  a<-a+1
  if(k1==y){ #k1已經和x相等，若k1和y位置的數值相等，不可計入b，故在此扣掉
    b<-b-1
  }
  if(k1==z){
    b<-b-1
  }
  if(k1==w){
    b<-b-1
  }
}else
{
  if(x==k2){
    b<-b+1
    if (k2==k3){  #k2和k3只能算一次
      b<b-1
    }
    if (k2==k4){
      b<b-1
    }
  }else if(x==k3)
  {
    b<-b+1
    if (k3==k4){
      b<-b-1
    }
  }else if(x==k4)
  {
    b<-b+1
  }
}
if (y==k2)
  {
  a<-a+1
  if(k2==x){
    b<-b-1
  }
  if(k2==z){
    b<-b-1
  }
  if(k2==w){
    b<-b-1
  }
}else
{
  if(y==k1){
    b<-b+1
    if(k1==k3){
      b<-b-1
    }
    if(k1==k4){
      b<-b-1
    }
  }
  else if(y==k3){
    b<-b+1
    if(k3==k4){
      b<-b-1
    }
  }
  else if(y==k4){
    b<-b+1
  }
}
if (z==k3)
  {
  if(k3==x){
    b<-b-1
  }
  if(k3==y){
    b<-b-1
  }
  if(k3==w){
    b<-b-1
  }
  a<-a+1
}else
{
  if(z==k1){
    b<-b+1
    if(k1==k2){
      b<-b-1
    }
    if(k1==k4){
      b<-b-1
    }
  }
  else if(z==k2){
    b<-b+1
    if(k2==k4){
      b<-b-1
    }
  }
  else if(z==k4){
    b<-b+1
  }
}
if (w==k4)
  {
  a<-a+1
  if(k4==x){
    b<-b-1
  }
  if(k4==y){
    b<-b-1
  }
  if(k4==z){
    b<-b-1
  }
}else
{
  if(w==k1){
    b<-b+1
    if(k1==k2){
      b<-b-1
    }
    if(k1==k3){
      b<-b-1
    }
  }
  else if(w==k2){
    b<-b+1
    if(k2==k3){
      b<-b-1
    }
  }
  else if(w==k3){
    b<-b+1
  }
}
print(paste(a,"A",b,"B"))
if(x==k1){
  if(y==k2){
    if(z==k3){
      if(w==k4){
        print(paste('第',t,"次成功，恭喜你"))
        break
      }
    }
  }
}
}
}





