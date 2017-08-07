data <- read.table("./household_power_consumption.txt", sep=';', header=TRUE)
data <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))

global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
global_active_power <- as.numeric(as.character(data$Global_active_power))
date <- strptime(paste(data$Date, data$Time, sep=' '), "%d/%m/%Y %H:%M:%S")
voltage <- as.numeric(as.character(data$Voltage))

sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

par(mfrow=c(2,2))

plot(date, global_active_power, type='l', xlab='', ylab="Global Active Power")
plot(date, voltage, type='l', xlab="datetime", ylab="Voltage")

plot(date, sub_metering_1, type='l', ylab="Energy Submetering", xlab="")
lines(date, sub_metering_2, col="red")
lines(date, sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(date, global_reactive_power, type='l', xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png")
dev.off()
