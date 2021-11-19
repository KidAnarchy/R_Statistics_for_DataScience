#----------------------------------------------------------
#                Data Preparation
#----------------------------------------------------------
# Import Library
library("tidyverse")
library("dplyr")
library("Hmisc")

# Import Data
data<-read.csv("titanic.csv",header = T)


# a) Dropping columns which are not useful (Passenger Id, Name, ticket number, cabin).
df1 = subset(data, select = c("survived","pclass","sex","age","sibsp","parch","fare","embarked"))
df1    # Answer of a)


# b1) Age: this column was imputed by using the median age for the passenger's title (Mr, Mrs, Dr etc).
data$Title <- gsub('(.*, )|(\\..*)','',data$name)


# Combine Rare Titles. 
rareTitle <- c('Dona','Lady','the Countess','Capt','Col','Don','Dr','Mlle','Mme','Major','Rev','Sir','Jonkheer')
data$Title[data$Title %in% rareTitle] <- 'Rare Title'
rm(rareTitle)


df2 = subset(data, select = c("Title","age"))
df2new <- df2 %>% group_by(Title)
df2new %>% summarise(age = median(age,na.rm = TRUE)) #Answer of b.1)
df2new$age<-impute(df2new$age,fun = median) 


# b2)Fare: the single missing value in this column was imputed using the median value for that passenger's class.
df3 = subset(data, select = c("pclass","fare"))
df3new <- df3 %>% group_by(pclass)
df3new %>% summarise(fare = median(fare,na.rm = TRUE)) #Answer of b.2)
df3new$fare<-impute(df3new$fare,fun = median) 


# b3)Embarked: the two missing values here were imputed using backfill method.
df4<-read.csv("D:titanic.csv",na.strings=c("","na"))
df4new = subset(df4, select = c("embarked"))
df4[is.na(df4$embarked),]
   #backfill method: use last value to fill next missing value.
df4new[c(169),"embarked"]<-'S'
df4new[c(285),"embarked"]<-'C'
df4new[c(1266),"embarked"]<-'S'
df4new[c(1303),"embarked"]<-'C'   #Answer of b.3)


# ----c) Creating dummy variables for ‘Pclass’, ‘Sex’ and ‘Embarked’ (One-hot-encoding)---------
# c1) Pclass
df5 = subset(data, select = c("name","pclass"))
for(unique_value in unique(df5$pclass)){
  df5[paste("pclass", unique_value, sep = ".")] <- ifelse(df5$pclass == unique_value, 1, 0)
}
dummy_pclass = df5[,!(names(df5) %in% c("pclass.3"))]  #Answer of c.1)
dummy_pclass


# c2) Sex
df6 = subset(data, select = c("name","sex"))
sexType <- c(female = 0, male = 1, other = 2)
df6$sex_num <- sexType[df6$sex]
for(unique_value in unique(df6$sex)){
  df6[paste("sex_num", unique_value, sep = ".")] <- ifelse(df6$sex == unique_value, 1, 0)
}
dummy_sex<-df6
dummy_sex   #Answer of c.2)


# c3) Embarked
df7<-df4new
for(unique_value in unique(df7$embarked)){
  df7[paste("embarked", unique_value, sep = ".")] <- ifelse(df7$embarked == unique_value, 1, 0)
}
dummy_Embarked = df7[,!(names(df7) %in% c("embarked.Q"))]
dummy_Embarked  #Answer of c.3)


# -----------d) Scaling Age, fare using min-max Normalization.-------------
# d1) Age
df8<-df2new
age_scaling_norm = df8[,!(names(df8) %in% c("Title"))]
maxs<-apply(age_scaling_norm,2, max)
mins<-apply(age_scaling_norm,2, min)
age_scaling_norm<-as.data.frame(scale(age_scaling_norm,center =mins,
                          scale=(maxs-mins)))
age_scaling_norm   #Answer of d.1)


# d2) Fare
df9<-df3new
fare_scaling_norm = df9[,!(names(df9) %in% c("pclass"))]
maxs<-apply(fare_scaling_norm,2, max)
mins<-apply(fare_scaling_norm,2, min)
fare_scaling_norm<-as.data.frame(scale(fare_scaling_norm,center =mins,
                                      scale=(maxs-mins)))
fare_scaling_norm   #Answer of d.2)


#-------------------------------------------------------------








