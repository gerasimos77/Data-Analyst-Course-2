

# Import Data
install.packages("readxl")
library(readxl)

data <- read_excel(file.choose())

summary(data)

data_no_label <- data[,-1]


# Inspect
plot(data_no_label$MinutesPlayed, data_no_label$PassAccuracy)


# scale data
pmatrix=scale(data)


# calculate distance
d=dist(pmatrix)


totwinss=c()

for (k in 2:10){
  k_cl=kmeans(pmatrix, k)
  totwinss[k]<-k_cl$tot.withinss
}


plot(1:10, totwinss, xlab="Number of Clusters", ylab="Total within SS")
lines(1:10, totwinss)


# Elbow Method (balance between coherence and genralization)
k_cl=kmeans(pmatrix, 4)
k_cl$cluster

# DBSCAN Clsutering
install.packages("dbscan")
library(dbscan)


model<- dbscan(pmatrix, eps=0.5, minPts = 5)
print(model$cluster)


