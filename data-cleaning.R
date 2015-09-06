## Download the file
download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/games.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/games.csv")

## Load the data
data<-read.csv("C:/Users/dracovich/Documents/football-predictor/games.csv")

## Remove all rows with non-sensical data
data_clean<-data[!(data$FTHG=="FTHG"),]

## Give the season column a better name
colnames(data_clean)[1]<-"season"

## Save the data again
write.csv(data_clean, file = "C:/Users/dracovich/Documents/football-predictor/games_clean.csv")