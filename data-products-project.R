library(zoo)
library(sqldf)
library(plyr)
library(reshape2)
library(ggplot2)

## Load the cleanup functions
source(file="teamCleanup.R") 
source(file="teamMerge.R") 
source(file="teamStanding.R")
source(file="tableStanding.R")

## Download and clean data, only if this is first time running
## source("get-data.R")

## Load the edited file and define the colClasses
col<-c("factor",rep("character",4),rep("numeric",2),"factor",rep("numeric",15))
data<-read.csv("all_seasons.csv", colClasses=col)

## We have to reformat the date variable from a string to a date
## Upon looking at data however, we see that tehre are two formats in data, so we need to split data first
## Then format, and subsequently rejoin them with the same date format
dateLengthLong<-nchar(as.character(data$Date))>8
dateLengthShort<-nchar(as.character(data$Date))<=8
dateLong<-data[dateLengthLong,]
dateShort<-data[dateLengthShort,]

dateShort$Date<-as.Date(dateShort$Date, "%d/%m/%y")
dateLong$Date<-as.Date(dateLong$Date, "%d/%m/%Y")

data<-rbind(dateShort,dateLong)

## Define home and away discipline points (HDP and ADP respectively), 10points for yellow, 25 for red.
data$ADP<-data$AY*10+data$AR*25
data$HDP<-data$HY*10+data$HR*25

## Incomplete dataset, missing half of 12-13 and nothing after that
seasons_wanted<-c("00-01",
                  "01-02",
                  "02-03",
                  "03-04",
                  "04-05",
                  "05-06",
                  "06-07",
                  "07-08",
                  "08-09",
                  "09-10",
                  "10-11",
                  "11-12",
                  "12-13",
                  "13-14",
                  "14-15")

selection_row<-data$season %in% seasons_wanted
data<-cbind(data,selection_row)

## Select the relevant seasons, and premier league (E0) only
data<-subset(data,selection_row==TRUE)

## Need to rename since "AS" messes with the SQL syntax if its a variable name.
data<-rename(data,c("AS"="AwayShots", "HS"="HomeShots"))

data<-data[order(data$Date),]

## We cycle through all games in all seasons, and create a rolling mean of the previous
## 3 games for all variables, in order to get predictive variables.
for(k in seasons_wanted){
      season_subset<-subset(data,season==k)
      teams<-unique(season_subset$HomeTeam)
      for (i in teams){
            team_subset<-subset(season_subset,(HomeTeam==i | AwayTeam==i))

            ## Run the cleanup on data for team i  
            team_cleaned<-teamCleanup(i,team_subset)
      
            ## If it's the first team, initiate the data-frame, if not just append it
            if(i==teams[1]){
                  combined<-team_cleaned
            } else {
                  combined<-rbind(combined,team_cleaned)
            }
      }
      cleanSeason<-season_subset[c(1,5,6,11)]                         
      
      ## Removing the first 5 games again (since they dont hvae rolling 5 data)
      combinedClean<-as.data.frame(combined[complete.cases(combined$mGoals),])
      
      ## Calculate the standing of each team before each game measured (using previously defined functions)
      indTeamStanding<-as.data.frame(apply(combinedClean[,c("season","Date","team")],1,function(x) teamStanding(x[1],x[2],x[3])))
      names(indTeamStanding)[1]<-"standing"  
      combinedFinal<-cbind(combinedClean,indTeamStanding)
      
      if(k==seasons_wanted[1]){
            totalCombined<-combinedFinal
      } else {
            totalCombined<-rbind(totalCombined,combinedFinal)
      }
}

## Load the manager data file
## All caretaker managers are designed as "Caretaker manager", and if there was an overlap in periods, the new managers is
## given priority (since only one person can manage at a time in this analysis).
## A few times there¨s a gap in managers data, where noone seems to be in charge. In those cases the incoming manager
## gets the games, since that usually means that they were caretaker first, then took over.
managers<-read.csv2("managers.csv",strip.white=TRUE)
managers$FromDate<-as.Date(managers$From, "%d-%m-%Y")
managers$ToDate<-as.Date(managers$To, "%d-%m-%Y")

## Merge managers onto the timestamps using SQL (not sure how easy this would be to do with R-code merging)
withManagers<- sqldf("select  distinct
                              g.*,
                              m.Manager,
                              1 as count
                     
                     from     totalCombined as g
                              
                              left join
                              managers as m
                              on m.Team=g.team
                        where g.Date<=m.ToDate   AND
                              g.Date>m.FromDate")

saveRDS(withManagers, file="withManagers.RDS")