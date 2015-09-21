library(shiny)

# Define UI for football stats application
shinyUI(pageWithSidebar(
      
      # Application title
      headerPanel("Explore EPL team statistics over time, comparing different managers."),
      
      # Sidebar with controls to select the variable to plot time
      # and to specify for which team
      sidebarPanel(

            selectInput("team", "Team:",
                        list("Arsenal"="Arsenal",
                             "Aston Villa"="Aston Villa",
                             "Birmingham"="Birmingham",
                             "Blackburn"="Blackburn",
                             "Blackpool"="Blackpool",
                             "Bolton"="Bolton",
                             "Burnley"="Burnley",
                             "Charlton"="Charlton",
                             "Chelsea"="Chelsea",
                             "Crystal Palace"="Crystal Palace",
                             "Derby"="Derby",
                             "Everton"="Everton",
                             "Fulham"="Fulham",
                             "Hull"="Hull",
                             "Ipswich"="Ipswich",
                             "Leeds"="Leeds",
                             "Leicester"="Leicester",
                             "Liverpool"="Liverpool",
                             "Man City"="Man City",
                             "Man United"="Man United",
                             "Middlesboro"="Middlesboro",
                             "Middlesbrough"="Middlesbrough",
                             "Newcastle"="Newcastle",
                             "Norwich"="Norwich",
                             "Portsmouth"="Portsmouth",
                             "QPR"="QPR",
                             "Reading"="Reading",
                             "Sheffield United"="Sheffield United",
                             "Southampton"="Southampton",
                             "Stoke"="Stoke",
                             "Sunderland"="Sunderland",
                             "Swansea"="Swansea",
                             "Tottenham"="Tottenham",
                             "Watford"="Watford",
                             "West Brom"="West Brom",
                             "West Ham"="West Ham",
                             "Wigan"="Wigan",
                             "Wolves"="Wolves"                             
                             )),
            checkboxInput("loessyn", "Fit loess smoother?", TRUE),
            
            selectInput("stat", "Statistic:",
                        c( "Goals" = "mGoals",
                           "Goals Conceded" = "mGoalsConceded",
                           "Total Shots" = "mShots",
                           "Total Shots Conceded" = "mShotsConceded",
                           "Shots on Target" = "mShotsOnTarget",
                           "Shots on Target Conceded" = "mShotsOnTargetConceded",
                           "Corners" = "mCorners",
                           "Corners Conceded" = "mCornersConceded",
                           "Fouls Committed" = "mFouls",
                           "Points" = "mPoints",
                           "Discipline Points" = "DP"
                        ),selected=NULL),
            h4("Statistics Explained: "),
            p("All statistics are the average of the previous 5 games, and almost all are self explanatory. The exception being
            the 'Disciplin Points'. This feature is to measure Yellow/Red cards, by giving yellow cards a value of 10, and 
            red cards a value of 25 (and averaging over the past 5 games)")
      ),
      
      mainPanel(
            h4("Basic instructions:"),
            p("Select a team and a statistic, and the page will print out the rolling mean (over the past 5 games), 
              from the 2001-2002 season, until the 2014-2015 season."),
            p("This program only uses premier league data, so any teams that were relegated for some years will see a gap
              in the data."),
            p("You can choose to fit a loess smoother, to get some small idea of general trends in the data, as it is very jittery."),
            plotOutput('graph'),
            
            h4("Data origin, assumptions, and data cleaning."),
            p("The data used here comes from the jokecamp football data git (https://github.com/jokecamp/FootballData), and the R code i 
              wrote to clean and aggregate the statistics can be found on my own github page, https://github.com/dracovich/EPLStatistics. Data on EPL managers is taken from wikipedia."),
            p("Since a lot of the managers in EPL have been caretakers over only a few games, and this is more of a big view, i
              have made all caretaker managers into one big group, just called 'Caretaker manager'. If there is overlap in managers,
              i give the incoming manager the game."))
))