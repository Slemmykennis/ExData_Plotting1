#Reading the individual household electric power consumption datset
energyUsed <- read.table("household_power_consumption.txt", header= TRUE, sep=";")

#Subsetting the needed dataset for the project
energyNeeded <- subset(energyUsed, energyUsed$Date == "1/2/2007" | energyUsed$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
energyNeeded$Date <- as.Date(energyNeeded$Date, format="%d/%m/%Y")
energyNeeded$Time <- strptime(energyNeeded$Time, format="%H:%M:%S")
energyNeeded[1:1440,"Time"] <- format(energyNeeded[1:1440,"Time"],"2007-02-01 %H:%M:%S")
energyNeeded[1441:2880,"Time"] <- format(energyNeeded[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# initiating a composite plot with many graphs
par(mfrow=c(2,2))


# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(energyNeeded,{
  plot(energyNeeded$Time,as.numeric(as.character(energyNeeded$Global_active_power)),type="l", xlab="" ,ylab="Global Active Power")  
  plot(energyNeeded$Time,as.numeric(as.character(energyNeeded$Voltage)), type="l", xlab="datetime", ylab="Voltage")
  plot(energyNeeded$Time,energyNeeded$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(energyNeeded,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(energyNeeded,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(energyNeeded,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.2)
  plot(energyNeeded$Time,as.numeric(as.character(energyNeeded$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

#Copy my plot to a PNG file
dev.copy(png, file = "plot4.png")

#Closing the PNG device
dev.off()