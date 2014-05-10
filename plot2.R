data <- read.table("household_power_consumption.txt", header=T, sep=";",
                  na.strings="?")
data <- subset(data, Date %in% c('2/2/2007','1/2/2007'))
data$Fulldate <- strptime(paste(data$Date, data$Time),
                          format="%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480, units="px", bg=NA)
plot(data$Fulldate, data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
