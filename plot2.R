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


#Generate plot2 per instructions
png("plot2.png", width = 480, height = 480)

plot(times, dfSubset$Global_active_power, xlab = "",
     ylab = "Global Active Power (kilowatts)", type = "l")

dev.off()

