
#--- K means Clustering -------
data=read.table("C:/Users/varvo/Desktop/DYPA/section_5_clustering_B/wine.data", sep=",", header=F)



colnames(data)

colnames(data)=c(
  "class", "Alcohol", "Malic acid", "Ash", "Alcalinity of ash", "Magnesium", "Total Phenols", "Flavanoids",
  "Nonflavanoid phenols", "Proanhocyanins", "Color intensity",
  "Hue", "OD280/OD315 of diluted wines", "Proline"
)

colnames(data)

str(data)


# inspect for missing values in data
table(complete.cases(data)) # no missing data

pmatrix=scale(data[,-1])


d=dist(pmatrix)


# ELbow Method
sse=c()

for (k in 2:10){
  k_cl=kmeans(pmatrix, k)
  sse[k]<- k_cl$tot.withinss
}


plot(1:10, sse, xlab="Num. of clusters", ylab="SS with Clusters")
lines(1:10, sse)

as.data.frame(table(data$class))

# Build model
k_cl = kmeans(pmatrix,3)
table(data$class, k_cl$cluster)
#---------------------------------------


# Find optimal k hyperparameter

# until now -> Elbow method
# Now we will try NbClust libray


install.packages("NbClust")
library(NbClust)

install.packages("Rtools")
rs.nb <- NbClust(pmatrix, min.nc=2, max.nc=10, method="complete")
