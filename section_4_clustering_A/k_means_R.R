?iris

data=iris[,1:4]
all_data = iris
summary(all_data$Species)

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
k_cl=kmeans(pmatrix, 3)

table(all_data$Species, k_cl$cluster)


install.packages("NbClust")
library(NbClust)

res.nb <-NbClust(pmatrix, min.nc=2, max.nc=10, method="complete")
