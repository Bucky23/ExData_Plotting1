# read & filter data
hhPower_full <- read.table("./household_power_consumption.txt", sep=";",header=TRUE)
hhPower_full$Date <- as.Date(hhPower_full$Date, format="%d/%m/%Y")
hhPower <- hhPower_full[(hhPower_full$Date =="2007-02-01") | (hhPower_full$Date =="2007-02-02"),]
rm(hhPower_full)

# recode variables
hhPower$Global_active_power <- as.numeric(as.character(hhPower$Global_active_power))
hhPower$Global_reactive_power <- as.numeric(as.character(hhPower$Global_reactive_power))
hhPower$Voltage <- as.numeric(as.character(hhPower$Voltage))
hhPower$Sub_metering_1 <- as.numeric(as.character(hhPower$Sub_metering_1))
hhPower$Sub_metering_2 <- as.numeric(as.character(hhPower$Sub_metering_2))
hhPower$Sub_metering_3 <- as.numeric(as.character(hhPower$Sub_metering_3))
hhPower$datetime <- as.POSIXct(paste(hhPower$Date, hhPower$Time))

# plot graph
par(mfrow=c(2,2))
with(hhPower, {
plot(datetime,Global_active_power,type="l",xlab="", ylab="Global Active Power")
plot(datetime,Voltage,type="l",xlab="datetime", ylab="Voltage")
plot(datetime,Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(hhPower$datetime,hhPower$Sub_metering_2,type="l",col="red")
lines(hhPower$datetime,hhPower$Sub_metering_3,type="l",col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.25)
plot(datetime,Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power")
})

# save plot as png
dev.copy(png, file="plot4.png")
dev.off()