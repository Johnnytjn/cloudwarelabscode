
library(party)

data(iris)

set.seed(1234)
ind <- sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3))

testData <- iris[ind==2,]
trainData <- iris[ind==1,]

myFormular <- Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width
iris_ctree <- ctree(myFormular,data=trainData)

table(predict(iris.ctree,trainData$Species))


plot(iris_ctree£¬type=¡±simple¡±)

testPred <- predict(iris_ctree,newdata=testData)
table(testPred,testData$Species)
            

