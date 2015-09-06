teamCleanup<-function(t,data){
      
      homeList<-data[data$HomeTeam==t,]
            cleanHome<-homeList[c(1,2,4)]
            cleanHome$team<-t
            cleanHome$HomeAway<-"Home"
            cleanHome$goals<-homeList$FTHG
            cleanHome$shots<-homeList$HomeShots
            cleanHome$shotsOnTarget<-homeList$HST
            cleanHome$corners<-homeList$HC
            cleanHome$fouls<-homeList$HF
            cleanHome$offsides<-homeList$HO
            cleanHome$yellows<-homeList$HY
            cleanHome$reds<-homeList$HR
                  homeWins<-homeList[homeList$FTHG>homeList$FTAG,]
                        homeW<-homeWins[1]
                        if(nrow(homeW)>0){homeW$points<-3}
                  homeDraws<-homeList[homeList$FTHG==homeList$FTAG,]
                        homeD<-homeDraws[1]
                        if(nrow(homeD)>0){homeD$points<-1}
                  homeLosses<-homeList[homeList$FTHG<homeList$FTAG,]
                        homeL<-homeLosses[1]
                        if(nrow(homeL)>0){homeL$points<-0}     
                  homePoints<-rbind(homeW,homeL,homeD)       
            finalHome<-merge(cleanHome,homePoints,by="X")
      
      awayList<-data[data$AwayTeam==t,]
            cleanAway<-awayList[c(1,2,4)]
            cleanAway$team<-t
            cleanAway$HomeAway<-"Away"
            cleanAway$goals<-awayList$FTHG
            cleanAway$shots<-awayList$HomeShots
            cleanAway$shotsOnTarget<-awayList$HST
            cleanAway$corners<-awayList$HC
            cleanAway$fouls<-awayList$HF
            cleanAway$offsides<-awayList$HO
            cleanAway$yellows<-awayList$HY
            cleanAway$reds<-awayList$HR
                  awayWins<-awayList[awayList$FTHG<awayList$FTAG,]
                        awayW<-awayWins[1]
                        if(nrow(awayW)>0){awayW$points<-3}
                  awayDraws<-awayList[awayList$FTHG==awayList$FTAG,]
                        awayD<-awayDraws[1]
                        if(nrow(awayD)>0){awayD$points<-1}
                  awayLosses<-awayList[awayList$FTHG>awayList$FTAG,]
                        awayL<-awayLosses[1]
                        if(nrow(awayL)>0){awayL$points<-0}
                  awayPoints<-rbind(awayW,awayL,awayD)       
            finalAway<-merge(cleanAway,awayPoints,by="X")
      
      combined<-rbind(finalHome,finalAway)
      clean<-combined[order(combined$X),]
      
      ## Add the cumulative sum of points to get the total points at any point in the seaso
      cumPoints<-cumsum(clean$points)      
      cumPointsTemp<-cumPoints[-38]
      firstRound<-0
      cumPointsBefore<-as.data.frame(c(firstRound,cumPointsTemp))
      cumPointsBefore<-rename(cumPointsBefore,c("c(firstRound, cumPointsTemp)"="cumPointsBefore"))
      
      clean<-cbind(clean,cumPoints,cumPointsBefore)
      
      ## Calculate the mean of each stat from last 5 games
      mStats<-as.data.frame(rollmean(clean$goals,5))
      names(mStats)[1]<-"mGoals"
      mStats$mShots<-rollmean(clean$shots,5)
      mStats$mShotsOnTarget<-rollmean(clean$shotsOnTarget,5)
      mStats$mCorners<-rollmean(clean$corners,5)
      mStats$mFouls<-rollmean(clean$fouls,5)
      mStats$mOffsides<-rollmean(clean$offsides,5)
      mStats$mYellows<-rollmean(clean$yellows,5)
      mStats$mReds<-rollmean(clean$reds,5)
      mStats$mPoints<-rollmean(clean$points,5)
      
      ## Remove the last row as it can't be used
      mStats<-mStats[-34,]
      
      ## Remove the first three rows in arsenal data as those won't have a 3 game mean.
      relevantData<-clean[-c(1,2,3,4,5),c(1,2,3,4,5,15,16)]
      
      ## We add the first 3 games again here, and remove them later, it's needed for the table standing function.
      combined<-rbind.fill(clean[c(1,2,3,4,5),c(1,2,3,4,5,15,16)],cbind(relevantData,mStats))
      return(combined)
}


