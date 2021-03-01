#  Course    :  CS 513
#  Name  : Drashti patel
#  Assignment : 7 ANN

######################################################################################################

library("neuralnet")
rm(list=ls())

#read csv file
cancer<- read.csv("C:/Users/Vineet/Downloads/wisc_bc_ContinuousVar.csv" ,header = TRUE, na.strings='?', colClasses=c("diagnosis"="factor"),) 
cancer <- data.frame(lapply(na.omit(cancer), as.numeric))

index<-seq(1, nrow(cancer), by=5)
test <- cancer[index,]
train <- cancer[-index,]

ann <- neuralnet(diagnosis~., data = train[-1], hidden=5, threshold=0.01)

plot(ann)

#Test the resulting output
results<-compute(ann, test)
final_result <- ifelse(results$net.result <1.5,1,2)

wrong<- (test$diagnosis!=final_result)
rate<-sum(wrong)/length(wrong)
rate
