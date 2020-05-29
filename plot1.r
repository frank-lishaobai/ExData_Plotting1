EPC<-read.table('./household_power_consumption.txt',header = T,sep = ';')
EPC_2day<-EPC[which(EPC$Date %in% c('1/2/2007','2/2/2007')),]
EPC_2day[,3:8]<-sapply(EPC_2day[,3:8],as.numeric)
with(EPC_2day, hist(Global_active_power,col = 'red',main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)'))
dev.copy(png,file='plot1.png')
dev.off()