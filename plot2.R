## Data Plotting #2

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

## Plot #2
png(filename="plot2.png")

plot(data$Global_active_power ~ data$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()

