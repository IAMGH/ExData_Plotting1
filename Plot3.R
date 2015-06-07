## Exploratory Data Project 1
## Plot 3 
## Data sourced from  the UC Irvine Machine Learning Repository
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

setwd("C:/Data/Ivor/Docs/CPD/DataScience/Exploratory")

## Use same R code to create data for all four plots
## (See gethousedata.R supplied)
## Check it hasn't been called already
## and if not call it.
if(!exists("housedata2d")) source("gethousedata.R")

## Plot Three
png("plot3.png") ## Open png device
par( las = 0)
with(housedata2d, plot(datetime, Sub_metering_1, type = "n",
                     xlab = "",
                     ylab = "Energy sub metering"))
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"),
       cex = 0.85)

with(housedata2d,lines(datetime,Sub_metering_1))
with(housedata2d,lines(datetime,Sub_metering_2, col = "red"))     
with(housedata2d,lines(datetime,Sub_metering_3, col = "blue"))

dev.off()   ## close png device

## Clean up
## rm(list=ls())