########################################################
#This function creates a PNG file with the line plots  #
#for Energy Sub Metering for 01/02/2007 and 02/02/2007 #
########################################################

plot3     <- function(){
  data    <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ";", na.strings = "?")
  data    <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",c(1,2,7,8,9)]
  xData   <- paste(data$Date, data$Time, sep = " ")
  xData   <- as.POSIXlt(xData, format = "%d/%m/%Y %H:%M:%S")
  png(file = "plot3.png", bg = "transparent")    # default PNG 480 x 480
  plot(xData, data[,3], type = "l", xlab = "", ylab = "Energy sub metering")
  points(xData, data[,4], type = "l", col = "red")
  points(xData, data[,5], type = "l", col = "blue")
  legend("topright",
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty=c(1,1), 
         col = c("black","red", "blue"))
  garbage <- dev.off()       # Suppress return value by assigning it to a variable
}
  
                   