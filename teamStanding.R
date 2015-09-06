## Return exactly where in the league a single team is
teamStanding<-function(year,date,team){
      pointsTable<-tableStanding(year,date)
      standing<-pointsTable[which(pointsTable$team==team),3]
      return(standing)          
}

