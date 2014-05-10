data <- read.table("household_power_consumption.txt", header=T, sep=";",
                  na.strings="?")
data <- subset(data, Date %in% c('2/2/2007','1/2/2007'))
data$Fulldate <- strptime(paste(data$Date, data$Time),
                          format="%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480, units="px", bg=NA)
plot(data$Fulldate, data$Sub_metering_1, type="l", col="black", xlab="",
     ylab="Energy sub metering")
lines(data$Fulldate, data$Sub_metering_2, type="l", col="red")
lines(data$Fulldate, data$Sub_metering_3, type="l", col="blue")
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lwd=1 , col=c("black","red","blue"))
dev.off()
