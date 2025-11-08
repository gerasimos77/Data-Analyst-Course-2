?iris
raw_data <- iris
data=iris[,1:4]
all_data = iris

summary(all_data$Species)

# scale data
pmatrix=scale(data)


# calculate distance
d=dist(pmatrix)


#clustering
c = hclust(d, method="ward.D2")


plot(c)

rect.hclust(c, k=3)


groups<- cutree(c, k=3)


table(all_data$Species, groups)
