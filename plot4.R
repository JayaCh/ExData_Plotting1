# Read the data from the downloaded text file
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile,
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   colClasses = c("character", "character", rep("numeric",7)))

#Subset the data_full from the dates 2007-02-01 and 2007-02-02 and store it in data
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

data <- data.frame(DateTime=strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), data)

#Copy the current plot to the png file
png(file = "plot4.png", height = 480, width = 480)

par(mfrow = c(2, 2))

# Top-left
plot(data$DateTime, data$Global_active_power, 
     type = "l", col = "black",
     xlab = "", ylab = "Global Active Power")

# Top-right
plot(data$DateTime, data$Voltage,
     type = "l", col = "black",
     xlab = "datetime", ylab = "Voltage")

# Bottom-left
plot(data$DateTime, data$Sub_metering_1, 
     type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

# Bottom-right
plot(data$DateTime, data$Global_reactive_power, 
     type = "l", col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
