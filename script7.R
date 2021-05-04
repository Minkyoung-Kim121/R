# 변수명 바꾸기
df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw

# dplyr
install.packages("dplyr")
library(dplyr)

# copy data frame
df_new <- df_raw
df_raw

# 변수명 변경
# rename(dataframe, 바꿀변수 = 원래변수)
df_new <- rename(df_new, v2 = var2)
df_new

# 확인
df_raw
df_new

# exercise
library(ggplot2)
mpg_copy <- mpg
mpg_copy
mpg_copy <- rename(mpg_copy, city = cty, highway = hwy)
mpg_copy


# 파생변수 만들기
df<- data.frame(var1 = c(4,3,8),
                var2 = c(2,6,1))
df

# var_sum = var1 + var2
df$var_sum <- df$var1 + df$var2
df

# var_mean
df$var_mean <- (df$var1 + df$var2)/2
df

# mpg data
mpg$total <- (mpg$cty + mpg$hwy)/2
mpg
head(mpg, 3)

mean(mpg$total) # [1] 20.14957

# 조건문함수
# 요약 통계량 산출
summary(mpg$total)

# 히스토그램
hist(mpg$total)

# ifelse()
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 5)

# table()
table(mpg$test)

# 막대그래프
library(ggplot2)
qplot(mpg$test)

# ifelse()
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))
mpg$grade
head(mpg$grade, 5)

# table()
table(mpg$grade)

# qplot()
qplot(mpg$grade)

mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "b",
                            ifelse(mpg$total >= 20, "C", "D")))
head(mpg$grade2, 5)
