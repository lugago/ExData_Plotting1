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

##PLOT 4
##
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
###PLOT 4.1
plot(pdata$Global_active_power, type = "l", 
     xlab = "",
     ylab = "Global Active Power",
     xaxt = "n")
axis(1, at = c(0, 1441, 2881), 
     labels= c("Thu", "Fri", "Sat"))
###PLOT 4.2
plot(pdata$Voltage, type = "l", 
     xlab = "datetime",
     ylab = "Voltage",
     xaxt = "n")
axis(1, at = c(0, 1441, 2881), 
     labels= c("Thu", "Fri", "Sat"))
###PLOT 4.3
with(pdata, plot(Sub_metering_1, type = "l", col= "black", 
                 xlab = "", ylab = "Energy sub metering",
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
legend ("topright", pch = "-", lty = 1, lwd = 3, bty = "n", 
        col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75)
###PLOT 4.4
plot(pdata$Global_reactive_power, type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power",
     xaxt = "n")
axis(1, at = c(0, 1441, 2881), 
     labels= c("Thu", "Fri", "Sat"))
dev.off()