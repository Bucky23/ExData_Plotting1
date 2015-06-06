# read & filter data
hhPower_full <- read.table("./household_power_consumption.txt", sep=";",header=TRUE)
hhPower_full$Date <- as.Date(hhPower_full$Date, format="%d/%m/%Y")
hhPower <- hhPower_full[(hhPower_full$Date =="2007-02-01") | (hhPower_full$Date =="2007-02-02"),]
rm(hhPower_full)

# recode variables
hhPower$datetime <- as.POSIXct(paste(hhPower$Date, hhPower$Time))
hhPower$Sub_metering_1 <- as.numeric(as.character(hhPower$Sub_metering_1))
hhPower$Sub_metering_2 <- as.numeric(as.character(hhPower$Sub_metering_2))
hhPower$Sub_metering_3 <- as.numeric(as.character(hhPower$Sub_metering_3))

# plot graph
with(hhPower, plot(datetime,Sub_metering_1,type="l",xlab="", ylab="Energy sub metering"))
lines(hhPower$datetime,hhPower$Sub_metering_2,type="l",col="red")
lines(hhPower$datetime,hhPower$Sub_metering_3,type="l",col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.5)

# save plot as png
dev.copy(png, file="plot3.png")
dev.off()