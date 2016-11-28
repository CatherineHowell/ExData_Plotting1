consumption<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";", skip = 66636, nrows = 2880, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
datetime <- strptime(paste(consumption$Date, consumption$Time), "%d/%m/%Y %H:%M:%S")
plot.new()
par(mfrow=c(2,2))
plot(datetime, consumption$Global_active_power, type = "l", xlab="", ylab = "Global Active Power")

plot(datetime, consumption$Voltage, type = "l", xlab="datetime", ylab = "Voltage")

plot(datetime, consumption$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering", col = "black")
lines(datetime, consumption$Sub_metering_2, col="orange")
lines(datetime, consumption$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black","orange","blue")) 

plot(datetime, consumption$Global_reactive_power, type="l")

dev.copy(png,'plot4.png')
dev.off()

