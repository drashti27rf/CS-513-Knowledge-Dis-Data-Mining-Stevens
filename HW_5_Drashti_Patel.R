#  Course    :  CS 513
#  Name  : Drashti patel
#  Assignment : 5 - Dtree

#########################################################################################################

rm(list=ls())
library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle

# loading csv file
cancer<- read.csv("C:/Users/Vineet/Downloads/breast-cancer-wisconsin.data.csv" ,header = TRUE, na.strings='?', colClasses=c("Class"="factor"),) 

# splitting dataset into 30-70
smp_size <- floor(0.70 * nrow(cancer))

train_ind <- sample(seq_len(nrow(cancer)), size = smp_size)

train <- cancer[train_ind, ]
test <- cancer[-train_ind, ]

CART_class<-rpart( Class~.,data=train[,2:11])
rpart.plot(CART_class)

predict<-predict(CART_class,test[,2:11], type="class") 


correct <- test[,11]==predict
rate <- sum(correct)/length(correct)
rate

prp(CART_class)


# much fancier graph
fancyRpartPlot(CART_class)