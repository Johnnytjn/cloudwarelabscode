
library(kknn)

data(iris)

m <- dim(iris)[1]
val <- sample(1:m, size = round(m/3), replace = FALSE, prob = rep(1/m, m)) 

iris.learn <- iris[-val,]
iris.valid <- iris[val,]

iris.kknn <- kknn(Species~., iris.learn, iris.valid, distance = 1,
	kernel = "triangular")

summary(iris.kknn)

fit <- fitted(iris.kknn)
table(iris.valid$Species, fit)
fit
             setosa versicolor virginica
setosa         14          0         0
versicolor      0         15         1
virginica       0          2        18

pcol <- as.character(as.numeric(iris.valid$Species))
pairs(iris.valid[1:4], pch = pcol, col = c("green3", "red")
	[(iris.valid$Species != fit)+1])
