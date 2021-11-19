#*****************************************************
#         Two categorical variables
#*****************************************************
library(descr)

lc_loans<-read.csv("lc_loans.csv")

xtab<-CrossTable(lc_loans$grade, lc_loans$status,
                 prop.c = FALSE, prop.chisq = FALSE, prop.t = FALSE)
xtab

#-----------------------------------------------------