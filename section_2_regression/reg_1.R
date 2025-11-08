
# Replicate the same sample in every run
set.seed(1)


# Sample 5 random numbers from 1 to 10 ()
x = sample(1:10, 5, replace=TRUE)
x


# sample error terms
e=rnorm(5) 
e


# create y
y=2*x+1+e
y


plot(x, y, xlim=c(-0.5, 10.5), ylim=c(-0.5,25))
abline(1,2)

# regression Y=a0 + a1 X
model = lm(y ~ x) 
summary(model)


p = predict(model, as.data.frame(x))
rbind(y,p)
