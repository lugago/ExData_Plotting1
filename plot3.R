#PROJECT 1

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
pdata <- read.table("C:/Coursera/Exploratory_Data_Analysis/household_power_consumption.txt", 
                    sep = ";", col.names = c("Date","Time","Global_active_power",
                                             "Global_reactive_power","Voltage",
                                             "Global_intensity","Sub_metering_1",
                                             "Sub_metering_2","Sub_metering_3"), 
                    skip = 66637, nrows = 2880)

#Check the first and the last rows from the pdata ti verify the dates
tail(pdata)
head(pdata)

#Convert the Date and Time variables to Date/Time classes using the 
#strptime() and as.Date() functions.
pdata$Date <- as.Date(pdata$Date, "%d/%m/%Y")
class(pdata$Date)
strptime(pdata$Time, "%H:%M:%S")


#Note that in this dataset missing values are coded as ?.
pdata[(pdata$Global_reactive_power = "?"),]

##PLOT 3
##
png("plot3.png", width=480, height=480, units="px")
with(pdata, plot(Sub_metering_1, type = "l", col= "black", 
                 xlab = "", ylab = "Global Active Power (kilowatts)",
                 ylim = c(0,40), xaxt = "n", yaxt = "n"))
axis(2, at = c(0, 10, 20, 30), 
     labels= c("0", "10", "20", "30"))
par(new = TRUE)
with(pdata, plot(Sub_metering_2, type = "l", col= "red",
                 xlab = "", ylab = "",
                 ylim = c(0,40), xaxt = "n", yaxt = "n"))
par(new = TRUE)
with(pdata, plot(Sub_metering_3, type = "l", col= "blue",
                 xlab = "", ylab = "",
                 ylim = c(0,40), xaxt = "n", yaxt = "n"))
axis(1, at = c(0, 1441, 2881), 
     labels= c("Thu", "Fri", "Sat"))
legend ("topright", pch = "-", lty = 1, lwd = 3, col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()