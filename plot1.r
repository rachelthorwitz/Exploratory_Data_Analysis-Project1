## Read in data
setwd('/Users/Rachel/Desktop/Coursera/Exploratory Data Analysis/');
power <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powersub <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

## Format data
globalactivepower <- as.numeric(powersub$Global_active_power)

## Create plot
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()