## Download and unzip the data file 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
  temp, method="curl")
unzip(temp)

## Read data
hhpc <- read.delim("household_power_consumption.txt", sep=";", na.strings="?")

## Get only the rows we need (2007-02-01 to 2007-02-02)
df <- subset(hhpc, Date == "1/2/2007" | Date == "2/2/2007")

## Export to PNG
png(file = "ExData_Plotting1/plot4.png", width=480, height=480)

## Set base plot layout
par(mfrow = c(2, 2))

## Prepare datetime column
df$datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")



## Draw plots
with(df, {
    plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
    plot(df$datetime, df$Voltage, type = "l", ylab="Voltage", xlab="datetime")
    plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", 
         xlab="")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", col = c("black", "red", "blue"), pch = "-", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           pt.cex = 3, cex = 0.8)
    plot(datetime, Global_reactive_power, type = "l")    
})


dev.off()
