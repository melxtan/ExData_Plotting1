url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"./Electric Power Consumption",method = "curl")
unzip("Electric Power Consumption")
file <- "household_power_consumption.txt"
data = read.table(text=grep("^[1,2]/2/2007",readLines(file),value = TRUE),
                  sep = ";",
                  col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  na.strings = '?')

png("plot2.png")
data$DateTime <- paste(data$Date,data$Time)
data$Date <- as.Date(data$Date,'%d/%m/%Y')
DateTime <- paste(data$Date, data$Time, sep=" ")
data$DateTime <- as.POSIXct(DateTime)
plot(data$DateTime,data$Global_active_power, xlab=" ",
     ylab="Global Active Power (kilowatts)", type="l")
dev.off()