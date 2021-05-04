# dplyr load
library(dplyr)

exam <- read.csv("https://raw.githubusercontent.com/youngwoos/Doit_R/master/Data/csv_exam.csv")
exam

# filter()
exam %>% filter(class == 1)

exam %>% filter(class == 2)

# !=
exam %>% filter(class != 1)

exam %>% filter(class != 3)

# 초과, 미만, 특정 이상 또는 이하
exam %>% filter(math > 50)

exam %>% filter(english >= 80)

exam %>% filter(science <= 40)

# and
exam %>% filter(class == 1 & math >= 60)

# or
exam %>% filter(math >= 70 | english >= 70)

# |
exam %>% filter(class == 1 | class == 3 | class == 5)

# %in%
exam %>% filter(class %in% c(1,3,5))

# 추출 >>> 데이터 만들기
class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 1)
mean(class1$math) # [1] 46.25
mean(class2$math) # [1] 46.25
ifelse(mean(class1$math) > mean(class2$math), "win_class_1",
       ifelse(mean(class1$math) == mean(class2$math), "draw", "win_class_2"))


# dplyr load
library(dplyr)
exam <- read.csv("https://raw.githubusercontent.com/youngwoos/Doit_R/master/Data/csv_exam.csv")
exam

# select()
exam %>% select(math)
exam %>% select(english)

exam %>% select(math, science)
# >>> ,로 변수를 나열하면 여러개 변수 추출 가능

# select(-variable)
exam %>% select(-math) # >>> math 제외 추출해주세요
exam %>% select(-math, english)

# filter() 와 select() 조합하기
exam %>% filter(class == 1) %>% select(math)
# >>> class == 1 & math 만 추출하기

exam %>% select(-math, english) %>% filter(class == 5)

# 가독성
exam %>%
  filter(class == 2) %>%
  select(class)

# 일부추출
# head()
exam %>%
  filter(class == 3) %>%
  select(math) %>%
  head(5)

exam %>%
  filter(class == 1) %>%
  select(-math) %>%
  tail(3)


# arrange() 정렬
# 오름차순
exam %>%
  arrange(math) %>%
  head(10) 
# >>> math 를 기준으로 오름차순 정렬

exam %>%
  arrange(class, math) %>%
  head(10)
# >>>  class, math를 기준으로 오름차순 정렬

exam %>%
  arrange(math, class) %>%
  head(10)
# >>> math, class 기준으로 오름차순 정렬
# >>> 여러개 변수 지정해서 정렬할 때는 먼저 쓴 변수가 먼저 정렬!

# 내림차순 arrange(desc())
exam %>%
  arrange(desc(math)) %>%
  head(10)

# mutate()
exam %>%
  mutate(total = math + english + science) %>%
  arrange(desc(total)) %>%
  head(10)
# >>> total 이라는 새로운 파생변수(세 과목의 합)를 출력

exam %>%
  mutate(total = math+english+science,
         mean = (total/3)) %>%
  arrange(desc(mean)) %>%
  head(10)

# mutate() & ifelse()
exam %>% mutate(test = ifelse(math >= 65, "pass", "fail")) %>%
  arrange(class) %>%
  head(10)

## >>> dplyr 패키지의 함수들은 데이터프레임명을 반복 입력하지 않는다.


# summarise()
exam %>% summarise(mean_math = mean(math))

# summarise() 는 대개 group_by()함수와 같이 사용한다.
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))
# >>> class 별로 그룹바이(묶어서,분리해서)하고 math 평균 산출

# 여러 요약 통계량 한 번에 산출하기
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())
# n() : 빈도 -> 행 개수를 세어서.(몇 행?)
# n 이 4 이면 반별로 4명이 있다는 의미.

exam %>%
  group_by(class) %>%
  summarise(mean_english = mean(english),
            sum_english = sum(english),
            median_english = median(english),
            min_english = min(english),
            max_english = max(english),
            n = n())

# mpg data
library(ggplot2)
mpg

mpg %>%
  group_by(manufacturer, drv) %>%
  summarise(mean_city = mean(cty)) %>%
  head(10)
# >>> group_by() 함수로 하위그룹 생성 가능

# dplyr 조합하기
mpg %>%
  group_by(manufacturer) %>%
  filter(class == "suv") %>%
  mutate(total = (cty+hwy)/2) %>%
  summarise(mean_t = mean(total)) %>%
  arrange(desc(mean_t)) %>%
  head(5)
# 요구사항 파악 - 사용 함수정의 - 함수사용 - 결과 산출


# left_join()
# data 준비
test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60,70,80,90,90))
test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(100,20,80,70,50))
test1
test2

total <- left_join(test1, test2, by ="id")
total
# >>> 'id' 를 기준으로 test1, test2의 데이터를 합친다.

#  변수 추가
name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("k", "l", "w", "e", "d"))
name

exam_new <- left_join(exam, name, by="class")
exam_new

# >>> 공통 컬럼을 기준으로 데이터를 합친다. (오라클 조인과 비슷)
# bind_rows()
# data
group1 <- data.frame(id = c(1,2,3,4,5),
                     test = c(80,70,60,70,60))
group2 <- data.frame(id = c(1,2,3,4,5),
                     test = c(80,80,90,90,80))
group1
group2

group_all <- bind_rows(group1, group2)
group_all
# by 기준이 없어도 합쳐진다. 
# 단, 두 데이터의 변수명이 같아야!

a1 <- data.frame(id = c(1,2,3,4,5),
                 class = c(11,22,33,44,55))
a2 <- data.frame(id = c(1,2,3,4,5),
                 teacher = c(99,88,77,66,55))
a1
a2

a3 <- bind_rows(a1, a2)
a3

a2 <- rename(a2, 'class'='teacher')
a2

a3 <- bind_rows(a1, a2)
a3


# exercise
# Q1
# ggplot2::midwest
library(ggplot2)
midwest

midwest <- as.data.frame(ggplot2::midwest)
midwest
midwest$underage <- (midwest$poptotal - midwest$popadults)/midwest$poptotal*100 
midwest$underage
midwest

# mutate()
midwest <- midwest %>%
  mutate(popunderage = (poptotal-popadults)/poptotal*100)
midwest

# Q2
midwest %>%
  arrange(desc(popunderage)) %>%
  select(county ,popunderage) %>%
  head(5)

# Q3
midwest <- midwest %>%
  mutate(q3 = ifelse(popunderage >= 40, "large",
       ifelse(popunderage >= 30, "middle", "small")))
midwest

#Q4
midwest %>%
  mutate(popq4 = (popasian/poptotal)*100) %>%
  arrange(popq4) %>%
  select(state, county, popq4) %>%
  head(10)
  
