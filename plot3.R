#NOTE: Please see Plot1.R for the script that creates the data frame "consumption_feb".

# Constructing Plot 3 and saving it as a PNG file 

with(consumption_feb, {
  plot(datetime, Sub_metering_1, type="l",
       ylab="Energy sub metering", xlab="")
  lines(datetime, Sub_metering_2, col='Red')
  lines(datetime, Sub_metering_3, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Saving it as a PNG file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
