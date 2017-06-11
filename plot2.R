#read the file from the current working directory
hpower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     dec = ".", na.strings = "?")

#subset the data to include rows with only dates 2007-02-01 and 2007-02-02
powersub <- subset(hpower, Date %in% c("1/2/2007","2/2/2007"))

#plot the graph
DateTime <- strptime(paste(powersub$Date,powersub$Time,sep = " "),
                     "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

plot(DateTime, powersub$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

dev.off()
