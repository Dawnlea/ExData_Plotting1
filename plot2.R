# ------------------------------------- Read data section -------------------------------------------
data=read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, skip=1,
             col.names=c("Date", "Time", "GlobalActivePower","GlobalReactivePower",
                         "Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3"))

# --------------------------------- Extract data for 1/2/2007 - 2/2/2007 ----------------------------
baseData <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007") & data$GlobalActivePower != "?" , ]

# ------------------ Create date/time column from separate date and time variables -------------------
baseData$DateTime <- as.POSIXct(strptime(paste(baseData$Date,baseData$Time), "%d/%m/%Y %H:%M:%S"))

# ---------------------------------- Produce PNG file containing plot --------------------------------
png (filename="plot2.png", width=480, height=480, units="px" )
plot(baseData$DateTime, baseData$GlobalActivePower, type="l", bg="white", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()