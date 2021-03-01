#  Course    :  CS 513
#  Name  : Drashti patel
#  Assignment : 3 - KNN

#########################################################################################################

rm(list=ls())
library(class)

# loading csv file
cancer<- read.csv("breast-cancer-wisconsin.data.csv" ,header = TRUE, na.strings='?', colClasses=c("Class"="factor"),) 

#removing missing values
cancer<-na.omit(cancer)

# splitting dataset into 30-70
smp_size <- floor(0.70 * nrow(cancer))

train_ind <- sample(seq_len(nrow(cancer)), size = smp_size)

train <- cancer[train_ind, ]
test <- cancer[-train_ind, ]

#k=3
predict<-knn(train[,2:10],test[,2:10],train[,11], k=3)

correct <- test[,11]==predict
rate <- sum(correct)/length(correct)
rate

#k=5
predict<-knn(train[,2:10],test[,2:10],train[,11], k=5)

correct <- test[,11]==predict
rate <- sum(correct)/length(correct)
rate

#k=10
predict<-knn(train[,2:10],test[,2:10],train[,11], k=10)

correct <- test[,11]==predict
rate <- sum(correct)/length(correct)
rate
