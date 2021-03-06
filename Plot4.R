data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- subset(data,(data$Date == "2007-02-01" | data$Date == "2007-02-02"))
data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime,format = "%Y-%m-%d %H:%M:%S")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
png(file = "plot4.png")
par(mfcol = c(2,2))
with(data, {
plot(data$DateTime,data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")
plot(data$DateTime,data$Sub_metering_1,type = "l",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col = "Orange")
lines(data$DateTime,data$Sub_metering_3,col = "Blue")
legend("topright",lty=c(1,1,1),col=c("Black","Orange","Blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$DateTime,data$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
plot(data$DateTime,data$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
})
dev.off()
