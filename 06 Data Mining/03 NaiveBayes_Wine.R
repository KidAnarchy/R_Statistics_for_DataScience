# Naive Bayes Wine Dataset

# Import library
library(e1071)
library(caret)
library(corrplot)
library(dplyr)

# Use supervised learning: Classification: Naive Bayes
#model <- naiveBayes(play~., data=data1, laplace = 1)
#model
#predict(model,x.data, type="raw") 

#compute probability using normal distribution
dnorm(11,11.52,0.99)
dnorm(11,10.25,0.97)
dnorm(11,10.21,0.92)


#Import Dataset
wineRed = read.csv("wine.csv", header = TRUE, sep=",", na.strings= "*")
head(wineRed)


# Visual Correlation
corrplot(cor(wineRed))


# Sepparate Group by quality of wine from 1-10 to A,B,C(clasifier)
wineRed$quality = lapply(wineRed[,12], function (x)
{
  if(x >6)  { "A"}
  else if(x >4)  {"B"}
  else { "C"}   
})

# Change List type to Character type
wineRed$quality = unlist(wineRed$quality)

# Change Character type to Factor type
wineRed$quality = as.factor(wineRed$quality)


set.seed(4242)
# Train and Test Split
sam <- sample(2, nrow(wineRed), replace=TRUE, prob=c(0.8, 0.2))
trainData <- wineRed[sam==1,]
testData <- wineRed[sam==2,]


# View amount of A,B,C in Train Target price
table(trainData$quality)
# View amount of A,B,C in Test Target price
table(testData$quality)


# Data Transformation (min-max, z, Decimal)
trainData[,1:11] <-  scale(trainData[,1:11])
testData[,1:11] <-  scale(testData[,1:11])


#Check head
head(trainData[,1:11])


# Build Target : Independent valuable
myFormula <- quality~ fixed.acidity + volatile.acidity + citric.acid + residual.sugar + chlorides + free.sulfur.dioxide + total.sulfur.dioxide + density +
  pH + sulphates + alcohol 


# Fit model
nb_model <- naiveBayes(myFormula, data=trainData, laplace = 0)
nb_model


# Prediction using Train data
trainPred = predict(nb_model,trainData)
confusionMatrix(trainData$quality, trainPred)


# Prediction using Train data
testPred = predict(nb_model,testData)
confusionMatrix(testData$quality, testPred)

#--------------------------------------------------------