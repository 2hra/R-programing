rm(list=ls())

### 3주차, 매트릭스와 데이터프레임
## 저번 주 내용
score <- c(100, 90, 40)
weight <- list(50, 60, 70)

### 매트릭스와 데이터프레임

### 매르릭스 > 자료형 같은 것만 있음 like 벡터
### 데이터프레임 > 문자+숫자 같이 있을 수 있음 like 리스트

## 행(row)/관측값: 가로
## 열(column): 세로
## 셀(cell): 사각형 영역

state.x77 ## 미국 77개 주
View(state.x77) ## 괄호 안을 보여 달라는 것
View(iris) ## 꽃에 대한 것. 기본적인 자료가 R프로그래밍은 많은 편
?iris

a <- matrix(1:20, nrow = 5, ncol = 4, byrow = F) 
## 값 20개(이상:이하), 5줄, 4칸, 정렬 방향. 
## 정렬 방향 따로 입력 안 하면 세로 정렬이 기본.
## 줄*칸=값 갯수 일치하지 않으면 오류 발생.
## nrow, ncol, byrow 명칭 생략 가능.
View(a)

b <-  matrix(1:30, 6, 5)
View(b)

z <-matrix(1,3,4) ## 값 하나만 적으면 숫자 반복된 매트릭스
## 값에 벡터, 리스트 등 넣을 수 있다. 
## 괄호 안에 안 넣고 위에 선언하고, 변수명 넣어도 됨
View(z)

### 매트릭스 행, 열 불러오기
dim(b) ## 결과: 6 5
dim(b)[1] ## 6 5의 첫 번째 값 6
nrow(b) ## 6
ncol(b) ## 5

### 매트릭스 값 불러오기 ★ 무조건 대괄호로 값 불러오는 것
b[3,] ## 매트릭스명(줄,칸)
b[3,5]
b[2,4]
b[,5]
b
b[,] ## 위와 같음. 전체값 불러옴.
length(b) ## 전체 갯수, 길이 등

### cbind, rbind로 매트릭스 만들기(데이터프레임도 동일함)
## cibnd
x <- 1:3
y <- 4:6
t <- 7:9
z <- cbind(x,y,t) ## 가로로 붙이는 것
z
## rbind
p <- rbind(x,y,t) ## 세로로 붙이는 것
p

x <- 1:3
y <- 4:6
m1 <- cbind(x,y)
m2 <- cbind(m1,x) ## 매트릭스에 매트릭스 또는 벡터를 넣을 수 있음.
m2

z <- matrix(1:15,3,5)
z[2,1:3]
z[1:3,2]
z[c(1,3),1:3]
z[c(1,3),3:5]

### 행, 열 이름 붙이기. 데이터프레임도 동일함.
score <- matrix(c(90, 85, 69, 87, 29, 30),3,2)
score
rownames(score) <- (c("hyora","hello","zoo"))
colnames(score) <- (c("math", "english"))

score["hello",]
score[2,] ## 동일한 결과
score[,"math"]



### 데이터프레임
v1 <- c("Seoul","Tokyo","Washington")
v2 <- c(1,3,2)
v3 <- c("KOR",'JPN','USA')
a <- data.frame(v1,v2,v3)
a
View(a)
a$v1 ## 리스트처럼 해당 이름의 값들이 나옴.
str(a)
a <- data.frame(city=v1,rank=v2,nation=v3) ## 이름 재설정 가능


### 매트릭스를 데이터프레임으로 가지고 오기
z <- matrix(1:15,3,5)
z
y <-  as.data.frame(z)
y
str(z)
str(y)
str(iris)

### iris를 이용해 데이터프레임 익히기 >> 값 보는 건 매트릭스와 동일. 대괄호
iris
View(iris)
iris[2,3]
iris[2,5] ## 5에는 펙터로 되어있다
iris[2,"Species"] ## 위와 같음
iris[2,"Petal.Width"] ## 이름으로 불러와도 됨
iris[,3] ## 해당 행의 모든 값 출력



### 매트릭스와 데이터프레임 산술연산 가능. 행, 열 크기가 같아야 가능.

### 매트릭스, 데이터프레임 동일 함수
dim()
nrow()
ncol()
rownames()
colnames(iris)
head(iris) ## 위의 여섯 줄. 형태 보고 싶을 때.
tail(iris) ## 아래 여섯 줄. 아래 출력에 1:6 나와도 그냥 출력 시에 나오는 것. 실제 1:6줄 아님.

str(iris) ## 정보 보여주는 것.
unique(iris[,5]) ## 종류 보기. 중복 제거됨
table(iris[,5]) ## 펙터 summary와 동일한 기능. 종류별 갯수 세기

colSums(iris[,-5]) ## 끝에서 몇 번째 == -숫자
colMeans()
rowSums()
rowMeans()
t() ## 행 열 바꾸어 출력

class(a) ## 매트릭스인지, 데이터프레임인지 자료형
is.data.frame(a) ## is.자료형(변수명) >> 이 자료형 맞는지 확인
is.matrix(a)

c <- as.matrix(a) ## 데이터프레임을 매트릭스로
c
class(c)

d <- as.data.frame(c) ## 매트릭스를 데이터프레임으로
d
class(d)

### 데이터프레임 전용 함수
subset() ## 조건문. 필수로 알아야 함.
a <- subset(iris, Sepal.Width > 4.0 & Sepal.Length >5.0) ## 매트릭스/데이터프레임, 조건 기재.
a ## 몇 번째 줄이었는지 원래 줄까지 나옴.
nrow(a)
View(a)



### 예제 1)
d <- matrix(seq(5,60,5),3,4)
d

### 예제 2)
d_t <- matrix(seq(5,60,5),nrow=3,ncol=4,byrow=T)
d_t

### 예제 3)
b1 <- c(4,5,7,2)
b2 <- c(19,15,12,17)
b3 <- c(20,24,28,23)
m1 <- cbind(b1,b2,b3)
m1

### 예제 4)
rich_state.x77 <- subset(as.data.frame(state.x77),Income>=5000)
rich_state.x77
View(rich_state.x77)

### 예제 5)
x <- c(1,2,3)
y <- c('white', 'blue', 'yellow')
z <- c(TRUE, FALSE, TRUE)
df <- data.frame(x,y,z)
df

### 예제 6)
class(airquality)
airquality_m <- as.matrix(airquality)
class(airquality_m)

### 예제 7)
nrow(subset(airquality, Ozone>120))
subset(airquality, Temp == max(airquality[,"Temp"]))
## 온도가 최대값(데이터프레임[행,열(기온값)])과 같을 때
subset(airquality, Wind == max(airquality[,"Wind"]))
## 위 문제를 바람으로 바꿔서 출력해 본 것

### 예제 8) 바람의 값 모두 출력하기기
airquality[,"Wind"]
airquality$Wind