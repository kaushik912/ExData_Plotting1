rm(list=ls())
house<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE)

house$Date2<-as.Date(house$Date, "%d/%m/%Y")
# filter only 2007-02-01 and 2007-02-02.
dates_of_interest<-c("1/2/2007","2/2/2007")
dates_of_interest2<-as.Date(dates_of_interest, "%d/%m/%Y")

imp_dates<-house$Date2 %in% dates_of_interest2
house2<-house[imp_dates,]
rm(house)

png(filename="plot2.png")
plot(house2$Global_active_power,type="l",xaxt='n',ylab="Global Active Power (kilowatts)",xlab="")
axis(side=1, at=seq(0,1440*2, 1440),labels=c("Thu","Fri","Sat"))
dev.off()

