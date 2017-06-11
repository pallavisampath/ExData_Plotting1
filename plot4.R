#read the file from the current working directory
hpower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     dec = ".", na.strings = "?")

#subset the data to include rows with only dates 2007-02-01 and 2007-02-02
powersub <- subset(hpower, Date %in% c("1/2/2007","2/2/2007"))

DateTime <- strptime(paste(powersub$Date,powersub$Time,sep = " "),
                     "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)

#set the parameter for the number of graphs
par(mfrow = c(2, 2)) 

#plot the graph 1
plot(DateTime, powersub$Global_active_power, type="l", xlab="",
     ylab="Global Active Power")

#plot the graph 2
plot(DateTime, powersub$Voltage, type="l", xlab="datetime",
     ylab="Voltage")

#plot the graph 3
plot(DateTime, powersub$Sub_metering_1, type="l", xlab="",
     ylab="Energy Sub metering")
lines(DateTime, powersub$Sub_metering_2, type="l", col="red")
lines(DateTime, powersub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,lwd=2, col=c("black", "red", "blue"), bty="n")

#plot the graph 4
plot(DateTime, powersub$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
