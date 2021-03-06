data <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- subset(data,(data$Date == "2007-02-01" | data$Date == "2007-02-02"))
data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$DateTime <- paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime,format = "%Y-%m-%d %H:%M:%S")
png(file = "plot3.png")
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
plot(data$DateTime,data$Sub_metering_1,type = "l",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col = "Orange")
lines(data$DateTime,data$Sub_metering_3,col = "Blue")
legend("topright",lty=c(1,1,1),col=c("Black","Orange","Blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
