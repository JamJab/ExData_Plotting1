## Data Plotting #3

## Loading dataset
df <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")

## Converting dates
df$Date <- as.Date(df$Date,format = "%d/%m/%Y")

## Keep only relevant dates
data <- subset(df, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(df)

## Converting time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot #3
png(filename="plot3.png")

with(data, {
        plot(Sub_metering_1 ~ Datetime, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(Sub_metering_2 ~ Datetime, col = 'Red')
        lines(Sub_metering_3 ~ Datetime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

