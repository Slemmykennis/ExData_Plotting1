#Reading the individual household electric power consumption datset
energyUsed <- read.table("household_power_consumption.txt", header= TRUE, sep=";")

#Subsetting the needed dataset for the project
energyNeeded <- subset(energyUsed, energyUsed$Date == "1/2/2007" | energyUsed$Date =="2/2/2007")

#calling the basic plot function
hist(as.numeric(as.character(energyNeeded$Global_active_power)), col="red" ,main="Global Active Power", xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")

#Copy my plot to a PNG file
dev.copy(png, file = "plot1.png")

#Closing the PNG device
dev.off()