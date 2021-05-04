# data frame
# 변수 만들기
english <- c(90, 80, 60, 70)
english # [1] 90 80 60 70 
math <- c(50,60,100,20)
math # [1] 50 60 100 20

# data.frame() : 데이터프레임 생성 함수
df_midterm <- data.frame(english, math)
df_midterm # df_midterm 이라는 영어, 수학 점수 데이터 프레임 생성

# class 추가
class <- c(1,1,2,2)
class
df_midterm <- data.frame(english, math, class)
df_midterm

# mean : 평균 구하기
# '$' : 데이터 프레임 안에 있는 변수를 지정할 때 사용
mean(df_midterm$english) # [1] 75
mean(df_midterm$math) # [1] 57.5

# 변수와 값을 나열해서 데이터 프레임 한 번에 만들기
df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
df_midterm

# exercise
df_fruit <- data.frame(name = c('apple','strawberry','watermelon'),
                       price = c(1800,1500,3000),
                       sell = c(24,38,13))
df_fruit

# 패키지 설치
# 1. 설치
install.packages("readxl")
# 2. 로드
library(readxl)

# excel file 불러오기
# read_excel("file.xlsx")
# excel_exam.xlsx
df_exam <- read_excel("excel_exam.xlsx")
df_exam
# read_excel("filename.xlsx") : 엑셀 파일을 데이터프레임으로 읽어오기
# 주의) 반드시 확장자까지 입력해야!
# "파일명" >>> 큰 따옴표!

# 다른 경로에 있는 파일을 불러올 경우
# df_exam <- read_excel("파일경로/파일명.확장자")

# excel 파일 내 평균 구하기 
mean(df_exam$english) # [1] 84.9
mean(df_exam$science) # [1] 59.45

# read_excel()은 기본적으로 첫 행을 변수명으로 인식
# excel_exam_novar.xlsx
df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar # error 발생
# >>> 첫 행부터 데이터가 실행되는 파일인데, 첫 행을 변수명으로 인식했기 때문

# col_name = F
# read_excel("file.xlsx", col_names = F)
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar
# >>> 첫 행을 변수명이 아닌 데이터로 인식해라
# F 대문자 유의! >>> false
# 논리형 벡터는 반드시 대문자 TRUE 또는 FALSE로 입력! T 또는 F도 가능!

# 여러 개의 시트
#read_excel("file.xlsx", sheet = number)
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet=3)
df_exam_sheet

# csv 파일
# : 범용 데이터 파일
# 경로로 불러오기
df_csv_exam <- read.csv("https://raw.githubusercontent.com/youngwoos/Doit_R/master/Data/csv_exam.csv")
df_csv_exam

#exercise
df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
df_midterm

#write.csv()
write.csv(df_midterm, file="df_midterm.csv")

#saveRDS
saveRDS(df_midterm, file = "df_midterm.rds")

# rds 삭제
rm(df_midterm)
df_midterm
# >>> error
df_midterm <- readRDS("df_midterm.rds")
df_midterm
