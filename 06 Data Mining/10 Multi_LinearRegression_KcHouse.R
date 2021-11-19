#========================================================
#             Multi Linear Regression
#========================================================
# 1. Import data
df.house = read.csv("kc_house_data_edited.csv",header=T,stringsAsFactors = T)
str(df.house)  # Structure of data


# 2. Train and test set  split
n = nrow(df.house)
n.train = round(0.8*n,digits=0)
n.test = n - n.train

# Change column name of easy
colnames(df.house) = c("price","x1","x2","x3","x4","x5","x6","x7","x8")

df.house.train = df.house[1:n.train,]
df.house.test = df.house[(n.train+1):n,]


# 3. Train model
model = lm(price ~ x1+x2+x3+x4+x5+x6+x7+x8, data = df.house.train)
summary(model)


# Create vector 1
ones=rep(1,times=n.test)
# Create X matrix
x.mat = as.matrix(cbind(ones,df.house.test[,-1]),nrow=n.test,ncol=9)
dim(x.mat)  # dimention of variable X


coef = as.matrix(model$coefficients) #transpose to be the vector b
dim(coef)
fitted.test = x.mat%*%coef
fitted.test

# fitted value from the training set
model$fitted.values


#===========================================
# Variable selection
#===========================================
null_mod =lm(price~1, data=df.house)
full_mod =lm(price ~., data=df.house)

#Forward
mod_forw = step(null_mod,scope=list(lower=null_mod,upper=full_mod),direction="forward")
summary(mod_forw)

#Backward
mod_back = step(full_mod,data=df.house,direction="backward")
summary(mod_back)

#Stepwise
mod_step = step(full_mod, direction="both", data=df.house)
summary(mod_step)


#======Additional Method in Variable selection=======#

#install.packages("MASS")
library(MASS)
step.model =  stepAIC(full_mod, direction = "backward", 
                      trace = FALSE)

summary(step.model)


#===========================================
#Factor variable, Dummy variable
#===========================================
df.heart = read.csv("heartData_edited.csv",header=T,stringsAsFactors = T)
df0 = df.heart
str(df0)

fit0 = lm(oldpeak~., data=df0)
summary(fit0)

#Change structure of data
df0$cp = factor(df0$cp)
str(df0)

#Fit the model with dummy variable
fit0 = lm(oldpeak ~., data=df0)
summary(fit0)


# Change dummy manually
#sex 0,1
df1 = df0
df1$sex = ifelse(df1$sex=="M",1,0)
str(df1)
df1$sex = factor(df1$sex)
df1$slope=factor(df1$slope)
fit1 = lm(oldpeak ~. ,data=df1)
summary(fit1)


#Other options
#install.packages('fastDummies')
library(fastDummies)

df2=df.heart
df2$sex = factor(df2$sex)
df2$cp = factor(df2$cp)
df2$slope=factor(df2$slope)
mod = lm(oldpeak~.,data=df2)
summary(mod)


df.dum = dummy_cols(df.heart, select_columns = c('sex','cp','slope'))
View(df.dum)

# fit.dum1 gives the same results as mod 
fit.dum1 = lm(oldpeak~age+sex_M+cp_1+cp_2+cp_3+trestbps+chol+thalach+
                slope_1+slope_2,data = df.dum)
summary(fit.dum1)



# fit.dum2 gives you the model where cp_0 and cp_3 combined and it used
# as the base variable
fit.dum2 = lm(oldpeak~age+sex_M + cp_1 + cp_2 + trestbps+chol+thalach+
                slope_1+slope_2,data = df.dum)
summary(fit.dum2)

#-----------------------------------------------------------------