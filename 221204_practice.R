# ### 9주차
# ## 1)
# lgm <- function(x, y){
#   res <-  0
#   for (i in 1:max(x, y)){
#     if (x %% i == 0 & y %% i == 0){
#       res <- i
#     }
#   }
#   return(res)
# }
# lgm(10,8)
# lgm(10,20)
# 
# 
# ## 2)
# maxmin <- function(x){
#   ma <- max(x)
#   mi <- min(x)
#   return(list(max=ma, min=mi))
# }
# 
# v1 <- c(7,1,2,8,9)
# result <- maxmin(v1)
# result$max
# result$min
# 
# 
# ## 3)
# weight <- c(69,50,55,71,89,64,59,70,71,80)
# max(weight)
# min(weight)
# which.max(weight)
# which.min(weight)
# which(weight>=61 & weight<=69)
# w <- which(weight<=60)
# weight2 <- weight[w]
# weight2
# 
# 
# 
# ### 10주차
# ## 1)
# gender <- c('F','F','F','M','M','F','F','F','M','M')
# table(gender)
# 
# 
# ## 2)
# par(mfrow=c(1,2))
# gt <- table(gender)
# barplot(gt, main='gender_bar')
# pie(gt, main = 'gender_pie')
# 
# 
# ## 3)
# score <- c(90,85,73,80,85,65,78,50,68,96)
# mean(score)
# median(score)
# mean(score, trim=0.1)
# sd(score)
# 
# 
# ## 4)
# par(mfrow = c(1,2))
# hist(score, main = 'score_his', xlab = '성적', ylab = '과목의 수', las = 2)
# boxplot(score, main='score_box')
# 
# 
# ## 5)
# point <- as.numeric(iris$Species)
# color <- c('red','green','blue')
# plot(iris$Sepal.Length, iris$Sepal.Width, main = 'iris_plot', col = color, pch = point)
# 
# 
# ## 6) 
# year <- c(20144,20151,20152,20153,20154,20161,20162,20163,20164,20171,20172,20173)
# men <- c(73.9,73.1,74.4,74.2,73.5,73,74.2,74.5,73.8,73.1,74.5,74.2)
# women <- c(51.4,50.5,52.4,52.4,51.9,50.9,52.6,52.7,52.2,51.5,53.2,53.1)
# 
# plot(year, women, type='l',main='economic Participation',col='red',xlab='year',ylab='Percentage', ylim=c(50,80))
# 
# lines(year, men, col = 'blue', ylim=c(50,80))
# 
# 
# 
# ### 11주차
# ## 1)
# ds <- state.x77
# ds[2,3] <- NA
# ds[3,1] <- NA
# ds[2,4] <- NA
# ds[4,3] <- NA
# for (i in 1:ncol(ds)){
#   this_na <- is.na(ds[,i])
#   cat(colnames(ds)[i], ' ', sum(this_na), '\n')
# }
# 
# 
# ## 2)
# sum(rowSums(is.na(ds))>0)
# ds.new <- ds[complete.cases(ds),]
# head(ds.new)
# 
# 
# ## 3)
# df <- data.frame(state.x77)
# out_val <- boxplot.stats(df$Population)$out
# df$Population[df$Population %in% out_val] <- NA
# df_2 <- df[complete.cases(df),]
# rownames(df)
# rownames(df_2)
# 
# 
# ## 4)
# state.x77[order(state.x77[, "Population"], decreasing = F),]
# state.x77[order(state.x77[,'Income'], decreasing = T),]
# 
# 
# ## 5)
# mt_g <- split(mtcars, mtcars$gear)
# mt_g
# mt_wt <-  subset(mtcars, wt > 1.5 & wt < 3.0)
# mt_wt
# 
# 
# ## 6)
# set.seed(100)
# st_sam <- sample(1:nrow(state.x77), size = 20)
# st_other <- state.x77[-st_sam,]
# nrow(st_other)
# 
# 
# ## 7)
# authors <- data.frame(surname =  c('Twein','Venables','Tierney','McNeil'), nationality = c('US','Australia','US','UK')
# )
# books <- data.frame(name = c('Venables','Tierney','Ripley','McNiel'), title=c('Modern Applied Statistics', 'LISP-STAT', 'Spatil Statistics','Interactive Data Analysis'))
# 
# merge(authors, books, by.x = c('surname'), by.y=c('name'))
# 
# 
# 
# ### 12주차
# ## 2)
# symbols(swiss$Fertility, swiss$Agriculture, circles = swiss$Education, bg = 'lightgreen', xlab = 'Fertility', ylab = 'Agriculture')
# 
# text(swiss$Fertility, swiss$Agriculture, rownames(swiss), col = 'darkblue')
# 
# 
# ## 3)
# library(ggplot2)
# ggplot(mtcars, aes(x=gear)) + geom_bar() + labs(x = '기어의 수', y = '빈도수')
# 
# 
# ## 4)
# ggplot(mtcars, aes(x=mpg, y=wt, col=gear)) + geom_point(size = 2)
# 
# 
# ## 5)
# library(Rtsne)
# dup <- which(duplicated(swiss))
# dup
# tsne <- Rtsne(swiss, dims = 2, perplexity = 10)
# swiss.tsne <- as.data.frame(tsne$Y)
# ggplot(swiss.tsne, aes(x=V1, y=V2)) + geom_point(size = 3)
# 
# 
# 
# ##### 9주차 타이핑 #####
# 함수 <- function(입력값){
#   ...
#   return(반환값) 또는 print(출력값)
#   return(list(이름 = 반환값, 이름 = 반환값)) 여러개 반환 가능.
# }
# 함수(x)
# 함수$이름(x)
# 
# source('사용자 정의 함수.R')
# 사용자정의함수 파일내 함수(입력값)
# 
# which(데이터와 조건)
# which.min(데이터)
# which.max(데이터)
# 
# 
# 
# ##### 10주차 타이핑 #####
# 
# ### 단일변수
# 도수분포표 == summary와 유사
# table(데이터) 
# 
# 도수분포표 순서 정렬 == 변수 인덱스 내에 원하는 순서 벡터
# 변수 <- table(데이터)
# n변수 <- 변수[c(2,3,1,4)]
# 
# 막대그래프 
# barplot(도수분포표 데이터, main='제목', col='색')
# 
# 원그래프
# pie(도수분포표 데이터, main = '제목', col='색')
# 
# 데이터가 numeric이면 색상 벡터로 입력 가능
# colors <- c('red','yellow','green')
# pie(도수분포표 데이터, main = '제목', col=colors)
# 
# 평균
# mean(데이터)
# 
# 중앙값
# median(데이터)
# 
# 절사평균(0.1, 0.2 등 10% 비율로 기재)
# mean(데이터, trim = 0.n)
# 
# 사분위수
# quantile(데이터)
# quantile(데이터, (0:10)/10) 10%~100%
# 
# 최대, 최소, 평균 출력
# summary(데이터)
# 
# 산포
# var(데이터)
# sd(데이터)
# range(데이터)
# diff(range(데이터))
# 
# 히스토그램
# hist(데이터, main =, xlab =, ylab=, border = 막대 테두리 색, col = 막대 색, las = x축 글씨 방향(0~3), breaks = 막대 개수 조절)
# 
# 상자그림
# boxplot(데이터 y, x, main =)
# boxplot.stats(데이터)
# 
# 
# ### 다중변수
# 두 변수 사이 산점도
# plot(x축, y축, main =, xlab =, ylab =, col ='점 색', pch ='점 종류')
# 
# 산점도 x축, y축 표현 방법 세가지
# 데이터$x, 데이터$y
# 데이터[,c(x, y)]
# y~x, data = 데이터
# 
# 여러 변수 사이 산점도
# pairs(데이터, main = )
# 
# 그룹정보 있는 산점도
# point <- as.numeric(데이터$그룹정보) == 그룹내 종류를 1~ 숫자로 바꿈
# colors <- c('red','yellow','green')
# plot(데이터, main = , pch=점 모양, col = colors[point])
# 
# 상관분석
# plot(y, x, data = 데이터) == 산점도
# res <- lm(y, x, data= 데이터) == 회귀식
# abline(res) == 회귀선
# cor(x, y) == 상관계수 계산
# 
# 데이터 변수간 상관분석
# cor(데이터[,이상:이하])
# 
# 선그래프
# plot(x, y, main = , type = 그래프 종류, lyt = 선 모양, lwd = 선 두께, xlab=, ylab=, xlim = c(축 구간 하한, 상한), ylim= c(축 구간 하한, 상한), col = )
# 
# 선그래프 위에 복수 그래프
# plot(x, y2, type = , col = )
# 
# 
# 
# ##### 11주차 타이핑 #####
# 
# ### 결측값
# is.na(데이터) T, F로 여부 확인
# sum(is.na(데이터)) 결측값 개수
# sum(데이터, na.rm = T) 결측값 제외 합계
# 데이터[is.na(데이터)] <- n == 값 치환
# 변수 <- as.vector(na.omit(데이터)) 결측값 제외 후 새 벡터 생성
# 
# 열별 결측값 확인 - for문
# for (i in 1:ncol(데이터)){
#   변수 <- is.na(데이터[,i])
#   cat(colnames(x)[i], "\t", sum(변수), "\n")
# }
# 
# 열별 결측값 확인 - function & apply()
# col_na <- function(x){
#   return(sum(is.na(x)))
# }
# na_count <- apply(데이터, 2, col_na)
# 
# 행별 결측값 확인 - rowSums()
# rowSums(is.na(데이터)) 행별 결측값 개수
# sum(rowSums(is.na(데이터))>0) 결측값 포함 행 개수
# 
# 행별 결측값 확인 - complete.cases()
# 데이터[!complete.cases(데이터),] 결측값 포함 행
# 데이터[complete.cases(데이터),] 결측값 포함 행 제외
# 
# 중복값 확인
# duplicated(데이터)
# 
# 
# ### 특이값
# boxplot.stats(데이터$열)$out
# 
# 특이값 포함 행 제거
# 데이터$열[데이터$열 %in% boxplot.stats(데이터$열)$out] <- NA
# 새 변수 <- 데이터[complete.cases(데이터),]
# 
# 
# ### 데이터 정렬
# order(데이터) == 숫자, 영어 순으로 각 요소의 순서 반환
# sort(데이터) == 오름차순
# sort(데이터, decreasing = T) 내림차순
# 
# 매트릭스와 데이터프레임 정렬
# 데이터[order(데이터$열),]
# 데이터[order(데이터$열, 데이터$열),]
# 
# 
# ### 데이터 분리와 선택
# 분리: split(데이터, 데이터$구분기준 열)
# 선택: subset(데이터, 조선, select = c(출력 원하는 행))
# 
# 
# ### 데이터 샘플링과 조합
# sample(범위, size=개수, replace=F) replace=F == 비복원 추출
# 
# set.seed(100) 두 줄 같이 실행하면 계속 같은 값
# sample(1:20, size=5)
# 
# 조합(모든 경우의 수): combn(범위(또는 벡터), 개수)
# 
# 
# ### 데이터 집계와 병합
# aggregate(데이터[,], by = list(데이터$열, 여러개도 가능.), FUN = 적용 함수)
# by = 구분에 적힐 내용. list(구분 제목 = 데이터$열)
# 
# 두 데이터셋의 같은 구분끼리 병합
# merge(데이터 x, 데이터 y, by = c('구분이름'))
# merge(x, y, by=c('구분'), all=T(모든 데이터셋 다 표시), all.x=T, all.y=T)
# 
# 두 데이터셋의 구분 이름 다르면 각각 지정하여 병합
# merge(x, y, by.x=c('구분1'), by.y=c('구분2'))
# 
# 
# 
# ##### 12주차 타이핑 #####
# 
# ### 트리맵
# library(treemap)
# 
# treemap(데이터, index = c('굵은 선 구분할 종류'), vSize='크기 정할 종류', vColor = '색상 구분할 종류', type = 'value', title = '제목')
# 
# 
# ### 버블차트
# symbols(데이터$x열, 데이터$y열, circles = 데이터$원크기지정열, inches =, fg = 테두리색, bg = 원색, lwd= , xlab =, ylab = , main =)
# 
# text(데이터$x열, 데이터$y열, rownames(데이터), cex=크기, col=)
# 
# 
# ### 모자이크플롯
# mosaicplot(~x축+y축, data= , color =, main=)
# color = c( , , ) 색 여러개 지정하면 y축 그룹별로 색상
# 
# 
# ### ggplot
# library(ggplot2)
# 
# 기본구조
# ggplot(data =, aes(x= , y= )) + ...
# 
# 막대그래프
# ggplot(데이터, aes(x= , y= )) + geom_bar(stat='identity', width = , fill = '색상') + labs(x = , y = , title = , caption = ) + coord_flip()
# coord_flip()은 가로 막대
# 
# 히스토그램
# ggplot(데이터, aes(x= , fill = 막대색, color = 윤곽선 색)) + geom_histogram(binwidth = 구간 범위 지정, position = 'dodge') + theme(legend.position = 'top')
# dodge는 한 구간 여러 막대를 분리하는 것
# 
# 산점도
# ggplot(데이터, aes(x= , y= )) + geom_point(size = ) + ggtitle('제목')
# 
# 상자그림
# ggplot(데이터, aes(y= )) + geom_boxplot(fill = 색)
# ggplot(데이터, aes(y= , fill = 데이터열)) + geom_boxplot() >> 항목별 박스, 항목별 박스 색상.
# 
# 선그래프
# ggplot(데이터, aex(x= , y= )) + geom_line(col = )
# 
# 
# ### 차원 축소
# library(Rtsen)
# dup <- which(duplicated(데이터))
# 변수 <- 데이터[-dup, ]
# 변수.y <- 데이터$열[-dup]
# 
# tsne <- Rtsne(데이터, dims=원하는 차원, perplexity=10)
# df.tsne <- data.frame(tsne$Y)
# 
# ggplot(df.tsne, aes(x= , y= , color=변수.y)) + geom_point(size = )



### 9주차 예제
## 1) 
lgm <- function(x, y){
  res <- 0
  for (i in 1:max(x, y)){
    if (x %% i == 0 & y %% i == 0){
      res <- i
    }
  }
  return(res)
}

lgm(8, 10)
lgm(10,20)


## 2) 
maxmin <- function(vector){
  ma <- max(vector)
  mi <- min(vector)
  return(list(max = ma, min = mi))
}
v1 <- c(7,1,2,8,9)
result <- maxmin(v1)
result$max
result$min


## 3)
weight <- c(69,50,55,71,89,64,59,70,71,80)
which.max(weight)
which.min(weight)
which(weight>=61 & weight<=69)
w <- which(weight<=60)
weight2 <- weight[w]
weight2



### 10주차 예제
## 1)
gender <- c('F','F','F','M','M','F','F','F','M','M')
table(gender)


## 2)
par(mfrow=c(1,2))
gt <- table(gender)
barplot(gt, main = 'gender_bar')
pie(gt, main = 'gender_pie')


## 3)
score <- c(90,85,73,80,85,65,78,50,68,96)
mean(score)
median(score)
mean(score, trim=0.1)
sd(score)


## 4)
par(mfrow=c(1,2))
hist(score, main= 'score_hist', xlab = '성적', ylab = '과목의 수', las =2)
boxplot(score, main='score_box')


## 5)
point <- as.numeric(iris$Species)
color <- c('red','green','blue')
plot(iris$Sepal.Length, iris$Sepal.Width, main = 'iris_plot', pch = point, col=color)


## 6) 
year <- c(20144,20151,20152,20153,20154,20161,20162,20163,20164,20171,20172,20173)
men <- c(73.9,73.1,74.4,74.2,73.5,73,74.2,74.5,73.8,73.1,74.5,74.2)
women <- c(51.4,50.5,52.4,52.4,51.9,50.9,52.6,52.7,52.2,51.5,53.2,53.1)

plot(year, women, type = 'l',lty=1, ylim = c(50,80), main = 'Economic Participation', ylab = 'percentage', col='red')

## 7)
lines(year, men, type = 'l', col='blue')



### 11주차 예제
## 1)
ds <- state.x77
ds[2,3] <- NA
ds[3,1] <- NA
ds[2,4] <- NA
ds[4,3] <- NA
for (i in 1:ncol(ds)){
  this_na <- is.na(ds[,i])
  cat(colnames(ds)[i], '\t', sum(this_na), '\n')
}


## 2)
sum(rowSums(is.na(ds))>0)
ds.new <- ds[complete.cases(ds),]


## 3)
df <- data.frame(state.x77)
out_val <- boxplot.stats(df$Population)$out
df$Population[df$Population %in% out_val] <- NA
df_2 <- df[complete.cases(df),]
rownames(df_2)


## 4)
state.x77[order(state.x77[,'Population'])]
state.x77[order(state.x77[,'Income'], decreasing = T)]


## 5)
mt_g <- split(mtcars, mtcars$gear)
mt_g
mt_wt <- subset(mtcars, mtcars$wt > 1.5 & mtcars$wt < 3.0)
mt_wt


## 6)
set.seed(100)
sat_sam <- sample(1:nrow(state.x77), size = 20)
st_other <- state.x77[-sat_sam,]
st_other
nrow(st_other)


## 7)
authors <- data.frame(surname =  c('Twein','Venables','Tierney','McNeil'), nationality = c('US','Australia','US','UK')
)
books <- data.frame(name = c('Venables','Tierney','Ripley','McNiel'), title=c('Modern Applied Statistics', 'LISP-STAT', 'Spatil Statistics','Interactive Data Analysis'))

merge(authors, books, by.x = 'surname', by.y = 'name')



### 12주차 예제
## 2)
symbols(swiss$Fertility, swiss$Agriculture, circles = swiss[,'Education'], bg = 'lightgreen', xlab = 'Fertility', ylab = 'Agriculture')
text(swiss$Fertility, swiss$Agriculture, rownames(swiss), col = 'darkblue')


## 3)
library(ggplot2)
ggplot(mtcars, aes(x = mtcars$gear)) + geom_bar() + labs(x = '기어의 수', y = '빈도수')


## 4)
ggplot(mtcars, aes(x = mpg, y = wt, color = gear)) + geom_point(size = 2)


## 5)
library(Rtsne)
dup <- which(duplicated(swiss))
dup
tsne <- Rtsne(swiss, dims=2, perplexity = 10)
swiss.tsne <- as.data.frame(tsne$Y)
ggplot(swiss.tsne, aes(x = V1, y = V2)) + geom_point(size = 3)



### 과제 복습
## 1)
for (i in 1:100){
  if (i %% 3 == 0 & i %% 5 != 0){
    i <- '*'
  }
  cat(i, ' ')
}


## 2)
answer <- 25
number <- 0
while (answer!=number){
  number <- readline('숫자를 입력해주세요 : ')
  if (number > answer){
    print('down!')
  }else if(number < answer){
    print('up!')
  }else{
    print('정답')
  }
}


## 3)
repo <- function(string, k){
  print(rep(string, k))
}
repo('computer', 2)
repo('student', 3)


## 4)
fs <- c('spring','spring','summer','summer','summer','summer','fall','winter','winter','winter','winter')
table_fs <- table(fs)
final_fs <- table_fs[c(2,3,1,4)]
color_fs <- c('blue','red','green','yellow')
barplot(final_fs, main = 'favorite season', col = color_fs)


## 5)
life_df <- LifeCycleSavings
life_out <- boxplot.stats(life_df$ddpi)$out
life_df$ddpi[life_df$ddpi %in% life_out] <- NA
life_final <- life_df[complete.cases(life_df),]
mean(life_final$ddpi)
