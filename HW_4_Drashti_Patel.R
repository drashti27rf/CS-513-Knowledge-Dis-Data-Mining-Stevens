#  Course    :  CS 513
#  Name  : Drashti patel
#  Assignment : 4 - NB

#########################################################################################################

rm(list=ls())
library(e1071)

# loading csv file
cancer<- read.csv("C:/Users/Vineet/Downloads/breast-cancer-wisconsin.data.csv" ,header = TRUE, na.strings='?', colClasses=c("Class"="factor"),) 

#removing missing values
cancer<-na.omit(cancer)

# splitting dataset into 30-70
smp_size <- floor(0.70 * nrow(cancer))

train_ind <- sample(seq_len(nrow(cancer)), size = smp_size)
train <- cancer[train_ind, ]
test <- cancer[-train_ind, ]

#Applying Naive Bayes 
Naive_Bayes_Model=naiveBayes(Class ~., data=train[,2:11])
Naive_Bayes_Model

#predictting accuracy
NB_Predictions=predict(Naive_Bayes_Model,test[,2:11])

correct <- test[,11] == NB_Predictions
rate <- sum(correct)/length(correct)
rate

#Confusion Matrix
table(NB_Predictions,test[,2:11]$Class)
