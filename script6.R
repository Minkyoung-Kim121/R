# 데이터 파악하기
exam <- read.csv("https://raw.githubusercontent.com/youngwoos/Doit_R/master/Data/csv_exam.csv")
exam

# head()
# 데이터 앞부분 출력
head(exam)
head(exam, 5) # 앞에서부터 5행만 보여줘
head(exam, 3) # 앞에서부터 3행만 보여줘

# tail()
tail(exam)
tail(exam, 3) # 뒤에서부터 3행만 보여줘
tail(exam, 7) # 뒤에서부터 7행만 보여줘

# View()
# 맨 앞의 대문자 V 유의!
View(exam)
# >>> exam 이라는 데이터 뷰어 창 생성(새로 뜬다)

# dim()
# data 가 몇 행? 몇 열?
dim(exam) # [1] 20 5 >>> 행, 열
# >>> 데이터가 20행 5열로 구성되어있다.
# 행이 먼저!

# str()
str(exam)
# data.frame':	20 obs. of  5 variables:
# >>> exam : 데이터프레임
# >>> 20 : 관측치(Observation)
# >>> 5 : (variables)

# summary()
# 요약 함수
summary(exam)
# >>> 요약 통계량 확인 함수

# exercise
library(ggplot2)

# using mpg data
mpg <- as.data.frame(ggplot2::mpg)

# head()
head(mpg)
head(mpg, 5)

# tail()
tail(mpg)
tail(mpg, 3)

# dim()
dim(mpg) # [1] 234 11

# str()
str(mpg)

# summary()
summary(mpg)

# View()
View(mpg)
