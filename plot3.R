rm(list=ls())
house<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE)

house$Date2<-as.Date(house$Date, "%d/%m/%Y")
# filter only 2007-02-01 and 2007-02-02.
dates_of_interest<-c("1/2/2007","2/2/2007")
dates_of_interest2<-as.Date(dates_of_interest, "%d/%m/%Y")

imp_dates<-house$Date2 %in% dates_of_interest2
house2<-house[imp_dates,]
rm(house)

png(filename="plot3.png")
plot(house2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt='n')
axis(side=1, at=seq(0,1440*2, 1440),labels=c("Thu","Fri","Sat"))
lines(house2$Sub_metering_2,type="l",col="red")
lines(house2$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=3)
dev.off()
