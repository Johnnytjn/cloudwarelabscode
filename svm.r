
# 加载e1071函数包
library(e1071)
# 导入iris数据集
data(iris)
# 首先通过散点图观察数据集的大致分布情况，如图3-所示
library(lattice)
xyplot(Petal.Length ~ Petal.Width, data = iris, groups = Species,  auto.key=list(corner=c(1,0)))
# 调用svm函数并观察分类后的超平面
svm_model <- svm(Species~Petal.Length+Petal.Width,data=iris)
plot(svm_model,iris,Petal.Length~Petal.Width)
