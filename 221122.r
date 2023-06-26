rm(list=ls()) 

## 12/6은 진도 나가지 않고 복습 예정.
## 내일 또는 모레에 과제 진행.
## 5문제 r파일 제출.
## 12/13 중간고사와 같은 형식으로 볼 예정. 문법 빠삭히 외우기.
## 조건문, 반복문부터 오늘까지 시험 범위.



### 1교시) 
## 1) 데이터 시각화 기법 세 가지
## 1-1) 트리맵(tree map) 
## 그림을 보고 코드 알아낼 수 있어야 함.
install.packages('treemap') ## 패키지 설치
library(treemap) ## 패키지 호출
data(GNI2014) ## GNI(국민총소득 자료)
treemap(GNI2014, 
        index=c('continent','iso3'),
        vSize = 'population',
        vColor = 'GNI',
        type = 'value',
        title = 'GNI'
        ) 
## index == 굵은 선으로 구분할 종류 구분. 두 번째에 기재.
## vSize == 해당 값으로 크기 설정. 세 번째에 기재.
## vColor == 해당 값에 비례한 색의 농도. 네 번째에 기재.
## type == index, value 등 여덟 개 있지만 밸류만 씀. gni의 실제 값을 쓰겠다는 것. 다섯 번째에 기재.
## title == 제목 변경.
## 위 다섯가지 필수 기재 요소, 순서도 기억.

x <- as.data.frame(state.x77) ## 데이터프레임만 적용 가능
class(x)
View(x) 
st <- data.frame(x, iso3 = rownames(x)) 
## 나라 이름도 행 이름이 아니라 셀 값이 되도록.
View(st)
class(st)
treemap(st, index=c("ios3"), vSize = 'Area', vColor = "Income", type = 'value', title = 'data_state.x77') 



### 1교시)
## 1-2) 버블차트(bubble chart)
symbols(data_state.x77$Illiteracy, data_state.x77$Murder, circles = data_state.x77$Population, inches = 0.4, bg='lightgray', fg = 'red', lwd = 1.5, xlab = 'Illiteracy', ylab = 'Murder rate', main = 'statex77') 
## simbols(x, y값, circles = 원의 크기 설정할 값, inches = 원 크기 조절할 값, bg = 원의 색, fg = 원 테두리 색, lwd = 테두리 두께)
## x, y, circles는 필수

## x, y 값을 보여 주는 텍스트 함수
text(data_state.x77$Illiteracy, data_state.x77$Murder, data_state.x77$iso3, cex=0.5, col = 'brown') ## 설정 업데이트 하려면 위의 심볼 함수도 다시 실행 필요. 안 그럼 계속 덮어써짐.



### 1교시)
## 1-3) 모자이크 플롯 (mosaic plot)
View(mtcars)
mosaicplot(~mtcars$gear+mtcars$vs, color = c('red','green'), main = 'mtcars')
mosaicplot(~gear+vs, data = mtcars) ## 위아래 결과 상동.
## mosaicplot(~x+y) 가장 중요.
## color = T == 값별로 음영 차등. c()로 색상 나열도 가능.



### 1교시)
## 2) ggplot 패키지
install.packages('ggplot2')
library(ggplot2)


## 2-1) ggplot 명령문 구조
## ggplot(data = xx, aes(x=x1, y=x2)) + geom_xx( )+ geom_yy( ))
## 사용할 데이터, x, y로 사용할 값 초기화 + 점 모양 등 함수 추가
ggplot(data = mtcars, aes(x=wt, y=mpg)) + geom_point() + labs(x='xxxx',y='1234')



### 1교시)
## 2-2) 막대그래프 (bar plot)
month <- c(1,2,3,4,5,6)
rain <- c(55,50,60,45,70,55) 
x <- data.frame(month,rain)
ggplot(data = x, aes(x=month,y=rain))+geom_bar(stat='identity', width=0.7, fill = 'steelblue')+labs(x='month',y='rains', title='raaaa', caption='true') + coord_flip()
## geom_bar(stat = , width = 간격, fill = 색상)
## type처럼 stat는 identity만 사용.
## coord_flip()은 가로형 막대 그래프.



### aes 안에 색상 명령 넣는 것 중요.



### 1교시)
## 2-3) 히스토그램 (histogram): 구간을 나눠서 해당 구간에 들어가면 카운트하는 것. x축의 범위에 따라 그림이 달라짐. x값만 입력함.
## y값을 모두 합치면 전체 갯수라 나옴.
View(iris)
ggplot(data=iris, aes(x=Sepal.Width, fill = Species, color = Species
                      )) + geom_histogram(binwidth = 0.5, position='dodge') + theme(legend.position = 'top')
## fill = 데이터 열 이름 그룹화해서 색 변경.
## color = 윤곽선 색상.
## position = 'dodge' = 색 겹쳐 그리지 않고 각각 그림.
## binwidth = 간격 설정.
## lwd = 선 굵기
## Theme(legend.position = ) = 속성의 위치



### 2교시) 
## 2-4) 산점도 (scatter plot)
ggplot(data = iris, aes(x=Petal.Length, y=Petal.Width, color = Species)) + geom_point(size = 2) + ggtitle('꽃잎의 길이와 폭')
## color = 동일값별로 색상 구분.


### 2교시) 
## 2-5) 상자그림 (box plot) >> y값만 입력.
ggplot(data=iris, aes(y=Sepal.Width)) + geom_boxplot(fill='yellow')
ggplot(data=iris, aes(y=Sepal.Width, fill = Species)) + geom_boxplot() ## aes 안에 fill 함수 넣으면 항목별 색상, 항목별 박스 그림.



### 2교시) 
## 2-6) 선그래프 (line plot)
month <- c(1,2,3,4,5,6)
rain <- c(55,50,60,45,70,55) 
x <- data.frame(month,rain)
View(x)
class(x)
ggplot(data = x, aes(x=month,y=rain)) + geom_line(col = 'red')



### 2교시) 
## 3) 차원축소 >> 이 수업에서는 간략하게 배울 것.
## iris 데이터에서 Species 빼고 나머지 네 개의 열 존재.
## 4차원 공간에 점을 찍어야 하는데 불가하기에 차원 축소.
## 의미 있는 열을 추려서 2차원, 3차원 등으로 모델링.
install.packages("Rtsne")
library(Rtsne) ## 완전 동일한 값 있으면 실행 오류.
library(ggplot2)
ds <- iris[,-5] ## Species 뺀 모든 값
View(ds)
a <- which(duplicated(ds)) ## 동일한 값 위치 찾아내기.
ds <- ds[-a,] ## 해당 행 제외 후 새로 초기화
View(ds)

ds.y <- iris$Species[-a] ## 중복값 제외 후 품종 저장.
ds.y 

x <- Rtsne(ds, dims = 2, perplexity = 10)
## perplexity 무조건 10. 유사값 범위.
x

boxplot.stats(iris$Sepal.Width)$out ## 박스플랏 아웃라이어 찾는 것. 복습.

View(x$Y) ## 2차원으로 바뀐 값.
result <- x$Y
res <- data.frame(result)
class(res)
View(res)
ggplot(res, aes(x=X1, y=X2, color=ds.y)) + geom_point(size=2) + labs(x='xx',y='yy')



### 예시 1) 문제 잘못됨.
library(ggplot2)
library(treemap)
library(Rtsne)


### 예시 2) 
symbols(swiss$Fertility, swiss$Argriculture, circles = swiss$Education, bg = 'lightgreen', xlab = 'Fertility', ylab= 'Agriculture')
text(swiss$Fertility, swiss$Argriculture, rownames(swiss), col='darkblue')


### 예시 3) 
ggplot(mtcars, aes(x=gear)) + geom_bar() + labs(x='기어의 수', y='빈도수')


## 예시 4)
ggplot(mtcars, aes(x=mpg, y=wt, color = gear)) + geom_point(size = 2)

View(swiss.tsne)

## 예시 5)
View(swiss)
dup <- which(duplicated(swiss))
dup
tsne <- Rtsne(swiss, dims = 2, perplexity=10)
swiss.tsne <- as.data.frame(tsne$Y)
ggplot(swiss.tsne, aes(x=V1, y=V2)) + geom_point(size=3)
