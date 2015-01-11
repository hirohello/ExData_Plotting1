#Reading the data
Dat <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
Dat$Date <- as.Date(Dat$Date, format = "%d/%m/%Y")
D1 <- Dat[Dat$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ]
D1$DateTime <- strptime(paste(D1$Date, D1$Time), format = "%Y-%m-%d %H:%M:%S")

#Plotting the graph
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
#plot1
plot(D1$DateTime, D1$Global_active_power, type = "l", xlab = "", ylab="Global Active Power")
#plot2
plot(D1$DateTime, D1$Voltage, type = "l", xlab = "datetime", ylab="Voltage")
#plot3
plot(D1$DateTime, D1$Sub_metering_1, type="l", 
     xlab = "", ylab="Energy sub metering")
par(new = TRUE)
plot(D1$DateTime, D1$Sub_metering_2, type="l", col="red", 
     ylim = range(as.numeric(D1$Sub_metering_1)), xlab = "", ylab="Energy sub metering")
par(new = TRUE)
plot(D1$DateTime, D1$Sub_metering_3, type="l", col="blue", 
     ylim = range(as.numeric(D1$Sub_metering_1)), xlab = "", ylab="Energy sub metering")
legend("topright", lty = 1, bty = "n", 
       col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#plot4
plot(D1$DateTime, D1$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power")
dev.off()

par(mfrow=c(1,1))