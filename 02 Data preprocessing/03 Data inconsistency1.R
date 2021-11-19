#---------------------------------------------------------
#               Data inconsistency 1
#---------------------------------------------------------
# Import Library
#install.packages ("stringdist")
library (stringdist)
library(deducorrect)

# Import data
person <-read.table ("person.txt",header=TRUE,stringsAsFactor =FALSE)

# Step
codes<-c("Male", "Female")     
# this yields the closest match of 'gender' in 'codes' (within a distance of 3)

(i<-amatch(person$gender,codes,maxDist =3))
## [1] 2 1 1 2 2
# store results in a data.frame

data.frame(rawtext = person$gender,code =codes[i])

#install.packages("deducorrect")
#library(deducorrect)
#---------------------------Method 1-------------------------------------
#Imputation qualitative variable using deduImpute () in package deducorrect
dat<-data.frame(age = NA,driverslicense = TRUE)
dat
## age  driverslicense
## 1 NA TRUE

#-------------------------Method 2---------------------------------------
E<-editarray(expression(age%in%c("adult","under-aged"),
driverslicense%in%c(TRUE,FALSE),if(age=="under-aged")!driverslicense))
dat
## age driverslicense
## 1 NA TRUE


cor<-deduImpute(E,dat)
cor$corrected
## age driverslicense
## 1 adult TRUE


#-----------------------------------------------------------------------









