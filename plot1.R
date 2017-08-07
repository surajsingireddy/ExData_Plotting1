data <- read.table("./household_power_consumption.txt", sep=';', header=TRUE)
data <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))

global_active_power <- as.numeric(data$Global_active_power)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png")
dev.off()