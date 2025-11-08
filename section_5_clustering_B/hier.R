

data=read.table("C:/Users/varvo/Desktop/DYPA/section_5_clustering_B/wine.data", sep=",", header=F)

as.data.frame(table(data$V1))


colnames(data)

colnames(data)=c(
  "class", "Alcohol", "Malic_acid", "Ash", "Alcalinity_of_ash", "Magnesium", "Total Phenols", "Flavanoids",
  "Nonflavanoid phenols", "Proanhocyanins", "Color_intensity",
  "Hue", "OD280/OD315_of_diluted wines", "Proline"
)

str(data)


# inspect for missing values in data
table(complete.cases(data)) # no missing data


pmatrix=scale(data[,-1])


d=dist(pmatrix)


c=hclust(d, method="ward.D2")
plot(c)


rect.hclust(c, k=3)
rect.hclust(c, k=3)

groups <-cutree(c, k=3)


table(data$class, groups)


plot(data$Alcohol, data$Alcalinity_of_ash)
plot(data$Malic_acid, data$Ash)

# DBSCAN Clsutering


