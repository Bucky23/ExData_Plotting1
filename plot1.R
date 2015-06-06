# read & filter data
hhPower_full <- read.table("./household_power_consumption.txt", sep=";",header=TRUE)
hhPower_full$Date <- as.Date(hhPower_full$Date, format="%d/%m/%Y")
hhPower <- hhPower_full[(hhPower_full$Date =="2007-02-01") | (hhPower_full$Date =="2007-02-02"),]
rm(hhPower_full)

# recode variables
hhPower$Global_active_power <- as.numeric(as.character(hhPower$Global_active_power))

# plot graph
hist(hhPower$Global_active_power, xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")

# save plot as png
dev.copy(png, file="plot1.png")
dev.off()
