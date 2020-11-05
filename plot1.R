setwd("Felipe/Programacion/Coursera/R/Exploratory data analysis/Primer entrega")
name<-"household_power_consumption.txt"
d0<-read.table(name,nrows=2,header=T,sep=";")    ## First fast view of the data.
          
types<-sapply(d0,class)                          ## Types of the columns

consumo<-read.table(name,sep=";",header=T,       ## Complete data
         colClasses=types,na.strings=c('?'))
str(consumo)
consumo[,1]<-as.Date(consumo[,1], "%d/%m/%Y")    ## Changing the first column
consume<-subset(consumo,Date=="2007-02-01" |     ## Subsetting
                Date=="2007-02-02") 
str(consume)                                     ## A little view of the resulting dataset
temp<-paste(consume$Date,consume$Time)           ## Pase Date and Time
time<-strptime(temp,"%Y-%m-%d %H:%M:%S")         ## Give the format we need

##~~~~~~~~~~~~##
#~ First plot ~#
##~~~~~~~~~~~~##

with(consume,hist(Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",main=NA))
title(main="Global Active Power")

dev.copy(png,file="plot1.png",width=480,height=480)          
dev.off()