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
df <-read.csv('50_companies.csv')

print(head(df, 5))


#-----------------


# Εξέταση Δεδομένων
#------------------
summary(df)


library(plotly)

plot_ly(x = ~df$Profit, type = 'histogram')

plot_ly(df, x = ~df$R.D.Spend, y = ~df$Profit, type = 'scatter', mode = 'markers')

plot_ly(df, x = ~df$Administration, y = ~df$Profit, type = 'scatter', mode = 'markers')

plot_ly(df, x = ~df$Marketing.Spend, y = ~df$Profit, type = 'scatter', mode = 'markers')
#-------------------------------------


# Model Training
#----------------


model_1 = lm(Profit ~ R.D.Spend + Administration + Marketing.Spend, data=df)
model_2 = lm(Profit ~ R.D.Spend + Marketing.Spend, data=df)
model_3 = lm(Profit ~ Marketing.Spend, data=df)


summary(model_1)
summary(model_2)
summary(model_3)
#-------------------


# Predictions
#------------

new_data <- data.frame(
  R.D.Spend=170100,
  Administration=136000,
  Marketing.Spend=470000
)

p=predict(model_1, new_data)
p


plot(df$R.D.Spend, df$Profit,
     main = "Παλινδρόμηση Κέρδους ως προς R&D Spending",
     xlab = "R&D Spending ($)",
     ylab = "Profit ($)",
     pch = 19,
     col = "steelblue")

# Προσθήκη γραμμής παλινδρόμησης
abline(model_1, col = "red", lwd = 2)
