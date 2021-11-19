#-----------------------------------------
#              Transformation
#-----------------------------------------
# Import Library
data<-read.csv("titanic.csv")

maxs<-apply(data,2, max)
mins<-apply(data,2, min)
data<-as.data.frame(scale(data,center =mins,
                          scale=(maxs-mins)))
data

#----------------------------------------