EPC<-read.table('./household_power_consumption.txt',header = T,sep = ';')
EPC_2day<-EPC[which(EPC$Date %in% c('1/2/2007','2/2/2007')),]
EPC_2day[,3:8]<-sapply(EPC_2day[,3:8],as.numeric)
EPC_2day$DateTime <- strptime(paste(EPC_2day$Date, EPC_2day$Time), format="%d/%m/%Y %H:%M:%S")
with(EPC_2day,{
        plot(DateTime,Sub_metering_1,type = 'l',ylab='Energy sub metering',xlab = '')
        points(DateTime,Sub_metering_2,type = 'l',col='red')
        points(DateTime,Sub_metering_3,type = 'l',col='blue')
})
legend('topright',lty=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex = 1.5)
dev.copy(png,file='plot3.png')
dev.off()

