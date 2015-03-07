# Reading Data 
d <- read.table("./exdata-data-household_power_consumption/household_power_consumption.txt", 
                header = TRUE, 
                sep = ";",
                na.strings = "?", 
                colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", 
                               "numeric", "numeric", "numeric"))

# Subsetting data   
dateSubset <- d[(d$Date == "1/2/2007") | (d$Date == "2/2/2007"),]
# Date convertion  
dateSubset$Date <- as.Date(dateSubset$Date, "%d/%m/%Y")
# Datetime append  
dateSubset$DateTime = as.POSIXct(paste(dateSubset$Date, 
                                       dateSubset$Time), 
                                 format="%Y-%m-%d %H:%M:%S")

# Creating png graphic in the working directory

png("plot4.png") # width and height defaults are 480
par(mfcol= c(2,2)) # Columm wise

with(dateSubset, {
        # Upper left corner
        plot(DateTime, Global_active_power, 
             type="l", 
             ylab="Global Active Power (kilowatts)", 
             xlab="")
        # Lower left corner
        plot(DateTime, Sub_metering_1, 
             type="n", 
             ylab="Energy sub metering", 
             xlab="")
        lines(DateTime, Sub_metering_1)
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright", lty=1, col=c("black", "red", "blue"), 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        # Upper right corner
        plot(DateTime, Voltage, 
             type="l", 
             ylab="Voltage", 
             xlab="datetime")
        
        # Lower right corner
        plot(DateTime, Global_reactive_power, 
             type="l", 
             ylab="Global_reactive_power", 
             xlab="datetime")
})
dev.off()
