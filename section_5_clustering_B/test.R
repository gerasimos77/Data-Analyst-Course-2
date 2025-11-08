
data=read.table("C:/Users/varvo/Desktop/DYPA/section_5_clustering_B/investors.csv", 
                sep=",",header=T)

summary(data)


plot(data$account_balance, data$investements)


colnames(data)

table(complete.cases(data))

hist(data$account_balance)
hist(data$investements)

boxplot(data$account_balance)
boxplot(data$investements)

data_clean <- data[data$account_balance < 16,]

table(complete.cases(data_clean))

hist(data_clean$account_balance)
hist(data_clean$investements)
plot(data_clean$account_balance, data_clean$investements)
boxplot(data_clean$account_balance)
boxplot(data_clean$investements)
summary(data_clean)

scaled_data<-scale(data_clean)

# K-means
#---------

sse=c()

for (k in 2:10){
  k_cl=kmeans(scaled_data, k)
  sse[k]<- k_cl$tot.withinss
}

plot(1:10, sse, xlab="Num. of clusters", ylab="SS with Clusters")
lines(1:10, sse)



km<-kmeans(scaled_data, 3)

plot(data_clean$account_balance, data_clean$investements, 
     col = km$cluster,        
     pch = 20,                
     xlab = "Acc. Balance", 
     ylab = "Investments", 
     main = "K-means Clustering Results")


# install.packages("NbClust")
# library(NbClust)
# 
# install.packages("Rtools")
# rs.nb <- NbClust(scaled_data, min.nc=2, max.nc=10, method="complete")


#-----------------------------------

# DBSCAN Clsutering
#------------------------
install.packages("dbscan")
library(dbscan)


model<- dbscan(scaled_data, eps=0.4, minPts = 3)
print(model$cluster)

as.data.frame(table(model$cluster))

plot(data_clean$account_balance, data_clean$investements, 
     col = model$cluster,        
     pch = 19,                
     xlab = "X", 
     ylab = "Y", 
     main = "DBSCAN Clustering Results")
#------------------------------------------

