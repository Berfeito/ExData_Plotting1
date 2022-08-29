getwd()
library(dplyr)
library(readr)

#Downloading and unzipping the data dateframe.

filename <- "consumption.zip"

if(!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("household_power_consumption")) { 
  unzip(filename) 
}



# Converting the TXT files into Data Frames and naming columns for inspection

household_power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")



# Converting Date variable into date format and subsetting the data to only include data with dates between from Feb 1 to Feb 2

consumption_feb <- household_power_consumption %>% mutate(Date = as.Date(Date, format= "%d/%m/%Y")) %>% filter(Date >= "2007/02/01",  Date <= "2007/02/02")


#Creating the variable Date/Time as a POSIXlt variable

consumption_feb$datetime <- strptime(paste(consumption_feb$Date, consumption_feb$Time), "%Y-%m-%d %H:%M:%S")


# Inspecting of the final data frame.

summary(consumption_feb)



# Constructing Plot 1 and saving it as a PNG file 

with(consumption_feb, hist(Global_active_power, col = "red",  xlab="Global Active Power (kilowatts)", ylab="Frequency", main = "Global Actove Power"))
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
