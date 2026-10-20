library(lattice)
library(ggplot2)

data("mtcars", package = "datasets")
head(mtcars)

plot(mtcars$hp, mtcars$mpg,
     main = "Base R: Horsepower vs. MPG",
     xlab = "Horsepower",
     ylab = "Miles per Gallon (MPG)",
     pch = 19)

boxplot(mpg ~ factor(cyl),
        data = mtcars,
        main = "Base R: MPG by Number of Cylinders",
        xlab = "Number of Cylinders",
        ylab = "Miles per Gallon (MPG)")

xyplot(mpg ~ hp | factor(cyl),
       data = mtcars,
       main = "Lattice: MPG vs. Horsepower by Cylinders",
       xlab = "Horsepower",
       ylab = "Miles per Gallon (MPG)",
       pch = 19)

bwplot(mpg ~ factor(cyl),
       data = mtcars,
       main = "Lattice: MPG by Number of Cylinders",
       xlab = "Number of Cylinders",
       ylab = "Miles per Gallon (MPG)")


ggplot(mtcars, aes(x = hp, y = mpg, color = factor(cyl))) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "ggplot2: Horsepower vs. MPG",
       x = "Horsepower",
       y = "Miles per Gallon (MPG)",
       color = "Cylinders") +
  theme_minimal()

ggplot(mtcars, aes(x = factor(cyl), y = mpg,
                   fill = factor(cyl))) +
  geom_boxplot() +
  labs(title = "ggplot2: MPG by Number of Cylinders",
       x = "Number of Cylinders",
       y = "Miles per Gallon (MPG)",
       fill = "Cylinders") +
  theme_minimal()






