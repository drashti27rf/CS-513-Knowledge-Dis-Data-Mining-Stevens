#  Course    :  CS 513
#  Name  : Drashti patel
#  Assignment : 6 - RF_C50

#####################################################################################
library('C50')

rm(list=ls())


# loading csv file
cancer<- read.csv("C:/Users/Vineet/Downloads/breast-cancer-wisconsin.data.csv" ,header = TRUE, na.strings='?', colClasses=c("Class"="factor"),) 

# splitting dataset into 30-70
smp_size <- floor(0.70 * nrow(cancer))

train_ind <- sample(seq_len(nrow(cancer)), size = smp_size)

train <- cancer[train_ind, ]
test <- cancer[-train_ind, ]

#applying C50 on training data
C5 <- C5.0(Class~., data=train[,2:11])
C5

#plotting tree
plot(C5)

#predicting values
prediction<-predict( C5 ,test[,2:11] , type="class" )
prediction

wrong<- (test[,11]!=prediction)
rate<-sum(wrong)/length(wrong)
rate