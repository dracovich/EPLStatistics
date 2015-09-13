## Downloading files for each season from 00-01 season to 14-15 season

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2000-2001/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2000-2001.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2001-2002/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2001-2002.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2002-2003/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2002-2003.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2003-2004/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2003-2004.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2004-2005/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2004-2005.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2005-2006/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2005-2006.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2006-2007/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2006-2007.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2007-2008/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2007-2008.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2008-2009/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2008-2009.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2009-2010/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2009-2010.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2010-2011/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2010-2011.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2011-2012/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2011-2012.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2012-2013/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2012-2013.csv")


download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2013-2014/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2013-2014.csv")

download.file("https://raw.githubusercontent.com/jokecamp/FootballData/master/football-data.co.uk/england/2014-2015/Premier.csv",
              destfile="C:/Users/dracovich/Documents/football-predictor/2014-2015.csv")

## Load the data 
data_0001<-read.csv("C:/Users/dracovich/Documents/football-predictor/2000-2001.csv")
data_0001$season<-"00-01"
data_0001$B365H<-0
data_0001$B365D<-0
data_0001$B365A<-0
clean_0001<-na.omit(subset(data_0001,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))
      
data_0102<-read.csv("C:/Users/dracovich/Documents/football-predictor/2001-2002.csv")
data_0102$season<-"01-02"
data_0102$B365H<-0
data_0102$B365D<-0
data_0102$B365A<-0
clean_0102<-na.omit(subset(data_0102,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_0203<-read.csv("C:/Users/dracovich/Documents/football-predictor/2002-2003.csv")
data_0203$season<-"02-03"
clean_0203<-na.omit(subset(data_0203,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_0304<-read.csv("C:/Users/dracovich/Documents/football-predictor/2003-2004.csv")
data_0304$season<-"03-04"
clean_0304<-na.omit(subset(data_0304,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_0405<-read.csv("C:/Users/dracovich/Documents/football-predictor/2004-2005.csv")
data_0405$season<-"04-05"
clean_0405<-na.omit(subset(data_0405,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_0506<-read.csv("C:/Users/dracovich/Documents/football-predictor/2005-2006.csv")
data_0506$season<-"05-06"
clean_0506<-na.omit(subset(data_0506,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_0607<-read.csv("C:/Users/dracovich/Documents/football-predictor/2006-2007.csv")
data_0607$season<-"06-07"
clean_0607<-na.omit(subset(data_0607,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_0708<-read.csv("C:/Users/dracovich/Documents/football-predictor/2007-2008.csv")
data_0708$season<-"07-08"
clean_0708<-na.omit(subset(data_0708,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_0809<-read.csv("C:/Users/dracovich/Documents/football-predictor/2008-2009.csv")
data_0809$season<-"08-09"
clean_0809<-na.omit(subset(data_0809,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_0910<-read.csv("C:/Users/dracovich/Documents/football-predictor/2009-2010.csv")
data_0910$season<-"09-10"
clean_0910<-na.omit(subset(data_0910,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_1011<-read.csv("C:/Users/dracovich/Documents/football-predictor/2010-2011.csv")
data_1011$season<-"10-11"
clean_1011<-na.omit(subset(data_1011,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_1112<-read.csv("C:/Users/dracovich/Documents/football-predictor/2011-2012.csv")
data_1112$season<-"11-12"
clean_1112<-na.omit(subset(data_1112,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_1213<-read.csv("C:/Users/dracovich/Documents/football-predictor/2012-2013.csv")
data_1213$season<-"12-13"
clean_1213<-na.omit(subset(data_1213,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_1314<-read.csv("C:/Users/dracovich/Documents/football-predictor/2013-2014.csv")
data_1314$season<-"13-14"
clean_1314<-na.omit(subset(data_1314,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))

data_1415<-read.csv("C:/Users/dracovich/Documents/football-predictor/2014-2015.csv")
data_1415$season<-"14-15"
clean_1415<-na.omit(subset(data_1415,select=c(season,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR,HS,AS,HST,AST,HC,AC,HF,AF,HY,AY,HR,AR,B365H,B365D,B365A)))
                   
all_seasons<-rbind(clean_0001,
                   clean_0102,
                   clean_0203,
                   clean_0304,
                   clean_0405,
                   clean_0506,
                   clean_0607,
                   clean_0708,
                   clean_0809,
                   clean_0910,
                   clean_1011,
                   clean_1112,
                   clean_1213,
                   clean_1314,
                   clean_1415)

write.csv(all_seasons, file = "C:/Users/dracovich/Documents/football-predictor/all_seasons.csv")