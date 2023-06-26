### 2주차 복습

a <- c(1,2,3,4,5,6)
sum(a)
mean(a)
median(a)
max(a)
min(a)
var(a)
sd(a)
sort(a)
sort(a, decreasing = T)
range(a)
length(a)
a_fac <- factor(a)
a_fac
a_fac[7] <- 7
a_fac
summary(a_fac)

## 1
d <- c(100:200)
d[50]
d[seq(1,101,10)]
d[c(1:20)]

## 2
length(d)
mean(d)
sum(d<110)
sum(d[d<110])

## 3
x <- c(1:20)
y <- x[seq(3,20,3)]
y
sort(y,decreasing = T)
mean(x[-c(2:10)])

## 4
a <- c(1,6,3,8)
a <- sort(a, decreasing = F)
a
names(a) <- c('one','three','six','eight')
a

## 5
ages <- c(58,20,85)
names <- c('Tony','Ahn','Nick')
x <- list(ages,names)
names(x) <- list('numbers','names')
x

## 6
gender <- c(rep('male',5),rep('female',10))
gender_fac <- factor(gender)
gender_fac[16] <- 'male'
summary(gender_fac)



### 3주차 복습

a <- matrix(1:6, nrow = 2, ncol = 3, byrow = F)
a
b <- matrix(7:12, 2,3,F)
b
a+b
b-a
a*2
c <- cbind(a,b)
c
d <- rbind(a,b)
d
dim(d)
nrow(d)
ncol(d)
rownames(d)
colnames(d)
head(state.x77)
tail(state.x77)
str(state.x77)
unique(iris$Species) ## 종류만(factor처럼)
table(iris$Species) ## 종류별 갯수
colSums(swiss[,-4]) ## 4열 빼고 연산
colMeans(swiss[,-5]) ## 5열 빼고 연산

## 1
d <- matrix(seq(5,60,5),3,4,byrow=F)
d

## 2
d_t <- matrix(seq(5,60,5),3,4,byrow=T)
d_t
d_tt <- t(d)
d_tt

## 3
b1 <- c(4,5,7,2)
b2 <- c(19,15,12,17)
b3 <- c(20,24,28,23)
m1 <- cbind(b1,b2,b3)
m1

## 4
rich <- subset(as.data.frame(state.x77),Income>=5000)
rich

## 5
x <- c(1,2,3)
y <- c('white','blue','yellow')
z <- c(T, F, T)
df <- data.frame(x,y,z)
df

## 6
class(airquality)
air_m <- as.matrix(airquality)
class(air_m)

## 7
nrow(subset(airquality, Ozone > 120))
subset(airquality, Temp == max(airquality$Temp))

## 8
airquality['Wind']
airquality$Wind
airquality[,'Wind']



### 5주차 복습

read.csv(file = 'file.csv', header = T)
write.csv(something, 'new.csv', row.names = F, col.names = F)

library(xlsx)
read.xlsx(file = 'file.xlsx', header = F, sheetIndex = 1)
write.xlsx(something, 'new.xlsx', row.names = F, col.names = T)

read.table('file.txt', sep='\t') ## sep == 항목 구분을 탭으로 해라
read.delim('file.txt', header = T)
write.table(something, 'new.txt', row.names = T, col.names = F)
write.table(something, 'new.txt', append = T) ## 기존 파일 뒤에 추가만(기본값)
write.table(something, 'new.txt', append = F) ## 기존 내용 지우고 새로
write.table(something, 'new.txt', quoto = F) ## 파일내 따옴표 삭제(기본값 T)
write.table(something, 'new.txt', eol = '/') ## 행 내용을 /으로 구분

sink('file.txt', append = T)
cat('a','b','c')
sink() ## 세 줄 한 번에 실행

## 1
air_6_1025 <- subset(airquality, Month = 6)
air_6_1025
write.table(air_6_1025, 'air_6_1025.txt', col.names=T)

## 2
swiss_F <- subset(swiss, Fertility>=90)
swiss_F
write.csv(swiss_F, 'swiss_F_1025.csv')

## 3
sw_F <- readLines('swiss_F_1025.csv')
sw_F

## 4
swd_F <- read.csv('swiss_F_1025.csv')
swd_F

## 5
colSums(swiss['Education'])
sum(swiss$Education)
colMeans(swiss['Examination'])
mean(swiss$Examination)
sort(swiss$Agriculture)

## 6
rank <- sort(swiss$Agriculture)
rank

## 7
swd_F1 <- subset(swiss, Infant.Mortality>20)
nrow(swd_F1)
View(swd_F1)



### 6주차 복습

num <- nrow(iris)
my.Label = c()
for (i in 1:num){
  if (iris$Petal.Length[i] <= 1.6){
    my.Label[i] <- 'L'
  } else if(iris$Petal.Length[i] >= 5.1){
    my.Label[i] <- 'H'
  } else{
    my.Label[i] <- 'M'
  }
}
print(my.Label)
new_df <- data.frame(iris$Petal.Length, my.Label)
new_df

i <- 1
num <- nrow(iris)
new.Label <- c()
while (i<=num){
  if (iris$Petal.Length[i]<=1.6){
    new.Label[i] <- 'L'
  } else if (iris$Petal.Length[i]>=5.1){
    new.Label[i] <- 'H'
  } else{
    new.Label[i] <- 'M'
  }
  i <- i+1
}
print(new.Label)
new_data_frame <- data.frame(iris$Petal.Length, new.Label)
new_data_frame