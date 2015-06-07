## Code to get, subset and clean the required data prior to plotting
## for use by plot1.R, plot2.R, plot3.R plot4.R

housedata <- read.table("./data/household_power_consumption.txt", sep = ";",
                        header = TRUE, comment.char = "", nrows = 2100000,
                        colClasses = c("character","character","numeric","numeric","numeric",
                                       "numeric","numeric","numeric","numeric"),
                        na.strings = "?")

## Investigate
## head(housedata)
## tail(housedata)
## str(housedata)

## Subset for the 2 days we want
housedata2d <- subset(housedata, (Date == "1/2/2007") | (Date == "2/2/2007"))
## and tidy
rm(housedata)

## Combine date and tme character fileds and convert to date/time format
housedata2d$datetime <- with(housedata2d,paste(Date,Time, sep = " "))
library(lubridate)
housedata2d$datetime <- dmy_hms(housedata2d$datetime)

## Investigate
## head(housedata2d)
## tail(housedata2d)
## str(housedata2d)

## Remove  NAs  (There weren't any anyway!)
housedata2d <- housedata2d[complete.cases(housedata2d),]

