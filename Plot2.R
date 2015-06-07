## Exploratory Data Project 1
## Plot 2 
## Data sourced from  the UC Irvine Machine Learning Repository
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

setwd("C:/Data/Ivor/Docs/CPD/DataScience/Exploratory")

## Use same R code to create data for all four plots
## (See gethousedata.R supplied)
## Check it hasn't been called already
## and if not call it.
if(!exists("housedata2d")) source("gethousedata.R")

## Plot Two
png("plot2.png") ## Open png device
par( las = 0)
with(housedata2d, plot(datetime, Global_active_power,
                     xlab = "",
                     ylab = "Global Active Power (kilowatts)",
                     type = "l"))
dev.off()   ## close png device

## Clean up
## rm(list=ls())