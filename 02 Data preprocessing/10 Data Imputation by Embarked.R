#-----------------------------------------------
#          Imputation Embarked
#-----------------------------------------------
# Import Library
#install.packages("data.table")
#install.packages("readr")
library(data.table)
library(dplyr)
library(tidyr)
library(readr)

# Import data
titanic_original <- read.csv("titanic.csv", header = TRUE)
#or
df<-read.csv("titanic.csv",na.strings=c("","na"))

# Find NA
df[is.na(df$embarked),]
df1<-df
df1$embarked <-lapply(df1$embarked, as.character)

# Impute
df1$embarked[which(is.na(df1$embarked))] <-"S"
df2<-df1 
df2[is.na(df2$embarked),]

#------------------------------------------------