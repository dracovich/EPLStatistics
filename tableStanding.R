## A function to calculate the table standings on the "combined" dataset
tableStanding<-function(year,date){
      playedGames<-combined[which(combined$season==year & combined$Date<=date),]
      pointsPerTeam<-aggregate(cumPointsBefore~team,playedGames,max)
      pointsTable<-pointsPerTeam[order(-pointsPerTeam$cumPointsBefore),]
      standing<-data.frame(standing=1:20)
      final<-cbind(pointsTable,standing)
}

