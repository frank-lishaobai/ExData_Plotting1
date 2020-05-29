EPC<-read.table('./household_power_consumption.txt',header = T,sep = ';')
EPC_2day<-EPC[which(EPC$Date %in% c('1/2/2007','2/2/2007')),]
EPC_2day[,3:8]<-sapply(EPC_2day[,3:8],as.numeric)
with(EPC_2day,plot(Global_active_power,type = 'l',ylab='Global Active Power (kilowatts)',xlab = '',xaxt='n'))
axis(1,c(0,length(which(EPC_2day$Date=='1/2/2007')),length(EPC_2day$Date)),c('Thu','Fri','Sat'))
dev.copy(png,file='plot2.png')
dev.off()