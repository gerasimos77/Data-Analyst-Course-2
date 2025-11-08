# Automatically set working directory to current R script location
if (requireNamespace("rstudioapi", quietly = TRUE)) {
  setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
  message("Working directory set to: ", getwd())
} else {
  stop("Please install 'rstudioapi' package to auto-detect script location.")
}

set.seed(1)


# Εισαγωγή Δεδομένων
#--------------------

?mtcars

data<-mtcars

install.packages("rattle")
install.packages("rpart")

library(rpart)
library(rattle)
library(rpart.plot)

#-----------------


# Model Training
#---------------
tree_model <-rpart(mpg~., data=mtcars,method="anova")
summary(tree_model)
#---------------


plot(tree_model)
text(tree_model)


fancyRpartPlot(tree_model)




res<- predict(tree_model, mtcars[,2:11])
predictions <- cbind(mtcars[,1], res)
