### 2주차 예시 복습

## 예시 1)
# 문제
d <- c(100:200)
# coding here #
d[50]
d[seq(1,110,10)]
d[c(1:20)]

## 예시 2)
# 문제
d <- c(100:200)
# coding here #
length(d)
mean(d)
sum(d<110)
sum(d[d<110])

## 예시 3)
# 문제
x <- c(1:20)
# coding here #
y <- x[seq(3,20,3)]
y
sort(y, decreasing = T)
mean(x[-c(2:10)])

## 예시 4)
# 문제
a <- c(1,6,3,8)
# coding here #
a <-  sort(a)
a
names(a) <- c('one','three','six','eight')
a

## 예시 5)
# 문제
ages <- c(58,20,85)
names <- c('Tony','Ahn','Nick')
x <- list(ages,names)
# coding here #
names(x) <- c('numbers', 'names')
x

## 예시 6)
# 문제
gender <- c(rep('male',5),rep('female',10))
gender_fac <- factor(gender)
# coding here #
gender_fac[16] <- 'male'
summary(gender_fac)



### 3주차 예시 복습

## 예시 1)
# coding here #
d <- matrix(seq(5,60,5),nrow=3,ncol=4,F)
d

## 예시 2)
# 문제
d <- matrix(seq(5,60,5),nrow=3,ncol=4,F)
# coding here #
d_t <- matrix(c(seq(5,60,5)),nrow=3,ncol=4,T)
d_t

## 예시 3)
# 문제
b1 <- c(4,5,7,2)
b2 <- c(19,15,12,17)
b3 <- c(20,24,28,23)
# coding here #
m1 <- cbind(b1,b2,b3)
m1

## 예시 4)
# 문제
# coding here #
rich_state.x77 <- subset(as.data.frame(state.x77),Income >= 5000)
rich_state.x77

## 예시 5)
# 문제
x <- c(1,2,3)
y <- c('white','blue','yellow')
z <- c(TRUE, FALSE, TRUE)
# coding here #
df <- data.frame(x,y,z)
df

## 예시 6)
# 문제
class(airquality)
# coding here #
airquality_m <- as.matrix(airquality)
airquality_m

## 예시 7)
# 문제
# coding here #
nrow(subset(airquality, Ozone>120))
subset(airquality, Temp==max(airquality$Temp))
subset(airquality, Temp==max(airquality['Temp']))
subset(airquality, Temp==max(airquality[,'Temp']))

## 예시 8)
# 문제
# coding here #
airquality['Wind'] # 데이터 프레임
airquality[,'Wind'] # 벡터
airquality$Wind # 벡터



### 5주차 예시 복습

## 예시 1)
# 문제
# coding here #
air_6 <- subset(airquality, Month == 6)
air_6
write.table(air_6, file='air_6.txt', row.names=F)

## 예시 2)
# 문제
# coding here #
swiss_F <- subset(swiss, Fertility>=90)
swiss_F
write.csv(swiss_F, file='swiss_F.csv')

## 예시 3)
# 문제
# coding here #
sw_F <- readLines('swiss_F.csv')
sw_F

## 예시 4)
# 문제
# coding here #
swd_F <- read.csv('swiss_F.csv', header=T)
swd_F

## 예시 5)
# 문제
# coding here #
colSums(swiss['Education'])
sum(swiss$Education)
colMeans(swiss['Examination'])
mean(swiss$Examination)
sort(swiss$Agriculture)

## 예시 6)
# 문제 생략

## 예시 7)
# 문제
# coding here #
swd_F1 <- subset(swiss, Infant.Mortality>20)
swd_F1
View(swd_F1)