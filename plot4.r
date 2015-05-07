plot4 <- function(){
    lowerDateLimit <- as.Date("2007-02-01")
    upperDateLimit <- as.Date("2007-02-02")
    data <- read.csv2("household_power_consumption.txt", colClasses="character")
    data$Date  <- as.Date(data$Date, "%d/%m/%Y")
    data2 = data[data$Date>=lowerDateLimit & data$Date<=upperDateLimit,]
    remove(data)
    datetimes <- strptime(paste(data2$Date, data2$Time, sep = " "), "%Y-%m-%d %H:%M:%S")
    png(filename = "plot4.png")
    par(mfrow=c(2,2))
    plot(datetimes, data2$Sub_metering_1, type="l", ylab = "Energy sub metering", 
         xlab="", col="black", ylim=c(0.0,40.0))
    par(new=T)
    plot(datetimes, data2$Sub_metering_2, type="l", ylab = "", 
         xlab="", col="red", ylim=c(0.0,40.0))
    par(new=T)
    plot(datetimes, data2$Sub_metering_3, type="l", ylab = "", 
         xlab="", col="blue", ylim=c(0.0,40.0))
    par(new=F)
    plot(datetimes, data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", 
         xlab="")
    plot(datetimes, data$Voltage, type="l", ylab = "Voltage", 
         xlab="")
    plot(datetimes, data$Global_reactive_power, type="l", ylab = "Global Reactive Power", 
         xlab="")
    dev.off()
}