### 14주차 - 과제 풀이, 전체 복습
## 객관식, 주관식(코드 빈칸 채우기) 20문제 예정
## 조건문, 반복문부터 시험범위

### 과제 풀이(출력만 같으면 된다)
for (i in 1:100){
  result <- ifelse(i%%3==0 & i%%5!=0, '*', i)
  cat(result, ' ')
}

answer <- 25
number <- 0
while (answer != number){
  number <- readline("숫자를 입력해주세요 : ")
  if (answer > number){
    print("up!")
  } else if (answer < number){
    print("down!")
  } else {
    print("정답")
    break
  }
}

repo <- function(string, k){
  new_string <- rep(string, times=k)
  return(new_string)
}
repo("computer", 2)
repo("student", 3)

ddpi_data <- LifeCycleSavings$ddpi
ddpi_data[ddpi_data %in% boxplot.stats(LifeCycleSavings$ddpi)$out] <- NA
new_ddpi <- LifeCycleSavings[complete.cases(ddpi_data),]
mean(new_ddpi$ddpi)



### 전범위 복습
x <- c(1,2,3,4:10) ## 벡터
y <- seq(from=1, to = 10, by=2) ## 벡터 간격
y
z <- rep(1, times=5) ## 반복 횟수
names(z) <-c("a","b","c","d","e") ## 값 위에 이름 지정
z
x[-c(3:7)]
condi <- x>1 & x<5
x[condi]

## 도수분포표는 무조건 테이블 처리되어야 가능함.
## 시각화는 무조건 데이터프레임으로 바꿔야 함.

## 리스트
x <- list(major="datascience",name="tony", score=96, check=TRUE)
x[[1]] ## 대괄호 두 번
x$name
y <- list("datascience","tony", 96,TRUE)
y

## 팩터 - 새로운 값 추가 불가
bt <- c('A','B','B','O','AB','A')
by_fac <- factor(bt)
summary(by_fac)

## 1차원 - 벡터, 리스트, 팩터
## 2차원 - 매트릭스, 데이터프레임

iris == 데이터프레임
state.x77 == 매트릭스

a <- matrix(1:12, nrow = 3, ncol = 4) ## 행, 열, 열방향
a
b <- matrix(1:12, nrow = 3, ncol = 4, byrow=T) ## 행방향
b

cbind(1:3, 4:6)
rbind(1:3, 4:6)

rownames(x) <- c(행 개수만큼 이름 지정)
colnames(x) <- c(열 개수만큼 이름 지정)

city <- c('Seoul', 'Tokyo',' Washington')
rank <- c(1,3,2)
df <- data.frame(city, rank)
df
class(df)
m_df <- as.matrix(df)
class(m_df)
as.character(3)
subset(iris, Sepal.Length > 5.0 & Sepal.Width < 4.0) ## subset 열 조건에서는 "열"이 아니고 그냥 열이름만.

cat('옆으로', '쭉 이어서', '\n', '두 개 요소 이상 출력', ' ')
print('a')
read.csv(파일명, header = )
write.csv(데이터, 파일명, row.names = )
read.table('파일명', sep=열 구분 기준)
write.table(데이터, '파일명', append= T(는 기존 데이터 뒤에 추가, F는 데이터 새로 쓰기))



### 시험범위
## 조건문
if(조건){
  ...
}else if(조건){
  ...
}else{ ## else 필수 아님.
  ...
}

ifelse(조건, 참 실행문, 거짓 실행문)


## 반복문
for(조건){
  ...
}

i <- 0 || 1
while(조건){
  ...
  i <- i+1
}

break = 반복문 중단
next = 반복문 다음 실행 안 하고 시작점으로 돌아감

apply(데이터, 행방향 = 1 || 열방향 = 2, 함수)


## 함수
함수명 <- function(조건){
  ...
  return(...) ## 여러 요소 반환 시 return(list(a = 지역변수, b = 지역변수))
}

myfunc <- function(x, y) {
  val.sum <- x+y
  val.mul <- x*y
  return(list(sum = val.sum, mul = val.mul))
}
result <- myfunc(5, 8)
result$sum
result[[2]]

which(...)


## 데이터 탐색
도수분포표 table() 처리 후 그래프 그림.
barplot(), pie() 등

beers <- c(5,2,9,8,3,7,3,5,3,5)
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,0.06,0.02,0.05)
tbl <- data.frame(beers,bal)

plot(bal~beers, data=tbl) # 산점도
res <- lm(bal~beers,data=tbl) # 회귀식 도출
abline(res) # 회귀선 그리기
cor(beers,bal) # 상관계수 계산


## 데이터 전처리
## 1) 결측값 - 열별로, 행별로 찾는 방법 분명히 기억
for문, apply() == 열별로

새변수 <- 데이터[!complete.cases(데이터), ] ## NA 있는 거
새변수 <- 데이터[complete.cases(데이터), ] ## NA 없는 거

## 아래 세 줄은 달달 외우기
out.val <- boxplot.stats(st$Income)$out # 특이값 추출
st$Income[st$Income %in% out.val] ← NA # 특이값을 NA로 대체
newdata <- st[complete.cases(st),] # NA가 포함된 행 제거

## order(), sort()
a <- c('a','b','c',1,5,2)
order(a) ## 순서 반환
order(iris$Sepal.Length) ## 순서 반환
iris[order(iris$Sepal.Length),] ## 인덱스로 order 반환된 순서 적용해서 값 반환

## 병합 merge()
merge(a, b)
merge(a, b, all.x = T)


## 데이터 시각화
library(ggplot2)
ggplot(데이터, aes(x = , y = )) + geom_bar() + geom_point() + labs(x = , y = , ...)

## 차원축소
library(Rtsne)
x <- Rtsne(ds, dims= 차원수, perplexity=10)
result <- x$Y ## $Y 무조건.
res <- data.frame(result) ## 데이터프레임으로 무조건 변경
ggplot(res,aes(x=X1, y=X2, color=기준별로 색상 구분)) + geom_point(size=10) + labs(x='xx', y='yy')

## 각 파트당 세네 문제씩. 중요한 부분이 뭔지 생각해 보기.