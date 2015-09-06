library(shiny)
library(ggplot2)

shinyData <- readRDS("withManagers.RDS")

shinyServer(function(input, output) {      
      output$graph<-renderPlot({
            teamSubset<-subset(shinyData, team==input$team)
            
            
            dataPlot<-ggplot(data=teamSubset, aes_string(x="Date", y=input$stat))
            dataPlot<-dataPlot+geom_point(aes(colour=Manager, group=Manager))
            dataPlot<-dataPlot+scale_colour_brewer(palette="Set1")
            
            if(input$loessyn==TRUE) {
                  dataPlot<-dataPlot+stat_smooth(method="loess")
            }
            
            print(dataPlot)

      })
}
)