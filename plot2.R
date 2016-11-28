consumption<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";", skip = 66636, nrows = 2880, col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
datetime <- strptime(paste(consumption$Date, consumption$Time), "%d/%m/%Y %H:%M:%S")
plot.new()
plot(datetime, consumption$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.copy(png,'plot2.png')
dev.off()

