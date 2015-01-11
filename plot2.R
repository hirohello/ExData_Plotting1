#Reading the data
Dat <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
Dat$Date <- as.Date(Dat$Date, format = "%d/%m/%Y")
D1 <- Dat[Dat$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ]
D1$DateTime <- strptime(paste(D1$Date, D1$Time), format = "%Y-%m-%d %H:%M:%S")

#Plotting the graph
png("plot2.png", width=480, height=480, units="px")
plot(D1$DateTime, D1$Global_active_power, type = "l", 
     xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
