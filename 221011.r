## 다음 주 오프라인 수업 안 나와도 됨. 
## 목요일에 1분반 특강 업로드하면 녹강 보기.

## 오늘까지가 시험 범위.
## 25일 비대면으로 시험 봄. 19문제 객관식. 1시간. 5지선다.
## while문 사용 지정 아니면 for문 사용해라.



### 조건문(if, else, ifelse, else if)

## if-else문
a <- 10
if(a < 0){ ## 소괄호 안에 조건이 아닌 T 있으면 무조건 반복 실행. == 조건이 참일 경우만 반복 진행.
  print('0보다 작습니다.') ## 중괄호 내의 반복할 요소 여러개 작성 가능.
} else{ ## else 없이도 실행 가능. 필수 아님. if 중괄호 닫힌 줄에 else 적어야 함. 엔터X.
  print(a)
}

a <- 10
if(a<5){
  print(a) ## 조건문, 반복문 안에는 print(), cat() 함수 사용 습관화.
} else{
  print(a*10)
  print(a/10)
}

a <- 10
b <- 20
if(a>5 & b>5){
  print(a+b)
}
if (a>5 | b>30){
  print(a*b)
}
if(T){ ## 중괄호 내의 반복 요소 잘 실행되는지 확인하고 싶을 때 1, T 등 참으로 넣고 확인.
  print(a+b)
}

## ifelse(조건, 참일 때 실행할 것, 거짓일 때 실행할 것.)
# ★★★★★ 아래 두 가지 방법 모두 기억. 동일한 결과 나옴.
if(a>5){
  print(a)
} else{
  print(b)
}
ifelse(a>5,print(a),print(b)) 

## else if
score = 85
if(score>90){ ## 낮은 수부터 조건 짜면 위에서 조건 성립. 높은 수부터 걸러야 함.
  grade='A'
} else if(score>80){
  grade='B'
} else if(score>70){
  grade='C'
} else{
  grade='D'
}
print(grade)



### 반복문(모든 문제를 for, while 둘 다 풀 수 있어야 함.)

## repeat()
a <- 10
if(a<20){
    repeat(print("Hello")) ## 괄호 안의 조건을 무한 반복. 그래서 조건과 함께 사용.
  a <- a+1
}

## for()
for (i in 1:10){ ## 이상:이하. 미만X.
  print(i) ## 그냥 i 입력하면 오류. 꼭 print(), cat() 함수 사용.
}
i ## for에서 사용한 변수 값 저장되어있음.

for (i in 1:10){
  print(rep('O',i)) ## 내부에 rep 함수로 반복도 가능.
}

for (i in 6:10){
  print(i)
}

for (i in 1:9){ ## 구구단 2단 만들기 > cat(), for()
  cat('2*',i,'=',2*i,'\n') ## cat은 엔터 필수. 바뀌는 것과 바뀌지 않는 부분 파악이 중요.
}

for (i in 1:10){
  if(i%%2==0){ ## 짝수면
    print(i) ## 출력하기 (홀수는 조건 없으니 pass)
  }
}

## 학번 조회
num = 20211648
for (i in 1:10000){
  if((num/10000)%%100==21){
    print('21')
  }
}

for(i in 1:20){
  if(i%%2==0){
    cat(i,'')
  }
}
  
sum <- 1
for (i in 1:100){
  sum <- sum*i
}
sum

## 예시
?iris
View(iris)
nrow(iris)
ncol(iris)
dim(iris)

norow <- nrow(iris) ## for문 몇 번 돌려야 할지 알아야 하니까 nrow로 값 저장.
label <- c() ## label = L,L,L,M,H,M,L,H,... 될 예정
for (i in 1:norow){
  if(iris$Petal.Length[i]<=1.6){ ## [i]번째 꼭 추가해야 함. 안 하면 해당 열 모두를 뜻하는 것.
    label[i]='L'
  } else if(iris$Petal.Length[i]>=5.1){
    label[i]='H'
  } else{
    label[i]='M'
  }
}
label
length(label)

newds <- data.frame(iris$Petal.Length, label) ## Petal.Length와 label로 새로운 데이터프레임 제작.
head(newds)


## while()
a <- 1
while(a<3){
  print('Hello')
  a <- a+1 ## 직접 증가시켜 줘야 함. for()문과 차이점.
}

i <- 1
while(i<=4){
  print('O')
  i <- i+1
}

sum <- 0
i <- 1
while(i<=100){
  sum <- sum+i
  i <- i+1
}
print(sum)


## while, for - break
sum <- 0
for (i in 1:10){
  sum <- sum+i
  if(i>=5) break ## 중단시킬 조건 걸어서 무한루프 방지.
}
print(sum)

sum <- 0
for (i in 1:100){
  if(i%%2==0) {
    sum <- sum+i
  }
}
print(sum)

sum <- 0
for (i in 1:100){
  print('correct') ## 실제 현업에서는 루프 점검 시 break 활용.
  break
}


## while - next
sum <- 0
for (i in 1:10){
  if(i%%2==0){
    next
  } ## next: 조건에 해당되면 무시하겠다. 다음으로 넘어가겠다.
  sum <- sum+i
}
print(sum)


## 무한 반복
sum <- 0
while(T){ ## 조건 없애고 아래 반복 맞게 돌아가는지 확인할 때 참 값으로 무한루프 넣음.
  sum <- sum+1
  print('Hello')
  }


## apply()
a <- matrix(1:20,4,5)
a
apply(a,1,sum) ## apply(계산할 요소, 1은 가로(행방향, 2는 세로(열방향)) 평균, 함수명)
apply(a,1,mean)
apply(a,1,min)
apply(a,2,min)
apply(a,2,median)

apply(iris[,1:4],1,mean) ## iris 데이터프레임에서 1~4열의 평균을 가로로 구한다.
apply(iris[,1:4],2,mean) ## iris 데이터프레임에서 1~4열의 평균을 세로로 구한다.



### 조건문, 반복문 예시 풀이

## 예시 1) 24의 약수 구하기
for (i in 1:24){
  if (24%%i==0){
    print(i)
  }
}
## while로 다시 구해 보기
i <- 1
while(i<=24){
  if (24%%i==0){
    print(i)
  } else{
  }
  i <- i+1
}
  

## 예시 2)
num <- 0
sum <- 0
for(i in 1:100){
  if(i%%3==0){
    num <- num+1
    sum <- sum+i
  }
}
cat(num, sum)
## while로 다시 구해 보기
num <- 0
sum <- 0
i <- 1
while (i<=100){
  if(i%%3==0){
    num <- num+1
    sum <- sum+i
  }
  i <- i+1
}
cat(num, sum)


## 예시 3)
k <- 1
for(i in 1:5){
  k=k*i
}
print(k)
## while로 다시 구해 보기
i <- 1
k <- 1
while(i<=5){
  k <- k*i
  i <- i+1
}
print(k)


## 예시 4)
apply(iris[,1:4],1,sum)
apply(iris[,1:4],2,max)
apply(iris[,1:4],2,min)
