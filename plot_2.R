setwd('/1. PROYECTOS DE TRABAJO/RStudio/4. Exploratory Data Analysis/activity_1/ExData_Plotting1/')

getwd()


df <- read.table("household_power_consumption.txt", 
                 header = TRUE, sep =";",
                 na.strings = '?', nrows = 2075259, 
                 check.names = FALSE, 
                 stringsAsFactors = FALSE, 
                 comment.char = '', quote = '\"')


df1 <- subset(df, Date %in% c('1/2/2007', '2/2/2007'))

df1$Date <- as.Date(df1$Date, format = '%d/%m/%Y')

dftime <- paste(as.Date(df1$Date), df1$Time)


df1$dftime <- as.POSIXct(dftime)

with(df1, {
  plot(df1$Global_active_power~df1$dftime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
