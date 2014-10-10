## read preprocessed data set
## the data set only contains the necessary data (February 1st and 2nd)
epc <- read.table("./household_power_consumption_Feb07.txt", header=TRUE, sep=";")

## format variable Date as class Date
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")

## combine columns date and time to create a timestamp
epc$timesamp <- paste(epc$Date, epc$Time)

## reformat variable timestamp
epc$timesamp <- strptime(epc$timesamp, format="%Y-%m-%d %H:%M:%S")

## set language for english time labels
Sys.setlocale("LC_TIME", "English")

## open PNG graphics device
png(file="./plot1.png", width=640, height=640)

## create histogram
hist(epc$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

## close graphics device
dev.off()