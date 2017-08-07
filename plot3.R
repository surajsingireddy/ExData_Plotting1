data <- read.table("./household_power_consumption.txt", sep=';', header=TRUE)
data <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))

global_active_power <- as.numeric(as.character(data$Global_active_power))
date <- strptime(paste(data$Date, data$Time, sep=' '), "%d/%m/%Y %H:%M:%S")

sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

plot(date, sub_metering_1, type='l', ylab="Energy Submetering", xlab="")
lines(date, sub_metering_2, type='l', col="red")
lines(date, sub_metering_3, type='l', col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

dev.copy(png, file="plot3.png")
dev.off()