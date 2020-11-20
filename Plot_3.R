#Plot 3
power <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";")
subpower <-subset(power, power$Date == "1/2/2007" | power$Date=="2/2/2007")
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],
                                  "2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],
                                     "2007-02-02 %H:%M:%S")

png("plot_3.png", width=480, height=480)
plot(subpower$Time, as.numeric(as.character(subpower$Global_active_power)),
     xlab="", ylab= "Energy sub metering", main= "Energy sub-metering", type="n")
points(lines(subpower$Time, subpower$Sub_metering_1))
points(lines(subpower$Time, subpower$Sub_metering_2, col = "red"))
points(lines(subpower$Time, subpower$Sub_metering_3, col = "blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))       
dev.off()
