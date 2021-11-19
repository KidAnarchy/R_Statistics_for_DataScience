#**********************************************************
#*                    EDA Part1
#**********************************************************
# Import file
state <- read.csv(file="state.csv")


#***********Estimates of Location**************************
#*
mean(state[["Population"]])
median(state[["Population"]])
mean(state[["Population"]], trim=0.1)
weighted.mean(state[["Murder.Rate"]], w=state[["Population"]])

# install.packages("matrixStats")
library("matrixStats")
weightedMedian(state[["Murder.Rate"]], w=state[["Population"]])


#*******Estimates of variability***************************
#*
sd(state[["Population"]])
IQR(state[["Population"]])
mad(state[["Population"]])


#*************Exploring the Data Distribution**************
#*
#*-------------------Box Plot--------------------------------
quantile(state[["Murder.Rate"]], p=c(.05, .25, .5, .75, .95))

boxplot(state[["Population"]]/1000000, ylab="Population (millions)")


#------------------Frequency Table---------------------------
breaks <- seq(from=min(state[["Population"]]),
              to=max(state[["Population"]]), length=11)
pop_freq <- cut(state[["Population"]], breaks=breaks,
                right=TRUE, include.lowest = TRUE)
table(pop_freq)


#------------------Histogram---------------------------------
hist(state[["Population"]], breaks = breaks)


#----------------Density Plot--------------------------------
hist(state[["Murder.Rate"]], freq=FALSE)
lines(density(state[["Murder.Rate"]]), lwd=3, col="blue")


#------------------------------------------------------------

