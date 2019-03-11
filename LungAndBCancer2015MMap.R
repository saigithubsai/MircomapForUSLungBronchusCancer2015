library(tidyverse)
library(micromapST)


cancer <- read.csv(
  file="C:/Users/avala/OneDrive/Desktop/Fall18/LungandBronchusCancer.csv",
  header=T, as.is=TRUE)
head(cancer)



CancerMM <- data.frame(
  type=c('map','id','dot','dot','dot','dot'),
  lab1=rep("",6),
  lab2=c('' ,'','All','Male','Female','Male - Female'),
  lab3=c('','','Possible 0-500','Possible 0-500',
         'Possible 0-500',''),
  col1 = c(NA,NA,'All','Male','Female','Male...Female')
)





#Make a plot in a pdf file.  

CancerMM <- data.frame(
type=c('map','id','dot'),
lab1=rep("",3),
lab2=c('' ,'','Crude Rate per 100,000'),
col1 = c(NA,NA,'CrudeRate')
)


fName = "C:/Users/avala/OneDrive/Desktop/CancerStat.pdf"
pdf(file=fName,width=7.5,height=10)

micromapST(cancer, CancerMM,
           rowNamesCol='State',
           rowNames='full',
           sortVar='CrudeRate',ascend=FALSE,
           title=c("United States Lung and Bronchus Cancer Statistics,",
                   "2015 Mortality Trend"),
           ignoreNoMatches=TRUE)

dev.off()
