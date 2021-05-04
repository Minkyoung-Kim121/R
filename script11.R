# outlier 제거하기
# 데이터 준비
outlier <- data.frame(sex=c(1,2,1,3,2,1),
                      score=c(5,4,3,5,2,6))
outlier

# 이상치 확인
# 빈도표
table(outlier$sex)
table(outlier$score)

# 이상치 -> 결측치 변환
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
table(outlier$sex)

outlier$score <- ifelse(outlier$score == 6, NA, outlier$score)
table(outlier$score)

outlier

library(dplyr)
# missing value 제거
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score = mean(score))

library(ggplot2)
# outlier 제거하기
# boxplot
boxplot(mpg$hwy)$stats

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy=mean(hwy, na.rm=T))
