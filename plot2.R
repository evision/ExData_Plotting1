## Download and unzip the data file 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
  temp, method="curl")
unzip(temp)

## Read data

hhpc <- read.delim("household_power_consumption.txt", sep=";", na.strings="?")

## Get only the rows we need (2007-02-01 to 2007-02-02)
df <- subset(hhpc, Date == "1/2/2007" | Date == "2/2/2007")

## Prepare datetime column
df$datetime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

## Export to PNG
png(file = "ExData_Plotting1/plot2.png", width=480, height=480)

## Just make sure we have correct plot layout
par(mfrow = c(1, 1))

## Draw plot 2
plot(df$datetime, df$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")


dev.off()