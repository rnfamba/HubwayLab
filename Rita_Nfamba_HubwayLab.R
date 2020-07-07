getwd()
stations <- read.csv("hubway_stations.csv")
stations
# 1. What are the column names? find out using R.
colNames<-(stations)
colNames
#2. How many stations are there? Find out using R
length(unique(stations$station))                  
#create a data frame with stations that are existing
summary(stations)
#Look at summary of this data frame with Hubway station info
#some of the stations dont exist anymore
#create a data frame with only those that still exist
#how many are left?
station_exist <- stations[stations$status == "Existing" ,]
station_exist
# B Trip data
trip_data <- read.csv("hubway_trips.csv")
trip_data
#1. How many rows and coloumns does it have?
ncol(trip_data)
nrow(trip_data)
#2. How many unique user zip codes are in this dataset?
length(unique(trip_data$zip_code))
#3. How many unique bicycles are in this dataset?
length(unique(trip_data$bike_nr))
#4.Calculate the count of rides for each unique bicyle.
bike_rides <-table(trip_data$bike_nr)
bike_rides
#5. Which bicycle is ridden most frequently?
bike_rides<-as.data.frame(bike_rides)
bike_rides[which.max(bike_rides$Freq), 1]
#6. Calculate the total duration of all rides for each bicycle. 
long_dur <- table(trip_data, duration)
#Which bicycle has been ridden the longest total duration in this dataset? 
longest_trip <- subset(trip_data, longest = duration & bike_nr)
longest_trip
#Shortest total duration
#9. Consider only trips on the bicycle that has been ridden for the 
#longest duration in the dataset, which  station is its most frequent 
#end station/ Which station is its most frequent start station? 
#Return the station Ids
max_tripby <- subset(trip_data, bike_nr =="B00585")
maxtrip_table <- table(max_tripby$end_statn)
which.max(maxtrip_table)
#most start station
min_tripby <- subset(trip_data, bike_nr =="B00585")
mintrip_table <- table(min_tripby$strt_statn)
which.max(mintrip_table)
#10. Look up the name of the above station ids in the station data frame.
#What  are the names of the most frequent start and end stations for this 
#bicycle?
freq_station <- subset(trip_data, bike_nr =="B00585")
freqstation_table <- table(freq_station$end_statn)
which.max(freqstation_table)
#start stations
freqEnd_station <- subset(trip_data, bike_nr =="B00585")
freqEnd_table <- table(freqEnd_station$strt_statn)
which.max(freqEnd_table)

#Part III
# merge trip and station data
#getwd()
#setwd("C:/Users/ritah/OneDrive/Documents")
#trips<-read.csv("trips.csv")
merge(trips_1.station)
combined_data<-merge(trip_data, stations, by=c("station"))
