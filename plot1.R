#read the file from the current working directory
hpower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     dec = ".", na.strings = "?")

#subset the data to include rows with only dates 2007-02-01 and 2007-02-02
powersub <- subset(hpower, Date %in% c("1/2/2007","2/2/2007"))

#plot the hist graph
png("plot1.png", width=480, height=480)
hist(powersub$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()