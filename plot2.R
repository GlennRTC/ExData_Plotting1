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
DataFEB <- selectByDate(Data, start = "2007-02-01", end = "2007-02-02")
## Creating Date and Time Field to append
datetime <- paste(as.Date(DataFEB$date), DataFEB$Time)
DataFEB$Datetime <- as.POSIXct(datetime)

## Plot Creation
png("plot3.png", width=480, height=480)
plot(Data_FEB$Datetime, Data_FEB$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()