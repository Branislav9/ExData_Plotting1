library(dplyr)

##  reading and subsetting data
powerdata <- filter(read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?"), Date == "1/2/2007" | Date == "2/2/2007")

## changing format of Date and Time
powerdata$datetime <-strptime(paste(powerdata$Date, powerdata$Time), "%d/%m/%Y %H:%M:%S")

Sys.setlocale(category = "LC_ALL", locale = "english")

## opening device
png(filename = "./Plots/plot1.png", width = 480, height = 480, units="px")

## plotting
hist(powerdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## closing device
dev.off()