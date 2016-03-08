## Plot2.R
# Coursera - Exploratory Data Analysis, Week 1 Project
# constructs the assignment plot, plot2.png
# Overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007.
# 2007-02-01 and 2007-02-02
# using  UC Irvine Machine Learning Repository, “Individual household electric power consumption Data Set”

library(dplyr)
library(lubridate)

house_power <- read.table("household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE, na.strings=c("NA", "-", "?")) 
house_power$Date_Time <- dmy_hms(paste(house_power$Date, house_power$Time), tz = "America/New_York")
house_power <- subset(house_power, Date_Time > "2007-01-31 23:59:00" & Date_Time < "2007-02-03")

plot(house_power$Date_Time, house_power$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png,'plot2.png')
dev.off()
