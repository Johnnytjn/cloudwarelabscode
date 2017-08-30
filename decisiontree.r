# ����party������
library(party)
# ����iris���ݼ�
data(iris)
# ���ɲ�������
set.seed(1234)
ind <- sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3))
# ����ѵ�����ݼ�iris.learn�Ͳ������ݼ�iris.valid
testData <- iris[ind==2,]
trainData <- iris[ind==1,]
# ����ctree()����
myFormular <- Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width
iris_ctree <- ctree(myFormular,data=trainData)
# �鿴ѵ�����ݼ��ϵ���Ͻ��
table(predict(iris.ctree,trainData$Species))

# �������ɵľ�����,��ͼ3-2-1
plot(iris_ctree��type=��simple��)
# �鿴�������ݼ��ϵ�Ԥ����
testPred <- predict(iris_ctree,newdata=testData)
table(testPred,testData$Species)
            

