#第六組
#目標：想要照著datacamp(https://www.datacamp.com/community/tutorials/keras-r-deep-learning)的步驟整理資料和學sequential model
#原本想要用functional API 來做，可是發現有難度，所以只用sequential model來做

library(keras)
#讀檔案
iris <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), header = FALSE) 
#改column name
names(iris)<-c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

### 觀察資料
plot(iris$Petal.Length, 
     iris$Petal.Width, 
     pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], 
     xlab="Petal Length", 
     ylab="Petal Width")
#可以看出Petal.Length和Petal.Width有正相關，並且可以用來預測種類

# 將種類改成數值
iris[,5] <-as.numeric(iris[,5]) -1
# model只能辨認矩陣的shape，故要改成矩陣
iris<-as.matrix(iris)
# 不希望dianame也跑進model裡
dianame(iris)<-NULL

### 整理資料
# Determine sample size
# 隨機選擇1和2，共150個
ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.67, 0.33))

# Split the `iris` data
iris.training <- iris[ind==1, 1:4]
iris.test <- iris[ind==2, 1:4]

# Split the class attribute
iris.trainingtarget <- iris[ind==1, 5]
iris.testtarget <- iris[ind==2, 5]

# One hot encode training target values
iris.trainLabels <- to_categorical(iris.trainingtarget)

# One hot encode test target values
iris.testLabels <- to_categorical(iris.testtarget)

# Initialize a sequential model
model <- keras_model_sequential()

# Add layers to the model
# 為了增加準確度，多建了2層
# units＝10是因為hidden layer 
model %>% 
  layer_dense(units = 10, activation = 'relu', input_shape = c(4)) %>% 
  layer_dense(units = 8, activation = 'relu', input_shape = c(4)) %>%
  layer_dense(units = 5, activation = 'relu', input_shape = c(4)) %>% 
  layer_dense(units = 3, activation = 'softmax')

# Define an optimizer
sgd <- optimizer_sgd(lr = 0.01)

# Compile the model
model %>% compile(
  loss = 'categorical_crossentropy',
  optimizer = sgd,
  metrics = 'accuracy'
)

# Fit the model 
model %>% fit(
  iris.training, 
  iris.trainLabels, 
  epochs = 200, 
  batch_size = 5, 
  validation_split = 0.2
)


# Evaluate the model
score <- model %>% evaluate(iris.test, iris.testLabels, batch_size = 128)

# Print the score
print(score)

#心得：改變optimizer、增加hidden units、 Adding Layers可以適度提升準確率