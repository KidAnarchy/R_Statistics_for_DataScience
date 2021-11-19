

# Import Library
library(e1071)
library(caret)
library(corrplot)
library(dplyr)
###install.packages("e1071")

# Import Data
data1<-read.csv("weather_nom.csv",header=T,colClasses="factor")


# --------Created Naive Bayes model--------
model <- naiveBayes(play~., data=data1, laplace = TRUE)
model


# --------Predict new data-----------------
outlook <- c("sunny")
temperature <- c("hot")
humidity <- c("normal")
windy <- c("FALSE")


# --------Build DataFrame to new data------
x.data <- data.frame(outlook,temperature,humidity,windy)
x.data


# --------------Predict Result-------------
predict(model,x.data, threshold=0, type="raw") 

# ---------------Test laplace = 1----------
model <- naiveBayes(play~., data=data1, laplace = 1)
model

predict(model,x.data, type="raw") 
#------------------------------------------


