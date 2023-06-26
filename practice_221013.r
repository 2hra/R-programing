### 2주차 예시

## 1)
d <- c(100:200)
d[50]
d[seq(1,110,10)]
d[c(1:20)]

## 2)
length(d)
mean(d)
sum(d<110)
sum(d[d<110])

## 3)
x <- c(1:20)
y <- x[seq(3,20,3)]
y <- sort(y, decreasing = T)
y
mean(x[-c(2:10)])

## 4)
a <- c(1,6,3,8)
a <- sort(a, decreasing = F)
a
names(a) <- c('one','three','six','eight')
a

## 5)
ages <- c(58, 20, 85)
names <- c('Tony', 'Ahn', 'Nick')
x <- list(ages, names)
names(x) <- list('numbers','names')
x

## 6)
gender <- c(rep('male',5),rep('female',10))
gender_fac <- factor(gender)
gender_fac[16] <- 'male'
summary(gender_fac)



### 3주차 예시

## 1)
d <- matrix(seq(5,60,5),nrow=3,ncol=4,F)
d

## 2) 
d_t <- matrix(seq(5,60,5),nrow=3,ncol=4,T)
d_t

## 3)
b1 <- c(1,2,3)
b2 <- c('white','blue','yellow')
b3 <- c(TRUE, FALSE, TRUE)
m1 <- cbind(b1,b2,b3)
m1

## 4)
rich_state.x77 <- subset(as.data.frame(state.x77),Income>=5000)
rich_state.x77

## 5)
x <- c(1,2,3)
y <- c('white','blue','yellow')
z <- c(TRUE, FALSE, TRUE)
df <- data.frame(x,y,z)
df

## 6)
class(airquality)
airquality_m <- as.matrix(airquality)
airquality_m

## 7)
nrow(subset(airquality, Ozone>120))
subset(airquality, Temp==max(airquality$Temp))

## 8)
airquality['Wind']
airquality[,'Wind']
airquality$Wind



### 5주차 예시

## 1)
air_6 <- subset(airquality,Month==6)
air_6
write.table(air_6,'air_6_221013.txt')

## 2)
swiss_F <- subset(swiss, Fertility>=90)
swiss_F
write.csv(swiss_F, 'swiss_F_221013.csv')

## 3)
sw_F <- readLines('swiss_F_221013.csv')
sw_F

## 4)
swd_F <- read.csv('swiss_F_221013.csv')
swd_F

## 5)
sum(swiss[,'Education'])
sum(swiss['Education'])
sum(swiss$Education)
colSums(swiss['Education']) ## colName과 함께 출력됨.
mean(swiss[,'Examination']) ## 2차원 배열이어야 한다고 , 안 쓰면 오류.
mean(swiss$Examination)
colMeans(swiss['Examination']) ## colName과 함께 출력됨.

## 6)
rank <- order()

## 7)
swd_F1 <- subset(swiss,Infant.Mortality>20)
nrow(swd_F1)
View(swd_F1)



### 6주차 예시(if, else if, ifelse, else, for, while, apply())

## +) iris에서 Petal.Length 값이 1.6 이하면 L, 5.1 이상은 H, 나머지는 M이라고 라벨을 붙이고 출력하시오.
## +) 출력된 값을 iris_label 변수로 가장 오른쪽에 추가하시오.
norow <- nrow(iris)
mylabel <- c()
for (i in 1:norow){
  if (iris$Petal.Length[i]<=1.6){
    mylabel[i] <- 'L'
  } else if (iris$Petal.Length[i]>=5.1){
    mylabel[i] <- 'H'
  } else{
    mylabel[i] <- 'M'
  }
}
mylabel
iris_label <- data.frame(iris,mylabel)  
iris_label

## 1)
for (i in 1:24){
  if (24%%i==0){
    print(i)
  }
}

## 2) 
num <-  0
sum <- 0
for (i in 1:100){
  if (i%%3==0){
    num <- num+1
    sum <- sum+i
  }
}
cat(num, sum)

## 3)
i <- 1
k <- 1
while (i<=5){
  k <- k*i
  i <- i+1
}
print(k)

## 4)
apply(iris[,c(1:4)], 1, sum)
apply(iris[,1:4],2,sum)
apply(iris[,1:4],2,max)
apply(iris[,1:4],2,min)



### decreasing = T||F >> T=행방향(가로 방향으로), F=열방향(세로 방향으로, 기본값)

### 파일 읽기, 쓰기 등 필수 함수
## read.csv('file', header=T||F) >> 필수
## write.csv(자료, 'file', row.names=T||F, col.names=T||F)
## xlsx는 마지막에 몇 번째 시트인지까지(sheetIndex=)
## txt는 read.derim('file',header=T||F)
## write.table(자료, 'file', 함수)
# ... append=T||F) T==기존에 내용 추가, F==초기화 후 내용 변경. >> 이건 필수
# ... qouto=F) == 텍파 쌍따옴표 삭제.
# ... eol=' ') == 행 사이 구분 문자 추가.

### 반복문, 조건문에 () 꼭 넣어서 구분해 주기.
### apply(자료, 1||2, 함수) >> 1=행별(가로끼리), 2=열별(세로끼리)