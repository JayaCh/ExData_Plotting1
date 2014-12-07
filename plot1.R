# Read the data from the downloaded text file
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile,
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   colClasses = c("character", "character", rep("numeric",7)))

#Subset the data_full from the dates 2007-02-01 and 2007-02-02 and store it in data
data<-data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

#Copy the current plot to the png file
png(file = "plot1.png", height = 480, width = 480)

#Plot the histogram
hist(data$Global_active_power, breaks = 12, col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()

