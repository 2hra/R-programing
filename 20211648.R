## 분반 : R프로그래밍(02)
## 학번 : 20211648
## 이름 : 이효라


### 1번 문제 ###
for (i in 1:100){
  if ((i %% 3 == 0) & (i %% 5 != 0)){
    num <- '*'
  } else {
    num <- i
  }
  cat(num, ' ')
}



### 2번 문제 ###
answer <- 25
number <- 0
while (answer != number){
  number <- readline("숫자를 입력해주세요 : ")
  if (answer > number){
    print("up!")
  } else if (answer != number){
    print("down!")
  } else {
    print("정답")
    break
  }
}



### 3번 문제 ###
repo <- function(string, k){
    new_string <- rep(string, times=k)
    print(new_string)
}

repo("computer", 2)
repo("student", 3)



### 4번 문제 ###
fs <- c('spring','spring','summer','summer','summer','fall','winter','winter','winter','winter')

table_fs <- table(fs)
final_fs <- table_fs[c(2,3,1,4)]
color_fs <- c('blue','red','green','yellow')

barplot(final_fs, main = 'favorite season', col = color_fs)

## 시험 예시) 그래프 주고 매개변수 들어가야 할 것 확인


### 5번 문제 ###
ddpi_data <- LifeCycleSavings$ddpi

ddpi_data[ddpi_data %in% boxplot.stats(LifeCycleSavings$ddpi)$out] <- NA

new_ddpi <- LifeCycleSavings[complete.cases(ddpi_data),]

mean(new_ddpi$ddpi)



iris.2 <- iris[,3:4]
point <- as.numeric(iris$Species)
color <- c('red','blue','green')
plot(iris.2, main='test', col=color[point], pch=point)

