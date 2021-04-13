set.seed(123) # Set random number generation
needs(tidyverse)
m <- lm(mpg ~ hp + cyl + drat, mtcars)

l <- list(a = list(m = matrix(1:12, ncol = 3),
                   v = 1:7),
          b = data.frame(student = 1:15,
                         score = rnorm(15, 100, 10)))
l
names(m)

# 1 
##xtract the qr tolerance (tol).
tol <- m[["qr"]]["tol"]
tol

## Extract the term labels from the model.
str(m)
term_labels <- attr(m[["terms"]], "term.labels")
term_labels

# 2
## Use at least two different methods to extract m.
l
str(l)
m1 <- l$a$m
m1
m2 <- l[[1]][1]
m2
## Extract the third column of m. Maintain the dimensions (matrix structure).
l$a$m[, 3]
## Extract the score for student 7.
l$b[7, "score"]
airquality
# Use the “airquality” dataset, which is part of base R. Split it by Month
by_month <- split(airquality, airquality$Month)
by_month
# Use a for loop to calculate the mean Ozone by month (remember to remove missing data from the calculation)
months <- vector("double", length(by_month))

for(i in seq_along(months)) {
  months[i] <- mean(by_month[[i]]$Ozone, na.rm = TRUE)
}
months

# Replicate this calculation with lapply, sapply, and vapply
lapply(by_month, function(x) {
  mean(x$Ozone, na.rm = TRUE)
})

sapply(by_month, function(x) {
  mean(x$Ozone, na.rm = TRUE)
})

vapply(by_month, function(x) {
  mean(x$Ozone, na.rm = TRUE)
},
double(1))

months <- rep(NA, length(by_month))
months
# Produce separate plots showing the relation between Ozone and Solar.R for each month (with a single loop).
lapply(by_month, function(x) {
  ggplot(x, aes(Ozone, Solar.R)) +
    geom_point() +
    geom_smooth()
})

# Use a for loop to save the plots to a folder on your computer
plots <- lapply(by_month, function(x) {
  ggplot(x, aes(Ozone, Solar.R)) +
    geom_point() +
    geom_smooth()
})

("~/iCloud Drive/Documents/GitHub/Lab1")

dir.create("~iCloud Drive/Documents/GitHub/Lab1/plots")
filenames <- here::here("plots", 
                        paste0("month", names(by_month), ".png"))
filenames

for(i in seq_along(plots)) {
  ggsave(filenames[i],
         plots[[i]],
         device = "png",
         width = 6.5, 
         height = 8)
}

