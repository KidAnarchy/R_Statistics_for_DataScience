#*************************************************
#*           Assignment 1 EDA
#*************************************************           

#install.packages("moderndive")
#install.packages("skimr")
#install.packages("ggplot2")


# Import Library
library(moderndive)
library(skimr)
library(ggplot2)

# Import Data
house_data <- read.csv(file="kc_house_data.csv")

#-----------Min-Max-----------------------
min(house_data[["price"]])
max(house_data[["price"]])
#------------Table----------------------------
breaks <- seq(from=min(house_data[["price"]]),
              to=max(house_data[["price"]]), length=45)
pop_freq <- cut(house_data[["price"]], breaks=breaks,
                right=TRUE, include.lowest = TRUE)
table(pop_freq)


#-----------Min-Max----------------------------
min(house_data[["sqft_living"]])
max(house_data[["sqft_living"]])
#-------------Table----------------------------
breaks <- seq(from=min(house_data[["sqft_living"]]),
              to=max(house_data[["sqft_living"]]), length=45)
pop_freq <- cut(house_data[["sqft_living"]], breaks=breaks,
                right=TRUE, include.lowest = TRUE)
table(pop_freq)


#----------------Histogram----------------------
breaks <- seq(from=1,to=9000000, by=200000) 
hist(house_data[["price"]], xlab="price (USD)",main="House price", breaks = breaks)

breaks <- seq(from=1,to=15000, by=1000) 
hist(house_data[["sqft_living"]], xlab="living space (square feet)",main="House size", breaks = breaks)

#----------------Bar Chart---------------------
ggplot(house_prices, aes(x = condition)) +
  geom_bar() + 
  labs(x = "condition", title = "House condition")

#---------------Describe-----------------------
summary(house_data[["price"]])

#----------------IQR---------------------------
IQR(house_data[["price"]])


#--------fit the normaldistribution, we use log10()--------
log10_price = log10(house_data[["price"]])
log10_size= log10(house_data[["sqft_living"]])


#--------Scatter plot---------------------------
plot(log10_price, log10_size, xlab="price", ylab="size")

#--------Correlation Value--------------------
cor(log10_price,log10_size )

#----------------------------------------------


