data <- read.table("household_power_consumption.txt", header=T, sep=";",
                  na.strings="?")
data <- subset(data, Date %in% c('2/2/2007','1/2/2007'))
data$Fulldate <- strptime(paste(data$Date, data$Time),
                          format="%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480, units="px", bg=NA)
par(mfrow = c(2,2))
plot(data$Fulldate, data$Global_active_power, type="l", col="black", xlab="",
     ylab="Global Active Power")
plot(data$Fulldate, data$Voltage, type="l", col="black", xlab="datetime",
     ylab="Voltage")
plot(data$Fulldate, data$Sub_metering_1, type="l", col="black", xlab="",
     ylab="Energy sub metering")
lines(data$Fulldate, data$Sub_metering_2, type="l", col="red")
lines(data$Fulldate, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lwd=1, bty="n", col=c("black","red","blue"))
plot(data$Fulldate, data$Global_reactive_power, type="l", col="black",
     xlab="datetime", ylab="Global_reactive_power")
dev.off()
