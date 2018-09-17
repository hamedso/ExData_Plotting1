data<- read.csv("household_power_consumption.txt", sep=';')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
x <- strptime(data$Time, format="%H:%M:%S")
data$Time <- format(x, "%H:%M:%S")
dates <- c("2007-02-01", "2007-02-02")
betterDates <- as.Date(dates, format = "%Y-%m-%d")
DATA<- subset(data, Date%in%betterDates)
"?"%in%DATA

png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(as.numeric(DATA[,3]), breaks =13, col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#axis(1, at = seq(0, 6, by = 2), las=2)
dev.off()