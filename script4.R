# exercise
# string data를 넣을 때는 따옴표 붙여야한다.
str1 <- "a"
str1 # >>> "a"

str2 <- "hello"
str2 # >>> "hello"
str3 <- "hello r studio"
str3 # >>> "hello r studio"
# 따옴표 안에서는 띄어쓰기 자유롭게!

# c() 함수를 이용해 문자 여러개 넣기
str4 <- c("a","b","c")
str4 # >>> "a" "b" "c"

str5 <- c("hello","r","studio","good")
str5 # >>> [1] "hello"  "r"      "studio" "good"  
# >>> 단어들 중 가장 긴 단어의 길이를 기준으로 출력 -> 간격 벌어짐

str4 + str5

# 숫자 다루는 함수
x <- c(1,2,3)
x # >>> [1] 1 2 3
mean(x) # >>> [1] 2 : 평균 구하기
max(x) # >>> [1] 3 : max값 구하기
min(x) # >>> [1] 1 : min값 구하기

# 문자 다루는 함수
str5 # >>> "hello"  "r"      "studio" "good"  
paste(str5, collapse=",") # str5 문자열을 ,로 구분 후 합치기
# >>> "hello,r,studio,good"
str6 <- paste(str5, collapse = "!")
str6 # >>> "hello!r!studio!good"

# 1.패키지 설치
install.packages("ggplot2")
# 2.패키지 로드
library(ggplot2)
# 3. 함수 사용
x1 <- c("a","a","b","c")
x1
qplot(x1) # 내장함수qplot()사용해서 빈도 막대그래프 생성

qplot(data=mpg,x=hwy) # data에 mpg, x축은 hwy 지정

# x축 cty
qplot(data=mpg, x=cty)

# x축 drv, y축 hwy
qplot(data = mpg, x=drv, y=hwy)

# x축 drv, y축 hwy, 선 그래프 형태
qplot(data = mpg, x=drv, y=hwy, geom="line")

# x축 drv, y축 hwy, 상자 그림(box plot) 형태
qplot(data = mpg, x=drv, y=hwy, geom="boxplot")

# x축 drv, y축 hwy, 상자그림 형태, drv별 색 표현
qplot(data = mpg, x=drv, y=hwy, geom="boxplot", colour=drv)

# help 기능
?qplot

# exercise
# 1.시험 점수 변수 만들고 출력하기
# 80, 60, 70, 50, 90
a <- c(80,60,70,50,90)
a # >>> [1] 80 60 70 50 90

# 2.전체 평균 구하기
mean(a) # [1] 70

# 3.전체 평균 변수 만들고 출력하기 
b = mean(a)
b # >>> [1] 70
