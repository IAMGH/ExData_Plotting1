## Exploratory Data Project 1
## Plot 1 
## Data sourced from  the UC Irvine Machine Learning Repository
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

setwd("C:/Data/Ivor/Docs/CPD/DataScience/Exploratory")

## Use same R code to create data for all four plots
## (See gethousedata.R supplied)
## Check it hasn't been called already
## and if not call it.
if(!exists("housedata2d")) source("gethousedata.R")


## Plot One
png("plot1.png") ## Open png device
par( las = 0)
hist(housedata2d$Global_active_power,main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()   ## close png device

## Clean up
## rm(list=ls())
