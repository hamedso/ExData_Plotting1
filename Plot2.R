data<- read.csv("household_power_consumption.txt", sep=';')
data$Date <- as.Date(data$Date, "%d/%m/%Y")
x <- strptime(data$Time, format="%H:%M:%S")
data$Time <- format(x, "%H:%M:%S")
dates <- c("2007-02-01", "2007-02-02")
betterDates <- as.Date(dates, format = "%Y-%m-%d")
DATA<- subset(data, Date%in%betterDates)
"?"%in%DATA

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
DATA$datetime<- as.POSIXct(paste(DATA$Date, DATA$Time), format="%Y-%m-%d %H:%M:%S")
plot(y=DATA[,3], x=DATA$datetime, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
#axis(side=2, at=c(1000, 2000, 3000), lables=c(2,4,6))
dev.off()