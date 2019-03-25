#Reading the individual household electric power consumption datset
energyUsed <- read.table("household_power_consumption.txt", header= TRUE, sep=";")

#Subsetting the needed dataset for the project
energyNeeded <- subset(energyUsed, energyUsed$Date == "1/2/2007" | energyUsed$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
energyNeeded$Date <- as.Date(energyNeeded$Date, format="%d/%m/%Y")
energyNeeded$Time <- strptime(energyNeeded$Time, format="%H:%M:%S")
energyNeeded[1:1440,"Time"] <- format(energyNeeded[1:1440,"Time"],"2007-02-01 %H:%M:%S")
energyNeeded[1441:2880,"Time"] <- format(energyNeeded[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot function
plot(energyNeeded$Time, as.numeric(as.character(energyNeeded$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 

# annotating graph
title(main="Global Active Power Vs Time")

#Copy my plot to a PNG file
dev.copy(png, file = "plot2.png")

#Closing the PNG device
dev.off()