EPC<-read.table('./household_power_consumption.txt',header = T,sep = ';')
EPC_2day<-EPC[which(EPC$Date %in% c('1/2/2007','2/2/2007')),]
EPC_2day[,3:8]<-sapply(EPC_2day[,3:8],as.numeric)
par(mfrow=c(2,2))
{
        with(EPC_2day,plot(Global_active_power,type = 'l',ylab='Global Active Power',xlab = '',xaxt='n'))
        axis(1,c(0,length(which(EPC_2day$Date=='1/2/2007')),length(EPC_2day$Date)),c('Thu','Fri','Sat'))
}
{
        with(EPC_2day,plot(Voltage,type = 'l',ylab='Voltage',xlab = 'datetime',xaxt='n'))
        axis(1,c(0,length(which(EPC_2day$Date=='1/2/2007')),length(EPC_2day$Date)),c('Thu','Fri','Sat'))
}
{
        with(EPC_2day,plot(Sub_metering_1,type = 'l',ylab='Energy sub metering',xlab = '',xaxt='n'))
        with(EPC_2day,lines(Sub_metering_2,col='red'))
        with(EPC_2day,lines(Sub_metering_3,col='blue'))
        axis(1,c(0,length(which(EPC_2day$Date=='1/2/2007')),length(EPC_2day$Date)),c('Thu','Fri','Sat'))
        legend('topright',pch = '-',col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex = 0.5)
}
{
        with(EPC_2day,plot(Global_reactive_power,type = 'l',xlab = 'datetime',xaxt='n'))
        axis(1,c(0,length(which(EPC_2day$Date=='1/2/2007')),length(EPC_2day$Date)),c('Thu','Fri','Sat'))
}
dev.copy(png,file='plot4.png')
dev.off()