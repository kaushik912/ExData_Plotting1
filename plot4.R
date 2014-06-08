rm(list=ls())
house<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE)

house$Date2<-as.Date(house$Date, "%d/%m/%Y")
# filter only 2007-02-01 and 2007-02-02.
dates_of_interest<-c("1/2/2007","2/2/2007")
dates_of_interest2<-as.Date(dates_of_interest, "%d/%m/%Y")

imp_dates<-house$Date2 %in% dates_of_interest2
house2<-house[imp_dates,]
rm(house)

png(filename="plot4.png")
par(mfrow=c(2,2))

plot(house2$Global_active_power,type="l",xaxt='n',ylab="Global Active Power",xlab="")
axis(side=1, at=seq(0,1440*2, 1440),labels=c("Thu","Fri","Sat"))

plot(house2$Voltage,type="l",xaxt='n',xlab="datetime",ylab="Voltage")
axis(side=1, at=seq(0,1440*2, 1440),labels=c("Thu","Fri","Sat"))

plot(house2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt='n')
axis(side=1, at=seq(0,1440*2, 1440),labels=c("Thu","Fri","Sat"))
lines(house2$Sub_metering_2,type="l",col="red")
lines(house2$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
col=c("black","red","blue"),lwd=2,cex=0.5,bty="n")

plot(house2$Global_reactive_power,type="l",xaxt='n',xlab="datetime",ylab="Global_reactive_power")
axis(side=1, at=seq(0,1440*2, 1440),labels=c("Thu","Fri","Sat"))
dev.off()
