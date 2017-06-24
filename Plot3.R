library(dplyr)

##  reading and subsetting data
powerdata <- filter(read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")

## changing format of Date and Time
powerdata$datetime <-strptime(paste(powerdata$Date, powerdata$Time), "%d/%m/%Y %H:%M:%S")

Sys.setlocale(category = "LC_ALL", locale = "english")

## opening device
png(filename = "./Plots/plot3.png", width = 480, height = 480, units="px")

## plotting
with(powerdata, {
        plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(datetime, Sub_metering_2, type = "l", col = "red")
        lines(datetime, Sub_metering_3, type = "l", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
})

## closing device
dev.off()