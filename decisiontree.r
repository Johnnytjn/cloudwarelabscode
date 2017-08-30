# 加载party函数包
library(party)
# 导入iris数据集
data(iris)
# 生成采样数据
set.seed(1234)
ind <- sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3))
# 生成训练数据集iris.learn和测试数据集iris.valid
testData <- iris[ind==2,]
trainData <- iris[ind==1,]
# 调用ctree()函数
myFormular <- Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width
iris_ctree <- ctree(myFormular,data=trainData)
# 查看训练数据集上的拟合结果
table(predict(iris.ctree,trainData$Species))

# 绘制生成的决策树,如图3-2-1
plot(iris_ctree，type=”simple”)
# 查看测试数据集上的预测结果
testPred <- predict(iris_ctree,newdata=testData)
table(testPred,testData$Species)
            

