## set working directory and download and unzip power data file

setwd("C:/Users/admin/Documents/RProjs/ExpDataAnalysis")
if(!file.exists('data')) dir.create('data')
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./data/householdpower.zip")
unzip("./data/householdpower.zip")

## Read data
Files <- file("./household_power_consumption.txt")
powerdata <- read.table(text = grep("^[1,2]/2/2007", readLines(Files), value = TRUE), sep = ';', na.strings = "?", header = T)
names(powerdata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Open PNG device, plot figure and close device
png(filename = "./plot1.png", width = 480, height = 480, units = "px")
with(powerdata, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red"))
dev.off()
