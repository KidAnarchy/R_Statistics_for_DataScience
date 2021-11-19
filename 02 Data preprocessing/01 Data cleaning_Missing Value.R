#--------------------------------------------------------------------
#                Missing Value
#-------------------------------------------------------------------
# Import Library
# install.packages("tidyr")
library(tidyr)
library (Hmisc)

# Import Data
person <- read.table ("person.txt",header=TRUE,stringsAsFactor =FALSE)

str(person) #str() function in R Language is used for compactly displaying the internal structure of a R object.

person
# or
print(person)

#-------------1)Ignore the tuple----------------------------------
#1.1
complete.cases(person)
persons_complete <- na.omit(person)  # Omit is dropping column that has NA.
print(persons_complete)
na.action(persons_complete)

#1.2 # Drop NA
data<-drop_na(person)
data

#-------2) Use a global constant to fill in the missing value-----
index = is.na( person$height )
person$height [index]=160
person

#-----3) Use a measure of central tendency for the attribute using R-------
#install.packages("Hmisc")
#library (Hmisc)

# -----------------mean imputation---------------
x <-1:5                            # create a vector
x[2] <- NA                         # ...with an empty value
x <- impute (x, mean)              # mean imputation
x
                                   ## 1 2 3 4 5
                                   ## 1.00 3.25* 3.00 4.00 5.00

# -----------------median imputation---------------
x <-impute (x, fun = median)       # median imputation
x


#---4)Use the regression model to fill in the missing value(Regression Imputation)---

data(iris)

iris$Sepal.Length [1:10] <- NA

model<- lm (Sepal.Length~Sepal.Width + Petal.Width , data = iris)

I<- is.na(iris$Sepal.Length)

iris$Sepal.Length[I]<- predict(model, newdata = iris[I,])

#-------------------------------------------------------------------------------



































