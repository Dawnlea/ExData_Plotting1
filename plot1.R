# ------------------------------------- Read data section -------------------------------------------
data=read.table("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, skip=1,
             col.names=c("Date", "Time", "GlobalActivePower","GlobalReactivePower",
                         "Voltage","GlobalIntensity","SubMetering1","SubMetering2","SubMetering3"))

# --------------------------------- Extract data for 1/2/2007 - 2/2/2007 ----------------------------
baseData <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007") & data$GlobalActivePower != "?" , ]

# ------------ Convert data to correct type and produce PNG file containing Histogram ---------------
baseData <- transform(baseData, GlobalActivePower=as.numeric(GlobalActivePower) )
png (filename="plot1.png", width=480, height=480)
hist(as.numeric(baseData$GlobalActivePower) , col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()