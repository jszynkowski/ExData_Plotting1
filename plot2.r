plot2 <- function(){
    lowerDateLimit <- as.Date("2007-02-01")
    upperDateLimit <- as.Date("2007-02-02")
    data <- read.csv2("household_power_consumption.txt", colClasses="character")
    data$Date  <- as.Date(data$Date, "%d/%m/%Y")
    data2 = data[data$Date>=lowerDateLimit & data$Date<=upperDateLimit,]
    remove(data)
    datetimes <- strptime(paste(data2$Date, data2$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
    png(filename = "plot2.png")
    plot(datetimes, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", 
         xlab="")
    dev.off()
}