#bike sharing cleaning script 

#set directory 
setwd("C:/Users/Alexander/OneDrive - National College of Ireland/4th Year/Semester 2/Web Mining/CA2/BS-updated")
BikeDay <- read.csv("day.csv", stringsAsFactors = FALSE, header = TRUE, sep = ",")

str(BikeDay)
#row and column number
nrow(BikeDay)
ncol(BikeDay)

#Identify NA's
sapply(BikeDay,function(x) sum(is.na(x)))

#remove column one
BikeDay <- BikeDay[,-1]

#time column 
#BikeDay$datetime <- strptime(BikeDay$datetime, format="%Y-%m-%d %H:%M:%S")
#day of week column 
#BikeDay$weekday <- weekdays(BikeDay$datetime)
#hour column 
#BikeDay$hour <- BikeDay$datetime$hour
#re-format datetime column 
#BikeDay$date <- as.Date(BikeDay$date, "%y %m %d")

#date to gmt format 
BikeDay$date <- as.POSIXct(paste(BikeDay$date))

#rename columns 
colnames(BikeDay)[1] <- "date"
colnames(BikeDay)[3] <- "year" 
colnames(BikeDay)[4] <- "month"
colnames(BikeDay)[8] <- "weather"
colnames(BikeDay)[11] <- "humidity"
colnames(BikeDay)[15] <- "count"

#changing columns to factor
BikeDay$season <- as.factor(BikeDay$season)
BikeDay$month <- as.factor(BikeDay$month)
BikeDay$weekday <- as.factor(BikeDay$weekday)
BikeDay$weather <- as.factor(BikeDay$weather)

#days of week to character- only run if want categorical data in chars
#BikeDay$weekday <- gsub(1, "Monday", BikeDay$weekday) #1 = Monday
#BikeDay$weekday <- gsub(2, "Tuesday", BikeDay$weekday) #2 = Tuesday
#BikeDay$weekday <- gsub(3, "Wednesday", BikeDay$weekday) #3 = Wednesday
#BikeDay$weekday <- gsub(4, "Thursday", BikeDay$weekday) #4 = Thursday
#BikeDay$weekday <- gsub(5, "Friday", BikeDay$weekday) #5 = Friday
#BikeDay$weekday <- gsub(6, "Saturday", BikeDay$weekday) #6 = Saturday
#BikeDay$weekday <- gsub(7, "Sunday", BikeDay$weekday) #7 = Sunday

str(BikeDay)

#save to new csv 
write.csv(BikeDay, 'BikeDayCleaned.csv', row.names = FALSE)

#
# when reading file from new csv add check names 
# e.g 
# BikeData <- read.csv("train.csv", stringsAsFactors = FALSE, header = TRUE, sep = ",", check.names = FALSE)
#


##################
# BikeHour data  #
##################
BikeHour <- read.csv("hour.csv", stringsAsFactors = FALSE, header = TRUE, sep = ",")

#Identify NA's
sapply(BikeHour,function(x) sum(is.na(x)))

BikeHour <- BikeHour[, -1]

#rename columns 
colnames(BikeHour)[1] <- "date"
colnames(BikeHour)[3] <- "year" 
colnames(BikeHour)[4] <- "month"
colnames(BikeHour)[5] <- "hour"
colnames(BikeHour)[9] <- "weather"
colnames(BikeHour)[12] <- "humidity"
colnames(BikeHour)[16] <- "count"

#changing columns to factor
BikeHour$season <- as.factor(BikeHour$season)
BikeHour$month <- as.factor(BikeHour$month)
BikeHour$weekday <- as.factor(BikeHour$weekday)
BikeHour$weather <- as.factor(BikeHour$weather)
BikeHour$hour <- as.factor(BikeHour$hour)

#date to gmt format 
BikeHour$date <- as.POSIXct(paste(BikeHour$date))

str(BikeHour)

#save to new csv 
write.csv(BikeHour, 'BikeHourCleaned.csv', row.names = FALSE)

