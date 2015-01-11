#Reading the data
Dat <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
Dat$Date <- as.Date(Dat$Date, format = "%d/%m/%Y")
D1 <- Dat[Dat$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ]

#Plotting the graph
png("plot1.png", width=480, height=480, units="px")
hist(as.numeric(D1$Global_active_power), col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power")
dev.off()
