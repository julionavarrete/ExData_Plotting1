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
 png("plot1.png") # width and height defaults are 480
 hist(dateSubset$Global_active_power, 
       col="red", 
       xlab="Global Active Power (kilowatts)", 
       ylab="Frecuency", 
       main="Global Active Power")
 dev.off()
  
 