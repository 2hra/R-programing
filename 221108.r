### 1교시-1) 단일변수 - 범주형 자료
mid_score <- c(90,86,80,50) ## 하나의 변수로만 자료 제작


## 아래 설명 진행할 단일 변수 범주형 자료
favorite <- c('Winter','Summer','Spring','Fall','Winter','Spring','Spring','Fall','Winter','Winter')
favorite


## table()
y <- table(favorite) ## 표 만들기
x <- table(favorite)/length(favorite)
x ## 상대 도수 분포표
y ## 도수 분포표


## barplot(table 처리된 값)
barplot(y) ## 막대그래프 작성 함수
barplot(y, main='선호하는 계절', xlab='계절', ylab='사람 수', col='yellow') 
## 메인은 제목으로 적히는 것
## xlab은 x축 이름, ylab은 y축 이름
## col은 막대그래프의 색상
?barplot ## 옵션 다 외울 필요 없다.


## 값 순서 바꾸기
y.new <- y[c(2,3,1,4)]
y.new
y
y.new

barplot(y, main='선호하는 계절', xlab='계절', ylab='학생수', col='yellow')
barplot(y.new, main='선호하는 계절', xlab='계절', ylab='학생수', col='blue')


## pie(table 처리된 값)
pie(y)
pie(y, main='선호하는 계절', xlab='계절', clockwise = T)
pie(y.new, main='선호하는 계절', xlab='계절', clockwise = F, radius = 1)
## clockwise는 시계, 반시계 방향, radius는 표의 크기(기본 0.8, 1까지 보임)
?pie ## 옵션 다 외울 필요 없다.


## table, pie, names 예시
favorite.color <- c(1,2,3,3,2,2,2,2,1,1,1,1,2,2,3,3,3,1)
ds.color <- table(favorite.color)
barplot(ds.color)

colors1 <- c('green','red','blue') ## 색상 이름 지정
barplot(ds.color, col=colors1) ## 도표의 색상을 벡터로 입력

names(ds.color) <- colors1 ## 색상 벡터로 이름 지정
barplot(ds.color, col=colors1, main='선호하는 색상',xlab='색상',ylab='학생수')

ds.color
pie(ds.color, col=colors1, main='선호하는 색상')



### 1교시-2) 단일변수 - 연속형 자료(평균, 중앙값, 절사평균, 사분위수, 산포, 분산, 표준편차)
weight <- c(70,80,60,78,82)
weight.heavy <- c(weight, 150)
weight.heavy

mean(weight)
mean(weight.heavy) ## 150이라는 큰 차이가 나는 특이값 때문에 평균 차이 많이 남

median(weight) ## 그럴 땐 미디언이 최선책
median(weight.heavy) ## 특이값의 영향을 그나마 덜 받아서 크게 차이 안 남

mean(weight, trim = 0.2) ## 절사평균
mean(weight.heavy, trim = 0.2)

quantile(weight.heavy) ## 사분위에 해당하는 숫자 나타냄
summary(weight.heavy) ## 사분위, 최소, 최대, 평균, 중앙값 모두 나타냄. 가장 중요

quantile(weight.heavy, (0:10)/10) ## 10등분으로 표시

var(weight.heavy) ## 
sd(weight.heavy)
mean(weight.heavy)
range(weight.heavy) ## 최소, 최대 한 번에 출력
diff(range(weight.heavy))
min(weight.heavy)
max(weight.heavy)


## 히스토그램, hist()
x <- cars[,2]
x
?hist
hist(x)
hist(x, main='제동거리', xlab='제동거리', ylab='빈도수', border = 'red', col='green', las=3)
## las는 x, y축의 값 방향 정렬
## breaks는 막대의 갯수를 조절하는 것. 여기선 값이 적어서 다 적용이 안 됨.


## boxplot()
boxplot(x)
## 굵은 선이 중앙값
## 실선은 최소, 최대값
## 동그라미는 특이값(아웃라인)
## 회색 네모 아래는 사분위 Q1, 네모 위는 Q3
boxplot.stats(x) ## 정보 요약해서 출력



## 예시
a <- c(1,4,5,2,8,9,6,3)
b <- c(3,4,1,12,18,29,16,13)
c <- c(10,14,1,1,3,5,6,0)
df <- data.frame(a,b,c)
df
boxplot(df) ## 데이터 프레임 각각의 박스를 그릴 수 있음


View(iris)
boxplot(iris$Petal.Length~Species, data=iris) ## 물결 앞은 y, 뒤는 x축으로 생성.



### 2교시-1) 다중변수(산점도) 범주형 자료
## 2개 이상의 변수로 도표 생성

## 산점도, plot(,)
x <- cars$speed
y <- cars$dist
plot(x,y, main='속도에 대한 제동거리', xlab='속도',ylab='제동거리',col='red', pch=19)
## pch는 점의 모양을 바꾸는 것. 형태 모두 암기할 필요는 없음.
## 그림 보고 맞는 코드 짤 줄은 알아야 함.
plot(cars[,c('speed','dist')])
plot(dist~speed, data=cars) ## 열 이름만 적으면 data 지정 필요
plot(cars$dist~cars$speed, col='green', pch=20) ## 자료$열 적으면 data= 불필요


## 산점도, pairs()
View(mtcars)
vars <- c('mpg','wt','disp','drat')
target <- mtcars[,vars]
View(target)
pairs(target) ## 위 네 가지 자료에 대해 두 가지씩 비교해 x, y 관계를 나타냄


## 예시
x <- iris[,3:4]
x
View(x)
iris$Species
point <- as.numeric(iris$Species) ## 문자열 자료를 종류별로 숫자로 바꿔 버림
point

colors <- c('red','green','blue')
plot(x, col=colors[point], pch=point) ## 모양과 색상을 종류별로 다르게 나타냄
## plot은 반복문으로 하나씩 찍어내는 건데 빠른 속도로 한 번에 출력되는 것처럼 보임.


## 상관분석(우상향 그래프=양, 우하향 그래프=음, 직선 아닌 그래프=관계가 없다)
## 상관계수(피어슨 상관계수= -1<r<1, 1이나 -1에 가까울 수록 의미있는 값. 0에 가까울수록 의미x)

## 상관계수 예시 1
plot(cars$dist~cars$speed, pch=20) ## 해당 자료와 동일한 값들로 아래 진행
res <- lm(cars$dist~cars$speed)
res ## 아래처럼 값 표시
#Call:
#  lm(formula = cars$dist ~ cars$speed)

#Coefficients:
#  (Intercept)   cars$speed  
#-17.579        3.932  
abline(res) ## 직선 그리는 함수
cor(cars$speed,cars$dist) ## 0.8068949 >> 양의 상관관계

## 상관계수 예시 2
res1 <- lm(iris$Petal.Width~iris$Petal.Length)
res1
abline(res1)
cor(iris$Petal.Length, iris$Petal.Width) ## 0.9628654 >> 더욱 양의 상관관계가 있다
cor(iris[,1:4])



### 2교시-2) 다중변수 연속형 자료
x <- 1:12
y <- c(3,5,7,1,10,4,2,5,7,10,11,12)
plot(x,y)
plot(x,y,type='s') 
## type = 'l' == 점 대신 선으로. 'b', 'o', 's' 있는데 암기까진 x
## lty = 점선, 실선 등의 선 종류. 그림 암기는 x.

z <- c(1,2,4,10,3,7,1,3,5,10,7,5) ## 그래프 겹쳐 그리고 싶을 때
lines(x,z, col='red') ## 기존 그래프, 추가할 자료. 다른 색으로 표시해 주는 게 좋음.



### 예시 1)
gender <- c('F','F','F','M','M','F','F','F','M','M')
table(gender)


### 예시 2)
gender <- c('F','F','F','M','M','F','F','F','M','M')
par(mfrow=c(1,2)) ## 그림 두 개 그리겠다는 것. 중요하지 않음.
gt <- table(gender)
gt
barplot(gt, main='gender_bar')
pie(gt, main='gender_pie')


### 예시 3)
score <- c(90,85,73,80,85,65,78,50,68,96)
mean(score)
median(score)
mean(score, trim=0.1)
sd(score)


### 예시 4)
score <- c(90,85,73,80,85,65,78,50,68,96)
hist(score, main='score_hist', xlab='성적',ylab='과목의 수',las=2)
boxplot(score, main='score_box')


### 예시 5)
point <- as.numeric(iris$Species)
color <- c('red','green','blue')
plot(iris$Sepal.Length, iris$Sepal.Width, main='iris_plot',col=color,pch=point)
## 또는 col=color[point]


### 예시 6)
year <- c(20144,20151,20152,20153,20154,20161,20162,20163,20164,20171,20172,20173)
men <- c(73.9,73.1,74.4,74.2,73.5,73,74.2,74.5,73.8,73.1,74.5,74.2)
women <- c(51.4,50.5,52.4,52.4,51.9,50.9,52.6,52.7,52.2,51.5,53.2,53.1)

plot(year, women, type='l',main='economic Participation',col='red',xlab='year',ylab='Percentage', ylim=c(50,80))
lines(year, men, col='blue',ylim=c(50,80))
## 순서 바꿔서 적어도 됨.
## ylim=c(50:80) == y축의 범위를 지정하는 것.
## xlim도 가능함.