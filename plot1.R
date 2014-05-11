########################################################
#This function creates a PNG file with the histogram   #
#for Global Active Power for 01/02/2007 and 02/02/2007 #
########################################################

plot1 <- function(){
  data <- read.table("household_power_consumption.txt", header = TRUE, 
                     sep = ";", na.strings = "?")
  png(file = "plot1.png", bg = "transparent")    # default PNG 480 x 480
  hist(subset(data, Date == "1/2/2007" | Date == "2/2/2007")$Global_active_power, 
                     col = "red", main = "Global Active Power", 
                     xlab = "Global Active Power (kilowatts)")
  garbage <- dev.off()       #Suppress return value by assigning it to a variable
}