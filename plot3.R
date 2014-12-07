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
png(file = "plot3.png", bg = "transparent")

#Plot with the DateTime and sub metering lines
plot(data$DateTime, data$Sub_metering_1, 
     type = "l", col = "black"
     xlab= "", ylab = "Energy sub metering" )
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", 
        col = c("black", "red", "blue"),
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lwd = 1)
dev.off()

