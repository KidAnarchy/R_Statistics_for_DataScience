#------------------------------------------------------------
#                 Data inconsistency
#------------------------------------------------------------
library("deducorrect")

#Imputation for quantitative variable using deduImpute
dat<-data.frame(staff = c(100,100,100),
                housing = c(NA,50,NA),
                cleaning = c (NA,NA,NA),
                total = c (100,180,NA))

## staff housing cleaning total
## 1 100 NA NA 100
## 2 100 50 NA 180
## 3 100 NA NA NA


E<-editmatrix(expression(staff+cleaning+housing==total,staff>= 0,housing>=0,
cleaning>=0))
cor<-deduImpute(E,dat)
cor$corrected
## staff housing cleaning total
## 1 100 0 0 100
## 2 100 50 30 180
## 3 100 NA NA NA

#------------------------------------------------------------