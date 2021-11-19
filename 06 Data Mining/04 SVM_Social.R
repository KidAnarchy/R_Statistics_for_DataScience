# SUPPORT VECTOR MACHINE

# Import library
library("e1071") 
library(caret)
library(corrplot)
library(dplyr)

# Import Dataset
data<- read.csv("social.csv",header=T)


# Find Mean and Standard Deviation
# Age
mean(data$Age)
sd(data$Age)

# EstimatedSalary
mean(data$EstimatedSalary)
sd(data$EstimatedSalary)

# Set the Traget feature.
data$Purchased[data$Purchased == '0'] <- '-1'
data$Purchased = factor(data$Purchased, levels = c(-1, 1)) 


# Random number start at 123
set.seed(123) 
samplesize = 0.75*nrow(data) 
index=sample(seq_len(nrow(data)), size=samplesize) 

#create training and test set 
training_set = data[index,] 
test_set = data[-index,] 


# Feature Scaling : Data Transformation (min-max, z, Decimal)
training_set[-3] = scale(training_set[-3]) 
test_set[-3] = scale(test_set[-3]) 

classifier = svm(formula = Purchased ~ ., data = training_set, type = 'C-classification', kernel = 'linear') 


# Obtain feature weights 
w = t(classifier$coefs) %*%classifier$SV 


# Calculate decision values manually 
data.scaled = scale(training_set[,-3], classifier$x.scale[[1]], classifier$x.scale[[2]]) 
t(w %*% t(as.matrix(data.scaled))) - classifier$rho 


# Should equal... 
classifier$decision.values


#Check head
head(training_set[,1:3])


# Build Target : Independent valuable
myFormula <- Purchased~ Age + EstimatedSalary


# Fit model
svm_model <- svm(myFormula, data=training_set, laplace = 0)
svm_model


# Prediction using Train data
trainPred = predict(svm_model,training_set)
confusionMatrix(training_set$Purchased, trainPred)

# Prediction using Test data
testPred = predict(svm_model,test_set)
confusionMatrix(test_set$Purchased, testPred)



# Predict new data
Age <- c(-1.2072)
EstimatedSalary <- c(-0.579)

# Build DataFrame to new data
new.data <- data.frame(Age,EstimatedSalary)
new.data

# Predict Result
new.data.pred <- predict(svm_model,new.data) 

# Build data frame to new predict data
new.data.pred1 <- data.frame(Age,EstimatedSalary,new.data.pred)


# Visualizing the Training set results 
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualizing the Test set results 
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)

grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)

plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))

contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)

points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'coral1', 'aquamarine'))

points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

#-------------------------------------------------------------------------
