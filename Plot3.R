## Exploratory Data Project 1
## Plot 3 
## Data sourced from  the UC Irvine Machine Learning Repository
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

setwd("C:/Data/Ivor/Docs/CPD/DataScience/Exploratory")

housedata <- read.table("./data/household_power_consumption.txt", sep = ";",
                        header = TRUE, comment.char = "", nrows = 2100000,
                        colClasses = c("character","character","numeric","numeric","numeric",
                                       "numeric","numeric","numeric","numeric"),
                        na.strings = "?")

## Subset for the 2 days we want
housedata <- subset(housedata, (Date == "1/2/2007") | (Date == "2/2/2007"))

## Combine date and tme character fileds and convert to date/time format
housedata$datetime <- with(housedata,paste(Date,Time, sep = " "))
library(lubridate)
housedata$datetime <- dmy_hms(housedata$datetime)

## Investigate
head(housedata)
tail(housedata)
str(housedata)

## Remove  NAs  (There weren't any anyway!)
housedata <- housedata[complete.cases(housedata),]

## Plot Three
png("plot3.png") ## Open png device
par( las = 1)
with(housedata, plot(datetime, Sub_metering_1, type = "n",
                     xlab = "",
                     ylab = "Energy sub metering"))
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"),
       cex = 0.85)

with(housedata,lines(datetime,Sub_metering_1))
with(housedata,lines(datetime,Sub_metering_2, col = "blue"))     
with(housedata,lines(datetime,Sub_metering_3, col = "red"))

dev.off()   ## close png device

## Clean up
rm(list=ls())