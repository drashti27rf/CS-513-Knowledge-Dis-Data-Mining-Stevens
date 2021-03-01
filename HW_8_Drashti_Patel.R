#  Course    :  CS 513
#  Name  : Drashti patel
#  Assignment : 8 Cluster

########################################################################################


rm(list=ls())
library(cluster)
library(fpc)



#read csv file
cancer<- read.csv("C:/Users/Vineet/Downloads/wisc_bc_ContinuousVar.csv" ,header = TRUE, na.strings='?', colClasses=c("diagnosis"="factor"),)

#remove missing value 
summary(cancer)
cancer<-na.omit(cancer)
cancer <- cancer[-1] 
cancer_pred <- cancer[1]
cancer<-data.frame(lapply(cancer[,-1],as.numeric)) #Convert dataset in numeric

hclust_dist <- dist(cancer)
hclust<-hclust(hclust_dist)
hclust_2_part<-cutree(hclust,2)
plot(hclust_2_part)
length(cancer_pred)
table(Hclust=hclust_2_part,Actual=t(cancer_pred))

#kmeans
kmeans_2<- kmeans(cancer[,-1],2,nstart = 10)
kmeans_pred <- kmeans_2$cluster
table(kmeans_pred,t(cancer_pred))