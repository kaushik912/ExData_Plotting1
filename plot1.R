rm(list=ls())
house<-read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactor=FALSE)

house$Date2<-as.Date(house$Date, "%d/%m/%Y")
# filter only 2007-02-01 and 2007-02-02.
dates_of_interest<-c("1/2/2007","2/2/2007")
dates_of_interest2<-as.Date(dates_of_interest, "%d/%m/%Y")

imp_dates<-house$Date2 %in% dates_of_interest2
house2<-house[imp_dates,]
rm(house)

bad<-house2$Global_active_power=="?"
house2[bad,c("Global_active_power")]<-NA
range(house2$Global_active_power,na.rm=TRUE)
global_active_power_without_NA<-na.omit(house2$Global_active_power)
range(global_active_power_without_NA)

png(filename="plot1.png")
hist(as.numeric(global_active_power_without_NA),yaxt='n',col="red",
main="Global Active Power", xlab="Global Active Power(kilowatts)" )
axis(side=2, at=seq(0,1200, 200),labels=seq(0,1200,200))
dev.off()

####




