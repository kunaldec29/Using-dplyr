# dplyr
#arrange function
#usage of pipe operator "%>%"


#Getting the variable name of the dataset mtcars

names(mtcars)

#Install and Load the package dplyr

install.packages("dplyr")
library(dplyr)

#Lets  check the head of mtcars dataset
head(mtcars)

#arrange the mtcars dataset in ascending order of mpg  and cyl
arrange(mtcars,mpg,cyl)

#Lets check
head(arrange(mtcars,mpg,cyl))

#Important-Remember it doesnt affect the original dataset


#arrange the mtcars dataset in dscending order of mpg and cyl

arrange(mtcars,desc(disp))

head(arrange(mtcars,desc(disp)))

#Filter function of the dplyr package

#create a dataset car.cyl6 from the mtcars to include cars with 6 cylinders



car.cy6<- filter(mtcars,cyl==6)

View(car.cy6)

#create a dataset car.cyl6 from the mtcars to include cars with 6 cylinders

car.cy6.vs<- filter(mtcars,cyl==6 & vs==0)

#Create a dataset car.mpg18 for cars whose mileage is > 18 miles/gallon

car.mpg18<-filter(mtcars,mpg>=18)

View(car.mpg18)

#Filter mtcars to have only 4 and 6 cylinder  cars
filter(mtcars,cyl%in%c(4,6))

#Filter mtcars NOT to have 4 and 6 cylinder cars
filter(mtcars,!cyl%in%c(4,6))

#Filter mtcars to have 3 gears and 3 carb

filter(mtcars,gear==3 & carb==3)

#Filtering with multiple conditions(5 conditions here)

filter(mtcars,gear==3,carb>3,vs==0,mpg>10,hp>150)

#USAGE OF PIPE OPERATOR

#dataset iris and mtcars

names(iris)
names(mtcars)
#Usage of one pipe operator
iris %>% select(Species,Sepal.Length,Sepal.Width)

mtcars%>% select(mpg,wt,cyl)

#Usage of pipe operator twice
iris %>% select(Species,Sepal.Length,Sepal.Width) %>% filter(Sepal.Length>4,Sepal.Width<3)

mtcars%>% select(mpg,wt,cyl) %>% filter(cyl>=6)

mtcars%>% select(mpg,wt,cyl) %>% arrange(wt)#Increasing order

mtcars%>% select(mpg,wt,cyl) %>% arrange(desc(wt))#decreasing order

#Usage of select function in dplyr for subsetting/splitting the dataset

iris_1<-select(iris,Species,Sepal.Length)
iris_1

#Usage of pipe operator with arrange function

iris %>% arrange(Sepal.Length,Species)

head(iris %>% arrange(Sepal.Length,Species))

#In descending order
iris %>% arrange(desc(Sepal.Length),Species)

head(iris %>% arrange(desc(Sepal.Length),Species))


#Lead and lag function of dplyr

lead(1:10,1)
lead(1:10,2)
lead(1:10,3)


lag(1:10,1)
lag(1:10,2)
lag(1:10,3)


yr<-c(1990:2010)
yr

sales<-seq(15000,35000,1000)
sales

stock_value<-data.frame(yr,sales)

stock_value

lead(stock_value$sales)
lag(stock_value$sales)

diff(stock_value$sales)



