# 加载kknn函数包
library(kknn)
# 导入iris数据集
data(iris)
# 生成采样数据
m <- dim(iris)[1]
val <- sample(1:m, size = round(m/3), replace = FALSE, prob = rep(1/m, m)) 
# 生成训练数据集iris.learn和测试数据集iris.valid
iris.learn <- iris[-val,]
iris.valid <- iris[val,]
# 调用kknn()函数
iris.kknn <- kknn(Species~., iris.learn, iris.valid, distance = 1,
	kernel = "triangular")
# 查看结果
summary(iris.kknn)
# 使用交叉验证法查看测试数据集分类情况
fit <- fitted(iris.kknn)
table(iris.valid$Species, fit)
fit
             setosa versicolor virginica
setosa         14          0         0
versicolor      0         15         1
virginica       0          2        18
# 绘制测试数据集的散点矩阵图，其中错误分类样本用红色标注，如图3-1-1所示
pcol <- as.character(as.numeric(iris.valid$Species))
pairs(iris.valid[1:4], pch = pcol, col = c("green3", "red")
	[(iris.valid$Species != fit)+1])
