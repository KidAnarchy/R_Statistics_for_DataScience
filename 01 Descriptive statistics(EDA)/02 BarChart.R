#***********************************************
#*Exploring Binary Data and Categorical Data 
#***********************************************  

dfw<-read.csv("dfw_airline.csv")

#************barchart************************
barplot(as.matrix(dfw)/6, cex.axis = .5)

#--------------------------------------------