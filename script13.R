# 막대그래프
library(dplyr)
mpg

df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(sum_hwy = sum(hwy))
df_mpg

ggplot(data=df_mpg, aes(x=drv, y=sum_hwy)) + geom_col()

library(dplyr)
mpg

dd_mpg <- mpg %>%
  group_by(cty) %>%
  summarise(mean_hwy=mean(hwy))
dd_mpg

ggplot(data=dd_mpg, aes(x=cty, y=mean_hwy)) + geom_col()

ggplot(data=dd_mpg, aes(x=reorder(cty, -mean_hwy), y=mean_hwy)) + geom_col()

ggplot(data=mpg, aes(x=hwy)) + geom_bar()


# line chart
library(ggplot2)
ggplot(data=economics, aes(x=date, y=unemploy)) + geom_line()       

# box plot
library(ggplot2)
ggplot(data = mpg, aes(x=drv, y=hwy)) + geom_boxplot()
