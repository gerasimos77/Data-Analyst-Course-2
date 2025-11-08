?iris

data=iris[,1:4]
all_data = iris
summary(all_data$Species)

# scale data
pmatrix=scale(data)


# calculate distance
d=dist(pmatrix)


# DBSCAN Clsutering
install.packages("dbscan")
library(dbscan)


model<- dbscan(pmatrix, eps=0.5, minPts = 5)
print(model$cluster)

plot(data$Sepal.Length, data$Petal.Width)
plot(data$Sepal.Width, data$Sepal.Length)



table(all_data$Species, model$cluster)
