rm(list=ls())

## 이번 계절학기는 안 열 예정
## 30% > 24등, 이번은 27등까지 29점(나도 29점)

## 데이터프레임, 매트릭스는 cbind, rbind로 숫자, 문자가 합쳐지면 모두 문자가 된다.
## 매트릭스 연산에서 +, -, * 뿐만 아니라 %%도 가능하다.(나머지)

## 9주차 - 1) 사용자 정의 함수

## 사용자 정의 함수 예시
yaksu <- function(a){
  for (i in 1:a){
    if(a%%i==0){
      cat(i, end='')
    }
  }
}
yaksu(24)



## 함수 구성 요소
fun_name <- function(x){ ## 함수명 <- function(입력 요소(갯수도 정해야 함)){
  ... ## 조건문, 반복문, 출력, retrun 등 함수 정의
}



## 함수 예시 1(입력값, 반환값 모두 있는 것)
mysum <- function(a,b){
  result <- a+b
  return(result) ## 값 출력은 안 하고 반환만 하니까
}
print(mysum(3,4)) ## 아래에서 따로 출력해 줘야 함

## 함수 예시 2(입력값 있고, 반환값 없는 것)
## 출력을 함수 정의에서 했는지, 호출에서 했는지 구분 필수
mysum2 <- function(a,b,c){
  result <- a+b+c
  print(result) ## 바로 출력도 가능(return 필수는 아님)
}
mysum2(3,4,5) ## 함수와 요소 갯수 다르게 입력하면 오류 발생

babo1 <- function(x){
  print(rep('바보',x))
}
babo1(5)

## 함수 예시 3(입력값, 반환값 모두 없는 것)
babo <- function(){
  print('바보')
}
babo()



mysummin <- function(a=9,b=0,c=0){ 
  ## 초기값 설정하면 함수 정의 요소와 입력 갯수 달라도 가능. 0이 아닌 값도 초기값 설정 가능.
  result <- a+b-c
  return(result)
}
x <- mysummin(3,4)
print(x)
y <- mysummin()
print(y) ## 아무것도 입력 안 해도 초기값 바탕으로 출력이 됨.


mydiv <- function(x=2, y=2){ ## 모든 요소 초기화도 가능. 값 입력되면 변경됨.
  result <- x/y
  return(result)
}
mydiv(12,3)
mydiv(12)


myfunc <- function(x,y){
  a <- x+y
  b <- x*y
  return(list(res_sum=a, res_mul=b)) 
  ## 리스트를 이용해 여러값 반환 가능. 
  ## 리스트 요소별로 이름 설정하면 $로 쉽게 호출 가능.
}
print(myfunc(4,5)) ## 리스트 전체 출력
print(myfunc(4,5)$res_sum) ## 함수 호출, 입력값, 리스트내 이름 호출


## 한 파일에 함수를 모아서 저장 후 호출 가능(컴퓨터 동일 파일내에 있어야 함)
source('myfunctions.r')
mylife(5)



## 9주차 - 2) 데이터 위치 찾기

## which(조건)
score <- c(100,90,50,30,40)
which(score==90) ## 인덱스
score[which(score>=50)]

## which.max(조건), which.min(조건)
which.max(score) ## 인덱스
which.min(score) ## 인덱스
score[which.max(score)] ## == max
score[which.min(score)] ## == min

## 값 바꾸기
idx <- which(score<35)
score[idx] <- 61 ## 조건에 해당하는 위치의 값을 바꿈
score

## 데이터 프레임, 매트릭스에서 인덱스(위치) 활용
idx2 <- which(iris$Petal.Length>5.0) ## 조건에 해당하는 위치 출력
idx2 ## 위치 저장
iris.big <- iris[idx2,] ## 위치로 행 호출
iris.big



## 예시 1)
lgm <- function(x, y){
  res <- 0
  for (i in 1:min(x,y)){
    if (x%%i==0 & y%%i==0){
      res <- i
    }
  }
  return(res)
}
lgm(10,8)
lgm(10,20)


## 예시 2)
maxmin <- function(x){
  ma <- max(x)
  mi <- min(x)
  return(list(max=ma, min=mi))
}
v1 <- c(7,1,2,8,9)
result <- maxmin(v1)
result$max ## 문제에 $이름 으로 호출되었으니 list 이름 선언 필요
result$min


## 예시 3)
weight <- c(69,50,55,71,89,64,59,70,71,80)
which.max(weight)
which.min(weight)
weight[which(weight>=61 & weight<=69)]
which(weight>=61 & weight<=69)
w <- which(weight<=60)
w
weight.2 <- weight[w]
weight.2
