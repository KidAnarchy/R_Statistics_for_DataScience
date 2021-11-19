#***********************************************
#*         Correlation Matrix
#**********************************************         
library(corrplot)

sp500_px<-read.csv(file = "sp500_data.csv")
sp500_sym<-read.csv(file = "sp500_sectors.csv")

etfs<-sp500_px[row.names(sp500_px)>"2012-07-01",
               sp500_sym[sp500_sym$sector=="etf",'symbol']]

corrplot(cor(etfs), method ='ellipse')

#------------------------------------------------