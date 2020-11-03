#ExData_Plotting1, peer reviewed assignment_week 1

#Load data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "house_power.zip")
unzip("house_power.zip")

#correct date & time
HPcon1 <- read.csv2("household_power_consumption.txt")
HPcon2 <- HPcon1
HPcon2$DateTime <- paste(HPcon1$Time, HPcon1$Date)
HPcon2$DateTime <- strptime(HPcon2$DateTime, format = "%H:%M:%S %d/%m/%Y")
HPcon2_sub <- subset(HPcon2, strptime("00:00:00 01/02/2007", format = "%H:%M:%S %d/%m/%Y") <= DateTime & 
                       DateTime < strptime("00:00:00 03/02/2007", format = "%H:%M:%S %d/%m/%Y"))

HPcon2_sub$Global_active_power <- as.numeric(HPcon2_sub$Global_active_power, na.rm = TRUE)

#PLOT 1

png(file = "Plot1.png", width=480, height=480)
par(pty = "s")
hist(HPcon2_sub$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Kilowatts")
dev.off()