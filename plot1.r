plot1 <- function(){
    lowerDateLimit <- as.Date("2007-02-01")
    upperDateLimit <- as.Date("2007-02-02")
    data <- read.csv2("household_power_consumption.txt", colClasses="character")
    data$Date  <- as.Date(data$Date, "%d/%m/%Y")
    data2 = data[data$Date>=lowerDateLimit & data$Date<=upperDateLimit,]
    remove(data)
    png(filename = "plot1.png")
    hist(as.numeric(data2$Global_active_power), col="red", 
         main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )
    dev.off()
}