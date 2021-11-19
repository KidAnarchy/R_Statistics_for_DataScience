#------------------------------------------------------------------------
#                  Multiple Linear Regression (MLR)
#------------------------------------------------------------------------
# Import Library
library(GGally)

#Import Data
mydata = read.csv("RegressionExample_50_Startups.csv",header = T,stringsAsFactors = T)
str(mydata)

#respond var= Profit
#explanatory var 
#x1=R.D.Spend, 
#x2=Administration, 
#x3=Marketing.Spend, 
#x4=State(factor var)

# Changed name of columns
varnames = c("x1","x2","x3","x4","Profit")
colnames(mydata) = varnames
str(mydata)
levels(mydata$x4)

#library(GGally)
ggcorr(mydata, method = c("everything", "pearson")) 
#we want to see high correlation beween x and y
#and low correlation between x's

#linear relationship from the scatter plots 
pairs(mydata[,-4],main="scatterplot matrix")

#From the ggcorr, we see low correlation between x2 an profit
cor(mydata$Profit,mydata$x2)

#Multiple regression model
# ~. 
fit.full=lm(Profit ~.,data=mydata)
summary(fit.mydata)

fit_2 = lm(Profit ~ x1+x3+x4,data=mydata)
summary(fit_2)

fit_3 = lm(Profit ~ x1+x2+x4,data=mydata)
summary(fit_3)

fit_4 = lm(Profit ~ x1+x2+x3,data=mydata)
summary(fit_4)

#which model to be chosen
#say after we've check the assumption of the regression model, one
#can look at the AIC
#the smallest AIC is preferable
AIC(fit.full)
AIC(fit_2)
AIC(fit_3)
AIC(fit_4)

#----------------------------------------------------------