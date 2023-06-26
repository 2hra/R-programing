### 2주차

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
y
sort(y, decreasing = T)
mean(x[-c(2:10)])

## 4)
a <- c(1,6,3,8)
a <- sort(a)
a
names(a) <- c('one','three','six','eight')
a

## 5)
ages <-  c(58,20,85)
names <- c('Tony','Ahn','Nick')
x <- list(ages,names)
names(x) <- c('numbers','names')
x

## 6)
gender <- c(rep('male',5),rep('female','10'))
gender_fac <- factor(gender)
gender_fac[16] <- 'male'
summary(gender_fac)



### 3주차 복습

## 1)
d <- matrix(seq(5,60,5),nrow=3,ncol=4, byrow=F)
d

## 2)
d <- matrix(seq(5,60,5), nrow = 3, ncol = 4, T)
d

## 3)
b1 <- c(4,5,7,2)
b2 <- c(19,15,12,17)
b3 <- c(20,24,28,23)
m1 <- cbind(b1,b2,b3)
m1
m2 <- cbind(b1,m1,b2)
m2

## 4)
rich <- subset(as.data.frame(state.x77), Income>=5000)
rich

## 5)
x <- c(1,2,3)
y <- c('white','blue','yellow')
z <- c(T, F, T)
df <- data.frame(x,y,z)
df

## 6)
airquality_m <- as.matrix(airquality)
class(airquality_m)

## 7)
nrow(subset(airquality, Ozone>120))
subset(airquality, Temp==max(airquality$Temp))
subset(airquality, Temp==max(airquality[,'Temp']))
subset(airquality, Temp==max(airquality['Temp']))

## 8)
airquality[,'Wind']
airquality$Wind



### 5주차 복습

## 1)
air_6 <- subset(airquality, Month==6)
air_6
write.table(air_6, file='air_6_221016.txt', row.names =F, col.names =T)

## 2)
swiss_F <- subset(swiss, Fertility>=90)
swiss_F
write.csv(swiss_F, file='swiss_F_221016.csv', row.names = T)

## 3)
sw_F <- readLines('swiss_F_221016.csv')
sw_F

## 4)
swd_F <- read.csv('swiss_F_221016.csv')
swd_F

## 5)
sum(swiss$Education)
colSums(swiss['Education'])
mean(swiss$Examination)
colMeans(swiss['Examination'])
sort(swiss$Agriculture)

## 6)
rank <- sort(swiss$Education)
rank

## 7)
swd_F <- subset(swiss, Infant.Mortality>20)
nrow(swd_F)
View(swd_F)



### 6주차 복습

## 1)
num_col <- nrow(iris)
b = c()
for (i in 1:num_col){
  if (iris$Petal.Length[i]<=1.6){
    b[i] <- 'L'
  } else if (iris$Petal.Length[i]>=5.1){
    b[i] <- 'H'
  } else{b[i] <- 'M'}
}
b

## 2)
for (i in 1:24){
  if (24%%i==0){
    print(i)
  }
}

## 3)
num <- 0
sum <- 0
for (i in 1:100){
  if (i%%3==0){
    num <- num+1
    sum <- sum+i
  }
}
cat(num,sum)

## 4)
i <- 1
k <- 1
while(i<6){
  k <- k*i
  i <- i+1  
}
print(k)

## 5)
apply(iris[,1:4],1,sum)
apply(iris[,1:4],2,max)
apply(iris[,1:4],2,min)

iris
colSums(swiss[,-3])
rowSums(iris[,-5])
View(swiss)
