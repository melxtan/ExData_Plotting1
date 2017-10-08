url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"./Electric Power Consumption",method = "curl")
unzip("Electric Power Consumption")
file <- "household_power_consumption.txt"
data = read.table(text=grep("^[1,2]/2/2007",readLines(file),value = TRUE),
                  sep = ";",
                  col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  na.strings = '?')
png("plot1.png")
hist(data$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()