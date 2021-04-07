set.seed(123) # Set random number generation

m <- lm(mpg ~ hp + cyl + drat, mtcars)

l <- list(a = list(m = matrix(1:12, ncol = 3),
                   v = 1:7),
          b = data.frame(student = 1:15,
                         score = rnorm(15, 100, 10)))
l
names(m)

tol <- m[["qr"]]["tol"]
tol

str(m)
    