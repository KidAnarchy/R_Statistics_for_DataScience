#example pima diabete
pima <- read.csv(file="diabetes.csv")

model_pima <- glm(X9 ~ ., family = "binomial", data=pima)
model_pima

summary(model_pima)

test_data <- read.csv(file="testdata_default.csv")

dim(test_data)

predict <- predict(model_pima, test_data, type ="response")

ans.pred = rep("0", dim(test_data)[1])
ans.pred[predict > .5] = "1"

confusionMatrix(as.factor(test_data[,9]), as.factor(ans.pred))

as.factor(test_data[,9])
as.factor(ans.pred)
