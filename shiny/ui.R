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
            checkboxInput("loessyn", "Fit loess smoother?", FALSE),
            
            selectInput("stat", "Statistic:",
                        c( "Goals" = "mGoals",
                              "Total Shots" = "mShots",
                              "Shots on Target" = "mShotsOnTarget",
                              "Corners" = "mCorners",
                              "Fouls Committed" = "mFouls",
                              "Yellow cards" = "mYellows"
                        ),selected=NULL)
      ),
      
      mainPanel(
            h4("Basic instructions:"),
            p("Select a team and a statistic, and the page will print out the rolling mean (over the past 5 games), 
              from the 2001-2002 season, until the 2011-2012 season."),
            p("This program only uses premier league data, so any teams that were relegated for some years will see a gap
              in the data."),
            p("You can choose to fit a loess smoother, to get some small idea of general trends in the data, as it is very jittery."),
            plotOutput('graph'),
            
            h4("Data origin, assumptions, and data cleaning."),
            p("The data used here comes from the jokecamp football data git (https://github.com/jokecamp/FootballData), and the R code i 
              wrote to clean and aggregate the statistics can be found on my own github page, https://github.com/dracovich/EPLStatistics. Data on EPL managers is taken from wikipedia."),
            p("Since a lot of the managers in EPL have been caretakers over only a few games, and this is more of a big view, i
              have made all caretaker managers into one big group, just called 'Caretaker manager'. If there is overlap in managers,
              i give the incoming manager the game."),
            p("I'll be looking into getting better and more up to date data, perhaps creating some web crawler to get data from
              websites that have match data  and statistics (premierleague.com for exmaple)."))
))