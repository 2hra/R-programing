rm(list=ls()) # 오른쪽 환경창 다 지우기, 맨 위에 적어 두고 필요할 때마다 실행

a <- 1 # 교재에서는 (alt + -)로 화살표
a = 2 # 현업에서는 =을 사용. 하지만 <- 사용하도록 하기.
b <- a + 3
x <- 3
y <- 4

# ctrl + 1 : console 삭제
# ctrl + enter : 커서 있는 라인 실행
# ctrl + a : 전체 선택



### 연산자
4 + 8
a <- 5*9 # 해당 값을 나중에 활용하고 싶을 때 변수에 저장
9%%2 # 나머지
9/2
2^3 # 제곱
2**3 # 제곱
17**5



### 함수, 값 리턴
log(17)
log2(4) # 함수명 적다가 추천에서 탭 누르면 사용 가능
factorial(6)
sample(5) # 숫자 5까지 랜덤 순서
sample(1:10, 4) # 1부터 10까지, 4개
cos(pi/3)
sin(pi)



### 변수
# 변수명 첫 글자 숫자 불가, 대소문자 구분 필요. 띄어쓰기 사용 불가.
b <- 3
c <- a+b
a+b
d <-"hyora"

c # print 없이 그냥 변수명 + ctrl + enter 해도 값 출력됨
d
print(c) # 이게 정석이긴 함

name = 'hyora' # 변수명 직관적으로 정하기
average = mean(c) # c의 평균값을 새로운 변수에 값 추가하기
age = 14
gender= 'female'

a <- 0.5
b <- 'Jane' # 문자열 입력 시 큰 따옴표, 작은 따옴표 상관없음.
c <- 'DongDuk'

a <- TRUE # 대문자로 쓰면 논리형 참, 거짓값.
b <- FALSE # 색이 달라짐
c <- T # T만 써도 TRUE로 바뀜.
d <- 'TRUE' # 따옴표 안에 넣으면 문자열

e <- NULL # NULL, NA, NaN 등 특수값.
sqrt(-3) # In sqrt(-3) : NaNs produced >> 정의 불가능한 값이다

a <- 'data'
a+age # 연산은 동일한 자료형만 가능
a <-  30
a+age
# 변수 이름이 같다면 실행할 때마다 값 바뀜. 항상 아래 값이 아니라 실행한 줄의 값



### 지정된 자료형이 맞는지 확인
is.numeric(a) # 숫자형 자료형인지 확인 >> TRUE
is.numeric(gender) # 숫자형 >> FALSE
is.character(name) # 문자형인지 확인 >> TRUE
is.character(age) # >> FALSE
is.logical(c) # 논리형 자료인지 확인 >> TRUE
is.logical(d) # >> FALSE, 문자열임



### 해당 자료형이 무엇인지 확인 후 리턴
class(a)
class(c)
class(d)



### 벡터
# 하나씩 값을 넣기엔 너무 비효율. c() 활용.
score <- c(90, 84, 70, 0, 60, 20) # c(값 여러개 입력)
# 문자가 값 중 하나라도 있으면 다 문자로 바뀜
score[1] + score[4] # 연산도 가능
score[5] # 0번부터 아니고 1번부터.
mean(score) # 평균 내는 것 >> 값: 54

a <- c('a', 'b', 'c')
b <- c(TRUE, FALSE, T)
c <- c(1,2,3)
d <- c(1,2,'a')
e <- c(1:100) # 콜론, (이상:이하)로 범위 지정
f <- c(1,2,3,90:100) # 직접 입력 + 콜론 섞어 쓸 수 있음
f[12] # 인덱스는 대괄호로



### seq(), 시퀀스
g <- seq(from = 0, to = 100, by = 5) # 1부터 100까지 5씩 건너뛰기. 
g <- seq(from = 0, to = 100, length.out=6) # 6개의 값을 균등한 간격으로 자동 배분
g <- seq(0,30) # == g = c(0:30). by 안 적으면 1씩 건너뛴다고 봄.
g <- seq(0,100,5) # from, to, by를 지정하지 않아도 순서대로 적으면 동일한 값
g
?seq # 물음표 뒤에 함수명 적으면 함수 설명이 나옴.

h <- seq(0,1,length.out=4)
h



### 반복하는 함수 rep()
?rep
v1 <- rep(c('aaa','bbb'), times=5) #times 생략 가능, 문자열도 반복 가능
v2 <- rep(c(1,2,3),2) # 그룹으로 반복 가능
v3 <- rep(c(1,2,3,4),each=3) # each는 각 요소별로 반복
v1
v4 <- rep(c(1,2,3,4), length.out=9) # 1,2 세트로 안 끝나고 반복 9에서 끝남.
v4
v5 <- rep(1,5)



### names(), 벡터에 이름 붙이기
x <- c(100, 90, 80)
x
names(x) <- c('jane','tony','sam') # 미리 만들어둔 벡터에 이름 저장
x
# 결과
#jane tony  sam (표 형식으로 나옴)
#100   90   80
x[3] 
# 결과 
# sam
# 80



### 벡터 안의 인덱스 불러오기. seq, c, 직접 입력, - 붙이기.
a <- seq(1,9,2)
a[c(1,3,5)] # 인덱스 안에 벡터를 또 넣고 몇 번째 인덱스에 있는 걸 알려 달라고 할 수 있음.
a[seq(1,5,2)] # 위와 동일함. 1,3,5번째 값을 리턴
seq(1,5,2)
a[-2] # -를 붙이면 해당 인덱스 빼고 나머지 출력
a[-seq(1,5,2)] # 1,3,5 빼고 2, 4번째 값 출력
a[c(1:4)]
a[-c(1:3)]



### 벡터 안의 값 바꾸기
a <- seq(1,10,3) # 아래 실행했다가 위에 다시 실행하면 값 다시 덮어써짐.
a[2] <-  5 # 벡터 안의 값 재지정 가능
a[3] <-  9
a[c(1,3)] <- c(2,6) # 묶어서 변경할 수도 있음.


2*a # 변수 안의 num 자료형의 값을 곱해서 반환해서 출력해 줌. +-도 가능함.

b <-c('apple','banana')
c <- c(a,b) # 벡터 두 개 이어 주기. 숫자+문자 >> 문자형으로 다 바뀜. 벡터는 무조건 요소가 다 같은 자료형
a[1]+a[2]



### 벡터 함수
sum(a)
mean(a[1:3]) # 해당 벡터 안에서 범위 지정하고, 그 범위의 평균 구할 수 있음
median(a) # 중앙값
length(c) # 값이 몇 개인지

?sort
sort(a, decreasing=FALSE) # >> 오름차순이 소트 기본 설정. decreasing=TRUE 또는 TRUE 또는 T 추가하면 내림차순.
modified_score <- sort(a,decreasing=TRUE)
sort(a,TRUE)
sort(a,F)
sort(a) # 오름차순이 디폴트



### 논리연산자
x <- 10
y <- 5
x > y
x!=y
(x>y)|(x==y)
(x>y)&(x!=y)

a <-  seq(1,10,3)
a
a > 3 # 요소별로 크기 비교함.
a[a>3] # TRUE 반환하는 요소만 출력
a[a<3]


a <- c(1,2,3,4,5,6,7,8,9,10)
a>5
a[a>5] # 결과: [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
sum(a>5) # a가 5보다 큰 요소의 갯수. TRUE의 갯수를 출력(TRUE의 값을 더함)
sum(a[a>5]) # a가 5보다 큰 요소의 합계
# 괄호가 여러개면 가장 바깥의 함수, 변수명, 괄호 종류부터 확인하기.

b <- a>5
b
a[b] # == a[a>5]와 동일한 것. b에 a>5를 초기화해 줬으니까.



### 리스트
x <- list('datascience','tony',96, TRUE) # 다양한 자료형 한 번에 입력 가능
names(x) <- c('major', 'name', 'score', 'check') # names() 함수도 적용 가능하지만 처음부터 이름 설정 가능
y <- list(major='datascience', name='tony', score = 96, check=TRUE)
x[[1]] # 대괄호 두 번 열기로 값 불러오기
y$name # 달러 표시 옆에 키 입력해서 결과 얻어낼 수 있음.
x$major # 이름 나중에 설정하면 그것도 달러로 불러오기 가능

my.info <- list(name = 'Tom', age=60, status=TRUE, score=)



### 팩터
a <- c('A', 'B', 'O', "AB","B")
b <- factor(a) # 종류만 몇 개인지 알려줌
b
summary(b) # 요약
length(a)
b[6] <- 'A'
b[7] <- 'C' # 위에 있는 factor안의 levels에 정의되지 않은 구분은 추가할 수 없음.



### 예제 1~2) 무조건 d 활용. 단순 출력은 오답.
d <- c(100:200)
d
d[50] # 1번 답: 149
d[seq(1,110,10)] # 2번 답: 100 110 120 130 140 150 160 170 180 190 200
# 1번째부터, 110번째까지, 10 간격으로
d[1:20] # 또는 d[c(1:20)] 3번 답: 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119
length(d)
mean(d)
sum(d<110)
d<110
sum(d[d<110])

### 예제 3)
x <- c(1:20)
x
y <- x[seq(3,20,3)]
y
sort(y, TRUE)
length(y)
mean(x[-c(2:10)])

### 예제 4)
a <- c(1,6,3,8)
a <- sort(a)
sort(a,T)
names(a)<-c('one','three','six','eight')
a

### 예제 5) >> 다시 풀기기
ages <- c(58,20,85)
names <- c('Tony','Ahn','Nick')
x <- list(ages,names)
x
names(x)<-c('names','ages')
$names

### 예제 6)
gender <- c(rep('male',5),(rep('female',10)))
gender_fac <- factor(gender)
gender_fac[16] <- 'male'
summary(gender_fac)
