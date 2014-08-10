data<-read.table('household_power_consumption.txt',header=TRUE,sep=';')
data1<-subset(data,Date=='1/2/2007')
data2<-subset(data,Date=='2/2/2007')
datatot<-rbind(data1,data2)
data3_1<-datatot[,7]
data3_2<-datatot[,8]
data3_3<-datatot[,9]
voltage<-datatot[,5]
reactive<-datatot[,4]
data4<-as.numeric(as.character(datatot$Global_active_power))
data4_1<-as.numeric(as.character(data3_1))
data4_2<-as.numeric(as.character(data3_2))
data4_3<-as.numeric(as.character(data3_3))
datavolt<-as.numeric(as.character(voltage))
datareac<-as.numeric(as.character(reactive))
data5_1<-data4_1
data5_2<-data4_2
data5_3<-data4_3
dates<-datatot[,1]
times<-datatot[,2]
x<-paste(dates,times)
y<-strptime(x,format='%d/%m/%Y %H:%M:%S')
par(mfrow=c(2,2))
plot(y,data4,ylab='Global Active Power (kilowatts)',xlab='',type='l')
plot(y,datavolt,ylab='Voltage',xlab='datetime',type='l')
with(datatot,plot(y,data5_1,type='l',ylab='Energy Sub Metering',xlab=''))
with(datatot,points(y,data5_2,type='l',col='red'))
with(datatot,points(y,data5_3,type='l',col='blue'))
with(datatot,legend("topright",pch='-',col=c('black','red','blue'),legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3")))
plot(y,datareac,ylab='Global_reactive_power',xlab='datetime',type='l')
dev.copy(png,file="plot4.png")
dev.off()


