EPC<-read.table('./household_power_consumption.txt',header = T,sep = ';')
EPC_2day<-EPC[which(EPC$Date %in% c('1/2/2007','2/2/2007')),]
EPC_2day[,3:8]<-sapply(EPC_2day[,3:8],as.numeric)
EPC_2day$DateTime <- strptime(paste(EPC_2day$Date, EPC_2day$Time), format="%d/%m/%Y %H:%M:%S")
with(EPC_2day,plot(DateTime,Global_active_power,type = 'l',ylab='Global Active Power (kilowatts)',xlab = ''))
dev.copy(png,file='plot2.png')
dev.off()