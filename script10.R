# 결측치 정제하기
# missing value
# 누락된 값, 비어있는 값을 의미
# >>> 데이터 수집 시 결측치 발생할 수도 있다.

# data
df <- data.frame(sex = c("M", "F", NA, "M","F"),
                 score = c(99,88,77,66,NA))
df

# is.na()
is.na(df)
# >>> TRUE -> 결측치

table(is.na(df))
# >>> FALSE : 8 , TRUE : 2
# >>> TRUE, 결측치가 2개.

# 각각 결측치 출력
table(is.na(df$sex))
table(is.na(df$score))
# >>> sex, score 둘 다 TRUE 가 1개씩 있다.
# >>> 결측치 각 각 1 개씩 존재.

# 결측치 연산
mean(df$score)
sum(df$score)
# >>> NA : 불가능

# filter(is.na(variable))
library(dplyr)
df %>% filter(is.na(score))

# not missing_value
# !is.na()
df %>% filter(!is.na(score))

df_nomissing <- df %>%
  filter(!is.na(score))
df_nomissing
mean(df_nomissing$score)
sum(df_nomissing$score)
# >>> not missing value -> 연산 가능!

# 여러 변수 동시에 결측치 없는 데이터 추출하기
df_nomissing <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomissing
# '&' => and 

# na.omit()
df_nomissing2 <- na.omit(df)
df_nomissing2
# >>> na.omit(variable) : 결측치 있는 행을 한 번에 제거

# 함수의 결측치 제거 기능
# na.rm = TRUE
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

# exam data
exam <- read.csv("https://raw.githubusercontent.com/youngwoos/Doit_R/master/Data/csv_exam.csv")
exam[c(3,8,15), "math"] <- NA
exam

exam %>% summarise(mean_math = mean(math))
# >>> math에는 결측값이 존재하기 때문에 NA 산출.

exam %>%
  summarise(mean_math = mean(math, na.rm = T))

exam %>%
  summarise(mean_english = mean(english, na.rm = T),
            sum_english = sum(english, na.rm=T),
            median_english = median(english, na.rm=T))

# mean으로 결측치 대체
exam
# >>> NA 확인
mean(exam$math, na.rm=T)
# 55.23529

exam$math <- ifelse(is.na(exam$math), 55, exam$math)
exam

table(is.na(exam$math))
# >>> FALSE 20

mean(exam$math)
