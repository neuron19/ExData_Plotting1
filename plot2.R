## Importing the text data

         power.data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

## Subsetting the data for Feb 01, 2007 and Feb 02, 2007

         subset.data <- power.data[power.data$Date %in% c("1/2/2007","2/2/2007"),]

## Converting the variable Global Active Power to numeric

         GAP <- as.numeric(subset.data$Global_active_power)


## Creating a .png file with size 480x480
         datetime <- strptime(paste(subset.data$Date, subset.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
         png("plot2.png", width=480, height=480)
         plot(datetime, GAP, xlab="", ylab = "Global Active Power (kilowatts)", type = "l")
         dev.off()
