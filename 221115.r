## 오늘, 다음 주 정상 수업, 29일은 녹강 특강, 6일 강의는 고민 중.
## 데이터 전처리 여섯 종류 꼭 기억하기.
## 데이터 전처리는 초기 확보한 데이터를 정제, 가공하여 적합한 데이터 확보하기 위한 과정



### 1교시) 결측값 (missing value)
View(airquality) ## Ozone에 있는 NA도 결측값.


## 결측값 처리 예시 1)
x <- c(1,2,3,NA,5) ## NA가 결측값이라는 것.
mean(x) ## NA 출력. 오류 발생
is.na(x) ## is.numeric처럼 na가 있는지 확인하는 것.
sum(is.na(x)) ## NA의 갯수. (TURE == 1, FALSE == 0)


## 결측값의 처리 1) 값 제외 후 데이터 분석
mean(x, na.rm = TRUE) ## NA를 제외하고 함수 진행하도록.
sum(x, na.rm=T) 


## 결측값의 처리 2) 추정하여 값 대체 후 데이터 분석
is.na(x)
x[is.na(x)] <- 0 ## NA값이 TRUE인 요소를 0으로 값 변경. 유의미한 0값을 활용해야 한다면 겹치지 않는 값으로 대체해야 함.
x

## 결측값의 처리 3) NA 값을 아예 삭제 후 데이터 분석
y <- as.vector(na.omit(x)) ## na.omit이 NA값 삭제하는 함수
y ## as.vector로 기존과 같은 형태로 만들 수 있음.



## 결측값 처리 예시 2) 
## airquality의 행별, 영별 NA의 갯수 알아보기


## 방법 1) for문(열별로)
for (i in 1:ncol(airquality)){ ## ~까지는 ncol 함수로 불러오기
  n <- is.na(airquality[,i]) ## 모든 행, i열에 NA가 있는지 T, F로 구분
  cat(colnames(airquality)[i],' ',sum(n),'\n') ## 열 이름 기재, 띄어쓰기, 갯수(T인 요소 합계), 엔터
}
# Ozone 	 37 
# Solar.R 	 7 
# Wind 	 0 
# Temp 	 0 
# Month 	 0 
# Day 	 0 


## 방법 2) apply 함수 이용 <- apply(데이터, 1(행) or 2(열), 함수)
calculate_na <- function(a){
  x <- sum(is.na(a))
  return(x)
}  
apply(airquality, 2, calculate_na)


## 방법 3) rowSums 함수 이용(행별로)
x <- is.na(airquality)
x
rowSums(is.na(airquality)) ## 행별 NA의 갯수
rowSums(is.na(airquality)) > 0
sum(rowSums(is.na(airquality)) > 0) ## 결측값 있는 행이 42줄이라고 출력
sum(is.na(x))


## 방법 4) complete.cases() 함수 이용(행별로)
complete.cases(airquality) ## NA가 없는 행 출력
!complete.cases(airquality) ## 위와 반대로 결과 나옴.

z <- airquality[complete.cases(airquality),]
z
nrow(z)

zz <- airquality[!complete.cases(airquality),]
zz
nrow(zz)



### 1교시) 특이값 (outlier)
## 특이값 찾기(논리적으로 이상한 것, 상식 벗어난 것, 상자그림을 통해 특이값을 찾아본다.)


## 특이값 예시 1) 특이값 찾아내는 방법 == boxplot.stats(데이터$열)$out
x <- as.data.frame(state.x77)
boxplot(x$Income)

boxplot.stats(x$Income) ## $out이 아웃라이어를 말함.
boxplot.stats(x$Income)$out ## 상자 안 그려도 값 바로 알아낼 수 있음.


## 특이값 예시 2) 특이값 없애는 방법
y <- boxplot.stats(x$Income)$out ## 6315
z <- x$Income ## 전체 데이터 중 Income만 변수에 저장.
z[z %in% boxplot.stats(x$Income)$out] <- NA ## 특이값은 바로 값 제거 안 됨. 특이값을 결측값으로 바꾸고 삭제할 것.
## 특이값이 여러개일 수도 있음. 그래서 %in%는 해당 값의 포함 관계가 있는 요소를 찾아냄

a <- x[complete.cases(z),] ## line 87의 전체 데이터[NA 포함하지 않은 행, 전체 열]
a
View(a)


### 2교시) 데이터 정렬
## 2-1-1) order()
a <- c('x','a','c','p') ## a부터 z까지 순서로.
order(a) ## 벡터의 순서에 따른 순번을 반환함
b <- c(1,2,5,2)
order(b) ## 같은 수는 뒤에 적힌 요소가 순서 밀림.
c <- c('x','a','c','p',1,2,3,4)
order(c) ## 숫자가 더 순서 빠름.


## 2-1-2) sort()
a <- c('x','a','c','p',1,2,3,4)
b <- sort(a)
b
c <- sort(a, decreasing = T)
c


## 2-1-3) 2차원 데이터 정렬
order(iris$Sepal.Length) ## Sepal.Length 열의 값이 가장 낮은 데이터의 행 순서로 정렬
View(iris) ## 같은 값이 있다면 다음 열의 값을 비교해서 작은 값이 먼저 오도록 함.

X <- iris[order(iris$Sepal.Length),] ## order로 행 호출했으니 인덱싱의 행에 입력.
View(X)

Z <- iris[order(iris$Sepal.Length, decreasing = T),]
View(Z)

Y <- iris[order(iris$Species,-iris$Petal.Length, decreasing = T),]
View(Y)
## order에 조건 여러개 적용 가능한데, 첫 번째 조건으로 정렬해서 같은 값은 두 번째 조건으로 정렬함.
## 조건에 -가 붙으면 해당 조건은 decreasing 설정의 반대로 정렬한다.
## 위와 같은 경우는 Sepecies는 내림차순, Petal.Length는 오름차순.



### 2교시) 데이터 분리와 선택
## 2-2-1) 열의 값을 기준으로 분리. 그룹화 == split()
x <- split(iris, iris$Species)
View(x)
summary(x) ## 분리 결과 요약
x$setosa


## 2-2-2) 데이터 선택 == subset()
x <- subset(iris, Sepal.Length>7.6, select = Petal.Length)
x ## select는 조건에 해당하는 데이터의 어떠한 열만 출력하도록 조건을 더하는 것.
y <- subset(iris, Sepal.Length>7.6, select = c(Petal.Length, Petal.Width))
y ## 여러 열을 출력하려면 벡터로 만들어 줘야 함.



### 2교시) 데이터 샘플링 == 샘플 추출하는 것. 
## 2-3-1) sample()
a <- 1:100
sample(a, size = 5) ## 범위내 숫자 랜덤 출력.
sample(a, 10) ## size 생략 가능.
sample(a, 10, replace = T) ## 이미 출력된 걸 다시 출력할 수 있게. 안 되게 하려면 F.


## 2-3-2) set.seed()
a <- 1:100
set.seed(190)
sample(a, 8, replace = F) 
## set.seed() 숫자에 랜덤 값을 저장. 
## set.seed()에 지정된 숫자를 같이 실행하면 동일한 숫자를 계속 발생시킴.


## 2-3-3) 데이터 조합 combn(데이터, 조합할 데이터 갯수)
combn(1:10,2) ## 해당 조건으로 만들 수 있는 모든 조합을 알려줌.



### 2교시) 데이터 집계와 병합
## 2-4-1) 데이터 집계 == aggregate()
agg <-  aggregate(iris[,-5], by=list(iris$Species), FUN=mean)
## aggregate(데이터, 그룹 만들 조건, 함수)
## iris[모든 행, 5번째 열 제외], iris의 Sepicies 열의, 평균
View(agg)

agg1 <-  aggregate(iris[,-5], by=list(오늘=iris$Species), FUN=mean)
agg1 ## by=list(구분 이름=그룹 만들 조건) 으로 구분 이름 설정 가능

View(mtcars)
agg2 <- aggregate(mtcars, by=list(cyl=mtcars$cyl, vs=mtcars$vs), FUN=max)
## by=list 내 조건의 모든 조합으로 함수 적용.
agg2


## 2-4-2) 데이터 병합 == merge()
x <-  data.frame(name=c("a","b","c"), math=c(90,80,40))
y <-  data.frame(name=c("a","b","d"), korean=c(75,60,90))
z <-  merge(x,y, by=c("name")) ## by= 조합의 공통 요소만 병합.
## merge(데이터 1, 데이터 2, by = 병합 기준)
View(z)
zz <- merge(x,y, by=c('name'), all.x=T) ## all.x는 병합기준에 해당하지 않는 데이터 1, x 데이터의 요소를 포함하여 출력. 데이터 2인 y로 바꾸면 d가 추가됨.
View(zz)
zzz <-merge(x,y, by=c('name'), all=T) ## 그냥 all로 입력하면 데이터 1,2 모든 값을 호출.
View(zzz)

x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(sname=c("a","b","d"), korean=c(75,60,90))
z <- merge(x,y, by.x=c("name"), by.y=c("sname"))
## by.x : x(첫 번째 데이터)의 병합 기준 열의 이름 지정
## by.y : y(두 번째 데이터)의 병합 기준 열의 이름 지정
## by.x와 by.y 기준에 일치하는 값을 병합하는 것.
View(z)



### 예시 1)
ds <- state.x77
ds[2,3] <- NA
ds[3,1] <- NA
ds[2,4] <- NA
ds[4,3] <- NA

for (i in 1:ncol(ds)){
  this_na  <-  is.na(ds[,i])
  cat(colnames(ds)[i],'\t',sum(this_na),'\n')
}


### 예시 2)
ds <- state.x77
ds[2,3] <- NA
ds[3,1] <- NA
ds[2,4] <- NA
ds[4,3] <- NA

sum(rowSums(is.na(ds))>0)
ds.new <- ds[complete.cases(ds),]
head(ds.new)


### 예시 3)
df <- as.data.frame(state.x77)
out_val <- boxplot.stats(df$Population)$out
df_2 <- df[complete.cases(df),]
rownames(df)
rownames(df_2)


### 예시 4)
state.x77d <- as.data.frame(state.x77)
state.x77[order(state.x77d$Population)]
state.x77[order(state.x77d$Income, decreasing = T)]


### 예시 5)
mt_g <- split(mtcars, mtcars$gear)
mt_g

mt_wt <- subset(mtcars, mtcars$wt>1.5 & mtcars$wt<3.0)
mt_wt


### 예시 6)
set.seed(100)
st_sam <- sample(1:nrow(state.x77), 20)
st_other <- state.x77[-st_sam,] 
## 지정 행을 뺀 나머지를 출력할 땐 -를 붙여 준다.
st_other


### 예시 7)
authors <- data.frame(surname = c('Twein','Venables','Tierney','McNeil'), Nationality=c('US','Australia','US','UK'))
books <- data.frame(name=c('Vebables','Tierney','Ripley','McNeil'), title=c('Modern Applied Statistics ...','LISP-STAT','Spatial Statistics','Interactive Data Analysis'))

merge(authors, books, by.x = c('surname'), by.y=c('name'))