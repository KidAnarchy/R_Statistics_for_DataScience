#********************************************************
#*            Age Imputation
#********************************************************    
# Import Library
library("tidyverse")
library("dplyr")
library("Hmisc")

# Import Data
data<-read.csv("titanic.csv",header = T)

# Seperate titles from name (Code from Huijun Zhao)
data$Title <- gsub('(.*, )|(\\..*)','',data$name)

# Combine Rare Titles. 
rareTitle <- c('Dona','Lady','the Countess','Capt','Col','Don','Dr','Mlle','Mme','Major','Rev','Sir','Jonkheer')
data$Title[data$Title %in% rareTitle] <- 'Rare Title'
rm(rareTitle)

#-------Combine Table-------------------------
tt_age = subset(data, select = c("Title","age"))


by_title <- tt_age %>% group_by(Title)
by_title

#---------Impute age value by median------------------
by_title %>% summarise(age = median(age,na.rm = TRUE))

by_title$age<-impute(by_title$age,fun = median)

#-----------------------------------------------------