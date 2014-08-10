data<-read.table('household_power_consumption.txt',header=TRUE,sep=';')
data1<-subset(data,Date=='1/2/2007')
data2<-subset(data,Date=='2/2/2007')
datatot<-rbind(data1,data2)
data3<-datatot$Global_active_power
data4<-as.numeric(as.character(datatot$Global_active_power))
hist(data4,col="red")
hist(data4,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.copy(png,file="plot1.png")
dev.off()