### 2주차 복습

### 1) R의 기본 연산
log() ## 로그 함수
sqrt() ## 제곱근
max()
min()
abs() ## 절댓값
factorial()
sample()
sin(), cos(), tan()



### 2) 변수

### 변수의 자료형
## 숫자형, 문자형, 논리형, 특수값(NULL, NA, NaN, Inf, -Inf)


### R 변수 기본 함수
class()
is.numeric()
is.character()
is.logical()
is.null()



### 3) 벡터

### 벡터 만들기
## 1) 기본 벡터 c()
a <- c(1,2,3)
a
## 2) 범위 지정 벡터 seq(이상, 이하, 간격=증가)
b <- seq(0,10,2)
b
## 3) 값 반복 벡터 rep(원하는 값, times=(|each=))
c <- rep(1, times=5)
c
d <- rep(2:4, times=4) ## 묶음으로 반복
d
e <- rep(2:4, each=4) ## 요소별 반복


### 벡터 각 요소 이름 지정
score <- c(90,80,70,60,50,40,30)
names(score) <- c('A','B','C','D','E','F','G')
score


### 벡터 인덱싱, 값 변경
score[2]
score[1:2]
score[-1] ## 1 빼고
score[seq(1,5,2)]
score[c(3:5)]
score[-c(3:5)]
score['A']
score[3] <- 100
score[c(1:3)] <- c(1,2,3)


### 벡터 연산(연산할 벡터끼리 길이 같아야 함.)
w <- c(4,5,6)
x <- c(1,2,3)
v <- w+x
v
y <- c('a','b','c')
z <- c(x,y)


### 벡터 적용 함수
sum()
mean() ## 평균
median() ## 중간값
max(), min()
var() ## 분산
sd() ## 표준편차
sort() ## 정렬 오름차순, T 추가하면 내림차순
range() ## 최댓값~최솟값 범위
length() ## 길이, 갯수

main <- c(1:10)
sum(main) ## 55
mean(main) ## 5.5
median(main) ## 5.5
max(main) ## 10
min(main) ## 1
var(main) ## 9.166667
sd(main) ## 3.02765
sort(main) ## 1 2 3 4 5 6 7 8 9 10
sort(main, T) ## 10 9 8 7 6 5 4 3 2 1
sort(main, decreasing = FALSE) ## 이게 정식 표현법 ★★★
range(main) ## 1 10
length(main) ## 10


### 논리 연산자
# <, <=, >, >=, ==, !=, |, &

d <- seq(1,9,2)
d
d >= 5 ## FALSE FALSE  TRUE  TRUE  TRUE
sum(d >= 5) ## 3 >> 갯수수
sum(d[d >= 5]) ## 21 >> 합계
condi <- d >= 5
d[condi] ## 5 7 9



### 4) 리스트, list()
x <- list('name',24,TRUE)
x
y <- list(what='name',age=24,check=TRUE)
y
names(x) <- list('A',1,'ㄱ')
x


### 리스트 인덱싱
main <- list(1,2,3,'A','B','C')
names(main) <- list('가','나','다','라','마','바')
main[3:5]
main[c(1:4)]
main[seq(1,5,2)]
main$가
main[1] ## 이름과 값
main[[1]] ## 값만


### 리스트 팩터, 인덱싱, 값 추가, 값 변경
bt <- c('A','B','B','O','AB','A')
bt_fac <- factor(bt)
bt
bt_fac

bt_fac[1]
levels(bt_fac) ## 종류만
summary(bt_fac) ## 종류, 갯수 통계
#> bt_fac
#[1] A  B  B  O  AB A  A 
#Levels: A AB B O
#> summary(bt_fac)
#A AB  B  O 
#3  1  2  1 

bt_fac[7] <- 'A'
summary(bt_fac)

bt_fac[8] <- 'C'
#[1] A    B    B    O    AB   A    A    <NA>
#  Levels: A AB B O
bt_fac



### 예시 1)
## 문제)
d <- c(100:200)

## coding here ##
d[50]
d[seq(1,101,10)]
d[c(1:20)]


### 예시 2)
## 문제)
d <- c(100:200)

## coding here ##
length(d)
mean(d)
sum(d<110)
sum(d[d<110])


### 예시 3)
## 문제)
x <- c(1:20)

## coding here ##
y <- x[seq(3,20,3)]
sort(y, decreasing = TRUE)
mean(x[-c(2:10)])


### 예시 4)
## 문제)
a <- c(1,6,3,8)

## coding here ##
a
a <- sort(a, decreasing=FALSE)
a
names(a) <- c('one','three','six','eight')
a


### 예시 5)
## 문제)
ages <- c(58,20,85)
names <- c('Tony','Ahn','Nick')
x <- list(ages,names)

## coding here ##
names(x) <- list(ages='numbers', names='names')
x


### 예시 6)
## 문제)
gender <- c(rep('male',times=5),rep('female',times=10))
gender_fac <- factor(gender)

## coding here ##
gender_fac[16] <- 'male'
summary(gender_fac)



### 3주차 복습

### 5) 매트릭스, matrix(범위 or 일정 값, nrow = , ncol = )
z <- matrix(1:20, nrow = 4, ncol = 5)
z
zz <- matrix(0, nrow = 3, ncol = 2)
zz
v <- 1:12
vv <- matrix(data=v, nrow = 4, ncol=3)
vv


### 매트릭스 합치기 cbind, rbind
x <- 1:3
y <- 4:6
xx <- cbind(x,y)
xx
yy <- rbind(x,y)
yy
zz <- cbind(xx,y)
zz
xyz <- rbind(yy,zz)
xyz


### 매트릭스 인덱싱
a <- matrix(1:15, nrow=3,ncol=5)
a
a[2,3] ## 행, 열
a[,4]
a[1,2:3]
a[3,c(4:5)]
a[c(1:2),]


## 매트릭스 이름 지정
rownames(a) <- c('a','b','c')
colnames(a) <- c('ㄱ','ㄴ','ㄷ','ㄹ','ㅁ')
a



### 6) 데이터 프레임, data.frame()
city <- c('Seoul','London','Newyork')
rank <- c(1,3,2)
city.info <- data.frame(city,rank)
city.info

a <- matrix(1:15, nrow=3,ncol=5)
a
aa <- as.data.frame(a)
aa

mat <- matrix(c(1,3,5,7,9,2,4,6,8,10,2,3,5,7,11), ncol=3)
as.data.frame(mat)
mat2 <- as.data.frame(mat)
colnames(mat2) <- c('first','second','third')
rownames(mat2) <- c('one','two','three','four','five')
mat2


## cbind, rbind 가능
code <- c('ds001','ds002','ds003')
name <- c('math','r','statistics')
students <- c(50,40,30)

## 값 추가하기
ds<- data.frame(code,name,students)
ds
ds <- rbind(ds, c('ds004','seminar','100'))
ds

## 데이터프레임으로 추가하기
new <- data.frame(code=c('ds005','ds006'),name=c('coding'),students=c(56,77))
ds <- rbind(ds,new)
ds

## col 이름, 값 추가하기
ds$professor = c('taewan')
ds

## 값 추출
iris[1]
iris[1:3,c(2,4)]


## 매트릭스와 데이터프레임 산술연산
a <- matrix(1:6,2,3)
b <- matrix(7:12,2,3)
a
b
a+b
b-a
a*2



### 매트릭스와 데이터 프레임 함수
dim()
nrow()
ncol()
rownames(), colnames() ## 행, 열의 이름 나열열
head()
tail()
str()
unique()
table()
colSums()
rowSums()
colMeans()
rowMeans()
t() ## 행 열 위치 바꾸기
subset() ## subset(2차원자료, 조건문), 데이터프레임만.
class()
is.matrix()
is.data.frame()

class(iris)
class(state.x77)

## 혼용 가능
dim(iris) ## 행, 열 갯수
nrow(iris) ## 행 갯수
ncol(iris) ## 열 갯수
head(iris) ## 위 여섯 줄
tail(iris) ## 아래 여섯 줄
str(state.x77) ## 내용 요약
unique(state.x77) ## 중복 값 제거
unique(state.x77[,5]) ## 5열의 중복 제거 후 종류 보기
unique(iris[,"Species"])
table(state.x77) ## 각 그룹별 관측치. 갯수 출력
colSums(iris[,-5]) ## 5열의 합
rowSums(state.x77[,-5]) ## 끝부분 5행의 합
colMeans(iris[,-5])
rowMeans(state.x77[,-5])


## 예시 1)
## 문제)
d <- matrix( )

## coding here ##
d <- matrix(seq(5,60,5),nrow=3, ncol=4)
d


## 예시 2)
## 문제)
d <- matrix(c(seq(5,60,5)),nrow=3,ncol=4)
d_t <- matrix( )
d_t

## coding here ##
d_t <- matrix(c(seq(5,60,5)),nrow=3, ncol=4, T)
d_t


## 예시 3)
## 문제)
b1 <- c(4,5,7,2)
b2 <- c(19,15,12,17)
b3 <- c(20,24,28,23)

## coding here ##
m1 <- cbind(b1,b2,b3)
m1


## 예시 4)
## 문제)
rich_state.x77 <- ( )

## coding here ##
rich_state.x77 <- subset(as.data.frame(state.x77),Income>=5000)
rich_state.x77


## 예시 5)
## 문제)
x <- 
y <- 
z <- 
df <- 
df <- 

## coding here ##
  x <- c(1,2,3)
  y <- c('white','blue','yellow')
  z <- c(TRUE, FALSE, TRUE)
  df <- data.frame(x,y,z)
  df 


## 예시 6)
## 문제)
class(airquality)
airquality_m <- 
class(airquality_m)

## coding here ##
class(airquality)
airquality_m <- as.matrix(airquality)
class(airquality_m)


## 예시 7)
## 문제)
nrow()
subset()

## coding here ##
nrow(subset(airquality,Ozone>120))
subset(airquality,Temp==max(airquality[,'Temp']))


## 예시 8)
## 문제)
airquality
airquality

## coding here ##
airquality[,'Wind']
airquality$Wind



### 5주차 복습
## 출력 : 화면
## cat(), print()
library(svDialogs)
user.input <- dlgInput('Input income')$res
user.input
income <- as.numeric(user.input)
income
tax <- income*0.05
cat('세금: ',tax)

print('Hello World!')


## 예시)
library(svDialogs)
height <- dlgInput('키를 입력하세요(cm): ')$res
weight <- dlgInput('몸무게를 입력하세요(kg): ')$res
h <- (as.numeric(height)/100)
w <- as.numeric(weight)
bmi <- w/(h^2)
cat('입력한 키는 ',h*100,'cm, 몸무게는 ',w,'kg 입니다.\n', sep="")
cat('BMI는 ',bmi,'입니다.',sep='')


## 출력 : 파일
## 데이터 읽기, 쓰기 관련 함수
getwd()
setwd()


## csv
read.csv()
air <- read.csv('airquality.csv',header=T)
head(air)
class(air)
View(air)

write.csv()
my.iris <- subset(iris, Species=='setosa')
write.csv(my.iris, 'my_iris2.csv', row.names = F) ## F는 이름, 번호 제외하란 뜻.
View(my.iris)


## xlsx
library(xlsx)

read.xlsx()
air2 <- read.xlsx('airquality.xlsx', header=T, sheetIndex = 1, encoding='UTF-8')
head(air2)
View(air2)

write.xlsx()
my.iris2 <- subset(iris, Species=='setosa')
write.xlsx(my.iris2, 'my_iris2.xlsx',row.names = F)
View(my.iris2)


## txt 파일
read.table()
d_tab <- read.table('123.txt', sep='\t')
View(d_tab)

read.delim()
d4 <- read.delim('456.txt', header=F)
View(d4)

write.table()
num <- c(1,2,3)
char <- c('A','B','C')
log <- c(TRUE,FALSE,TRUE)
tx_data <- data.frame(num,char,log)
write.table(tx_data, file='tx_data1008.txt')
View(tx_data)


### 데이터 읽기, 쓰기 관련 함수
file()
append()
quoto()
eol()
na()
row.names()
col.names()
sink()

write.table(tx_data, file='tx_data1008.txt', append=TRUE) ## 기존 파일에 tx_data 추가
write.table(num, file='tx_data1008.txt', append=TRUE) ## 기존 파일 내용 지우고 num으로 내용 변경
write.table(tx_data, file='tx_data1008_2.txt', quoto=TRUE) ## 파일내 쌍따옴표 삭제
write.table(tx_data, file='tx_data1008_2.txt', eol='/') ## 행 구분할 항목 기재

print('Being work') ## 화면 출력
a <- 10
b <- 20
sink('result.txt',append=T) ## 파일로 출력 시작
cat('a+b= ',a+b,'\n')
sink()
cat('hello world \n') ## 화면 출력
sink('result.txt',append=T) ## 파일로 출력 시작
cat('a*b= ',a*b,'\n')
sink() ## 파일 출력 정지
print('End work') ## 화면 출력


## 예시 1)
## 문제)
air_60 <- 
air_60

## coding here ##
air_60 <- subset(airquality,Month==6)
air_60
write.table(air_60,file='air_60.txt')


## 예시 2)
## 문제)
swiss_F <- 
swiss_F

## coding here ##
swiss_F <- subset(swiss, Fertility>=90)
swiss_F
write.csv(swiss_F, 'swiss_F1008.csv')


## 예시 3)
## 문제)
sw_F <- 
sw_F
## coding here ##
sw_F <- as.matrix(read.csv('swiss_F1008.csv', header=T))
sw_F
class(sw_F)


## 예시 4)
## 문제)
swd_F <- read.csv('swiss_F1008.csv', header=T)
swd_F

## coding here ##
swd_F <- read.csv('swiss_F1008.csv', header=T)
swd_F
class(swd_F)


## 예시 5)
## 문제)
read.csv('swiss_F1008.csv', header=T)

## coding here ##
colSums(swiss['Education'])
sum(swiss$Education)

colMeans(swiss['Examination'])
mean(swiss$Examination)

sort(swiss$Agriculture)


## 예시 6)
## 문제)
rank <- 
rank

## coding here ##
rank <- order(as.matrix(swiss['Education'], decreasing=FALSE))
?order()
rank


## 예시 7)
## 문제)
swiss_F1 <- 

## coding here ##
swiss_F1 <- subset(swiss, Infant.Mortality>20)
nrow(swiss_F1)
View(swiss_F1)