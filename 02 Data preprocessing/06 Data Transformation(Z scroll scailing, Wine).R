#------------------------------------------------------
#                 Data Transformation
#------------------------------------------------------
#Import data
data<-read.csv("wine.csv",header =T)

#We would like to normalize these two variables using R.

#---------1. Find X' that is Normalization------------
maxs<-apply(data,2, max)
mins<-apply(data,2, min)
data<-as.data.frame(scale(data,center =mins,
                    scale=(maxs-mins)))
#After Run and back to data window




#---------2.Find X' that is Standardization-----------

#Read .CSV file again to re call original wine data
data<-read.csv("wine.csv",header =T)

means <- apply(data,2, mean)
sd <- apply(data,2, sd)
data <- as.data.frame(scale(data,center=means,scale=sd))
#After Run and back to data window


#-----------------------------------------------------