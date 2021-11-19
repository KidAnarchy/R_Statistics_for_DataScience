#===========================================
#Factor variable, Dummy variable
#===========================================

# 1.Import data
df.heart = read.csv("heartData_edited.csv",header=T,stringsAsFactors = T)
df0 = df.heart
str(df0)   # Check construction of data

# 2.Train model V.1
fit0 = lm(oldpeak~., data=df0) # Automaticly to read factor in Sex column.
summary(fit0)

# 3.1 Try data transformation
# In feature of CP: Change structure of data
df0$cp = factor(df0$cp)
str(df0)

# Train model V.2
#Fit the model with dummy variable
fit0 = lm(oldpeak ~., data=df0)
summary(fit0)


# 3.2 Try data transformation
# Change dummy manually
#sex 0,1
df1 = df0
df1$sex = ifelse(df1$sex=="M",1,0)
str(df1)

df1$sex = factor(df1$sex)
df1$slope=factor(df1$slope)

# Train model V.3
fit1 = lm(oldpeak ~. ,data=df1)
summary(fit1)


# Summary you can do only this
df2=df.heart  #copy data

df2$sex = factor(df2$sex)
df2$cp = factor(df2$cp)
df2$slope=factor(df2$slope)

mod = lm(oldpeak~.,data=df2)
summary(mod)


#======Other options=======
#install.packages('fastDummies')
library(fastDummies)


df.dum = dummy_cols(df.heart, select_columns = c('sex','cp','slope'))
View(df.dum)

#fit.dum1 gives the same results as mod 
fit.dum1 = lm(oldpeak~age+sex_M+cp_1+cp_2+cp_3+trestbps+chol+thalach+
                slope_1+slope_2,data = df.dum)
summary(fit.dum1)



#fit.dum2 gives you the model where cp_0 and cp_3 combined and it used
# as the base variable
fit.dum2 = lm(oldpeak~age+sex_M + cp_1 + cp_2 + trestbps+chol+thalach+
                slope_1+slope_2,data = df.dum)
summary(fit.dum2)

















#===========================================
# Variable selection
#===========================================
null_mod =lm(oldpeak~1, data=df.dum)
full_mod =lm(oldpeak ~., data=df.dum)


#======Additional Method in Variable selection=======#

#install.packages("MASS")
library(MASS)
step.model =  stepAIC(full_mod, direction = "both", 
                      trace = FALSE)

summary(step.model)
