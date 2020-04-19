library(dplyr)
library(ggplot2)
library(data.table)
library(openair)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "dataset.zip", method = "auto")
unzip("dataset.zip")
Data <- fread("household_power_consumption.txt", na.strings = "?")
## Change Date Format
Data$Date = as.Date(as.character(Data$Date), "%d/%m/%Y")
## Rename a Column
names(Data)[names(Data) == "Date"] <- "date"
## Select By Data (openair)
Data_FEB <- selectByDate(Data, start = "2007-02-01", end = "2007-02-02")

## PLOT CREATION
png("plot3.png", width=480, height=480)
hist(as.numeric(Data_FEB$Global_active_power), freq = TRUE, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()