plot1 <- function()
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
        
        #Plotting histogram
        png("plot1.png", width=480, height=480)
        hist(as.numeric(finalTable[,2]), 
             main="Global Active Power", 
             xlab="Global Active Power (kilowatts)", col = "red")
        dev.off()
        
}