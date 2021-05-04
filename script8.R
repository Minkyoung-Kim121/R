# Q1
library(ggplot2)
midwest <- as.data.frame(ggplot2::midwest)
midwest

head(midwest, 3)

tail(midwest, 4)

View(midwest)

dim(midwest)

summary(midwest)

str(midwest)


# Q2
library(dplyr)
midwest1 <- rename(midwest, total = poptotal, asian = popasian)
head(midwest1, 5)


# Q3
midwest1$aa <- (midwest1$asian/midwest1$total)*100
midwest1$aa
hist(midwest1$aa)


# Q4
mean(midwest1$aa)
# [1] 0.4872462
midwest1$b <- ifelse(midwest1$aa > 0.4872462, "large", "small")
head(midwest1$b, 5)


# Q5
table(midwest1$b)
qplot(midwest1$b)
