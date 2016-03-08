## Plot4.R
# Coursera - Exploratory Data Analysis, Week 1 Project
# constructs the assignment plot, plot4.png
# Overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007.
# 2007-02-01 and 2007-02-02
# using  UC Irvine Machine Learning Repository, “Individual household electric power consumption Data Set”

library(dplyr)
library(lubridate)

house_power <- read.table("household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE, na.strings=c("NA", "-", "?")) 
house_power$Date_Time <- dmy_hms(paste(house_power$Date, house_power$Time), tz = "America/New_York")
house_power <- subset(house_power, Date_Time > "2007-01-31 23:59:00" & Date_Time < "2007-02-03")

par(mfrow = c(2, 2))
with(house_power, {
        plot(Date_Time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "datetime")
        plot(Date_Time, Voltage, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "datetime")
        plot(Date_Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
        lines(Date_Time, Sub_metering_2, col = "red")
        lines(Date_Time, Sub_metering_3, col = "blue")
        legend("topright", c("sub metering 1", "sub metering 2", "sub metering 3"), lty = 1, col = c("black", "red", "blue"))
        plot(Date_Time, Global_reactive_power, type = "l", ylab = "Global ReActive Power", xlab = "datetime")
})

dev.copy(png,'plot4.png')
dev.off()
