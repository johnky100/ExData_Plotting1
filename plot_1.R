setwd('../4. Exploratory Data Analysis/')

getwd()


df <- read.table("./household_power_consumption.txt", header = TRUE, sep =";",
                 na.strings = '?', nrows = 2075259, check.names = FALSE, 
                 stringsAsFactors = FALSE, comment.char = '', quote = '\"')

df1 <- subset(df, Date %in% c('1/2/2007', '2/2/2007'))

df1$Date <- as.Date(df1$Date, format = '%d/%m/Y')

hist(df1$Global_active_power, 
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)', 
     ylab = 'Frequency',
     col = 'Red')

png('plot1.png', width=480, height=480)
dev.off() 
