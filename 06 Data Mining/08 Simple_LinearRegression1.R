#----------------------------------------------------
#             Simple linear regression
#----------------------------------------------------
# Import Library
library(ggplot2)
library(Hmisc)
library(corrplot)
library(GGally)

# Import Data
dataEx1= read.csv("RegressionExample1.csv",header=T)
colnames(dataEx1)


#Linear relationship
plot(Sales~DemandEstimate,data=dataEx1)
#correlation, the default is pearson correlation
#sample correlation denoted by r
r = cor(dataEx1$DemandEstimate,dataEx1$Sales)
#0.9145906 which is very high showing the strong positive relationship


# To do the hypothesis testing 
cor.test(dataEx1$DemandEstimate,dataEx1$Sales)
# t-test 
# H0: rho = 0
# Ha: rho != 0
# where rho is the coefficient of correlation of the population
# rho  and r are the coefficient of correlation


#Fit the model 
# y~x
fit1 = lm(Sales~DemandEstimate,data=dataEx1)
abline(fit1,col="blue",lwd=2)
summary(fit1)
predict(fit1)
fit1$fitted.values
fit1$residuals


#Forecasting
b0 = fit1$coefficients[1]
b1 = fit1$coefficients[2]
x=300000
yhat=b0+b1*x
yhat


#Transformation
df.Ex1_new = dataEx1
df.Ex1_new$Sales = log(df.Ex1_new$Sales)
fit2 = lm(Sales~DemandEstimate,data=df.Ex1_new)
plot(Sales~DemandEstimate,df.Ex1_new)
abline(fit2,col="red")
summary(fit2)
predict(fit2)

#compare fi1 and fit2! what do you think?


#Model checking
r_sq = summary(fit1)$r.squared
r_sq

#errors/residuals
#Model checking
resd = summary(fit1)$res
resd
hist(resd)
qqnorm(resd, pch = 19, frame = FALSE)
qqline(resd, col = "blue", lwd = 2)


#graphical using ggplot2
#library(ggplot2)
ggplot(dataEx1,aes(y=DemandEstimate,x=Sales))+geom_point()+
  geom_smooth(method="lm",col="red")


#Other options for checking correlation
df1 = read.csv("kc_house_data_edited.csv",header=T)
df1.cor = cor(df1, method = c("spearman"))
#install.packages("Hmisc")
#library("Hmisc")
data.rcorr = rcorr(as.matrix(df1.cor))
data.rcorr

#install.packages("corrplot")
#library(corrplot)
corrplot(df1.cor)

#install.packages("GGally")
#library(GGally)
str(df1)
ggcorr(df1, method = c("everything", "pearson")) 
pairs(df1[,c(1,4,5)],main="scatterplot matrix")

#-----------------------------------------------
