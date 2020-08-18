setwd('../4. Exploratory Data Analysis/activity_1/ExData_Plotting1/')

getwd()


df <- read.table("./household_power_consumption.txt", 
                 header = TRUE, sep =";",
                 na.strings = '?', nrows = 2075259, 
                 check.names = FALSE, 
                 stringsAsFactors = FALSE, 
                 comment.char = '', quote = '\"')

head(df)
str(df)


df1 <- subset(df, Date %in% c('1/2/2007', '2/2/2007'))

df1$Date <- as.Date(df1$Date, format = '%d/%m/%Y')

dftime <- paste(as.Date(df1$Date), df1$Time)
dftime
df1$dftime <- as.POSIXct(dftime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df1, {
  plot(df1$Global_active_power~df1$dftime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(df1$Voltage~df1$dftime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(df1$Sub_metering_1~df1$dftime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(df1$Sub_metering_2~df1$dftime,col='Red')
  lines(df1$Sub_metering_3~df1$dftime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(df1$Global_reactive_power~df1$dftime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})