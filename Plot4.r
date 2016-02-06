## Read in data 
setwd('/Users/Rachel/Desktop/Coursera/Exploratory Data Analysis/');
power <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powersub <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

## Format data
datetime <- strptime(paste(powersub$Date, powersub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalactivepower <- as.numeric(powersub$Global_active_power)
submetering1 <- as.numeric(powersub$Sub_metering_1)
submetering2 <- as.numeric(powersub$Sub_metering_2)
submetering3 <- as.numeric(powersub$Sub_metering_3)
globalreactivepower <- as.numeric(powersub$Global_reactive_power)

## Create plot
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, powersub$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, submetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime,submetering2, type = "l", col = "orange")
lines(datetime,submetering3, type = "l", col = "purple") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("Black", "Orange", "Purple"))
plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="global_reactive_power")

dev.off()