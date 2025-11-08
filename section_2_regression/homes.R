

df <- data.frame(
  Home = c("Home 1", "Home 2", "Home 3", "Home 4", "Home 5", "Home 6", "Home 7", "Home 8"),
  Age = c(25, 5, 4, 52, 54, 17, 33, 12),
  Bedrooms = c(2,4,4,2, 2, 3, 2, 2),
  price = c(130000, 200000, 220000, 80000, 77000, 160000, 133000, 140000)
)

df


plot(df$Age, df$price, ylim=c(65000, 250000))




# regression Y=a0 + a1 X
model_1 = lm(df$price~df$Bedrooms)
summary(model_1)

# regression Y=a0 + a1 X
model_2 = lm(df$price~df$Age)
summary(model_2)

# regression Y=a0 + a1 X + a2 X
model_3 = lm(df$price~df$Bedrooms + df$Age)
summary(model_3)


plot(df$Age, df$price)
abline(a = 203566.3, b = -2418.5, col = "red")
