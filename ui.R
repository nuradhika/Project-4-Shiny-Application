#
# In this application, you can understand the relationship between the species and petal length/width and 
# specious length/width. 

library(shiny)
library(bslib)
library(dplyr)
library(ggplot2)



fluidPage(
        
        # Application title
        titlePanel("Relationship between Flower Species"),
        
        # Sidebar with variable inputs 
        sidebarLayout(
                sidebarPanel(
                        varSelectInput("xvar", "X variable", iris, selected = "Sepal.Length"),
                        varSelectInput("yvar", "Y variable", iris, selected = "Sepal.Width"),
                        checkboxGroupInput(
                                "species", "select species",
                                choices = unique(iris$Species), 
                                selected = unique(iris$Species)
                        ),
                        hr(), 
                        checkboxInput("species_type", "Show species", TRUE),
                ),
                
                
                
                # Show a plot of the generated distribution
                mainPanel(
                        plotOutput("plot1")
                )
        )
)