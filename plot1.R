## Plot1.R
# Coursera - Exploratory Data Analysis, Week 1 Project
# constructs the assignment plot, plot1.png
# Overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007.
# 2007-02-01 and 2007-02-02
# using  UC Irvine Machine Learning Repository, “Individual household electric power consumption Data Set”

library(dplyr)
library(lubridate)

house_power <- read.table("household_power_consumption.txt",sep=";", header = TRUE, stringsAsFactors = FALSE, na.strings=c("NA", "-", "?")) 
house_power$Date_Time <- dmy_hms(paste(house_power$Date, house_power$Time), tz = "America/New_York")
house_power <- subset(house_power, Date_Time > "2007-01-31 23:59:00" & Date_Time < "2007-02-03")

hist(house_power$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png,'plot1.png')
dev.off()
