data <- read.table("household_power_consumption.txt", header=T, sep=";",
                  na.strings="?")
data <- subset(data, Date %in% c('2/2/2007','1/2/2007'))
png("plot2.png", width=480, height=480, units="px", bg=NA)
hist(data$Global_active_power, freq=TRUE, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
