data<-read.table('household_power_consumption.txt',header=TRUE,sep=';')
data1<-subset(data,Date=='1/2/2007')
data2<-subset(data,Date=='2/2/2007')
datatot<-rbind(data1,data2)
data3_1<-datatot[,7]
data3_2<-datatot[,8]
data3_3<-datatot[,9]
data4_1<-as.numeric(as.character(data3_1))
data4_2<-as.numeric(as.character(data3_2))
data4_3<-as.numeric(as.character(data3_3))
data5_1<-data4_1
data5_2<-data4_2
data5_3<-data4_3
dates<-datatot[,1]
times<-datatot[,2]
x<-paste(dates,times)
y<-strptime(x,format='%d/%m/%Y %H:%M:%S')
with(datatot,plot(y,data5_1,type='l',ylab='Energy Sub Metering',xlab=''))
with(datatot,points(y,data5_2,type='l',col='red'))
with(datatot,points(y,data5_3,type='l',col='blue'))
legend("topright",pch='-',col=c('black','red','blue'),legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))
dev.copy(png,file="plot3.png")
dev.off()

