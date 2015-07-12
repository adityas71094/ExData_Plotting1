plot3 <- function()
{
        #Loading and Subsetting
        library(graphics)
        hpc <- read.table("./household_power_consumption.txt", 
                          sep = ";", skip = grep("31/1/2007;23:59:00", readLines("./household_power_consumption.txt")), 
                          nrows =2 * 24 * 60)
        col3to7 <-  hpc[,3:dim(pc)[2]]
        col1to2 <- hpc[,1:2]
        col1n2 <- paste(col1to2[,1], col1to2[,2])
        dateTime <- strptime(col1n2, "%d/%m/%Y %H:%M:%S")
        finalTable <- cbind(dateTime,col3to7)
        
        #plotting
        png("plot3.png", width=480, height=480)
        plot(finalTable[,1], finalTable[,6], xlab = "",
             ylab="Energy Submetering", type = "l",col = "black")
        lines(finalTable[,1], finalTable[,7], col = "red")
        lines(finalTable[,1], finalTable[,8], col = "blue")
        legend("topright",legend =  c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
               , col=c("black", "red", "blue"),lty = 1)
        dev.off()
}