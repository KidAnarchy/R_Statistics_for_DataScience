#----------------------------------------------------------
#                  Create dummy
#----------------------------------------------------------
# Import data
titanic_original <- read.csv("D:titanic.csv", header = TRUE)
df<-read.csv("D:titanic.csv",na.strings=c("","na"))

#Creating dummy variables for ‘Pclass’, ‘Sex’ and ‘Embarked’ (One-hot-encoding)
Pclass_1HE = subset(df, select = c("name","pclass"))
Sex_1HE = subset(df, select = c("name","sex"))
Embarked_1HE = subset(df, select = c("name","embarked"))

#------------Pclass---------------------------
for(unique_value in unique(Pclass_1HE$pclass)){
  Pclass_1HE[paste("pclass", unique_value, sep = ".")] <- ifelse(Pclass_1HE$pclass == unique_value, 1, 0)
}
Pclass_1HE

#-----------Sex-------------------------------
for(unique_value in unique(Sex_1HE$sex)){
  Sex_1HE[paste("sex", unique_value, sep = ".")] <- ifelse(Sex_1HE$sex == unique_value, 1, 0)
}
Sex_1HE

#---------Embarked---------------------------
for(unique_value in unique(Embarked_1HE$embarked)){
  Embarked_1HE[paste("embarked", unique_value, sep = ".")] <- ifelse(Embarked_1HE$embarked == unique_value, 1, 0)
}
Embarked_1HE

#--------------------------------------------