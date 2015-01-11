#PROJECT 1

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


#Note that in this dataset missing values are coded as ?.
pdata[(pdata$Global_reactive_power = "?"),]

## PLOT 1
## Histogram Plot:
png("plot1.png", width=480, height=480, units="px")
hist(pdata$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()