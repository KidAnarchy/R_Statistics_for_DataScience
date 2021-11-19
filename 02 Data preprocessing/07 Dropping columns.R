titanic<-read.csv("titanic.csv",header = T)

titanic1 = subset(titanic, select = c("survived","pclass","sex","age",
                                      "sibsp","parch","fare","embarked"))
titanic1

