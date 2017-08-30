
# ����e1071������
library(e1071)
# ����iris���ݼ�
data(iris)
# ����ͨ��ɢ��ͼ�۲����ݼ��Ĵ��·ֲ��������ͼ3-��ʾ
library(lattice)
xyplot(Petal.Length ~ Petal.Width, data = iris, groups = Species,  auto.key=list(corner=c(1,0)))
# ����svm�������۲�����ĳ�ƽ��
svm_model <- svm(Species~Petal.Length+Petal.Width,data=iris)
plot(svm_model,iris,Petal.Length~Petal.Width)
