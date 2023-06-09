setwd("C:/Users/mmm/Downloads/Telegram Desktop/dr hamada/New folder (2)/labs")
getwd()
mydata <- read.csv('G4_howell.csv')
str(mydata)
summary(mydata)

class(mydata$sex)

mydata$sex = factor(mydata$sex)

summary(mydata$sex)
levels(mydata$sex) <- c("Female","Male" )

# remove kg 
mydata$weight = gsub(" kg","",mydata$weight)
class(mydata$weight)
mydata$weight = as.numeric(mydata$weight)



# missing values
install.packages("mice")
library(mice)
mydata[!complete.cases(mydata), ]
Pre.imputation <- mice(mydata , m = 5, meth = c("pmm"), maxit = 20)
Pre.imputation$imp
mydata <- complete(Pre.imputation, 3)

#remove over weight column as it has all nill value
mydata$Overweight = NULL



# age manipulation

for ( i in 1:length(mydata$age))
  mydata$age[i] = round(mydata$age[i])

mydata$age


#visualization
install.packages("tidyverse")
library(tidyverse)
library(ggplot2)
draw1 <- ggplot(mydata)
draw1 <- ggplot(mydata, aes(x=height, y=weight))
draw1
draw1 + geom_point()


draw_bar <- ggplot(mydata, aes(x=sex, fill = sex))
draw_bar + geom_bar()







