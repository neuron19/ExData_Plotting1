## Importing the text data

         power.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## Subsetting the data for Feb 01, 2007 and Feb 02, 2007

         subset.data <- power.data[power.data$Date %in% c("1/2/2007","2/2/2007"),]

## Converting the variables to numeric

         GAP <- as.numeric(subset.data$Global_active_power)
         GRP <- as.numeric(subset.data$Global_reactive_power)
         Voltage <- as.numeric(subset.data$Voltage)
         sm1 <- as.numeric(subset.data$Sub_metering_1)
         sm2 <- as.numeric(subset.data$Sub_metering_2)
         sm3 <- as.numeric(subset.data$Sub_metering_3)

## Creating a .png file with size 480x480
         datetime <- strptime(paste(subset.data$Date, subset.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")    
         png("plot4.png", width=480, height=480)
         par(mfrow = c(2,2))
        
         plot(datetime, GAP, xlab="", ylab="Global Active Power", type = "l")

         plot(datetime, Voltage, xlab="datetime", ylab="Voltage", type="l",)

         plot(datetime, sm1, xlab="", ylab = "Energy sub metering", type = "l")
         lines(datetime, sm2, col = "red", type="l")
         lines(datetime, sm3, col = "blue", type = "l")
         legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2.5, lty = 1, col = c("black", "red", "blue"))
        
         plot(datetime, GRP, xlab="datetime", ylab="Global_reactive_power", type="l")
         

dev.off()
