
# Import Libraly
library(e1071)
library(caret)
library(corrplot)
library(dplyr)
###install.packages("e1071")

# ----------Import Data-------------------
data1<-read.csv("Evade.csv",header=T,colClasses="factor")

# --------Created Naive Bayes model--------
model <- naiveBayes(Evade~., data=data1, laplace = TRUE)
model

# ----------Predict new data-----------
Refund <- c("No")
Marital_Status <- c("married")
Taxable_Income <- c("120")


#----------- Build DataFrame to new data----------
x.data <- data.frame(Refund,Marital_Status,Taxable_Income)
x.data

# ------------Predict Result---------------------
predict(model,x.data, threshold=0, type="raw")

#------------------------------------------------