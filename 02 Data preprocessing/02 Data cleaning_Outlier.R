#---------------------------------------------------------
#                  Finding Outlier
#--------------------------------------------------------
#Ex. Examine outlier using

#Outlier
x<- c(1:20, 30, 40)
boxplot.stats(x) 
boxplot.stats(x)$out  #Show outlier value        

#---------------Outlier Removal------------------------
#Ex. Remove outlier using result from boxplot.stats ( out in R)
new_x<-x[-which(x%in%boxplot.stats(x)$out)]      # -which
new_x

#--------------Outlier Editing------------------------
#Ex. Edit outlier using an average of x in R
x[which(x%in%boxplot.stats(x)$out)]<- mean(x)
x                  

#Ex. Edit outlier using a median of x in R
x[which(x%in%boxplot.stats(x)$out)]<- median(x)
x                      
                  
#-----------------------------------------------------                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  