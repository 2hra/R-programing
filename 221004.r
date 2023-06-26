rm(list=ls()) 
## 시험일정, 화요일에 가능. 비대면으로 볼 예정. 
## 10/25 비대면 시험. 20문제. 한 시간도 안 걸림. 시험 범위는 전주 재공지.


### 5주차

### r에서 데이터 입력과 출력
### 화면에 출력

## 출력 1)
age <- c(30, 22, 25, 10, 8, 28, 50)
age
young <- min(age)
young
old <- max(age)
old


## 출력 2)
## 현업에서 코드 짤 때는 모든 코드에 프린트 적용해서 실행 확인 필요.
print(old)
## print는 함수 끝날 때마다 한 줄 띄어쓰기 기본.


## 출력 3) cat() >> 여러 변수 요소 출력 가능
## cat()은 맨 뒤 엔터 수기 입력 필요
cat('가장 젊은 사람의 나이는 ', young,'이고','가장 늙은 사람의 나이는 ',old,'이다. \n')
print('가장 젊은 사람의 나이는 ', young,'이고','가장 늙은 사람의 나이는 ',old,'이다. \n')
## 프린트는 여러개 오류 발생.

install.packages('svDialogs')
library(svDialogs)

## 변수명 지정 후 digInput()$res
answer <- dlgInput('숫자를 입력해 주세요:')$res 
## $res 필수로 붙여야 함. res 값만 불러오겠다는 뜻.

## as.numeric 으로 input 문자열을 int로 변경 가능. 계산 필요할 때만 바꿈.
## 숫자를 문자로 바꾸는 건 as.character
answer_num <- as.numeric(answer) 
tax <- answer_num * 0.01
cat('당신이 지불할 세금은 ', tax, '원입니다.\n')



### 예시 1)
height <- dlgInput('키 입력:')$res
weight <- dlgInput('몸무게 입력: ')$res

height_n <-  as.numeric(height)
weight_n <-  as.numeric(weight)
height_n2 <-  height_n / 100

bmi <- weight_n/(height_n2^2)
cat('입력한 키는 ', height_n2, 'm이고, 몸무게는 ', weight_n, 'kg입니다.\n','bmi는 ',bmi,'입니다.')



### 파일에 읽고 출력
getwd() ## 작업 공간 주소 알려줌
setwd('C:/Users/lhr06/OneDrive/Desktop/R') ## 경로 바꿔 줌.
## 엑셀 파일과 유사하지만 엑셀은 코드 짜기에 유용하지 않음.
## csv 파일이 인코딩에 적합.
## 항상 연동시킨 파일은 창 열지 않고 코드 짜야 오류 발생하지 않음.


## 읽기 1-1) read.csv()
air <- read.csv('airquality.csv', header = F) 
## 헤더 없이 일단 view 실행 후 헤더 유무 확인.
## 구분 헤더 없으면 header = FALSE, 헤더 있으면 header = TRUE
View(air)
class(air)


## 쓰기 1-2) write.csv()
age <- c(30, 22, 25, 10, 8, 28, 50)
age
write.csv(age,'age.csv', row.names = F, col.names=F) ## csv 파일 생성.
## row.names는 행 구분항목 삭제
## col.names는 열 구분항목 삭제
## 생성 파일 용량이 0kb 아닌지 확인.

View(iris)
y = subset(iris, Species == 'setosa') ## 데이터프레임에서 구분항목 조건 기재 후 내용 추출
y ## 결과 출력
write.csv(y, 'setosa.csv') ## 추출값 파일로 쓰기.


## 읽고 쓰기 2) read.xlsx, write.xlsx
install.packages('xlsx')
library(xlsx)

air2 <- read.xlsx('airquality.xlsx', header=T, sheetIndex=1)
head(air2)
getwd()


## 일고 쓰기 3) read.table, read.delim, writ.table
x <- read.table('read_tab.txt', sep='\t') ## 탭으로 항목 구분, 엔터 필수
y <- read.delim('read_tab.txt', header=F) ## 쉽표, 탭 상관없이 다 구분, 엔터 필수

num <-  c(1,2,3)
chr <- c('A','b', 'c')
log <-  c(T, F, T)
DATA <- data.frame(num, chr, log)
View(DATA)
?write.table

## write.table 함수
## file()
write.table(DATA, file = '456.txt',row.names=F,col.names=F)
## append()
write.table(DATA, file = '456.txt',row.names=F,col.names=F, append=T)
## eol() 행과 행 사이에 기본적으로 띄어쓰기. 이걸 문자열이나 다른 걸로 변동 가능.
write.table(DATA, file = '456.txt',row.names=F,col.names=F, append=T, eol = '000')

## sink()
age <- c(20, 30, 40, 50, 60)
young <- min(age)

sink('20221004.txt', append=F)
cat('가장 젊은 사람 나이는 ', young, '이다.\n')
sink() ## 세 줄을 동시에 실행하면 파일 생성, 입력 내용, 파일 마무리 하는 것.



### 예시 1)
View(airquality)
air_6 <- subset(airquality, Month == '6')
air_6
write.table(air_6, file='air_6.txt', row.names=T)


### 예시 2) read.csv 제일 중요함.
View(swiss)
swiss_F <- subset(swiss, Fertility >= 90)
swiss_F
write.csv(swiss_F, 'swiss_F.csv')


## 예시 3) readLines() >> 시험도 안 나옴.
a <-  read.csv('swiss_F.csv')
class(a)
b <- readLines('swiss_F.csv') ## 벡터 형식으로 불러옴.
class(b)
b


### 예시 4)
swd_F <-  read.csv('swiss_F.csv')
swd_F


### 예시 5)
View(swiss)
colSums(swiss['Education'])
sum(swiss$Education)

colMeans(swiss['Examination'])
mean(swiss$Examination)

sort(swiss['Agriculture']) ## 얘는 왜 안 되지? 
## sort는 벡터에서만 사용 가능. 
## 데이터 프레임은 order 또는 $ 사용해야 함.
sort(swiss$Agriculture)


kor <- c(1,2,3)
usa <- c('a','b','c')
c <- data.frame(kor,usa)
c
View(c)
c['kor']
sort(c$kor, decreasing = F)
sort(kor)


### 예시 6) 몰라도 됨. order()


### 예시 7) 
swd_F1 <- subset(swiss, Infant.Mortiality > 20)

View(swd_F1) ## 표처럼 출력
nrow(swd_F1) ## 행의 갯수 출력
