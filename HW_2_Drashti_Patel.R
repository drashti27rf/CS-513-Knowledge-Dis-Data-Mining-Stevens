#  Course    :  CS 513
#  Name  : Drashti patel
#  Assignment : 2 - EDA

###########################################################################################
#Q1 

rm(list=ls())

cancer <- read.csv("breast-cancer-wisconsin.data.csv" ,header = TRUE, na.strings='?') 


#Q1.1
summary(cancer)

#Q1.2 

missing<-cancer[is.na(cancer$F6),]
missing

#Q1.3 
cancer[] <- lapply(cancer, function(x) { 
  x[is.na(x)] <- mean(x, na.rm = TRUE)
  x
})
cancer

#Q1.4
table(cancer$Class , cancer$F6)

#Q1.5
pairs(cancer[c(2:5,11)], bg = factor(cancer$Class))

#Q1.6
boxplot(cancer[8:10])

hist(cancer$F7)
hist(cancer$F8)
hist(cancer$F9)

############################################################################################
#Q2

rm(list=ls())

cancer <- read.csv("C://Users/shali/OneDrive/Desktop/1st Sem/CS-513 KDD/breast-cancer-wisconsin.data.csv" ,header = TRUE, na.strings='?') 

cancer <- na.omit(cancer)
