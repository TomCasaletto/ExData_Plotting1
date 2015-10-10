# Exploratory Data Analysis, Project 1

# Read the entire data into a data frame
df <- read.table("./data/household_power_consumption.txt", sep = ";",
                 header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

# Take the appropriate subset of data per instructions
idxFirst<-grep("1/2/2007", df$Date)
numPts <- 2*24*60 # Two days of data, taken at every minute
idx<-idxFirst[1]:(idxFirst[1]+numPts-1)

dfSubset<-df[idx,]

# Generate x values for plotting
dateTime<-paste(dfSubset$Date, dfSubset$Time)
times <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")



#Generate plot1 per instructions
png("plot1.png", width = 480, height = 480)

with(dfSubset, hist(dfSubset$Global_active_power,
                 xlab = "Global Active Power (kilowatts)",
                 main = "Global Active Power", col=2))

dev.off()


#Generate plot2 per instructions
png("plot2.png", width = 480, height = 480)

plot(times, dfSubset$Global_active_power, xlab = "",
     ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()


#Generate plot3 per instructions
png("plot3.png", width = 480, height = 480)

plot(times, dfSubset$Sub_metering_1, ylab = "Energy sub metering",
     type = "l", col = 1)
lines(times, dfSubset$Sub_metering_2, type = "l", col = 2)
lines(times, dfSubset$Sub_metering_3, type = "l", col = 4)
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()


#Generate plot4 per instructions
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(times, dfSubset$Global_active_power, xlab = "",
     ylab = "Global Active Power", type = "l")

plot(times, dfSubset$Voltage, xlab = "datetime", ylab = "Voltage",
     type = "l", col = 1)

plot(times, dfSubset$Sub_metering_1, ylab = "Energy sub metering",
     type = "l", col = 1)
lines(times, dfSubset$Sub_metering_2, type = "l", col = 2)
lines(times, dfSubset$Sub_metering_3, type = "l", col = 4)
legend("topright", col = c("black", "red", "blue"), lty = c(1, 1, 1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(times, dfSubset$Global_reactive_power, xlab = "datetime",
     ylab = "Global_reactive_power", type = "l")

dev.off()

