setwd('../4. Exploratory Data Analysis/')

getwd()


df <- read.table("./household_power_consumption.txt", 
                 header = TRUE, sep =";",
                 na.strings = '?', nrows = 2075259, 
                 check.names = FALSE, 
                 stringsAsFactors = FALSE, 
                 comment.char = '', quote = '\"')

df1 <- subset(df, Date %in% c('1/2/2007', '2/2/2007'))

df1$Date <- as.Date(df1$Date, format = '%d/%m/%Y')

dftime <- paste(as.Date(df1$Date), df1$Time)
dftime
df1$dftime <- as.POSIXct(dftime)

with(df1, {
  plot(df1$Sub_metering_1 ~ df1$dftime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(df1$Sub_metering_2~df1$dftime,col='Red')
  lines(df1$Sub_metering_3~df1$dftime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
