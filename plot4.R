# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
pdata <- read.table("C:/Coursera/Exploratory_Data_Analysis/household_power_consumption.txt", 
                    sep = ";", col.names = c("Date","Time","Global_active_power",
                                             "Global_reactive_power","Voltage",
                                             "Global_intensity","Sub_metering_1",
                                             "Sub_metering_2","Sub_metering_3"), 
                    skip = 66637, nrows = 2880)

#Check the first and the last rows from the pdata to verify the dates
tail(pdata)
head(pdata)

#Convert the Date and Time variables to Date/Time classes using the 
#strptime() and as.Date() functions.

class(pdata$Date)
pdata$DateTime <- strptime(paste(pdata$Date,pdata$Time),"%d/%m/%Y %H:%M:%S")
pdata$Date <- as.Date(pdata$Date, "%d/%m/%Y")

#Note that in this dataset missing values are coded as ?.

pdata[(pdata$Global_reactive_power == "?"),]
Sys.setlocale("LC_TIME", "english")

##PLOT 4
##
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
###PLOT 4.1
plot(pdata$DateTime,pdata$Global_active_power, type = "l", 
     xlab = "",
     ylab = "Global Active Power")
###PLOT 4.2
plot(pdata$DateTime,pdata$Voltage, type = "l", 
     xlab = "datetime",
     ylab = "Voltage")
###PLOT 4.3
plot(pdata$DateTime,pdata$Sub_metering_1, type = "l", col= "black", 
                 xlab = "", ylab = "Energy sub metering")

lines(pdata$DateTime,pdata$Sub_metering_2,type="l",col="red")
lines(pdata$DateTime,pdata$Sub_metering_3,type="l",col="blue")

 legend ("topright", lty = 1, bty = "n", 
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75)

###PLOT 4.4

plot(pdata$DateTime,pdata$Global_reactive_power, type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()