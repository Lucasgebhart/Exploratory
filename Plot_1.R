getwd()
setwd("C:/Users/lucas.gebhart/Desktop/Coursera")
#Plot 1
power <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
subpower <-subset(power, power$Date == "1/2/2007" | power$Date=="2/2/2007")
names(subpower)

png("plot_1.png", width=480, height=480)
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",
     xlab= "Global Active Power(kilowatts)",
     ylab= "Frequency",
     main= "Global Active Power")
dev.off()
