# 산점도
library(ggplot2)
mpg

# 배경생성
ggplot(data = mpg, aes(x = displ, y=hwy))
# >>> x축: displ, y축:aes

ggplot(data=mpg, aes(x = displ, y=hwy)) + geom_point()

# xlim(), ylim()
ggplot(data=mpg, aes(x=displ, y=hwy)) + geom_point() + xlim(3,6)

ggplot(data=mpg, aes(x=displ, y=hwy)) +
  geom_point() +
  xlim(3,6) +
  ylim(10,30)

