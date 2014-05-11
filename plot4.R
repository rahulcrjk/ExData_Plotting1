###########################################################
#This function creates a PNG file which combines 4 plots  #
#for various parameters for 01/02/2007 and 02/02/2007     #
###########################################################

plot4     <- function(){
  #Read data
  data    <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ";", na.strings = "?")
  data    <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",c(1, 2, 3, 4, 5, 7, 8, 9)]

  #Transform data
  xData   <- paste(data$Date, data$Time, sep = " ")
  xData   <- as.POSIXlt(xData, format = "%d/%m/%Y %H:%M:%S")
  
  #Plot data
  png(file = "plot4.png", bg = "transparent")    # default PNG 480 x 480
  par(mfcol = c(2,2))
  
  #Plot 1
  plot(xData, data[,3],type = "l", xlab = "", ylab = "Global Active Power")
  
  #Plot2
  plot(xData, data[,6], type = "l", xlab = "", ylab = "Energy sub metering")
  lines(xData, data[,7], type = "l", col = "red")
  lines(xData, data[,8], type = "l", col = "blue")
  legend("topright",
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = c(1,1), 
         bty = "n",
         col = c("black","red", "blue"))
  
  #Plot 3
  plot(xData, data[,5], type = "l", xlab = "datetime", ylab = "Voltage")
  
  #Plot 4
  plot(xData, data[,4], type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  
  garbage <- dev.off()    #Suppress return value by assigning it to a variable
}
  