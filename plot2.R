power<- read.table("household_power_consumption.txt", sep= ';', header = TRUE, stringsAsFactors = FALSE)
power$Date<- strptime(power$Date, "%d/%m/%Y")
power$Date<- as.Date(as.character(power$Date))
install.packages("dplyr")
library(dplyr)
power1<- filter(power, Date == "2007-02-01" | Date == "2007-02-02")
power1$dat<- as.POSIXct(paste(power1$Date, power1$Time), format="%Y-%m-%d %H:%M:%S")
with(power1, plot(dat, as.numeric(Global_active_power), type = "l", ylab = "Global Active Power", xlab = " "))
dev.copy(png, 'plot2.png')
dev.off()
