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


##~~~~~~~~~~~~~##
#~ Fourth plot ~#
##~~~~~~~~~~~~~##

par(mfcol=c(2,2),cex.axis=0.8)                 ## Set some configurations

plot(time,consume$Global_active_power,ty="l", 
     ylab="Global Active Power",xlab="")

plot(time,consume$Sub_metering_1,ty="l",
     ylab="Energy sub metering",xlab="")
points(time,consume$Sub_metering_2,ty="l",
       col="red")
points(time,consume$Sub_metering_3,ty="l",
       col="blue")
lb<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",legend=lb,col=c("black","red","blue")
       ,lty=1,cex=0.8,bty="n")

plot(time,consume$Voltage,xlab="datetime",
     ylab="Voltage",type="l")

plot(time,consume$Global_reactive_power,xlab="datetime",
     ylab="Global_reactive_power",type="l",col="darkslategray")

dev.copy(png,file="plot4.png",width=480,height=480)          
dev.off()