#Model checking

# 1. Import data
mydata = read.csv("RegressionExample_50_Startups.csv",header = T,stringsAsFactors = T)
# 2. Rename columns
varnames = c("x1","x2","x3","x4","Profit")
colnames(mydata) = varnames

# 3.Training model
fit =lm(Profit ~.,data=mydata)
# 4.Evaluate Model
summary(fit)

# 5.Model checking
par(mfrow = c(2, 2))
plot(fit)

# Visulization
#install.packages("ggResidpanel")
library(ggResidpanel)
resid_panel(fit)
resid_xpanel(fit)

#install.packages("ggfortify")
library(ggfortify)
fit.f <- fortify(fit)
ggplot(fit.f, aes(x = .fitted, y = .resid)) + geom_point()
