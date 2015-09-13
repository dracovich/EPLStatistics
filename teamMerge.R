teamMerge<-function(sData,tData){
      awayTeam<-rename(tData,c("team"="AwayTeam",
                                  "cumPoints"="aCumPoints",
                                  "cumPointsBefore"="aCumPointsBefore",
                                  "mGoals"="aGoals",
                                  "mShots"="aShots",
                                  "mShotsOnTarget"="aShotsOnTarget",
                                  "mCorners"="aCorners",
                                  "mFouls"="aFouls",
                                  "mYellows"="aYellows",
                                  "mReds"="aReds",
                                  "mPoints"="aPoints",
                                  "mDP"="aHP",
                                  "standing"="aStanding"))
      
      awayMerge<-merge(sData,awayTeam,by=c("X","AwayTeam"))
      
      homeTeam<-rename(tData,c("team"="HomeTeam",
                                  "cumPoints"="hCumPoints",
                                  "cumPointsBefore"="hCumPointsBefore",
                                  "mGoals"="hGoals",
                                  "mShots"="hShots",
                                  "mShotsOnTarget"="hShotsOnTarget",
                                  "mCorners"="hCorners",
                                  "mFouls"="hFouls",
                                  "mYellows"="hYellows",
                                  "mReds"="hReds",
                                  "mPoints"="hPoints",
                                  "mDP"="hDP",
                                  "standing"="hStanding"))
      
      homeMerge<-merge(awayMerge,homeTeam,by=c("X","HomeTeam"))
      return(homeMerge)
}