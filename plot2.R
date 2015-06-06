hhPower_full <- read.table("./household_power_consumption.txt", sep=";",header=TRUE)
hhPower_full$Date <- as.Date(hhPower_full$Date, format="%d/%m/%Y")
hhPower <- hhPower_full[(hhPower_full$Date =="2007-02-01") | (hhPower_full$Date =="2007-02-02"),]
rm(hhPower_full)

hhPower$Global_active_power <- as.numeric(as.character(hhPower$Global_active_power))
hhPower$datetime <- as.POSIXct(paste(hhPower$Date, hhPower$Time))

with(hhPower, plot(datetime,Global_active_power,type="l",xlab="", ylab="Global Active Power (kilowatts)"))

dev.copy(png, file="plot2.png")
dev.off()