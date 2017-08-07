data <- read.table("./household_power_consumption.txt", sep=';', header=TRUE)
data <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))

global_active_power <- as.numeric(as.character(data$Global_active_power))
date <- strptime(paste(data$Date, data$Time, sep=' '), "%d/%m/%Y %H:%M:%S")
plot(date, global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png")
dev.off()