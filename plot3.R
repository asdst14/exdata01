## read preprocessed data set
## the data set only contains the necessary data (February 1st and 2nd)
epc <- read.table("./household_power_consumption_Feb07.txt", header=TRUE, sep=";")

## format variable Date as class Date
epc$Date <- as.Date(epc$Date, format="%d/%m/%Y")

## combine columns date and time to create a timestamp
epc$timestamp <- paste(epc$Date, epc$Time)

## reformat variable timestamp
epc$timestamp <- strptime(epc$timestamp, format="%Y-%m-%d %H:%M:%S")

## set language for english time labels
Sys.setlocale("LC_TIME", "English")

## open PNG graphics device
png(file="./plot3.png")

## plot diagram 
plot(epc$timestamp, epc$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(epc$timestamp, epc$Sub_metering_1, col="black")
lines(epc$timestamp, epc$Sub_metering_2, col="red")
lines(epc$timestamp, epc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty="solid", col=c("black", "red", "blue"))

## close graphics device
dev.off()