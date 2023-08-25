#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
# Define server logic required to draw a scatter plot
function(input, output, session) {
        df <- reactive({
                req(input$species)
                iris |> filter(Species %in% input$species)
        })
        output$plot1 <- renderPlot({
                 ggplot(df(), aes(!!input$xvar, !!input$yvar)) + list(
                        theme(legend.position = "right"),
                        if (input$species_type) aes(color = Species),
                        geom_point()
                 )
                  
        
        }, res = 120)        
}        
        
        
        
