

library(e1071)

data(iris)

library(lattice)
xyplot(Petal.Length ~ Petal.Width, data = iris, groups = Species,  auto.key=list(corner=c(1,0)))

svm_model <- svm(Species~Petal.Length+Petal.Width,data=iris)
plot(svm_model,iris,Petal.Length~Petal.Width)
