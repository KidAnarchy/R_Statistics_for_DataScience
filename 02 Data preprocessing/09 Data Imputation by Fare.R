#---------------------------------------------
#          Imputation Fare value
#---------------------------------------------
# Import Library
library("tidyverse")
library("dplyr")

# Import data
data<-read.csv("D:titanic.csv",header = T)


# Subset column
Pclass_fare = subset(data, select = c("pclass","fare"))

# Separate group
by_class <- Pclass_fare %>% group_by(pclass)
by_class

# Imputation
by_class %>% summarise(fare = median(fare,na.rm = TRUE))

#-----------------------------------------