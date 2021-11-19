#install.packages("ISLR")
#install.packages("broom")
#install.packages("caret")
library(ISLR)
library(broom)
library(caret)

data2 <- ISLR::Default

# Test Model1
model1 <- glm(default ~ balance, family = "binomial", data=data2)
model1

tidy(model1)
summary(model1)


# Test Model2
model2 <- glm(default ~ student, family = "binomial", data=data2)
model2

summary(model2)


# Test Model3
model3 <- glm(default ~ student+balance, family = "binomial", data=data2)

tidy(model3)
summary(model3)


# Test Model4
model4 <- glm(default ~ ., family = "binomial", data=data2) 
summary(model4)


# Prediction
predict(model1, data.frame(balance = c(1000,2000)), type ="response")

#install.packages(caret)
library(caret)
#Which variable is the most influential 

caret::varImp(model4, scale=FALSE)

#Evaluate the model using Likelihood Ratio Test

anova(model4, test = "Chisq")
anova(model1, model2, model3, model4, test = "Chisq")

#self consistency test
predict1 <- predict(model4, data2,type="response")
predict1

ans.pred = rep("No", dim(data2)[1])
ans.pred[predict1 > .5] = "Yes"

table(ans.pred, data2[,1])

library(neuralnet)
set.seed(2)
data3<-data2
data3$default<-as.numeric(data3$default)
data3$student<-as.numeric(data3$student)

mins <- apply(data3, 2, min)
maxs <- apply(data3, 2, max)

scaled <- as.data.frame(scale(data3, center=mins, scale = maxs-mins)) 
NN <- neuralnet(default ~ ., scaled, hidden = 3 , act.fct = "logistic")

plot(NN)

predict_testNN = compute(NN, scaled[,c(2:4)])
pred1=predict_testNN$net.result

ans.pred1 = rep(0, dim(data3)[1])
ans.pred1[pred1 > .5] = 1

table(ans.pred1, scaled[,1])



confusionMatrix(data2[,1], as.factor(ans.pred))

## Split in train + test set
set.seed(80)
idxs <- sample(1:nrow(data2),as.integer(0.7*nrow(data2))) 


trainData <- data2[idxs,] 
testData <- data2[-idxs,]


model5 <- glm(default ~ ., family = "binomial", data=trainData) 
summary(model5)


predict2 <- predict(model5, testData, type ="response")

ans.pred = rep("No", dim(testData)[1])
ans.pred[predict2 > .5] = "Yes"

table(ans.pred, testData[,1])

confusionMatrix(testData[,1], as.factor(ans.pred))

#10-fold cross validation
yourData<-data2[sample(nrow(data2)),]
response<-yourData[,1]


#define error matrix
err <- matrix(NA,nrow=1,ncol=10)
errcv=err


#Create 10 equally size folds
folds <- cut(seq(1,nrow(yourData)),breaks=10,labels=FALSE)


#Perform 10 fold cross validation
for(i in 1:10){
  #Segement your data by fold using the which() function
  testIndexes <- which(folds==i,arr.ind=TRUE)
  testData <- yourData[testIndexes, ]
  trainData <- yourData[-testIndexes, ]
  
  #Use the test and train data partitions however you desire...
  model <- glm(default ~ ., family = "binomial", data=trainData)
  
  ans <- predict(model, testData, type ="response")
  ans.pred = rep("No", dim(testData)[1])
  
  ans.pred[ans > .5] = "Yes"
  
  table(ans.pred, testData[,1])
  err[1,i]= mean(ans.pred == testData[,1])}
err

errcv=rowMeans(err, na.rm = FALSE, dims = 1)
errcv


#example pima diabete
pima <- read.csv(file="diabetes.csv")

model_pima <- glm(X9 ~ ., family = "binomial", data=pima)
model_pima

summary(model_pima)
tidy(model_pima)

test_data <- read.csv(file="testdata_default.csv")

dim(test_data)

predict <- predict(model_pima, test_data, type ="response")

ans.pred = rep("0", dim(test_data)[1])
ans.pred[predict > .5] = "1"

confusionMatrix(as.factor(test_data[,9]), as.factor(ans.pred))

as.factor(test_data[,9])
as.factor(ans.pred)
