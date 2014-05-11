########################################################
#This function creates a PNG file with the line plot   #
#for Global Active Power for 01/02/2007 and 02/02/2007 #
########################################################

plot2     <- function(){
  data    <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")
  data    <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",1:3]
  xData   <- paste(data$Date, data$Time, sep = " ")
  xData   <- as.POSIXlt(xData, format = "%d/%m/%Y %H:%M:%S")
  png(file = "plot2.png", bg = "transparent")    # default PNG 480 x 480
  plot(xData, data[,3],type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  garbage <- dev.off()       # Suppress return value by assigning it to a variable
}
