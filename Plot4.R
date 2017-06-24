library(dplyr)

##  reading and subsetting data
powerdata <- filter(read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")

## changing format of Date and Time
powerdata$datetime <-strptime(paste(powerdata$Date, powerdata$Time), "%d/%m/%Y %H:%M:%S")

Sys.setlocale(category = "LC_ALL", locale = "english")

## opening device
png(filename = "./Plots/plot4.png", width = 480, height = 480, units="px")

## plotting
par(mfrow=c(2,2))

with(powerdata, {
        plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
        
        plot(datetime, Voltage, type = "l")
        
        plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
                lines(datetime, Sub_metering_2, type = "l", col = "red")
                lines(datetime, Sub_metering_3, type = "l", col = "blue")
                        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=.5, col=c("black", "red", "blue"), bty = "n", cex = .75)
                        
        plot(datetime, Global_reactive_power, type = "l")
})

## closing device
dev.off()