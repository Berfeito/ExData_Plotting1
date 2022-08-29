#NOTE: Please see Plot1.R for the script that creates the data frame "consumption_feb".

# Constructing Plot 2 and saving it as a PNG file 

with(consumption_feb, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# Saving it as a PNG file 

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


