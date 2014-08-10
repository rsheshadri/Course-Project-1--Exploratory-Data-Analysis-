data<-read.table('household_power_consumption.txt',header=TRUE,sep=';')
data1<-subset(data,Date=='1/2/2007')
data2<-subset(data,Date=='2/2/2007')
datatot<-rbind(data1,data2)
data3<-datatot$Global_active_power
data4<-as.numeric(as.character(datatot$Global_active_power))
data5<-data4
dates<-datatot[,1]
times<-datatot[,2]
x<-paste(dates,times)
y<-strptime(x,format='%d/%m/%Y %H:%M:%S')
plot(y,data5,ylab='Global Active Power (kilowatts)',xlab='',type='l')
dev.copy(png,file="plot2.png")
dev.off()

